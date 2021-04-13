
#define VIDMEM 0xb8000


int strLen(char *str){
  int tam;
  for(tam = 0; str[tam] != 0; tam++);
  return tam;
}

void write_string( int colour, const char *string, volatile char *video)
{
    //volatile char *video = (volatile char*)0xB8000;
    while( *string != 0 )
    {
        *video++ = *string++;
        *video++ = colour;
    }
}


extern "C" void main(){

  char str[] = "lol";
  int tamanho = strLen(str);
  volatile char *video = (volatile char*)0xB8000;

  for(int i = 0; i<tamanho; i++){

    video = video + i*2;
    char *inp;
    *inp = str[i];

    write_string(0xf,inp, video);
  }


  return;
}
