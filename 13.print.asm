.text
.globl main
main:
    li $v0, 4
    la $a0, msg1
    syscall

    .data
msg1:.asciiz "Hello\n"