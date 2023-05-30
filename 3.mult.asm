.text
.globl main
main:
    # load 10 to $t0
    li $t0, 10

    # load 20 to $t1
    li $t1, 20

    # LO reg will have the result
    mult $t1, $t0

    # move the result from LO to $t2
    mflo $t2

    li $v0, 10
    syscall
    