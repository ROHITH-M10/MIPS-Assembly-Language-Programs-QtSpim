.text
.globl main
main:
        
    # load 10 to $t0
    li $t0, 10
    # add value in reg $t0 with immediate value 100 and store in reg $t2
    addi $t2, $t0, 100

    # exit
    li $v0, 10
    syscall
    