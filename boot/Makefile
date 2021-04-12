all:
	nasm boot.asm -f bin -o boot.bin

	nasm ExtendedProgram.asm -f bin -o ExtendedProgram.bin

	cat boot.bin ExtendedProgram.bin > bootloader.bin

clean:
	rm boot.bin
	rm ExtendedProgram.bin
	rm bootloader.bin


#compilar o kernel la com tudo
 #nasm -f elf32 boot.asm -o ks.o
 #gcc -c kernel.c -o kernel.o -m32
 #ld -o boot.bin ks.o kernel.o -m elf_i386
