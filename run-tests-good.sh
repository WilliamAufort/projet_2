#!/bin/bash

rm -f comparaison.dat
echo "nb_var normal rand moms1 moms2 dlis" >> comparaison.dat

for i in `seq 23 50 `; do

nb_var=$((5*i)) # On compare les algos pou ces valeurs de nb_var
a=0.00
b=0.00
c=0.00
d=0.00
e=0.00
for nb_fois in `seq 1 100`; do # Moyenne sur un certain nombre de formules 

cd "generateur 3_SAT" 
 ./calc $nb_var $((4*nb_var)) # On cree la formule 
cp ex.cnf ../version_op # On la copie dans le repertoire version_op

  # On se place dans le répertoire du programme
  cd ../version_op 
  # On calcule les differents temps et on les ajoute 

  echo $entree | /usr/bin/time -f'%U' -o /tmp/toto.txt ./resol -moms ex.cnf
  TEMPS3=`cat /tmp/toto.txt`
  c=$(echo "scale=3; $TEMPS3 + $c" | bc)

  echo $entree | /usr/bin/time -f'%U' -o /tmp/toto.txt ./resol -moms2 ex.cnf
  TEMPS4=`cat /tmp/toto.txt`
  d=$(echo "scale=3; $TEMPS4 + $d" | bc)

  echo $entree | /usr/bin/time -f'%U' -o /tmp/toto.txt ./resol -dlis ex.cnf
  TEMPS5=`cat /tmp/toto.txt`
  e=$(echo "scale=3; $TEMPS5 + $e" | bc)

  cd ..

# pour finir, on ajoute une ligne (6 colonnes) au fichier ./comparaison.dat
done

# On fait la moyenne

c=$(echo "scale=2; $c/100" | bc)
d=$(echo "scale=2; $d/100" | bc)
e=$(echo "scale=2; $e/100" | bc)

echo $nb_var $a $b $c $d $e >> ./comparaison.dat 

done

