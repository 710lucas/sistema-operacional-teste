mov ah, 0x0e ;carrega a função 0x0e, que coloca caractere na tela
mov bh, 0x09 ;deixar 0
mov bl, 0xff ;atributos do texto, basicamente cor
             ; 0x07: branco no preto
mov al, 'C'   ;Coloca A no al
int 0x10     ; interrupt que coloca o A na tela

mov al, 'U'
int 0x10

jmp $

times 510-($-$$) db 0
db 0x55
db 0xaa
