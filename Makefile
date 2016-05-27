pro5: pro5.o
	gcc pro5.o -o pro5
pro5.o: pro5.c
	gcc -c pro5.c -o pro5.o

