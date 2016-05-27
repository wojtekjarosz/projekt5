#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/msg.h>

struct buf_elem {
	long mtype;
	char mvalue[40];
   };

int main(){
struct buf_elem elem;
int msgid = msgget(51212, IPC_EXCL);
if( msgrcv(msgid,&elem, 40, 123, 0) == -1){
	perror("Odbieranie komunikatu");
	exit(1);
	}

	int j=0;
	bool poprawny=true;
	char z;
	while(elem.mvalue[j]!=10){
		j++;
	}
	char* slowo=(char*)malloc(j*sizeof(char));
	int k;
	for(k=0;k<j;k++){
		slowo[k]=elem.mvalue[k];
	}
	/*	
	for(k=0;k<j;k++){
		printf("%c", slowo[k]);
	}*/

	k=0;
	while(k<j && poprawny){
		if(slowo[k]>=0 && slowo[k]<=127)
			poprawny=true;
		else
			poprawny=false;
	k++;
	}
	if(poprawny)
		fprintf(stdout, slowo);
	else
		printf("KOMUNIKAT NIEPRAWNY");
	free(slowo);
}
