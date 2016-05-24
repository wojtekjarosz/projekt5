#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>


int main(){
	char z[40];
int i=0,f,k=0;
	while((!feof(stdin) )&& (k==0)){
		f=fread(&z[i],1,1,stdin);
		if (z[i]==10) k=1;
		i++;
		}
}
