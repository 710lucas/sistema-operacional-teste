all:
		@echo "Compilando o Boot"
		@nasm "boot/boot.asm" -f bin -o "bin/boot.bin" -i boot
		@nasm "kernel/final_vazio.asm" -f bin -o "bin/final_vazio.bin"

		@echo "compilando o kernel"
		@i386-elf-gcc -ffreestanding -m32 -g -c "kernel/kernel.c" -o "bin/kernel.o" -I kernel
		@nasm "kernel/kernel_entry.asm" -f elf -o "bin/kernel_entry.o" -i kernel

		@echo "compilando funcoes"
		@i386-elf-gcc -ffreestanding -m32	-g -c "funcoes/strings.c" -o "bin/strings.o" -I funcoes
		@i386-elf-gcc -ffreestanding -m32 -g -c "kernel/idt.c" -o "bin/idt.o" -I kernel
		@i386-elf-gcc -ffreestanding -m32 -g -c "funcoes/strings.c" -o "bin/strings.o" -I funcoes
		@i386-elf-gcc -ffreestanding -m32 -g -c "funcoes/memset.c" -o "bin/memset.o" -I funcoes
		@i386-elf-gcc -ffreestanding -m32 -g -c "kernel/io.c" -o "bin/io.o" -I kernel



		@echo "linkando tudo"
		@i386-elf-ld -o "bin/kernel.bin" -Ttext 0x1000 "bin/kernel_entry.o" "bin/write.o" "bin/idt.o" "bin/strings.o" "bin/memset.o" "bin/io.o" "bin/kernel.o" --oformat binary
		@#lembrar que Ttext fala onde vai ficar a localização
		@#do kernel, que vai ser util para fazer o jmp

		@echo "junta tudo"
		@ cat "bin/boot.bin" "bin/kernel.bin" > "os_inc.bin"
		@ cat "os_inc.bin" "bin/final_vazio.bin" > "os.bin"
