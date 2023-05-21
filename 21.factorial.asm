.text
.globl main
main:
    # print msg1
    li $v0, 4
    la $a0, msg1
    syscall

    # get number into $t0
    li $v0, 5
    syscall
    move $t0, $v0

    # factorial
    # ans = #s0
     li $s0, 1

    
loop:
    # t0 == 0, exit
    beq $t0, $zero, exit
    # #s0 = $s0 * $t0
    mul $s0, $s0, $t0
    # $t0 --
    addi $t0, $t0, -1
    # jump to loop
    j loop

exit:
    # msg2
    li $v0, 4
    la $a0, msg2
    syscall

    # ans
    li $v0, 1
    move $a0, $s0
    syscall

    # return 0
    li $v0, 10
    syscall






    .data
msg1: .asciiz "Enter a number :"
msg2: .asciiz "Factorial is : "