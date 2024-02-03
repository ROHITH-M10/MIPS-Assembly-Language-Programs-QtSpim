.text
.globl main
main:

    # load n
    la $a0, n
    lw $a0, 0($a0)

    # call fn
    jal factorial

    # result to t0
    move $t0, $v0

    # print ans
    li $v0, 1
    move $a0, $t0
    syscall

    # end
    li $v0, 10
    syscall

factorial:
    # loading to stack
    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $s0, 4($sp)

    # base case a0 == 0
    li $v0, 1
    beq $a0, 0, exitloop

    # else_case - recursive
    move $s0, $a0
    addi $a0, $a0, -1

    jal factorial

    mul $v0, $v0, $s0


    # calc
exitloop:
    lw $s0, 4($sp)
    lw $ra, 0($sp)
    addi $sp, $sp, 8

    jr $ra




    .data
n: .word 5