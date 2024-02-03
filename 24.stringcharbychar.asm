.data
string: .asciiz "hello"

.text

main:
    # print msg1
    la $a1, string
loop:

    lb $t0, ($a1)
    

    li $v0, 4
    move $a0, $t0 
    syscall

    addi $a1, $a1, 1
    bne $t0, $zero, loop

exit:
    li $v0, 10
    syscall


