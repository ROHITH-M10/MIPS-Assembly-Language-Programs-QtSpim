.text
.globl main

main:
    la $s0, array
    la $s1, even
    la $s2, odd

    li $t0, 1 # count
    li $t5, 0 # even count
    li $t6, 0 # odd count


loop:
    bgt $t0, 10, evenprint
    # load to t3
    lw $t3, 0($s0)
    # div 
    li $t9, 2
    div $t3, $t9
    # get rem from hi
    mfhi $t4
    # t4 = 0 then even
    beq $t4, 0, evenNo
    j oddNo

evenNo:
    sw $t3, 0($s1)
    addi $s1, $s1, 4
    addi $t5, $t5, 1
    j prog

oddNo:
    sw $t3, 0($s2)
    addi $s2, $s2, 4
    addi $t6, $t6, 1
    j prog

prog:
    addi $s0, $s0, 4
    addi $t0, $t0, 1
    j loop

evenprint:
    li $v0, 4
    la $a0, msg1
    syscall

    la $s0, even
    li $t0, 0
loop2:
    beq $t0, $t5, oddprint
    lw $t2, 0($s0)
    # print 
    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, space
    syscall

    addi $s0, $s0, 4
    addi $t0, $t0, 1
    j loop2

oddprint:
    li $v0, 4
    la $a0, msg2
    syscall

    la $s0, odd
    li $t0, 0

loop3:
    beq $t0, $t6, exit
    lw $t2, 0($s0)
    # print 
    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, space
    syscall

    addi $s0, $s0, 4
    addi $t0, $t0, 1
    j loop3

exit:
    li $v0, 10
    syscall

    .data
array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 14
even: .space 40
odd: .space 40
msg1: .asciiz "\nEven array :"
msg2: .asciiz "\nOdd array :"
space: .asciiz "  "