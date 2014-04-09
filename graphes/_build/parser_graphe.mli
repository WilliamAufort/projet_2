type token =
  | INT of (int)
  | P
  | E
  | D
  | G
  | C
  | EOF
  | EOL
  | TRUC of (char)

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Graphe.entree
