.text
.globl main
main:
    la $t0, count
    la $t1, sum
    la $t5, output

    lw $t6, 0($t0) #count
    lw $t3, 0($t1) #sum

    bgt $t3, $t6, label
    add $t4, $t6, $t3
    j exit

label:
    div $t6, $t3
    mfhi $t4

exit:
    sw $t4, 0($t5)
    lw $s0, 0($t5)
    li $v0, 10
    syscall


.data
count: .word 2
sum: .word 4
output: .word 0