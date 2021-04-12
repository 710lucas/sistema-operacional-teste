
PROGRAM_SPACE equ 0x7e00 ;logo apos 0x7c00, a partir de onde ficara o espaço do programa

ReadDisk:
  mov ah, 0x02            ; função da bios para ler o disco, assim como
                          ; 0x0e é a de escrever na tela
  mov bx, PROGRAM_SPACE   ; argumento explicando a partir de onde deverão
                          ; ser lidos os dados
  mov al, 4               ; carrega 4 setores (aumentar com o tempo)
  mov dl, [BOOT_DISK]     ; qual disco será lido, definido em boot.asm
  mov ch, 0x00            ; cilindro do hd (inutil)
  mov dh, 0x00            ; mais coiso fudido de hd
  mov cl, 0x02            ; começa a ler o segundo setor, o primeiro é boot.asm

  int 0x13                ;interrupt da bios pra fazer a bios ler o disco

  jc DiskReadFailed       ; caso falhe, mostra a mensagem de erro

  ret

BOOT_DISK: db 0

DiskReadErrorString: db 'Disk read falhou, seu bosta',0

DiskReadFailed:
  mov bx, DiskReadErrorString
  call print

jmp $
