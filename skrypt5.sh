#!/bin/bash

make
gcc -c rcv.c -o rcv.o
gcc rcv.o -o rcv
echo "Podaj wyraz: "
./pro5

#zmienna=$(date +%u)
#if [ ${zmienna} -ge 5 ]
#then 
#	./rcv
#fi
./rcv | aspell
