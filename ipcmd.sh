#!/bin/bash

git clone https://github.com/nathanweeks/ipcmd.git
cd ipcmd
make

id_kolejki=`./bin/ipcmd msgget -Q 445 -e -m 0600`

echo "Podaj wyraz:"
read slowo

./bin/ipcmd msgsnd -q ${id_kolejki} -t 334 -n ${slowo}
odebrany=`./bin/ipcmd msgrcv -q ${id_kolejki} -t 334 -n`

zmienna=$(date +%u)
if [ ${zmienna} -ge 5 ]
then 

odebrany_dlugosc=${#odebrany}
pierwszy_znak=`echo ${odebrany} | cut -c 1`
poprawny=1

if ([[ ${pierwszyznak} -ge 'a' ]] && [[ ${pierwszy_znak} -le 'z' ]]) || ([[ ${pierwszy_znak} -ge 'A' ]] && [[ ${pierwszy_znak} -le 'Z' ]]); then

	while ([ ${odebrany_dlugosc} -ge 2 ] && [ ${poprawny} -eq 1 ]) ; do
	znak=`echo ${odebrany} | cut -c ${odebrany_dlugosc}`
	if ([[ ${znak} -ge 0 ]] && [[ ${znak} -le 127 ]]); then
		poprawny=1
	else
		poprawny=0
	fi
	odebrany_dlugosc=`echo "${odebrany_dlugosc}-1" | bc`
	done

	if [ ${poprawny} -eq 1 ]; then
		wynik=`echo "${odebrany}" | aspell list`
		if [ "${wynik}" == "" ]; then
			echo "Poprawny wyraz w języku polskim"
		else
			echo "Niepoprawny wyraz w języku polskim"
		fi

	else
		echo "KOMUNIKT NIEPOPRAWNY"
	fi 
else

	echo "KOMUNIKAT NIEPOPRAWNY"
fi


else
	echo "NIE JEST WEEKEND"
fi

ipcrm -q ${id_kolejki} 
