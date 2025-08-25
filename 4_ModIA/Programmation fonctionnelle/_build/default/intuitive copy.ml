open Encodage
open Chaines

(* Saisie des mots en mode T9 *)

(***************************)
(*       EXERCICE 3        *)
(***************************)

(***************************)
(*       QUESTION 1        *)
(***************************)

(******************************************************************************)
(*                                                                            *)
(*                fonction qui retourne la touche d'une lettre                *)
(*                                                                            *)
(*                                                                            *)
(*   signature : encoder_lettre : ('a*'b list)list -> 'b -> int = <fun>       *)
(*                                                                            *)
(*   paramètre(s) : un character et une liste de mapping                      *)
(*   résultat     : une touche                                                *)
(*                                                                            *)
(******************************************************************************)

let encoder_lettre l_t9 c = List.fold_left (fun acc (i, l) -> if List.mem c l then i else acc) (-1) l_t9 

(* on utilise List.fold_left pour parcourir la liste de mapping *)
(* on crée une fonction auxiliaire qui renvoie la touche si le caractère est présent dans la liste *)
(* sinon on retourne la valeur initiale qui est -1 de pour indiquer que le caractère n'est pas trouvé dans les listes *)


let%test _ = encoder_lettre t9_map 'c'  = 2
let%test _ = encoder_lettre t9_map 'w'  = 9
let%test _ = encoder_lettre t9_map 's'  = 7

(***************************)
(*       QUESTION 2        *)
(***************************)

(******************************************************************************)
(*                                                                            *)
(*                fonction qui retourne l'encodage d'un mot                   *)
(*                                                                            *)
(*                                                                            *)
(*   signature : encoder_mot : ('a*'b list)list -> string -> int list = <fun> *)
(*                                                                            *)
(*   paramètre(s) : un mot et une liste de mapping                            *)
(*   résultat     : un liste de touche                                        *)
(*                                                                            *)
(******************************************************************************)

let encoder_mot l_t9 s =
  let char_list = decompose_chaine s in
  List.map (encoder_lettre l_t9) char_list

(* on combine les fonctions précédentes, on transforme le mot en char list avec decompose_chaine *)
(* puis on applique à chaque caratère encoder_lettre grâce à List.map                            *)

let%test _ = encoder_mot t9_map "sara"  = [7;2;7;2]
let%test _ = encoder_mot t9_map "besbes"  = [2;3;7;2;3;7]
let%test _ = encoder_mot t9_map "algo"  = [2;5;4;6]


(***************************)
(*       EXERCICE 4        *)
(***************************)

(***************************)
(*       QUESTION 1        *)
(***************************)

type dico = Noeud of (string list * (int * dico) list)

let empty : dico = Noeud ([], [])

(***************************)
(*       QUESTION 2        *)
(***************************)

(* Fonction pour ajouter un chemin sur les branches d'un nœud *)
let rec ajouter_chemin_sur_branches chemin = function
  | [] -> []
  | [x] -> [(x, Noeud ([], []))] (* Dernier élément du chemin, créer un nœud vide *)
  | x::xs -> (x, Noeud ([], ajouter_chemin_sur_branches (x::chemin) xs)) :: []


(* Fonction pour insérer un mot dans un nœud en suivant un chemin représenté par des entiers *)
(* let rec inserer_mot_chemin chemin mot (Noeud (mots, fils)) =
  match chemin with
  | [] -> Noeud (mot :: mots, fils) (* Cas de base : arrivé à la fin du chemin, insérer le mot dans le nœud *)
  | code::reste_chemin ->
    match List.assoc_opt code fils with
    | None ->
        (* Si le code n'existe pas dans les fils, créer un nouveau nœud pour ce code *)
        let nouveau_noeud = inserer_mot_chemin reste_chemin mot (Noeud ([], [])) in
        let nouveau_fils = (code, nouveau_noeud) :: fils in
        Noeud (mots, nouveau_fils)
    | Some sous_noeud ->
        (* Si le code existe, continuer la récursion en descendant dans le sous-nœud correspondant *)
        let nouveau_sous_noeud = inserer_mot_chemin reste_chemin mot sous_noeud in
        let fils_mis_a_jour = (code, nouveau_sous_noeud) :: List.remove_assoc code fils in
        Noeud (mots, fils_mis_a_jour) *)



(* Fonction auxiliaire pour ajouter un élément à une liste s'il n'est pas déjà présent *)
let ajouter_si_absent mot liste =
  if List.mem mot liste then liste
  else mot :: liste

let rec inserer_mot_chemin chemin mot (Noeud (mots, fils)) =
  match chemin with
  | [] -> Noeud ((ajouter_si_absent mot mots), fils)  (* Insérer le mot dans le nœud courant à la fin du chemin *)
  | code::reste_chemin ->
    let (avant, apres) =
      match List.partition (fun (c, _) -> c = code) fils with
      | [], _ -> ([], (code, inserer_mot_chemin reste_chemin mot (Noeud ([], []))) :: fils)
      | [(c, sous_noeud)], autres -> [(c, inserer_mot_chemin reste_chemin mot sous_noeud)], autres
      | _ -> failwith "Impossible: plus d'un fils avec le même code"
    in
    Noeud (mots, avant @ apres)

let ajouter mappings arbre mot =
  let chemin = encoder_mot mappings mot in
  inserer_mot_chemin chemin mot arbre

let%test _ = ajouter t9_map empty "algo" = (Noeud ([], [(2, Noeud ([], [(5, Noeud ([], [(4, Noeud ([], [(6, Noeud (["algo"], []))]))]))]))]))
let%test _ = ajouter t9_map empty "sara" = (Noeud ([], [(7, Noeud ([], [(2, Noeud ([], [(7, Noeud ([], [(2, Noeud (["sara"], []))]))]))]))]))
let%test _ = ajouter t9_map empty "a" = Noeud ([], [(2, Noeud (["a"], []))]) 

(***************************)
(*       QUESTION 3        *)
(***************************)

let lire_mots_fichier chemin =
  let in_channel = open_in chemin in
  let rec lire_lignes acc =
    try
      let ligne = input_line in_channel in
      let mots = String.split_on_char ' ' ligne in
      let acc' = List.rev_append mots acc in  (* Ajout des mots de la ligne à l'accumulateur *)
      lire_lignes acc'
    with
    | End_of_file ->
        close_in in_channel;
        acc
  in
  let mots_du_fichier = lire_lignes [] in
  List.filter (fun mot -> mot <> "") mots_du_fichier  (* Filtrer les chaînes vides éventuelles *)

let%test _ = lire_mots_fichier "test.txt" = ["ab"; "aa"; "a"]

let ajouter_tous mappings chemin dico_initial =
    let mots = lire_mots_fichier chemin in
    List.fold_left (ajouter mappings) dico_initial mots
  

let%test _ = ajouter_tous t9_map "test.txt" empty =  Noeud ([], [(2, Noeud (["a"], [(2, Noeud (["aa"; "ab"], []))]))])

(***************************)
(*       QUESTION 4        *)
(***************************)




(***************************)
(*       QUESTION 5        *)
(***************************)


(******************************************************************************)
(*                                                                            *)
(*                fonction auxiliaire qui permet de trouver un sous-noeud 
                  dans les branches à partir d'un code donné                  *)
(*                                                                            *)
(*                                                                            *)
(*    signature : trouver_sous_noeud: int->(int*dico) list -> dico option
      signature : trouver_sous_noeud : 'a->('a*'b) list -> 'b option          *)
(*                                                                            *)
(*   paramètre(s) : code (chiffre), liste de paires (int*dico) où chaque 
                    paire représente une branche dans le dictionnaire         *)
(*   résultat     : sous_noeud associé au code                                *)
(*                                                                            *)
(******************************************************************************)

let trouver_sous_noeud code fils =
  List.fold_left (fun acc (c, sous_noeud) -> if c = code then Some sous_noeud else acc) None fils
(* Si le code `c` du tuple correspond au code recherché `code`, alors  on retourne "Some sous_noeud", et donc il existe un sous-noeud correspond au code. 
Sinon on retourne None qui indique qu'aucun sous-noeud correspondant n'a été trouvé.*)
  

(******************************************************************************)
(*                                                                            *)
(*                fonction qui vérifie si un mot appartient au
                                  dictionnaire                                *)
(*                                                                            *)
(*                                                                            *)
(*   signature :appartient : encodage −> dico −> string −> bool = <fun>       *)
(*                                                                            *)
(*   paramètre(s) : une liste de mapping, un dictionnaire 
                    et un mot                                                 *)
(*   résultat     : boolean (true si le mot appartient au dico, false sinon)  *)
(*                                                                            *)
(******************************************************************************)

let appartient encodage (Noeud (mots, fils)) mot =
  let chemin = encoder_mot encodage mot in
  (* `chemin` est la liste des codes obtenus en encodant le mot à l'aide de la fonction `encoder_mot`. Ce sont les étapes pour naviguer dans l'arbre jusqu'au mot recherché. *)

  let rec aux noeud chemin =
    (* `aux` : fonction auxiliaire récursive. `noeud` représente le nœud actuel dans l'arbre à partir duquel on commence la recherche, et `chemin` est la liste des codes restants à parcourir. *)

    match chemin with
    | [] -> List.mem mot (let Noeud (mots, _) = noeud in mots) (* Si `chemin` est vide, alors on a parcouru tous les codes et on est arrivé à la fin du chemin. On vérifie alors si `mot` appartient à la liste `mots` du nœud actuel en utilisant `List.mem`. *)
    | code::reste_chemin ->
      (* Si `chemin` n'est pas vide, alors il reste encore des codes *)

      match trouver_sous_noeud code (let Noeud (_, fils) = noeud in fils) with
      (* On cherche le sous-nœud correspondant au premier code dans `chemin` en utilisant `trouver_sous_noeud`. *)

      | None -> false
      (* Si aucun sous-nœud correspondant n'est trouvé, alors le mot n'existe pas dans le dictionnaire à cet endroit, donc on retourne `false`. *)

      | Some sous_noeud -> aux sous_noeud reste_chemin
      (* Sinon, on continue la recherche récursive en passant à ce sous-nœud et en réduisant `chemin` d'un élément (`reste_chemin`). *)

  in
  aux (Noeud (mots, fils)) chemin


let%test _ = appartient t9_map (ajouter_tous t9_map "test.txt" empty)  "ines" = false;;
let%test _ = appartient t9_map (ajouter_tous t9_map "test.txt" empty)  "aa" = true;;


let coherent encodage (Noeud (mots, fils)) =
  let rec aux (Noeud (mots, fils)) =
    (* On définit une fonction auxiliaire récursive qui vérifie la cohérence à partir d'un nœud *)
    let mots_sont_coherents = List.for_all (fun mot -> appartient encodage (Noeud (mots, fils)) mot) mots in
    (* On vérifie si tous les mots dans le nœud actuel sont cohérents avec l'encodage *)
    let sous_noeuds_sont_coherents = List.for_all (fun (_, sous_noeud) -> aux sous_noeud) fils in 
    (* Ensuite, on vérifie si tous les sous-nœuds sont cohérents récursivement *)
    (mots_sont_coherents && sous_noeuds_sont_coherents)
    (* Ainsi, le dictionnaire sera cohérent pour cet encodage si à la fois les mots du nœud actuel et tous les sous-nœuds sont cohérents *)
  in
  aux (Noeud (mots, fils))


let%test _ = coherent t9_map (ajouter_tous t9_map "test.txt" empty) = false;;




(***************************)
(*       EXERCICE 5        *)
(***************************)

(***************************)
(*       QUESTION 1        *)
(***************************)
(******************************************************************************)
(*                                                                            *)
(*                fonction qui identifie l’ensemble des mots
            correspondant à une suite de touches dans un dictionnaire         *)
(*                                                                            *)
(*                                                                            *)
(*   signature : decoder_mot : dico −> int list −> string  = <fun>            *)
(*                                                                            *)
(*   paramètre(s) : un dictionnaire, une liste d'entiers (touches)            *)
(*   résultat     : une liste de string (mots)                                *)
(*                                                                            *)
(******************************************************************************)
let rec decoder_mot (Noeud (mots, branches)) touches =
  match touches with
  | [] -> mots (* Si la liste de touches est vide, on retourne les mots du nœud courant *)
  | t::ts ->  (*Si la liste de touches n'est pas vide, on extrait la première touche t et le reste des touches ts.*)
    (* On utilise un List.fold_left qui applique une fonction à l'accumulateur acc et à chaque élément de la liste *)
    let result = List.fold_left (fun acc (key, subtree) ->
      if acc = [] && key = t then decoder_mot subtree ts else acc (*Si l'accumulateur est une liste vide et la touche correspond à t, on appelle récursivement decoder_mot sur le sous-dictionnaire avec le reste des touches (ts).*)
    ) [] branches (*[] est la valeur initiale de l'accumulateur, et 'branches' la liste des branches à parcourir*)
    in
    result

let%test _ = decoder_mot (ajouter_tous t9_map "test.txt" empty) [2;2] = ["aa";"ab"]

(***************************)
(*       QUESTION 2        *)
(***************************)

(******************************************************************************)
(*                                                                            *)
(*                fonction qui recueille tous les mots à partir 
                                d'un noeud donné
                                                                              *)
(*                                                                            *)
(*                                                                            *)
(*   signature : collecter_mots : dico −> string list  = <fun>                *)
(*                                                                            *)
(*   paramètre(s) : un dictionnaire                                           *)
(*   résultat     : une liste de string (mots)                                *)
(*                                                                            *)
(******************************************************************************)

let rec collecter_mots (Noeud (mots, branches)) =
  mots @ List.fold_left (fun acc (_, subtree) -> acc @ collecter_mots subtree) [] branches (*On prend un noeud du dico et on récupère tous les mots de ce noeud. Ensuite, on utilise List.fold_left pour combiner les mots du noeud courant (mots) avec les mots collectés de façon récursive à partir des branches*)


(******************************************************************************)
(*                                                                            *)
(*                fonction qui liste l’ensemble des
              mots d’un dictionnaire dont le préfixe a été saisi.             *)
(*                                                                            *)
(*                                                                            *)
(*   signature : prefixe : dico −> int list −> string list  = <fun>           *)
(*                                                                            *)
(*   paramètre(s) : un dictionnaire, une liste d'entiers (touches)            *)
(*   résultat     : une liste de string (mots)                                *)
(*                                                                            *)
(******************************************************************************)
let rec prefixe (Noeud (mots, branches)) touches =
  match touches with
  | [] -> collecter_mots (Noeud (mots, branches)) (* Si la liste de touches est vide, on collecte tous les mots à partir du noeud courant*)
  | t::ts -> (*Sinon, on extrait la première touche t et le reste des touches ts.*)
    (* On utilise List.fold_left pour rechercher la branche correspondant à la première touche *)
    List.fold_left (fun acc (key, subtree) ->
      if acc = [] && key = t then prefixe subtree ts else acc (*Si l'accumulateur est une liste vide et la touche correspond à t, on appelle récursivement prefixe sur le sous-dictionnaire avec le reste des touches (ts), sinon on retourne acc.*)
    ) [] branches


let%test _ = prefixe (ajouter_tous t9_map "test.txt" empty) [2] = ["a";"aa";"ab"]


(***************************)
(*       QUESTION 3        *)
(***************************)

(******************************************************************************)
(*                                                                            *)
(*                fonction qui calcule le nombre maximal de
        mots ayant la même séquence de touches dans un dictionnaire.          *)
(*                                                                            *)
(*                                                                            *)
(*   signature :max_mots_code_identique : dico −> int = <fun>                 *)
(*                                                                            *)
(*   paramètre(s) : un dictionnaire                                           *)
(*   résultat     : un entier                                                 *)
(*                                                                            *)
(******************************************************************************)
let rec max_mots_code_identique_aux (Noeud (mots, branches)) =
  let max_in_branches branches =
    (*Fonction qui parcourt les braches pour trouver le maximum*)
    List.fold_left (fun acc (_, subtree) -> max acc (max_mots_code_identique_aux subtree)) 0 branches
  in
  (* On retourne le maximum entre le nombre de mots dans le nœud courant et le maximum trouvé dans les branches *)
  max (List.length mots) (max_in_branches branches)


let%test _ = max_mots_code_identique_aux (ajouter_tous t9_map "test.txt" empty) = 2


(***************************)
(*       QUESTION 4        *)
(***************************)


(******************************************************************************)
(*                                                                            *)
(*        fonction qui liste l’ensemble des mots d’un dictionnaire.           *)
(*                                                                            *)
(*                                                                            *)
(*   signature : lister : dico −> string list = <fun>                         *)
(*                                                                            *)
(*   paramètre(s) : un dictionnaire                                           *)
(*   résultat     : une liste de string (mots)                                *)
(*                                                                            *)
(******************************************************************************)

let rec lister (Noeud (mots, branches)) =
  (* On collecte les mots à partir des branches avec List.fold_left *)
  let collect_from_branches branches =
    List.fold_left (fun acc (_, subtree) -> acc @ (lister subtree)) [] branches
  in
  (* On combine les mots du nœud courant avec ceux collectés des branches *)
  mots @ (collect_from_branches branches)


let%test _ = lister (ajouter_tous t9_map "test.txt" empty) = ["a"; "aa";"ab"]

(***************************)
(*       QUESTION 5        *)
(***************************)