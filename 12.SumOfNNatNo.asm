.text
.globl main
main:
    # print
    li $v0, 4
    la $a0, msg1
    syscall

    # input n
    li, $v0, 5
    syscall
    move $t0, $v0 # n

    li $t1, 1 # counter
    li $s0, 0 # sum
loop: 
    bgt $t1, $t0, exit
    add  $s0, $s0, $t1
    addi $t1, $t1, 1
    j loop
exit:
    # print
    li $v0, 4
    la $a0, msg2
    syscall
    # print value
    li $v0, 1
    move $a0, $s0
    syscall

    li $v0, 10
    syscall

    .data
msg1: .asciiz "Enter a number :"
msg2: .asciiz "Sum is :"