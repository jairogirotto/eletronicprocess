
#include <stdio.h>



void main(void)
{
    int valor = 127 ;
    printf("O endereço  da variável  valor e: %p\n",&valor);
    printf("Exibir 0.1234 resulta em %g\n",0.1234);
    printf("Exibir 0.00001234 resulta em %g\n",0.00001234);


    printf ("Formatando a saida da Variável \"Valor\"\n ");

    printf("%d\n", valor);
    printf("%02d\n", valor);
    printf("%03d\n", valor);
    printf("%04d\n", valor);


    printf("Exibindo um prefixo antes dos valores octais ou hexa\n");

    printf("O valor decimal %d em octal é: %#o\n", valor, valor);
    printf("O valor decimal %d em hexadecimal é: %#x\n", valor, valor);  
    printf("O valor decimal %d em hexadecimal é: %#X\n", valor, valor);

}
