.text
.globl main
main:
    ori $t0, $0, 0xA
    li $v0, 1
    move $a0, $t0
    syscall

    ori $t1, $0, 0xB
    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 10
    syscall 