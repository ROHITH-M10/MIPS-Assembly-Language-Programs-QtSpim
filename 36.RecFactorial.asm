.text
.globl main
main:

    # op1
    li $v0, 4
    la $a0, op1
    syscall

    # load number to $a0
    la $t0, number
    lw $a0, 0($t0)
    li $v0, 1

    jal fact

    move $t0, $v0

    li $v0, 1
    move $a0, $t0
    syscall


    li $v0, 10 

fact:

    beq $a0, 0, exit
    mul $v0, $v0, $a0
    addi $a0, $a0, -1
    j fact

exit:
    jr $ra







    .data
number : .word 5
op1: .asciiz "Factorial is :"