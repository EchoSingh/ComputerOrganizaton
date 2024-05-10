#include <stdio.h>
int main(){
    union {
        short n;
        char ch[2];
    } test;
    test.n = 0x2436;
    if(sizeof(short)==2){
        if(test.ch[0]==0x24 && test.ch[1]==0x36){
            printf("Big-endian\n");
        }else if(test.ch[0]==0x36 && test.ch[1]==0x24){
            printf("Little-endian\n");
        }else{
            printf("Unknown\n");
        }
    }else{
        printf("size of short for pc is not 2 bytes\n");
        //run sizeof(n) to check the size of short of your pc
    }
}