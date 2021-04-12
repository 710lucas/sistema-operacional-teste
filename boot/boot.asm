
[org 0x7c00]

mov [BOOT_DISK], dl  ;quanddo o bootloader inicia, ele armazena o ID do disco
                     ; que foi usado para bootar em dl, então armazenamos
                     ; esse id em BOOT_DISK, definido em DiskRead.asm

mov bp, 0x7c00 ;define o stack, endereço onde o bootloader inicia "base of stack"
               ;importante pra guardar dados
mov sp, bp     ;"stack pointer"

; mov bx, mensagem  ;bx funciona como se fosse o argumento da fução que sera chamado
; call escrever

call ReadDisk

jmp PROGRAM_SPACE  ;entra no extended space

%include "print.asm"
%include "DiskRead.asm"

times 510-($-$$) db 0
db 0x55
db 0xaa
