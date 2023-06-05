.text
.globl main
main:

    lw $s0, x           # x = 5
    lw $s1, y           # y = 10

    move $a0, $s0       # $a0 = 3
    move $a1, $s1       # $s1 = 10

    jal fn_sum          # jump to function fn_sum, arguments -> $a0, $a1

    move $t0, $v0       # move result to $t0

    # exit
    li $v0, 10
    syscall


fn_sum:

    # pushing into stack  $s0 
    addi $sp, $sp, -4    
    sw $s0, 4($sp)

    # pushing into stack  $s1
    addi $sp, $sp, -4
    sw $s1, 4($sp)

    add $s0, $a0, $a1   # add the 2 parameters
    move $v0, $s0       # store result in $v0 -> return reg

    # poping from stack to $s1
    lw $s1, 4($sp)
    addi $sp, $sp, 4

    # poping from stack to $s0
    lw $s0, 4($sp)
    addi $sp, $sp, 4

    # return
    jr $ra              # $ra will have PC + 4 address



    .data
x: .word 5
y: .word 10