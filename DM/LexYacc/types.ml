
(* un type pour l'entr�e *)
(* Le pr�traitement sera effectu� ensuite *)

type entree = int list 

(* Un litt�ral peut �tre soit positif, soit n�gatif *)

type litteral = Pos | Neg 
(* Un type pour les clauses : liste de litteraux, liste car taille 
  variable m�me si nombre de variables fix�es *)

type clause =  (int * litteral) list

(* une formule est une liste de clause, car on va faire des ajouts et des
  suppressions *)

type formule = clause list 


(* Pour le choix du type seau, cf algo.ml *)

type seau = clause list array

type consequence = (litteral * clause ) list array

(* Encorer une fois, le nombre de seaux est connu d'avance : c'est le nombre de variables *)





  
