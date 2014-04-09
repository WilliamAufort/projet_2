{
open Parser_graphe;;        (* le type "token" est d�fini dans parser.mli *)
}

rule token = parse    (* la "fonction" aussi s'appelle token .. *)
  | [' ' '\t']     { token lexbuf }    (* on saute les blancs *)
 	     	   	           (* token: appel r�cursif *)
                                   (* lexbuf: argument implicite
                                      associ� au tampon o� sont
                                      lus les caract�res *)
  | 'p'               { P }
  | 'e'               { E }
  | 'd'               { D }
  | 'g'               { G } 
  | 'c'               { C } 
  | ['0'-'9']+ as s   { INT (int_of_string s) }
  | '\n'              { EOL }
  | eof               { EOF }  
  | _ as s            { TRUC(s) }
