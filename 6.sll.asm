.text
.globl main
main:
    # load 5 to $t0
    li $t0, 5

    # sll -> $t1 = $t0 * 4
    # $t1 = $t0 * 4 = 5 *4 = 20
    sll $t1, $t0, 2
    
    # exit
    li $v0, 10
    syscall

    # sll by 1 -> mul by 2^1 = 2
    # sll by 2 -> mul by 2^2 = 4
    # sll by 3 -> mul by 2^3 = 8
