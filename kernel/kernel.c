#include "../funcoes/strings.h"
#include "io.h"
#include "idt.h"


extern char Inicial[];

typedef unsigned short uint16_t;

void preencher_tela(){
  for(int i = 0; i<10; i++){
    write_string(0x70,"                                                                                ");
  }
}



void main() {
    //preencher_tela();
    //write_string(15, "inhame \n\nlol");


    write_string(0xf, Inicial);
    for(int i = 0; i<80; i++)
      write_string(0xD0," ");
    for(int i = 0; i<80; i++)
      write_string(0x60," ");
    for(int i = 0; i<80; i++)
      write_string(0xB0," ");

    idt_install();


    unsigned char scancode = inb(0x60);
    if(scancode & 0x80){
        write_string(0xf, "fodase");
    }
    outb(0x20,0x20);
    outb(0xa0,0x20);


}
