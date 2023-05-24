# Multiply all elements by 3
.text
.globl main
main:
    la $t1, array # base address of array in $t1

    # input
    li $v0, 4
    la $a0, input
    syscall

    # get size
    li $v0, 5
    syscall
    move $s0, $v0 # $s0 has number of elements

    li $t0, 1 # element count
    # print element number
    addi $s0, $s0, 1
loop1:

    beq $t0, $s0, exitloop1
    # input msg 2
    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, input2
    syscall

    # get input value
    li $v0, 5 # get int input
    syscall

    sw $v0, 0($t1)
    addi $t1, $t1, 4
    addi $t0, $t0, 1

    # newline
    li $v0, 4
    la $a0, newline
    syscall

    
    j loop1

exitloop1:
    li $t0, 1 # element count
    # print element number

    la $t1, array # base address of array in $t1

loop2:
    beq $t0, $s0, print
    lw $t2, 0($t1) # load into $t2
    li $t5, 3
    mul $t2, $t2, $t5 # mul by 3

    sw $t2, 0($t1)

    addi $t0, $t0, 1
    addi $t1, $t1, 4
    j loop2




print:

    li $t0, 1 # element count
    # print element number

    la $t1, array # base address of array in $t1

    li, $v0, 4
    la, $a0, input3
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    

loop3:
    beq $t0, $s0, exit
    lw $t2, 0($t1) # load into $t2

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    

    addi $t0, $t0, 1
    addi $t1, $t1, 4

    j loop3

exit:

    li $v0, 10
    syscall


    .data
array: .space 100
input: .asciiz "Enter array size :"
input2: .asciiz ") Element Enter :"
newline: .asciiz "\n"
input3: .asciiz "Elements :"
