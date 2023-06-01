.text
.globl main
main:
    # load 1 to $t0
    li $t0, 1

    # load 1 to $t1
    li $t1, 1

    # load 0 to $t2
    li $t2, 0

    # and $t1 and $t0 and store in reg $t3
    and $t3, $t1, $t0

    # and $t1 and $t2 and store in reg $t4
    and $t4, $t1, $t2

    # exit
    li $v0, 10
    syscall
