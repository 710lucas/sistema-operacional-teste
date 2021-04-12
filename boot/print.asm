print:
  push ax
  push bx

  mov ah, 0x0e  ; função para escrever, teletype

  loop:
    cmp [bx], byte 0
    je exit      ;se a string chegar no final (0), para o programa
                 ;caso não seja, vai escrevendo todos os caracteres
    mov al, [bx] ;al é a string que será colocada na tela
    int 0x10     ;interrupt da bios que coloca o texto na tela
    inc bx       ;passa para o proximo caractere
    jmp loop     ;repete o processo ate chegar no ultimo caractere (0)

  exit:
    pop ax
    pop bx
    ret


  mensagem db 'Cu de cachorro emo', 13, 10, 0
