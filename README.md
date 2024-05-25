# ComputerOrganization

This repository contains examples and exercises related to computer organization and low-level programming. It includes examples written in C and x86 Assembly language, demonstrating concepts such as endianness and system calls.

## Contents

- `endianness.c` - A C program to determine the endianness of the system.
- `print_string.asm` - An x86 assembly program to print a string using DOS interrupts.

### endianness.c

This C program checks whether the system is using big-endian or little-endian byte order. The program uses a union to store a short integer and a character array, then examines the byte order in memory.

#### Compilation and Execution

To compile and run the `endianness.c` program:

```bash
gcc endianness.c -o endianness
./endianness 
```
## print_string.asm
This x86 assembly program prints a string to the console using DOS interrupts. It demonstrates the use of the DOS interrupt 21h to print a string and terminate the program.

Assembly and Execution
1. To assemble and run the print_string.asm program, you need an assembler like MASM or TASM, and an environment to run DOS programs like DOSBox.
```bash
masm print_string.asm;
```
2. Link the object file:
```bash
link print_string.obj;
```
3. Run the executable in DOSBox or a similar DOS environment:
```bash
print_string.exe
```

## License
This repository is licensed under the MIT License. See the [LICENSE] file for more information.

## Author
Aitya Singh
