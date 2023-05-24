.text
.globl main
main:
    # printing 

    # msg1
    li $v0, 4
    la $a0, msg1
    syscall

    # get number of elements onto $s1
    li $v0, 5
    syscall
    move $s1, $v0 # $s1 length

    la $s3, array # $s3 array

    j getArrayInput

getArrayInput:
    li $t0, 0
loop2:
    beq $t0, $s1, back

    # mgs2 enter element
    li $v0, 4
    la $a0, msg2
    syscall

    # get input
    li $v0, 5
    syscall
    move $t8, $v0

    sw $t8, ($s3)

    addi $s3, $s3, 4 # next array element
    addi $t0, $t0, 1 # next number

    j loop2


back:

    la $s3, array # $s3 array

    la $s4, array
    addi $t9, $s1, -1
    sll $t9, $t9, 2
    add $s4, $s4, $t9
    # addi $s4, $s4, 16  # last word

    # la $s1, len
    # lw $s1, ($s1) # $s1 length = 5

    li $t0, 1 # $t0 first element
    move $t1, $s1 # $t1  last element

loop1:
    beq $t0, $t1, exit
    bgt $t0, $t1, exit

    lw $t3, ($s3) # $t3 front load
    lw $t4, ($s4) # $t4 back load

    sw $t3, ($s4) # swap and store
    sw $t4, ($s3) 

    addi $t0, $t0, 1 # exit conditions 
    addi $t1, $t1, -1

    addi $s3, $s3, 4 # from first move to next word
    addi $s4, $s4, -4 # from last come back one word

    j loop1 # jump to loop


exit:
    

    # 1
    la $t5, array  # $t5 base address

    li $t0, 0 # $t0
    move $t1, $s1 # $t1, length 

loop3:
    # display new array
    beq $t0, $t1, end # exit condition

    lw $t2, ($t5) # each word

    li $v0, 1 # print value
    move $a0, $t2
    syscall

    li $v0, 4 # print newline
    la $a0, newline
    syscall

    # increment word and loop condition
    addi $t5, $t5, 4
    addi $t0, $t0, 1
    j loop3

end:

    li $v0, 10
    syscall




    .data
array: .space 400
newline: .asciiz "\n"
number: .space 4
msg1: .asciiz "Enter the number of Elements: "
msg2: .asciiz "Enter element : "