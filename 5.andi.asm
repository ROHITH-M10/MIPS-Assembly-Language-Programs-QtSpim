.text
.globl main
main:

    # load 1 onto $t0
    li $t0, 1

    # and $t0 and 1 and store in reg $t1
    andi $t1, $t0, 1

    # exit
    li $v0, 10
    syscall
