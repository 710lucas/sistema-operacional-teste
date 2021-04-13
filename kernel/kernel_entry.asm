section .text
[bits 32]

[extern main]

mov [0xB8000], byte "N"
; mov [0xb8002], byte "E"
; mov [0xb8004], byte "d"
; mov [0xb8006], byte "n"
; mov [0xb8008], byte "a"
; mov [0xb800A], byte "l"
; mov [0xb800C], byte "D"
; mov [0xb800E], byte "O"
; mov [0xb8010], byte "S"
; mov [0xb8012], byte "!"
call main		; calls kernel function main()

jmp $


section .rodata		; read only data
