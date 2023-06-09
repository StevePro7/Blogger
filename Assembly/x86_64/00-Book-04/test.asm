section .data
EXIT_SUCCESS equ 0 ; successful operation
SYS_exit equ 60 ; call code for termin


section .text
global _start
_start:

last:
mov rax, SYS_exit ; Call code for exit
mov rdi, EXIT_SUCCESS ; Exit program with success
syscall