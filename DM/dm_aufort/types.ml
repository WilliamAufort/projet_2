
(* un type pour l'entree *)
(* Le pretraitement sera effectue ensuite dans main.ml*)

type entree = int list 

(* Un litteral peut etre soit positif, soit n�gatif *)

type litteral = Pos | Neg 
(* Un type pour les clauses : liste de litteraux, liste car taille 
  variable m�me si nombre de variables fixees *)

type clause =  (int * litteral) list

(* une formule est une liste de clause, car on va faire des ajouts et des
  suppressions *)

type formule = clause list 

(* nombre fixe de seaux contenant des clauses *)

type seau = clause list array






  
