%{
(* --- pr�ambule: ici du code Caml --- *)

open Types 


 (* rappel : dans types.ml, type entree = int list *)

%}
/* description des lex�mes */

%token <int> INT       /* le lexeme INT a un attribut entier */
%token P C N F         /* lexeme de d�but de fichier */
%token MOINS           /* gere les nombres n�gatifs */
%token EOF             /* gere la fin de fichier    */
%token ZERO            /* gere la fin de la clause   */
%token EOL             /* gere les retours � la ligne notamment pour les commentaires */
%token TRUC            /* gere tout ce qu'il peut rester en commentairee */

%start main                   /* "start" signale le point d'entree: c'est ici main */
%type <Types.entree> main     /* on _doit_ donner le type du point d'entr�e */

%%

/* Regles de grammaire */

main:                       /* le point d'entr�e */
   C EOL P C N F INT INT EOL liste { $7::$8::$10 }  
 

liste:
   | EOF { [] }
   | clause liste { $1@$2 }
   | commentaire liste {$2}

/* Un commentaire est compos� de texte dont on ne s'occupe pas */
/*                et d'une fin de ligne                        */

commentaire :
  | C texte  { $2 }

texte : 
   | C texte { $2 }
   | P texte { $2 }
   | N texte { $2 }
   | F texte { $2 }
   | MOINS texte { $2 }
   | ZERO texte { $2 }
   | INT texte { $2 }
   | TRUC texte { $2 }
   | EOL { [] }
    

clause:	
  | ZERO EOL { [0] }		    
  | MOINS INT clause { (-$2)::$3 } 
  | INT clause       {  $1::$2 }
  | EOL { [] }       /* gestion des cas pathologiques */

