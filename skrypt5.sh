#!/bin/bash

make

echo "Podaj wyraz: "
./pro5

zmienna=$(date +%u)
if [ ${zmienna} -ge 5 ] 
then 	
	slowo=`./rcv`
	if [ "${slowo}" == "KOMUNIKAT NIEPOPRAWNY" ]; then
	echo "KOMUNIKAT NIEPOPRAWNY"
	else
		czy_polski=`echo "${slowo}" | aspell list`
	
		if [[ ${czy_polski} == "" ]]
		then
			echo "Poprawny wyraz w języku polskim"
		else	
			echo "Niepoprawny wyraz w języku polskim"
		fi
	fi
else
	echo "Nie jest weekend"
fi

echo 
echo "Rozwiązanie numer dwa: "
./ipcmd.sh
