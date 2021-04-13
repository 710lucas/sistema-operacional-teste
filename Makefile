all:
		@echo "Compilando o Boot"
		@nasm "boot/boot.asm" -f bin -o "bin/boot.bin" -i boot
		@nasm "kernel/final_vazio.asm" -f bin -o "bin/final_vazio.bin"

		@echo "compilando o kernel"
		@i386-elf-gcc -ffreestanding -m32 -g -c "kernel/kernel.cpp" -o "bin/kernel.o" -I kernel
		@nasm "kernel/kernel_entry.asm" -f elf -o "bin/kernel_entry.o" -i kernel


		@echo "linkando tudo"
		@i386-elf-ld -o "bin/kernel.bin" -Ttext 0x1000 "bin/kernel_entry.o" "bin/write.o" "bin/kernel.o"
		@#lembrar que Ttext fala onde vai ficar a localização
		@#do kernel, que vai ser util para fazer o jmp

		@echo "junta tudo"
		@ cat "bin/boot.bin" "bin/kernel.bin" > "os_inc.bin"
		@ cat "os_inc.bin" "bin/final_vazio.bin" > "os.bin"
