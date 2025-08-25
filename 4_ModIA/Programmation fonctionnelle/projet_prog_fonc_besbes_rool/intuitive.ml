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
(*   signature : encoder_lettre : encodage -> char -> int = <fun>             *)
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
(*   signature : encoder_mot : encodage -> string -> int list = <fun>         *)
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

(******************************************************************************)
(*                                                                            *)
(*      fonction qui ajoute un mot à un dictionnaire donné connaisant         *)
(*                           la table de mapping                              *)
(*                                                                            *)
(*   signature : ajouter : encodage -> dico -> string -> dico = <fun>         *)
(*                                                                            *)
(*   paramètre(s) : une table de mapping, un dictionnaire et un mot           *)
(*   résultat     : un dictionnaire                                           *)
(*                                                                            *)
(******************************************************************************)

let ajouter l_t9 dico mot =
  let chemin_liste = encoder_mot l_t9 mot in (* on convertit le mot en une liste de codes T9 *)
  let rec ajouter_mot chemin mot dico = (* fonction récursive pour ajouter un mot à un dictionnaire *)
    match chemin, dico with
    | [], Noeud (mots, branches) -> (* cas de base : le chemin est vide et nous sommes sur un noeud de type Noeud *)
        if not (List.mem mot mots) then  (* on vérifie si le mot n'est pas déjà présent dans la liste de mots *)
          Noeud (mots@[mot], branches)  (* si il n'est pas présent, on ajoute le mot à la liste de mots *)
        else
          Noeud (mots, branches)  (* sinon, on retourne le dictionnaire inchangé *)
    | t::q, Noeud (mots, branches) -> (* cas récursif : il reste encore des integers dans la liste à parcourir *)
        let rec ajouter_dans_branches = function (* fonction locale pour ajouter le mot dans les branches du noeud courant *)
          | [] -> [(t, ajouter_mot q mot (Noeud ([], [])))] (* si la liste de branches est vide, ajoute une nouvelle branche avec le code et le sous-dictionnaire résultant *)
          | (x, sous_dico) :: reste when x = t -> (x, ajouter_mot q mot sous_dico) :: reste (* si la tête de la liste de branches correspond au code t, récursivement ajoute le mot dans ce sous-dictionnaire *)
          | branche :: reste -> branche :: ajouter_dans_branches reste
        in
        Noeud (mots, ajouter_dans_branches branches) (* on met à jour le noeud courant avec les mots actuels et les branches mises à jour *)
  in
  ajouter_mot chemin_liste mot dico

(* on crée un dico_test pour pouvoir faire des tests : il contient bon, bonjour, tendre et vendre*)
let dico_test = Noeud ([], [(2, Noeud ([], [(6, Noeud ([], [(6, Noeud (["bon"], [(5, Noeud ([], [(6, Noeud ([], [(8, Noeud ([], [(7, Noeud (["bonjour"], []))]))]))]))]))]))])); (8, Noeud ([], [(3, Noeud ([], [(6, Noeud ([], [(3, Noeud ([], [(7, Noeud([], [(3, Noeud (["tendre"; "vendre"], []))]))]))]))]))]))])

let%test _ = ajouter t9_map empty "algo" = (Noeud ([], [(2, Noeud ([], [(5, Noeud ([], [(4, Noeud ([], [(6, Noeud (["algo"], []))]))]))]))]))
let%test _ = ajouter t9_map dico_test "bonne" = Noeud ([], [(2, Noeud ([], [(6, Noeud ([], [(6, Noeud (["bon"], [(5, Noeud ([], [(6, Noeud ([], [(8, Noeud ([], [(7, Noeud (["bonjour"], []))]))]))])); (6, Noeud ([], [(3, Noeud (["bonne"],[]))]))]))]))])); (8, Noeud ([], [(3, Noeud ([], [(6, Noeud ([], [(3, Noeud ([], [(7, Noeud([], [(3, Noeud (["tendre"; "vendre"], []))]))]))]))]))]))])
let%test _ = ajouter t9_map dico_test "bom" = Noeud ([], [(2, Noeud ([], [(6, Noeud ([], [(6, Noeud (["bon"; "bom"], [(5, Noeud ([], [(6, Noeud ([], [(8, Noeud ([], [(7, Noeud (["bonjour"], []))]))]))]))]))]))])); (8, Noeud ([], [(3, Noeud ([], [(6, Noeud ([], [(3, Noeud ([], [(7, Noeud([], [(3, Noeud (["tendre"; "vendre"], []))]))]))]))]))]))])
let%test _ = ajouter t9_map dico_test "bon" = dico_test


(***************************)
(*       QUESTION 3        *)
(***************************)

(******************************************************************************)
(*                                                                            *)
(*         fonction qui retourne une liste de mot à partir du chemin          *)
(*                            d'un fichier texte                              *)
(*                                                                            *)
(*   signature : lire_mots_fichier : string -> string list = <fun>            *)
(*                                                                            *)
(*   paramètre(s) : le chemin d'un fichier texte                              *)
(*   résultat     : une liste de mot ordonné                                  *)
(*                                                                            *)
(******************************************************************************)

let lire_mots_fichier fichier =
  let in_channel = open_in fichier in (* on ouvre le canal d'entrée pour lire à partir de l'emplacement du fichier *)
  let rec lire_lignes acc = (* fonction récursive pour lire toutes les lignes du fichier *)
    try
      let ligne = input_line in_channel in (* on lit une ligne complète du fichier *)
      let mots = String.split_on_char ' ' ligne in (* on divise la ligne en mots en utilisant l'espace comme séparateur *)
      let acc' = List.rev_append mots acc in (* on ajoute les mots à un accumulateur, en inversant l'ordre, pour préserver l'ordre d'origine *)
      lire_lignes acc' (* on continue à lire les lignes récursivement *)
    with
    | End_of_file ->
        close_in in_channel; (* on ferme le canal d'entrée lorsque la fin du fichier est atteinte *)
        acc (* on retourne l'accumulateur final contenant tous les mots du fichier *)
  in
  let mots_du_fichier = lire_lignes [] in (* on appelle la fonction récursive pour lire toutes les lignes du fichier *)
  let mots_non_vides = List.filter (fun mot -> mot <> "") mots_du_fichier in (* on filtre les mots vides, juste des espaces *)
  List.sort String.compare mots_non_vides (* on finit par trier les mots non vides en ordre alphabétique *)


(* on a crée un fichier test.txt*)
let%test _ = lire_mots_fichier "test.txt" = ["bon"; "bonjour"; "bonne"; "tendre"; "vendre"]

(******************************************************************************)
(*                                                                            *)
(*        fonction qui ajoute les mots d'une liste à un dictionnaire          *)
(*                                                                            *)
(*                                                                            *)
(*   signature : creer_dico : encodage -> string -> dico = <fun>              *)
(*                                                                            *)
(*   paramètre(s) : une table de mapping et le chemin d'un fichier texte      *)
(*   résultat     : un dictionnaire                                           *)
(*                                                                            *)
(******************************************************************************)

let creer_dico l_t9 fichier  = (* on ajoute les mots de la liste un par un à un dictionnaire vide *)
    let mots = lire_mots_fichier fichier in
    List.fold_left (ajouter l_t9) (Noeud ([], [])) mots

let%test _ = creer_dico t9_map "test.txt" = Noeud ([], [(2, Noeud ([], [(6, Noeud ([], [(6, Noeud (["bon"], [(5, Noeud ([], [(6, Noeud ([], [(8, Noeud ([], [(7, Noeud (["bonjour"], []))]))]))]));(6, Noeud([], [(3, Noeud(["bonne"], []))]))]))]))])); (8, Noeud ([], [(3, Noeud ([], [(6, Noeud ([], [(3, Noeud ([], [(7, Noeud([], [(3, Noeud (["tendre"; "vendre"], []))]))]))]))]))]))])

(***************************)
(*       QUESTION 4        *)
(***************************)

(******************************************************************************)
(*                                                                            *)
(*            fonction qui supprime un mot donné dans une liste               *)
(*                                                                            *)
(*                                                                            *)
(*   signature : supprime_mot : string -> string list -> string list = <fun>  *)
(*                                                                            *)
(*   paramètre(s) : un mot et une liste de mot                                *)
(*   résultat     : une liste de mot                                          *)
(*                                                                            *)
(******************************************************************************)

let rec supprime_mot mot l =
  match l with
  | [] -> [] (* cas de base : si la liste est vide, on retourne une liste vide *)
  | t :: q -> (* cas récursif : on sépare la liste en tête et queue *)
    match t with
    | m when m = mot -> q
    | _ -> t :: supprime_mot mot q

let%test _ = supprime_mot "mot" ["mot"] = []
let%test _ = supprime_mot "mot" ["mot"; "autre_mot"] = ["autre_mot"]
let%test _ = supprime_mot "mauvais_mot" ["mot"; "autre_mot"] = ["mot"; "autre_mot"]

(******************************************************************************)
(*                                                                            *)
(*              fonction qui supprime un mot d'un dictionnaire                *)
(*                                                                            *)
(*                                                                            *)
(*   signature : supprimer : encodage -> dico -> string -> dico = <fun>       *)
(*                                                                            *)
(*   paramètre(s) : une table de mapping, un dictionnaire et un mot           *)
(*   résultat     : un dictionnaire                                           *)
(*                                                                            *)
(******************************************************************************)

let supprimer l_t9 dico mot =
  let touches = encoder_mot l_t9 mot in (* on convertit le mot en une liste de touches *)
  let rec aux (Noeud (mots, branches)) chemin = (* on crée un fonction auxiliaire récursive pour effectuer la suppression *)
    match chemin with
    | [] -> 
        let new_mots = supprime_mot mot mots in (* on supprime le mot de la liste de mots *)
        if new_mots = [] && branches = [] then  (* on vérifie s'il reste des mots et des branches après la suppression *)
          None (* si il reste aucun mot et aucune branche, on retourne None pour indiquer la suppression complète *)
        else 
          Some (Noeud (new_mots, branches)) (* sinon, on retourne le dictionnaire mis à jour *)
    | t :: q -> 
        let new_branche = List.filter_map (fun (touche, branche) -> (* on filtre et on met à jour les branches *)
          if touche = t then
            match aux branche q with
            | None -> None (* si la suppression retourne None, on ne conserve pas cette branche *)
            | Some new_branche -> Some (touche, new_branche) (* sinon, on met à jour la branche avec la nouvelle version *)
          else 
            Some (touche, branche) (* on conserve les branches qui ne correspondent pas à la touche à supprimer *)
        ) branches in
        if new_branche = [] && mots = [] then  (* on vérifie s'il reste des branches et des mots après la mise à jour *)
          None (* si il reste aucun mot et aucune branche, on retourne None pour indiquer la suppression complète *)
        else 
          Some (Noeud (mots, new_branche)) (* sinon, on retourne le dictionnaire mis à jour *)
  in (* on appelle la fonction auxiliaire avec le dictionnaire et les touches du mot à supprimer *)
  match aux dico touches with
  | None -> Noeud ([], []) (* si la suppression retourne None, on retourne un dictionnaire vide *)
  | Some new_dico -> new_dico (* sinon, on retourne le dictionnaire mis à jour *)

let%test _ = supprimer t9_map dico_test "bon" =  Noeud ([], [(2, Noeud ([], [(6, Noeud ([], [(6, Noeud ([], [(5, Noeud ([], [(6, Noeud ([], [(8, Noeud ([], [(7, Noeud (["bonjour"], []))]))]))]))]))]))])); (8, Noeud ([], [(3, Noeud ([], [(6, Noeud ([], [(3, Noeud ([], [(7, Noeud([], [(3, Noeud (["tendre"; "vendre"], []))]))]))]))]))]))])
let%test _ = supprimer t9_map dico_test "vendre" = Noeud ([], [(2, Noeud ([], [(6, Noeud ([], [(6, Noeud (["bon"], [(5, Noeud ([], [(6, Noeud ([], [(8, Noeud ([], [(7, Noeud (["bonjour"], []))]))]))]))]))]))])); (8, Noeud ([], [(3, Noeud ([], [(6, Noeud ([], [(3, Noeud ([], [(7, Noeud([], [(3, Noeud (["tendre"], []))]))]))]))]))]))])
let%test _ = supprimer t9_map dico_test "bonjour" = Noeud ([], [(2, Noeud ([], [(6, Noeud ([], [(6, Noeud (["bon"], []))]))])); (8, Noeud ([], [(3, Noeud ([], [(6, Noeud ([], [(3, Noeud ([], [(7, Noeud([], [(3, Noeud (["tendre"; "vendre"], []))]))]))]))]))]))])
let%test _ = supprimer t9_map dico_test "mauvais_mot" =  Noeud ([], [(2, Noeud ([], [(6, Noeud ([], [(6, Noeud (["bon"], [(5, Noeud ([], [(6, Noeud ([], [(8, Noeud ([], [(7, Noeud (["bonjour"], []))]))]))]))]))]))])); (8, Noeud ([], [(3, Noeud ([], [(6, Noeud ([], [(3, Noeud ([], [(7, Noeud([], [(3, Noeud (["tendre"; "vendre"], []))]))]))]))]))]))])

(***************************)
(*       QUESTION 5        *)
(***************************)

(***************************)
(*        METHODE 1        *)
(***************************)

(******************************************************************************)
(*                                                                            *)
(*       fonction qui permet de trouver un sous-noeud dans les branches       *)
(*                        à partir d'une touche donnée                        *)
(*                                                                            *)
(*    signature : trouver_sous_noeud: int->(int*dico)list->dico option = <fun>*)
(*    signature : trouver_sous_noeud : 'a->('a*'b) list -> 'b option = <fun>  *)
(*                                                                            *)
(*   paramètre(s) : touche (chiffre), liste de paires (int*dico) où chaque    *)
(*                    paire représente une branche dans le dictionnaire       *)
(*   résultat     : sous_noeud associé à la touche                            *)
(*                                                                            *)
(******************************************************************************)

let trouver_sous_noeud touche branche = List.fold_left (fun acc (t, sous_noeud) -> if t = touche then Some sous_noeud else acc) None branche
(* si la touche du tuple correspond à la touce recherchée, alors  on retourne le sous-noeud correspond au code. *)
(* sinon on retourne None qui indique qu'aucun sous-noeud correspondant n'a été trouvé. *)

let%test _ = trouver_sous_noeud 9 [(2, Noeud([], [])); (5, Noeud([], [])); (9, Noeud([], []))] =  Some (Noeud([], []))
let%test _ = trouver_sous_noeud 3 [(2, Noeud([], [])); (5, Noeud([], [])); (9, Noeud([], []))] =  None


(******************************************************************************)
(*                                                                            *)
(*        fonction qui vérifie si un mot appartient au dictionnaire           *)
(*                                                                            *)
(*                                                                            *)
(*   signature : appartient : encodage −> dico −> string −> bool = <fun>      *)
(*                                                                            *)
(*   paramètre(s) : une liste de mapping, un dictionnaire et un mot           *)
(*                                                                            *)
(*   résultat     : boolean (true si le mot appartient au dico, false sinon)  *)
(*                                                                            *)
(******************************************************************************)

let appartient encodage (Noeud (mots, branches)) mot =
  let chemin = encoder_mot encodage mot in (* `chemin` est la liste des codes obtenus en encodant le mot à l'aide de la fonction `encoder_mot` *)
  let rec aux noeud chemin = (* on crée une fonction auxiliaire récursive. `noeud` représente le noeud actuel dans l'arbre à partir duquel on commence la recherche, et `chemin` est la liste des codes restants à parcourir. *)
    match chemin with
    | [] -> List.mem mot (let Noeud (mots, _) = noeud in mots) (* si `chemin` est vide, alors on a parcouru tous les codes et on est arrivé à la fin du chemin. On vérifie alors si `mot` appartient à la liste `mots` du noeud actuel en utilisant `List.mem`. *)
    | touche::reste_chemin -> (* si le chemin n'est pas vide, alors il reste encore des codes *)
      match trouver_sous_noeud touche (let Noeud (_, branches) = noeud in branches) with (* on cherche le sous-noeud correspondant au premier code dans `chemin` en utilisant `trouver_sous_noeud`. *)
      | None -> false (* si aucun sous-noeud correspondant n'est trouvé, alors le mot n'existe pas dans le dictionnaire à cet endroit, donc on retourne `false`. *)
      | Some sous_noeud -> aux sous_noeud reste_chemin (* sinon, on continue la recherche récursive en passant à ce sous-noeud et en réduisant `chemin` d'un élément (`reste_chemin`). *)
  in
  aux (Noeud (mots, branches)) chemin

let%test _ = appartient t9_map dico_test "ines" = false;;
let%test _ = appartient t9_map dico_test "bon" = true;;


(***************************)
(*        METHODE 2        *)
(***************************)

(******************************************************************************)
(*                                                                            *)
(*       fonction qui recueille tous les mots à partir d'un noeud donné       *)
(*                                                                            *)
(*                                                                            *)
(*   signature : lister : dico −> string list  = <fun>                        *)
(*                                                                            *)
(*   paramètre(s) : un dictionnaire                                           *)
(*   résultat     : une liste de string (mots)                                *)
(*                                                                            *)
(******************************************************************************)

(* cette fonction est la même que celle de la question 4 de cet exercice 5 *)
let rec lister (Noeud (mots, branches)) = mots @ List.fold_left (fun acc (_, sous_branche) -> acc @ lister sous_branche) [] branches
(* on prend un noeud du dico et on récupère tous les mots de ce noeud. Ensuite, on utilise List.fold_left pour combiner les mots du noeud courant (mots) avec les mots collectés de façon récursive à partir des branches*)

let%test _ = lister dico_test = ["bon"; "bonjour"; "tendre"; "vendre"]

(******************************************************************************)
(*                                                                            *)
(*        fonction qui vérifie si un mot appartient au dictionnaire           *)
(*                                                                            *)
(*                                                                            *)
(*   signature : appartient_bis : encodage −> dico −> string −> bool = <fun>   *)
(*                                                                            *)
(*   paramètre(s) : une liste de mapping, un dictionnaire et un mot           *)
(*                                                                            *)
(*   résultat     : boolean (true si le mot appartient au dico, false sinon)  *)
(*                                                                            *)
(******************************************************************************)

let appartient_bis dico mot = List.mem mot (lister dico) (* on utilise les fonctions déjà implémentées *)

let%test _ = appartient_bis dico_test "ines" = false;;
let%test _ = appartient_bis dico_test "bon" = true;;

(***************************)
(*       QUESTION 6        *)
(***************************)

let dico_test_coherent = Noeud ([], [(2, Noeud ([], [(6, Noeud ([], [(6, Noeud (["don"], [(5, Noeud ([], [(6, Noeud ([], [(8, Noeud ([], [(7, Noeud (["bonjour"], []))]))]))]))]))]))])); (8, Noeud ([], [(3, Noeud ([], [(6, Noeud ([], [(3, Noeud ([], [(7, Noeud([], [(3, Noeud (["tendre"; "vendre"], []))]))]))]))]))]))])

(******************************************************************************)
(*                                                                            *)
(*                  fonction qui vérifie si un dictionnaire                   *)
(*                    est cohérent pour un encodage donné                     *)
(*                                                                            *)
(*                                                                            *)
(*   signature : coherent : encodage −> dico −> bool = <fun>                  *)
(*                                                                            *)
(*   paramètre(s) : une liste de mapping et un dictionnaire                   *)
(*                                                                            *)
(*   résultat     : boolean                                                   *)
(*                                                                            *)
(******************************************************************************)
let coherent encodage dico =
  let rec aux chemin (Noeud(mots, enfants)) =
    (* On vérifie si tous les mots du nœud sont cohérents avec le chemin *)
    let mots_coherents = List.for_all (fun mot -> 
      encoder_mot encodage mot = chemin 
    ) mots (*mots_coherents est true si tous les mots du noeud actuel sont cohérents avec le chemin de touches.*)
  in 
    
    (* On vérifie récursivement la cohérence des enfants *)
    let enfants_coherents = List.for_all (fun (touche, sous_dico) ->
      aux (chemin @ [touche]) sous_dico
    ) enfants (*enfants_coherents est true si tous les sous-dictionnaires sont cohérents avec leurs chemins respectifs.*)
  in
    
    mots_coherents && enfants_coherents (*On retourne true si les mots et les enfants sont cohérents.*)
  in
  aux [] dico (*On vérifie avec un chemin de touches vide, en commençant par le dictionnaire complet.*)

let%test _ = coherent t9_map dico_test = true;;
let%test _ = coherent t9_map dico_test_coherent = false;;

(***************************)
(*       EXERCICE 5        *)
(***************************)

(***************************)
(*       QUESTION 1        *)
(***************************)

(******************************************************************************)
(*                                                                            *)
(*                fonction qui identifie l’ensemble des mots                  *)
(*            correspondant à une suite de touches dans un dictionnaire       *)
(*                                                                            *)
(*                                                                            *)
(*   signature : decoder_mot : dico −> int list −> string list  = <fun>       *)
(*                                                                            *)
(*   paramètre(s) : un dictionnaire, une liste d'entiers (touches)            *)
(*   résultat     : une liste de string (mots)                                *)
(*                                                                            *)
(******************************************************************************)

let rec decoder_mot (Noeud (mots, branches)) touches =
  match touches with
  | [] -> mots (* si la liste de touches est vide, on retourne les mots du noeud courant *)
  | t::q ->  (* Si la liste de touches n'est pas vide, on extrait la première touche t et le reste des touches q *)
    (* on utilise un List.fold_left qui applique une fonction à l'accumulateur acc et à chaque élément de la liste *)
    let result = List.fold_left (fun acc (touche, sous_branche) ->
      if acc = [] && touche = t then decoder_mot sous_branche q else acc (* si l'accumulateur est une liste vide et la touche correspond à t, on appelle récursivement decoder_mot sur le sous-dictionnaire avec le reste des touches q *)
    ) [] branches (* [] est la valeur initiale de l'accumulateur, et 'branches' la liste des branches à parcourir *)
    in
    result

let%test _ = decoder_mot dico_test [8;3;6;3;7;3] = ["tendre";"vendre"]
let%test _ = decoder_mot dico_test [2;6;6] = ["bon"]

(***************************)
(*       QUESTION 2        *)
(***************************)

(******************************************************************************)
(*                                                                            *)
(*         fonction qui liste l’ensemble des mots d’un dictionnaire           *)
(*                       dont le préfixe a été saisi                          *)
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
  | [] -> lister (Noeud (mots, branches)) (* si la liste de touches est vide, on collecte tous les mots à partir du noeud courant*)
  | t::q -> (* sinon, on extrait la première touche t et le reste des touches q*)
    (* o, utilise List.fold_left pour rechercher la branche correspondant à la première touche *)
    List.fold_left (fun acc (touche, sous_branche) ->
      if acc = [] && touche = t then prefixe sous_branche q else acc (* si l'accumulateur est une liste vide et la touche correspond à t, on appelle récursivement prefixe sur le sous-dictionnaire avec le reste des touches q, sinon on retourne acc *)
    ) [] branches

let%test _ = prefixe dico_test [8] = ["tendre"; "vendre"]
let%test _ = prefixe dico_test [2] = ["bon"; "bonjour"]
let%test _ = prefixe dico_test [2;6;6;5] = ["bonjour"]


(***************************)
(*       QUESTION 3        *)
(***************************)

(******************************************************************************)
(*                                                                            *)
(*   fonction qui calcule le nombre maximal de mots ayant la même séquence    *)
(*                      de touches dans un dictionnaire                       *)
(*                                                                            *)
(*                                                                            *)
(*   signature : max_mots_code_identique : dico −> int = <fun>                *)
(*                                                                            *)
(*   paramètre(s) : un dictionnaire                                           *)
(*   résultat     : un entier                                                 *)
(*                                                                            *)
(******************************************************************************)
let rec max_mots_code_identique_aux (Noeud (mots, branches)) =
  let max_in_branches branches =(* fonction qui parcourt les braches pour trouver le maximum *)
    List.fold_left (fun acc (_, subtree) -> max acc (max_mots_code_identique_aux subtree)) 0 branches
  in (* on retourne le maximum entre le nombre de mots dans le noeud courant et le maximum trouvé dans les branches *)
  max (List.length mots) (max_in_branches branches)

let%test _ = max_mots_code_identique_aux dico_test = 2
let%test _ = max_mots_code_identique_aux (ajouter t9_map dico_test "uendre") = 3


(***************************)
(*       QUESTION 4        *)
(***************************)

(******************************************************************************)
(*                                                                            *)
(*       fonction qui recueille tous les mots à partir d'un noeud donné       *)
(*                                                                            *)
(*                                                                            *)
(*   signature : lister : dico −> string list  = <fun>                        *)
(*                                                                            *)
(*   paramètre(s) : un dictionnaire                                           *)
(*   résultat     : une liste de string (mots)                                *)
(*                                                                            *)
(******************************************************************************)

let rec lister (Noeud (mots, branches)) = mots @ List.fold_left (fun acc (_, sous_branche) -> acc @ lister sous_branche) [] branches
(* on prend un noeud du dico et on récupère tous les mots de ce noeud. Ensuite, on utilise List.fold_left pour combiner les mots du noeud courant (mots) avec les mots collectés de façon récursive à partir des branches*)

let%test _ = lister dico_test = ["bon"; "bonjour"; "tendre"; "vendre"]

(***************************)
(*       QUESTION 5        *)
(***************************)

(******************************************************************************)
(*                                                                            *)
(*       fonction qui identifie l’ensemble des mots correspondant             *)
(*            à une suite de touches dans laquelle exactement                 *)
(*               (n paramètre) erreurs se sont glissées                       *)
(*                                                                            *)
(*                                                                            *)
(*   signature : proche : dico −> int list −> int −> string list = <fun>      *)
(*                                                                            *)
(*   paramètre(s) : un dico, une liste d'entiers (touches) et un entier       *)
(*   résultat     : une liste de string (mots)                                *)
(*                                                                            *)
(******************************************************************************)
let proche dico keys n = 
  (* On définit une fonction auxiliaire qui compare la séquence de touches donnée avec celle d'un mot qui contient n erreurs *)
  let rec compare_keys keys word_keys n =
    match keys, word_keys with
    | [], [] -> n = 0  (* Si les deux listes sont vides, on vérifie s'il reste exactement 0 erreurs *)
    | _ , [] | [], _ -> false  (* Si une des listes est vide, mais pas l'autre, on retourne faux *)
    | k::ks, wk::wks ->  (* Sinon, on compare les têtes des listes *)
        if k = wk then
          compare_keys ks wks n  (* Si les touches sont égales, on continue la comparaison sans changer n *)
        else if n > 0 then
          compare_keys ks wks (n-1)  (* Si les touches sont différentes et qu'il reste des erreurs permises, on diminue n *)
        else
          false  (* Sinon, retourner faux car il n'y a plus d'erreurs permises *)
  in

  let rec search_dict (Noeud (mots, branchhes)) keys n =
    (* On filtre les mots du noeud actuel qui correspondent à la séquence de touches avec exactement n erreurs *)
    let matches = List.filter (fun mot -> compare_keys keys (encoder_mot t9_map mot) n) mots in
    (* On parcourt récursivement les enfants du nœud pour trouver des correspondances *)
    let child_matches = List.concat (List.map (fun (_, child) -> search_dict child keys n) branchhes) in
    (* On combine les correspondances trouvées dans le nœud actuel et celles trouvées dans les enfants *)
    matches @ child_matches
  in
  (* On appelle la fonction de recherche sur le dictionnaire avec la séquence de touches donnée et le nombre d'erreurs permises *)
  search_dict dico keys n


let%test _ = proche dico_test [2;6;6;5;6;8;9] 1 = ["bonjour"] 