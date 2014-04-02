open Types
open Algo

(*////// Generer des exemples ////////*)

(* On se fixe des clauses de taille 3, 4 ,5 ou 6 
   avec les probabilites suivantes : 
    p(3) = 85/100 
    p(4) = 10/100
    p(5) = 4/100 
    p(6) = 1/100 *)

let random_taille() = 
  let x = Random.int 100 in
  if x < 85 then 3
  else if x < 95 then 4
  else if x = 99 then 6
  else 5 

(* Remarque : marche si nb_clauses >=6 *)

let random_etat() = 
  let x = Random.int 100 in 
  if x < 50 then Pos 
            else Neg 

let random_litte nb_var = 
  let x = (Random.int nb_var) +1 
  and typ = random_etat() in 
  (x,typ) 

(* range dans l'ordre et evite les doublons*)

let rec ajoute (x,typ) (i,l) = match l with
  [] -> (i+1,[(x,typ)])
 |(y,typ1)::q -> if x > y then (i+1,(x,typ)::l)
                else if x=y then (i,l)
                else let (n1,l1) = ajoute (x,typ) (i,q) in 
                (n1,(y,typ1)::l1) 
                  
let random_clause nb_var = 
   let n = random_taille()  
   and toto = ref (0,[]) in
   while (fst !toto <>n) do
     toto := ajoute (random_litte nb_var) !toto;
   done;
   snd !toto

let rec random_formule nb_var nb_clauses = 
   if nb_clauses = 0 then []
   else (random_clause nb_var)::(random_formule nb_var (nb_clauses-1))

(* un choix de test *)

let random_formule_bis n = 
   random_formule n (4*n)

(* Tous les tests utilises pour controler les fonctions *)

(*
let c1 = [ (4,Neg) ; (2,Pos) ; (1,Pos)] 
let c2 = [ (4,Pos) ; (3,Pos) ; (2,Pos) ] 
let c3 = [ (3,Neg) ; (1,Pos) ] 
let c4 = [ (4,Neg) ; (3,Neg) ; (2,Neg) ] 
let c5 = [ (3,Neg) ; (2,Neg) ; (1,Neg) ] 
let c6 = [(4,Pos) ; (2,Neg) ] 
let c7 = [(4,Neg) ; (2,Neg) ] 
let f = [c1;c2;c3;c4;c5] 
let f2 = [c6;c7] 


let (plus,moins) = init_les_seaux f 4 
resolvant c1 c2 
resolvant c1 c4 
traite_les_resolvants 4 plus moins  
plus 
moins 

traite_les_resolvants 3 plus moins 
plus 
moins 

traite_les_resolvants 2 plus moins 
plus 
moins  

vide_le_seau 4 plus moins 
plus 
moins 

vide_le_seau 3 plus moins 
plus 
moins

vide_le_seau 2 plus moins 
plus 
moins 

evalue [(1,Pos)] [|true;false;true;true;true|] 

let (plus2,moins2) = init_les_seaux f2 4 
vide_le_seau 4 plus2 moins2
plus2 
moins2 

vide_le_seau 3 plus2 moins2 
vide_le_seau 2 plus2 moins2 

let p = init_possibilites 1 4 
let p1 = met_a_jour (List.hd p) plus moins 2
 
solve f 4 
solve f2 4 

let cl1 = [(2,Pos);(1,Pos)] 
let cl2 = [(2,Neg);(1,Pos)] 
let cl3 = [(2,Neg);(1,Neg)] 
let cl4 = [(2,Pos);(1,Neg)] 
let f3 =  [cl1;cl2;cl3;cl4] 
solve f3 2 

let f_random = random_formule_bis 5 ;;
solve f_random 5 ;; *)

