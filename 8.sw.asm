.text
.globl main
main:
    la $t0, value
    lw $t1, 0($t0)
    addi $t1, $t1, 10
    sw $t1, 0($t0)

    lw $t1, 4($t0)
    addi $t1, $t1, 10
    sw $t1, 4($t0)

value: .word 1, 2