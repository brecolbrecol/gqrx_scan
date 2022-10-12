#!/bin/bash
freq_actual="freq_actual.csv"
i=0
ficheros=()
for fichero in *.csv 
do
	i=$(($i + 1))
	echo -e "\t$i) $fichero"
	fichero+=("$fichero")
done

for var in "${ficheros[@]}"
do
	  echo "Hola ${var}"
	    # do something on $var
done

echo -en "Selecciona una frecuencia [1-$i] "
read eleccion
elegido=${fichero[$eleccion]}
if [[ -r $elegido ]]
then
	rm $freq_actual
	ln -s $elegido $freq_actual
	ls -o $freq_actual
fi

python2 gqrx_scan.py
