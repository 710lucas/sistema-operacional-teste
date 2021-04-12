;basicamente um arquivo de teste pro programa
[org 0x7e00]

mov bx, sucesso
call print

jmp $

%include "print.asm"

sucesso: db "Parabens, voce entrou no espaco extendido ou seja la como essa porra se chama",10,0


times 2048-($-$$) db 0 ; carrega 2048 bytes para expandir o tamanho (4 setores)
