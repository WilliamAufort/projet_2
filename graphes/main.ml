open Graphe ;;

let lexbuf_graphe (*file*) = Lexing.from_channel (*file*) stdin ;;

let parse_graphe () (*file*) = Parser_graphe.main Lexer_graphe.token lexbuf_graphe (*file*) ;;

let compile e =
    affiche_graphe e;
    print_newline();;

let trace (*file*) =
  try (
    let result = parse_graphe ()(*file*) in
    compile result ; flush stdout )
  with _ -> print_string "erreur de saisie\n" ;;
  
