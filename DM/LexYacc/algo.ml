open Types
exception Tautologie 



(* Les differentes phases de l'algorithme *)

(* Generer les contraintes = inverser pos et neg 
   Attention : on a alors des CONJONCTIONS *)

(* Distribution dans les seaux *)

let rec garde_la_fin l = match l with 
  [] -> failwith "ne doit pas arriver "
 | [t] -> (t,[])
 |t1::t2::q -> let (x,reste) = garde_la_fin q in 
               (x,t1::reste) 

(*rajout *)
let rec ajoute_clause c l = match l with
  [] -> [c] 
 |c1::q -> if c=c1 then l else 
              c1::(ajoute_clause c q) 

let insere_clause_dans_seau c plus moins = 
  let (x,typ) = List.hd c in 
  if typ = Pos then  
  plus.(x) <- (*c::(plus.(x)) *)
              ajoute_clause c (plus.(x))
               else
  moins.(x) <- (*c::(moins.(x)) *)
               ajoute_clause c (moins.(x))

(* ATTENTION : au moment de remonter, si csqcs = x1,x2....xn, la contrainte associee sera
     not(x1) and not (x2) and .... and not(xn) *) 

let init_les_seaux f nb_var = 
  let plus = Array.create (nb_var+1) []
  and moins = Array.create (nb_var+1) [] in
  let rec aux f =  match f with
  [] -> (plus,moins) 
 |c::q -> begin
          insere_clause_dans_seau c plus moins ;
          aux q
          end
  in aux f 

(* Calculer le resolvant *)

let resolvant c1 c2 = 
  try (
  let rec aux c1 c2 = match (c1,c2) with
  ([],_) ->  c2
 |(_,[]) -> c1
 |((x1,typ1)::q1,(x2,typ2)::q2) -> 
   if x1 > x2 then
   (x1,typ1)::(aux q1 c2)
   else
   if x2 > x1 then 
   (x2,typ2)::(aux c1 q2)
   else
   if ((x1=x2)&&(typ1=typ2)) then 
   (x1,typ1)::(aux q1 q2) (* Erreur ici *)
   else raise Tautologie
   in aux (List.tl c1) (List.tl c2) )  (* Il faut enlever le litteral le plus grand quand on fusionne *)
   with Tautologie -> [(0,Pos)] ;;

(* Gerer les resolvants *)


let traite_les_resolvants i plus moins =
  let clauses_pos = plus.(i) 
  and clauses_neg = moins.(i) in
  let rec aux_un c l  = 
(* l liste des clauses avec lesquelles on doit calculer le resolvant avec c*) 
  match l with
  [] -> ()
 |c2::q -> let r = resolvant c c2 in 
    if r = [] then failwith "pas de solution (clause vide)"
    else 
    if (fst(List.hd r) <> 0) (* pas d'exception tautologie *) 
    then insere_clause_dans_seau r plus moins ;
    aux_un c q
  in
  let rec aux l1 l2 = match l1 with
  [] -> ()
 |c::q -> begin 
          aux_un c l2 ;
          aux q l2
          end
  in aux clauses_pos clauses_neg 

(* Gerer les consequences *)

(* On le fait avant de passer du seau k au seau k-1 *)

let consequence_de c typ = (typ, List.tl c) 

let met_a_jour_csqcs i plus moins csqcs =
  let rec aux l typ = match l with
  [] -> []   
  |c::q -> (consequence_de c typ)::(aux q typ)
  in
  csqcs.(i) <- (aux (plus.(i)) Pos)@( aux (moins.(i)) Neg) 

let vide_le_seau i plus moins csqcs =
  let fin = ref (0,[]) in
  let (l1,l2) = (plus.(i),moins.(i)) in
  match (l1,l2) with
  ([],[]) -> !fin
 | (_,[]) -> fin := (1,l1) ; met_a_jour_csqcs i plus moins csqcs ; !fin
 | ([],_) -> fin := (1,l2) ; met_a_jour_csqcs i plus moins csqcs ; !fin
 | _ -> if i <> 1 then
        begin
        traite_les_resolvants i plus moins ;
        met_a_jour_csqcs i plus moins csqcs ;
        !fin 
        end
        else (* si i = 1 et que les deux seaux ne sont pas vides, ils contiennent x1 et not(x1) contradiction *) 
        failwith "pas de solution (x1 et not(x1))" 

(* Remonter les contraintes *)

let instancie n = 
  Array.create (n+1) true ;;

(* attention forme normale disjonctive *)

let evalue c tab = 
  try(
    let rec aux c tab = match c with
    [] -> true
    |(n,litte)::q -> let booleen = tab.(n) in 
      match (booleen,litte) with
        (true,Neg) -> aux q tab
       |(false,Pos) -> aux q tab
       | _ -> raise Exit 
    in aux c tab)
  with Exit -> false 

let decision v (litte,c) = 
  let booleen = evalue c v in 
  if booleen then (* il faut modifier *)
  match litte with
    Pos -> 1
   | Neg -> 2
  else 0 

let add x l = match l with
  [] -> [x]
 |t::q -> if x = t then l else
          failwith "contradiction" 

let resultat_de_csqcs v csqcs = 
  try( 
    let rec aux v csqcs = match csqcs with 
      [] -> []
      |(litte,c)::q -> let l = aux v q 
                       and n = decision v (litte,c) in
  if n = 0 then l
  else if n = 1 then add true l 
  else add false l 
   in aux v csqcs )
  with _ -> failwith "contraction" 

let rec met_a_jour solutions csqcs i = 
  match solutions with
  [] -> [] 
 |v::q -> let l = resultat_de_csqcs v csqcs.(i) in
    match l with
    [] -> let copie = Array.copy v in 
    copie.(i) <- false ;
    v::copie::(met_a_jour q csqcs i)
   |_ -> let booleen = List.hd l (* l forc�ment r�duit � un �l�ment *)
         in v.(i) <- booleen ;
         v::(met_a_jour q csqcs i)

let rec init_possibilites i nb_var = (* initialise jusqu'au d�but du seau *)
 (* ex : sur la clause finale [x1,x2], i = 2 on peut fixer x1 et x2 et ensuite
    faire jouer les consequences *)
  if i = 0 then [(Array.create (nb_var+1) true)] 
  else let l = init_possibilites (i-1) nb_var in
  let rec aux l i nb_var = 
  match l with 
  [] -> [] 
  |tab::q -> let tab1 = Array.copy tab in 
                 tab1.(i) <- false ;
                 tab::tab1::(aux q i nb_var) 
  in aux l i nb_var

let depart_pour_init (nb,l) =
    let c = List.hd l in (* premi�re clause *)
    match c with
    [] -> 0 (* j ne change pas *)
   | _ -> fst (List.hd c) ;;

let affiche_resultat l nb_var= 
  let une_valuation = List.hd l in 
  print_string "s SATISFIABLE \n" ;
  for i = 1 to nb_var do 
  print_string "v ";
  if (not une_valuation.(i)) then 
  print_string "-" ;
  print_int i ;
  print_string "\n";
  done;;
    

(* Temps d'execution d'une fonction a deux arguments *)

let time f a b = 
  let x = Sys.time() in
  let _ = f a b in
  let y = Sys.time() in 
  print_string("temps d'execution :");
  print_float(y -.x );
  print_string("\n") 

