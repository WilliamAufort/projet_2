# pour visualiser le dessin trace par ce script gnuplot, taper
# gnuplot -persist script-plot.p
#  (en s`assurant que le fichier comparaison.dat est present dans le repertoire)

reset

### decommenter les 2 lignes ci-dessous pour engendrer un fichier pdf
### plutot qu`un dessin a l`ecran
set term pdfcairo
set output "temps_exec_50_var.pdf" # le nom du fichier qui est engendre

set title "Temps d'execution moyens pour 50 varaibles en 3-Sat"
set xlabel "nombre de clauses"
set ylabel "Temps d'execution"


# Dessin en joignant des points
set style data lines

set pointsize 2   # la taille des points
set logscale y

# on trace deux courbes: avec les colonnes 1 et 2, avec les colonnes 1 et 3
# a chaque fois, le nom de la courbe est lu en tete de colonne
plot "comparaison_50_var.dat" using 1:2 title columnheader(4), \
     "comparaison_50_var.dat" using 1:3 title columnheader(5), \
     "comparaison_50_var.dat" using 1:4 title columnheader(4), \
     "comparaison_50_var.dat" using 1:5 title columnheader(5), \
     "comparaison_50_var.dat" using 1:6 title columnheader(6)

