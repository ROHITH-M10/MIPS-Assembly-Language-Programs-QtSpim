.text
.globl main
main:
    # ip
    li $v0, 4
    la $a0, ip
    syscall

    # get ip
    li $v0, 5
    syscall

    # move to $a0
    move $a0, $v0

    # call sum
    jal sum

    # back to main after function

    # load result from v0 to s0
    move $s0, $v0

    # op
    li $v0, 4
    la $a0, op
    syscall

    # ans = $s0
    li $v0, 1
    move $a0, $s0
    syscall

    # exit
    li $v0, 10
    syscall

sum:
    # $t0 move from n to 0
    move $t0, $a0
    # $t1 sum variable
    li $t1, 0 

loop1:
    # check if $t0 is 0
    beq $t0, 0, exit_label
    # else_case

    # add n = t0 to t1- sum
    add $t1, $t1, $t0

    # dec $t0 = n by 1
    addi $t0, $t0, -1

    # jump to loop1
    j loop1

exit_label:
    # afer loop move result in t1 to vo-> return reg
    move $v0, $t1
    # return to main and continue from there
    jal $ra




    .data
ip: .asciiz "Enter n: "
op: .asciiz "Sum of N : "
