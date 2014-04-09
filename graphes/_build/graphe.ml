type entree = 
  int * int * (int * int) list ;;

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
  
