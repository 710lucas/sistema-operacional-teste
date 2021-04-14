#include "strings.h"
int linha = 0;

int* getLinha(){
  return &linha;
}

void write_string( int colour, const char *string )
{
    int i = 0;
    volatile char *video = (volatile char*)0xB8000;
    while( *string != 0 )
    {
        if(*string == 10){
          //linha++;
          *string++;
          linha+= 80 - linha % 80 - 1;
        }
        else{
          *(video+linha*2) = *string++;
          *(video+linha*2+1) = colour;
        }
        linha++;
        i++;
    }
}
