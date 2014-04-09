%{

%}

/* description des lexèmes */

%token <int> INT       /* le lexeme INT a un attribut entier */
%token P E D G C      /* lexeme de début de fichier */
%token EOF             /* gere la fin de fichier    */
%token EOL             /* gere les retours à la ligne */
%token <char> TRUC   /* gere tout ce qu'il peut rester en commentaire */

%start main                /* "start" signale le point d'entree: c'est ici main */
%type <Graphe.entree> main  /* on _doit_ donner le type du point d'entrée */

%%
/* Raisonnements bases a fond sur les regles de grammaire */
/*               Regles de grammaire                      */

main:                       /* le point d'entrée */
   commentaire_liste suite  { print_string "je rentre\n" ; $2}
 | suite                    { print_string "je rentre\n" ; $1} 

/* Une liste de commentaires au debut */

commentaire_liste :
  | commentaire commentaire_liste { print_string "un_com\n" ; $2 } 
  | commentaire                   { print_string "un_com\n" ; $1 }
   
suite :
  P E D G E INT INT EOL liste { ($6,$7,$9) } 
 
liste:
   | EOF               { [] }
   | arete liste      { $1@$2 }
   | commentaire liste { $2 }

/* Un commentaire est composé de texte dont on ne s'occupe pas */
/*                et d'une fin de ligne                        */

commentaire :
  | C texte  { $2 }

texte : 
   | C texte     { $2 }
   | E texte     { $2 }
   | D texte     { $2 }
   | G texte     { $2 }
   | P texte     { $2 }
   | INT texte   { $2 }
   | TRUC texte  { print_char $1 ; $2 }
   | EOL         { [] }
    

arete:	
  | E INT INT EOL {[($2,$3)] }
   


