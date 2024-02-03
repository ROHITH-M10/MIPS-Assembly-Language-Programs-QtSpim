.text
.globl main
main:
    li $t0, 0
    la $s0, array

loop1:
    beq $t0, 3, printKaro
    lw $t1, ($s0)
    addi $t1, $t1, 5

    sw $t1, ($s0)
    addi $t0, $t0, 1
    addi $s0, $s0, 4
    j loop1


printKaro:
    li $t0, 0
    la $s0, array

loopKaro2:
    beq $t0, 3, exitKaro
    lw $t1, ($s0)

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 4
    la $a0, arjunNewLine
    syscall

    addi $t0, $t0, 1
    addi $s0, $s0, 4
    j loopKaro2

exitKaro:

    li $v0, 10
    syscall

    .data
array: .word 10, 20, 30
arjunNewLine: .asciiz "\n"