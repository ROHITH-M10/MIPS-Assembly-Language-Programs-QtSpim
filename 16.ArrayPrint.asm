.text
.globl main
main:
    li $t0, 1 # element number
    la $t2, array # address of array

    # input
    li $v0, 4
    la $a0, input
    syscall

loop:
    # loop end condition
    beq $t0, 4, exit

    # print array element number
    li $v0, 1
    move $a0, $t0
    syscall

    # print number
    li $v0, 4
    la $a0, number
    syscall

    # input number
    li $v0, 5
    syscall

    # move input to $t3
    move $t3, $v0

    # pass it to array
    
    sw $t3, 0($t2) # $t3 input put it into array with specific offset
    addi $t2, $t2, 4 # next offset
    addi $t0, $t0, 1 # loop 
    # repeat
    j loop

exit:
    # end
    li $t0, 10
    syscall
    
input: .asciiz "Enter the array elements\n"
number: .asciiz ".)element : "
newline: .asciiz "\n"