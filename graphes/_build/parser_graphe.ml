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

open Parsing;;
# 2 "parser_graphe.mly"

# 16 "parser_graphe.ml"
let yytransl_const = [|
  258 (* P *);
  259 (* E *);
  260 (* D *);
  261 (* G *);
  262 (* C *);
    0 (* EOF *);
  263 (* EOL *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  264 (* TRUC *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\002\000\003\000\005\000\005\000\005\000\
\004\000\007\000\007\000\007\000\007\000\007\000\007\000\007\000\
\007\000\006\000\000\000"

let yylen = "\002\000\
\002\000\001\000\002\000\001\000\009\000\001\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\001\000\004\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\019\000\000\000\002\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\017\000\
\000\000\009\000\001\000\003\000\000\000\015\000\014\000\011\000\
\012\000\013\000\010\000\016\000\000\000\000\000\000\000\000\000\
\000\000\000\000\006\000\000\000\005\000\000\000\000\000\008\000\
\007\000\000\000\018\000"

let yydgoto = "\002\000\
\005\000\006\000\007\000\036\000\037\000\038\000\018\000"

let yysindex = "\255\255\
\018\255\000\000\007\255\001\255\000\000\020\255\000\000\019\255\
\022\255\001\255\001\255\001\255\001\255\001\255\001\255\000\000\
\001\255\000\000\000\000\000\000\023\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\024\255\028\255\029\255\025\255\
\001\000\030\255\000\000\001\000\000\000\001\000\032\255\000\000\
\000\000\027\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\033\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\028\000\031\000\010\000\241\255\000\000\002\000"

let yytablesize = 263
let yytable = "\001\000\
\035\000\010\000\011\000\012\000\013\000\014\000\015\000\016\000\
\017\000\009\000\008\000\022\000\023\000\024\000\025\000\026\000\
\027\000\008\000\028\000\003\000\040\000\003\000\041\000\004\000\
\004\000\021\000\030\000\029\000\031\000\032\000\039\000\033\000\
\042\000\043\000\004\000\020\000\019\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\034\000\000\000\000\000\004\000"

let yycheck = "\001\000\
\000\000\001\001\002\001\003\001\004\001\005\001\006\001\007\001\
\008\001\003\001\001\000\010\000\011\000\012\000\013\000\014\000\
\015\000\008\000\017\000\002\001\036\000\002\001\038\000\006\001\
\006\001\004\001\003\001\005\001\001\001\001\001\001\001\007\001\
\001\001\007\001\002\001\008\000\006\000\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\003\001\255\255\255\255\006\001"

let yynames_const = "\
  P\000\
  E\000\
  D\000\
  G\000\
  C\000\
  EOF\000\
  EOL\000\
  "

let yynames_block = "\
  INT\000\
  TRUC\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'commentaire_liste) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'suite) in
    Obj.repr(
# 21 "parser_graphe.mly"
                            ( print_string "je rentre\n" ; _2)
# 166 "parser_graphe.ml"
               : Graphe.entree))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'suite) in
    Obj.repr(
# 22 "parser_graphe.mly"
                            ( print_string "je rentre\n" ; _1)
# 173 "parser_graphe.ml"
               : Graphe.entree))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'commentaire) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'commentaire_liste) in
    Obj.repr(
# 27 "parser_graphe.mly"
                                  ( print_string "un_com\n" ; _2 )
# 181 "parser_graphe.ml"
               : 'commentaire_liste))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'commentaire) in
    Obj.repr(
# 28 "parser_graphe.mly"
                                  ( print_string "un_com\n" ; _1 )
# 188 "parser_graphe.ml"
               : 'commentaire_liste))
; (fun __caml_parser_env ->
    let _6 = (Parsing.peek_val __caml_parser_env 3 : int) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : int) in
    let _9 = (Parsing.peek_val __caml_parser_env 0 : 'liste) in
    Obj.repr(
# 31 "parser_graphe.mly"
                              ( (_6,_7,_9) )
# 197 "parser_graphe.ml"
               : 'suite))
; (fun __caml_parser_env ->
    Obj.repr(
# 34 "parser_graphe.mly"
                       ( [] )
# 203 "parser_graphe.ml"
               : 'liste))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'arete) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'liste) in
    Obj.repr(
# 35 "parser_graphe.mly"
                      ( _1@_2 )
# 211 "parser_graphe.ml"
               : 'liste))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'commentaire) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'liste) in
    Obj.repr(
# 36 "parser_graphe.mly"
                       ( _2 )
# 219 "parser_graphe.ml"
               : 'liste))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'texte) in
    Obj.repr(
# 42 "parser_graphe.mly"
             ( _2 )
# 226 "parser_graphe.ml"
               : 'commentaire))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'texte) in
    Obj.repr(
# 45 "parser_graphe.mly"
                 ( _2 )
# 233 "parser_graphe.ml"
               : 'texte))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'texte) in
    Obj.repr(
# 46 "parser_graphe.mly"
                 ( _2 )
# 240 "parser_graphe.ml"
               : 'texte))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'texte) in
    Obj.repr(
# 47 "parser_graphe.mly"
                 ( _2 )
# 247 "parser_graphe.ml"
               : 'texte))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'texte) in
    Obj.repr(
# 48 "parser_graphe.mly"
                 ( _2 )
# 254 "parser_graphe.ml"
               : 'texte))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'texte) in
    Obj.repr(
# 49 "parser_graphe.mly"
                 ( _2 )
# 261 "parser_graphe.ml"
               : 'texte))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : int) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'texte) in
    Obj.repr(
# 50 "parser_graphe.mly"
                 ( _2 )
# 269 "parser_graphe.ml"
               : 'texte))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : char) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'texte) in
    Obj.repr(
# 51 "parser_graphe.mly"
                 ( print_char _1 ; _2 )
# 277 "parser_graphe.ml"
               : 'texte))
; (fun __caml_parser_env ->
    Obj.repr(
# 52 "parser_graphe.mly"
                 ( [] )
# 283 "parser_graphe.ml"
               : 'texte))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : int) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : int) in
    Obj.repr(
# 56 "parser_graphe.mly"
                  ([(_2,_3)] )
# 291 "parser_graphe.ml"
               : 'arete))
(* Entry main *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let main (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Graphe.entree)
