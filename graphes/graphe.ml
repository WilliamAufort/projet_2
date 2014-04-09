(* Types et donnees *)

type entree = 
  int * int * (int * int) list ;;

(* On rappelle le type des formules *)

type formule = 
  Var of int
 | And of formule * formule
 | Or of formule * formule 
 | Implies of formule * formule 
 | Not of formule 

(* fonction d'affichage en console *)

(* graphe donne par se liste d'aretes *)

let affiche_arete (x,y) = 
 print_string "(" ;
 print_int x ;
 print_string "," ;
 print_int y ;
 print_string ")" ;;

let affiche_graphe g = 
  let rec aux1 g = 
  match g with
  [] -> print_string "]" ;
 |a::q -> affiche_arete a ;
          match q with
          [] -> print_string "]" ;
         |_ -> print_string ";" ;
               aux1 q
  in print_string "[" ;
  match g with 
  | (_,_,aretes) -> aux1 aretes ;;

(*/// Generer les formules pour le coloriage de graphe ////*)
(* Tres inspire du cours de logique *)
(* On represente par une formule le fait :
  - que deux sommets relies par une arete ont des couleurs differentes
  - que toutes les couleurs soien inferieures a k *)
(* Il faut pour cela coder les couleurs : on a besoin de log(k) bits/variables *)

(* On calcule le nombre de variable necessaires pour reprensenter un numero de 
   couleur compris entre 1 et k *)

let codage_necessaire k = 
  let x = floor (log(k) / log(2) -1) in 
  int_of_float x ;;

(* Un noeud est donc associe a n couleurs, avec n renvoye par codage_necessaire k *)
(* x1 sera associe aux variables 1,2,...,n ;
   x2 a n+1;n+2,...2n
  etc... *)

(* Les contraintes sur les aretes *)

(* Expliquer le calcul *)

let contraintes_aretes x y n = 
  let rec aux x y m = 
    if m = 1 then
    let v1 = (x-1)*n+1 (* cf le calcul precedent en commentaires *)
    and v2 = (y-1)*n+1 in 
    Or(And(v1,v2),And(Not(v1,v2))) in 
    else 
    let v1 = (x-1)*m+1 
    and v2 = (y-1)*m+1
    in let f1 = Or(And(v1,v2),And(Not(v1,v2))) 
    and f = aux x y (m-1) in 
    And(f,f1)
  in Not(aux x y n) ;; 

      
  



  
