.text
.globl main
main:
    # msg1
    li $v0, 4
    la $a0, msg1
    syscall

    # input
    li $v0, 5
    syscall
    move $t0, $v0 # $t0 contain n

    # odd or even
    li $t1, 2
    div $t0, $t1 # $t0/$t1 = n/2
    mfhi $t2 # $t2 contain remainder

    # checking

    li $t3, 0
    beq $t2, $t3, even
    j odd

even:
    li $v0, 4
    la $a0, msg2
    syscall
    j exit

odd:
    li $v0, 4
    la $a0, msg3
    syscall
    j exit

exit:
    li $v0, 10
    syscall

    .data
msg1: .asciiz "Enter Number :"
msg2: .asciiz "Even"
msg3: .asciiz "Odd" 