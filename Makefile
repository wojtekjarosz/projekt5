all: pro5 rcv

pro5: pro5.c
	gcc pro5.c -o pro5

rcv: rcv.c
	gcc rcv.c -o rcv

