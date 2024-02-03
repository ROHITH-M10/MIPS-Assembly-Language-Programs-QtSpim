.text
.globl main
main:
    # msg1
    li $v0, 4
    la $a0, msg1
    syscall

    # enter n
    li $v0, 5
    syscall
    move $t0, $v0 # $t0 will have value of n

    mul $t1, $t0, $t0 # mul $t0 with $t0 and store in $t1

    # msg2
    li $v0, 4
    la $a0, msg2
    syscall

    # print ans
    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 10
    syscall

    .data
msg1: .asciiz "Enter Number:"
msg2: .asciiz "The Square of the number is : "