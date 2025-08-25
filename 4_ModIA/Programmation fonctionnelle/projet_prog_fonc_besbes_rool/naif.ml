open Encodage
open Chaines

(* Saisie des mots sans le mode T9 *)
(* Pour marquer le passage d'un caractère à un autre, on utilise la touche 0 *)

(***************************)
(*       EXERCICE 1        *)
(***************************)

(***************************)
(*       QUESTION 1        *)
(***************************)

(******************************************************************************)
(*                                                                            *)
(*      fonction qui retourne la position d'un élément dans une liste         *)
(*                                                                            *)
(*   signature : return_position_list : 'a list -> 'a -> int = <fun>          *)
(*                                                                            *)
(*   paramètre(s) : une liste et un élément de même type                      *)
(*   résultat     : un integer decrivant la position (on commence à 1)        *)
(*                                                                            *)
(******************************************************************************)
let return_position_list l e = 
  let rec aux l idx = (* fonction auxiliaire introduisant un index*)
    match l with
    | [] -> -1 (* si la liste est vide on retourne -1*)
    | t :: q -> if t = e then idx else aux q (idx+1) (* sinon on compare la tête de la liste à notre élément*)
    (*si ils sont égaux, on retourne l'index sinon on fait un appel récursif*)
  in (* on instance la fonction auxiliaire à index = 1 et en prenant la liste passée en argument*)
  aux l 1 

let%test _ = return_position_list ["a"; "b"; "c"] "c" = 3
let%test _ = return_position_list ["a"; "b"; "c"] "a" = 1
let%test _ = return_position_list [] "c" = -1


(******************************************************************************)
(*                                                                            *)
(*   fonction qui indique la touche et le nombre de fois qu'il faut appuyer   *)
(*             dessus pour saisir la lettre passée en paramètre               *)
(*                                                                            *)
(*   signature : encoder_lettre : (int* 'a list) list -> 'a -> int*int = <fun>*)
(*                                                                            *)
(*   paramètre(s) : un character et une liste de mapping                      *)
(*   résultat     : un tuple (touche, nombre à appuyer)                       *)
(*                                                                            *)
(******************************************************************************)

let encoder_lettre l_t9 c = List.fold_left (fun acc (i, l) -> if return_position_list l c <> -1 then (i, return_position_list l c) else acc) (-1, -1) l_t9 


let%test _ = encoder_lettre t9_map 'c' = (2,3)
let%test _ = encoder_lettre t9_map 'w' = (9,1)
let%test _ = encoder_lettre t9_map 's' = (7,4)


(***************************)
(*       QUESTION 2        *)
(***************************)

(******************************************************************************)
(*                                                                            *)
(*   fonction qui retourne une liste de tuple d'instruction en fonction d'un  *)
(*                                   mot                                      *)
(*                                                                            *)
(*   signature : string_to_instruction_list : (int*char list) list -> string  *)
(*                                             -> (int*int)list = <fun>       *)
(*                                                                            *)
(*   paramètre(s) : une liste de mapping et un string                         *)
(*   résultat     : une liste de tuple (touche, nombre à appuyer)             *)
(*                                                                            *)
(******************************************************************************)

let string_to_instruction_list l_t9 s =
  (*on applique la fonction encoder_lettre à chaque lettre du mot décomposé grâce decompose_chaine *)
  List.map (fun c -> encoder_lettre l_t9 c) (decompose_chaine s)

let%test _ = string_to_instruction_list t9_map "sara" = [(7,4); (2,1); (7,3); (2,1)]
let%test _ = string_to_instruction_list t9_map "besbes" = [(2,2); (3,2); (7,4); (2,2); (3,2); (7,4)]
let%test _ = string_to_instruction_list t9_map "algo" = [(2,1); (5,3); (4,1); (6,3)]


(******************************************************************************)
(*                                                                            *)
(* fonction qui transforme un tuple en une liste d'integer en finissant par 0 *)
(*                                                                            *)
(*                                                                            *)
(*   signature : tuple_to_list : int*int -> int list = <fun>                  *)
(*                                                                            *)
(*   paramètre(s) : un tuple (touche, nb)                                     *)
(*   résultat     : une liste d'integer                                       *)
(*                                                                            *)
(******************************************************************************)

let rec tuple_to_list (touche, nb) =
  match nb with
  | -1 -> failwith "erreur d'encodage" (* si nb est égal à -1, cela indique une erreur d'encodage *)
  | 0 -> [0]  (* si nb est égal à 0, on renvoie une liste contenant 0 pour marquer la fin d'une lettre *)
  | _ -> [touche] @ tuple_to_list (touche, nb - 1) (* sinon on construit la liste en appelant récursivement *)

let%test _ = tuple_to_list (2,3) = [2;2;2;0]
let%test _ = tuple_to_list (9,1) = [9;0]


(******************************************************************************)
(*                                                                            *)
(*       fonction qui retourne la suite de touche à presser pour saisir un    *)
(*                          mot passé en paramètre                            *)
(*                                                                            *)
(*   signature : encoder_mot :(int*charlist)list -> string -> int list = <fun>*)
(*                                                                            *)
(*   paramètre(s) : une liste de mapping et un mot                            *)
(*   résultat     : une liste d'instruction                                   *)
(*                                                                            *)
(******************************************************************************)
let encoder_mot l_t9 s = List.flatten (List.map tuple_to_list (string_to_instruction_list l_t9 s))
(* on decompose le mot en liste de tuple d'instruction puis on les transforme en liste d'integer, on flatten à la fin par soucis de dimension *)

let%test _ = encoder_mot t9_map "sara" = [7;7;7;7;0;2;0;7;7;7;0;2;0]
let%test _ = encoder_mot t9_map "besbes" = [2;2;0;3;3;0;7;7;7;7;0;2;2;0;3;3;0;7;7;7;7;0]
let%test _ = encoder_mot t9_map "algo" = [2;0;5;5;5;0;4;0;6;6;6;0] 


(***************************)
(*       EXERCICE 2        *)
(***************************)

(***************************)
(*       QUESTION 1        *)
(***************************)

(******************************************************************************)
(*                                                                            *)
(*             fonction qui retourne la n-ième élément d'une liste            *)
(*                                                                            *)
(*                                                                            *)
(*   signature : nieme_element : int -> 'a list -> 'a = <fun>                 *)
(*                                                                            *)
(*   paramètre(s) : une position et une liste                                 *)
(*   résultat     : un élément de la liste                                    *)
(*                                                                            *)
(******************************************************************************)
let rec nieme_element n l =
  match (n, l) with
  | (_, []) -> failwith "index hors limite" (* Si la liste est vide, l'index est hors limite *)
  | (1, t::_) -> t (* Si l'index est 1, retourne le premier élément *)
  | (_, _::q) -> nieme_element (n - 1) q (* Appel récursif pour l'index suivant et la liste restante *)


(******************************************************************************)
(*                                                                            *)
(*fonction qui retourne une liste de lettre de t9_map en fonction de la touche*)
(*                                                                            *)
(*                                                                            *)
(*   signature : return_char_list_from_int : ('a*'b)list -> 'a -> 'b = <fun>  *)
(*                                                                            *)
(*   paramètre(s) : une liste de mapping et une touche                        *)
(*   résultat     : une liste de lettre                                       *)
(*                                                                            *)
(******************************************************************************)

let return_char_list_from_int l_t9 n =
  match List.fold_left(fun acc (touche, char_l) -> if touche = n then Some char_l else acc) None l_t9 with
    | Some result -> result
    | None -> failwith "touche non trouvé dans la liste"

(* on cherche dans t9_map avec List.fold_left si il existe une touche correspondant au paramètre n *)
(* lorsqu'on trouve la touche on retourne la liste de caratère associée                            *)
(* on ajoute un message d'erreur si one trouve pas la touche dans la liste                         *)

let%test _ = return_char_list_from_int t9_map 5 = ['j';'k';'l']
let%test _ = return_char_list_from_int t9_map 9 = ['w';'x';'y';'z']


(******************************************************************************)
(*                                                                            *)
(*      fonction qui retourne une lettre en fonction de la touche et du       *)
(*                   nombre de fois qu'on doit l'appuyer                      *)
(*                                                                            *)
(*   signature : decoder_lettre : (int*int) -> char = <fun>                   *)
(*                                                                            *)
(*   paramètre(s) : un tuple (touche, nb)                                     *)
(*   résultat     : une lettre                                                *)
(*                                                                            *)
(******************************************************************************)

let decoder_lettre (touche, nb) = nieme_element nb (return_char_list_from_int t9_map touche)
(* on identifie la liste de charactère avec la fonction return_char_list_from_int puis avec nieme_element on retourne la lettre précise*)

let%test _ = decoder_lettre (2,1) = 'a'
let%test _ = decoder_lettre (6,3) = 'o'
let%test _ = decoder_lettre (8,2) = 'u'


(***************************)
(*       QUESTION 2        *)
(***************************)

(******************************************************************************)
(*                                                                            *)
(*              fonction qui transforme une liste d'instruction               *)
(*                en liste de tuple (chiffre, nb d'occurence)                 *)
(*                                                                            *)
(*   signature : compte_liste : int list -> (int*int) list = <fun>            *)
(*                                                                            *)
(*   paramètre(s) : une liste d'instruction                                   *)
(*   résultat     : une liste de tuple                                        *)
(*                                                                            *)
(******************************************************************************)

let compte_liste l =
  let rec aux chiffre_actuel cmpt acc resultat = function
    | [] -> (* si la liste est vide et qu'il y a un compte en cours, on ajoute le dernier tuple au résultat *)
        if cmpt > 0 then (chiffre_actuel, cmpt) :: resultat 
        else resultat
    | 0 :: reste ->  (* si l'élément est 0, on ajoute le tuple actuel au résultat et réinitialise le compteur *)
        if cmpt > 0 then 
          aux (if reste = [] then chiffre_actuel else List.hd reste) 0 acc ((chiffre_actuel, cmpt) :: resultat) reste
        else 
          aux chiffre_actuel 0 acc resultat reste
    | t :: reste ->  
        if t = chiffre_actuel then (* si l'élément est égal au chiffre actuel, on incrémente le compteur *)
          aux chiffre_actuel (cmpt + 1) acc resultat reste 
        else  (* sinon, on ajoute le tuple actuel au résultat et on commence un nouveau comptage pour le nouvel élément *)
          aux t 1 acc ((chiffre_actuel, cmpt) :: resultat) reste (* ce cas n'arrive pas car il y a des zéros pour séparer les chiffres *)
  in (* on initialise avec le premier élément de la liste *)
  match l with
  | [] -> [] (* si la liste est vide, on retourne une liste vide *)
  | t :: reste -> List.rev (aux t 1 [] [] reste) (* sinon on commence le comptage avec le premier élément et on renverse le résultat final *)

let%test _ = compte_liste [8;8;0] = [(8,2)]
let%test _ = compte_liste [8;8;0;8;8;0] = [(8,2);(8,2)]
let%test _ = compte_liste [8;8;0;8;8;0;4;0;6;6;6;0] = [(8,2);(8,2);(4,1); (6,3)]
let%test _ = compte_liste [2;0;5;5;5;0;4;0;6;6;6;0] = [(2,1); (5,3); (4,1); (6,3)]


(******************************************************************************)
(*                                                                            *)
(*        fonction qui décode un mot en partant d'une suite de touche         *)
(*                                                                            *)
(*                                                                            *)
(*   signature : decoder_mot : int list -> string = <fun>                     *)
(*                                                                            *)
(*   paramètre(s) : une liste de suite de chiffre                             *)
(*   résultat     : un mot                                                    *)
(*                                                                            *)
(******************************************************************************)

let decoder_mot l = recompose_chaine (List.map decoder_lettre (compte_liste l))

(* on applique succesivement les fonctions créée précédement            *)
(* d'abord on converti la liste de chiffre en liste de tuple            *)
(* puis on transformer cette liste en liste de char grâce à decoder mot *)
(* puis on retourne un string avec recompose chaine                     *)

let%test _ = decoder_mot [7;7;7;7;0;2;0;7;7;7;0;2;0] = "sara" 
let%test _ = decoder_mot [2;2;0;3;3;0;7;7;7;7;0;2;2;0;3;3;0;7;7;7;7;0] = "besbes"
let%test _ = decoder_mot [2;0;5;5;5;0;4;0;6;6;6;0] = "algo"