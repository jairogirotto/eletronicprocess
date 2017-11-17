#include <stdio.h>
  
  int main(void) {
  
       char *ptr;
  
       printf("%d", sizeof(ptr)); //tamanho de um unsigned inteiro

       printf("\n");
  
       printf("%d", sizeof(*ptr));  //tamanho de um char, porque neste caso ptr está apontando para este tipo de dado
  
       printf("\n");

       return 0;
  
  }
