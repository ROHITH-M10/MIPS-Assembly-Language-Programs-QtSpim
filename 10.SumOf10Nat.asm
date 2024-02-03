.text
.globl main
main:
    li $t0, 1 # counter
    li $s0, 11
    li $s1, 0 # sum
loop:
    beq $s0, $t0, exit
    add $s1, $s1, $t0
    addi $t0, $t0, 1
    j loop
exit:
    li $v0, 10
    syscall