.text
.globl main
main:
    # print msg1
    li $v0, 4
    la $a0, msg1
    syscall

    # get string input
    li $v0, 8
    syscall

    # move address of input string to $t0
    move $t0, $a0

    # print string full
    li $v0, 4
    move $a0, $t0
    syscall

    # newline
    li $v0, 4
    la $a0, newline
    syscall

    la $s0, len

loop:
    # load one byte to $t1
    lb $t1, ($t0)

    # check if it is end of string or not, if end go to exit
    beq $t1, 0, exit

    # not end
    # print content in $t0
    li $v0, 4
    move $a0, $t1
    syscall

    # move a byte by incrementing $t0
    addi $t0, $t0, 1

    # check if $t0 is less than or equal to the length of the string
    blt $t0, $s0, loop

exit:
    li $v0, 10
    syscall
.data

msg1: .asciiz "Enter String: "
newline: .asciiz "\n"
len: .word 6
