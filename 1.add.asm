.text
.globl main
main:
    # load 10 to $t0
    li $t0, 10
    # load 20 to $t1
    li $t1, 20
    # add both registers - $t0 and $t1 and store the result in $t2
    add $t2, $t1, $t0
    
    # End
    li $v0, 10
    syscall