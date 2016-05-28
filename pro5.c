#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/msg.h>


struct buf_elem {
	long mtype;
	char mvalue[40];
   };

int main(){
	char z[40];
	int i=0,f,k=0;
	while((!feof(stdin))&&(k==0)){
		f=fread(&z[i],1,1,stdin);
		if (z[i]==10) k=1;
		i++;
		}
	
	
	int msgid,msgid2;
	struct buf_elem elem;
	elem.mtype=445;
	
	int j;	
	for(j=0;j<40;j++){
		elem.mvalue[j]=z[j];
	}
	
	msgid = msgget(51212, IPC_CREAT|IPC_EXCL|0600);
	if (msgid == -1){
		msgid = msgget(51212, IPC_CREAT|0600);
		if (msgid == -1){
			perror("Utworzenie kolejki komunikatów");
			exit(1);
		}
	}
	if( msgsnd(msgid, &elem , 40 , 0) == -1) {
		perror("msgsnd");
		exit(1);
	}
	
}
