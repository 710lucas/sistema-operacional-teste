section .text
[bits 32]

[extern main]
call main		; calls kernel function main()

jmp $

%include "interrupts.asm"

section .rodata

%include "include_txt.asm"
