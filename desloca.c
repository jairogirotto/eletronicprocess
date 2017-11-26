#include <stdio.h>
void main(void){

    unsigned u_val = 1;
    signed int valor = -1;

    printf("%u (sem sinal) desloca á esquerda 2 vezes é %u\n", u_val, u_val << 2);
    printf("%u (sem sinal) desloca á direita 2 vezes é %u\n", u_val, u_val >> 2);
    
    u_val = 65535 ;
    
    printf("%u (sem sinal) desloca á esquerda 2 vezes é %u\n", u_val, u_val << 2);
    printf("%u (sem sinal) desloca á direita 2 vezes é %u\n", u_val, u_val >> 2);
 
  

}   


