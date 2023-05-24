.text
.globl main
main:

# msg1
	li $v0, 4
	la $a0, msg1
	syscall
	
# $s0 = n ,get n as input

	li $v0, 5
	syscall
	move $s0, $v0
	
# $t0 = 2
# $t1 = n - 1
# do

	li $t0, 2
	move $t1, $s0

	addi $t1, $t1, -1

# $t0 = 2
# $t1 = n - 1
# completed	

loop:
	beq $t0, $s0, valid
	
# check if $t0 can divide $s0 

#t2 = mfhi
	div $s0, $t0
	
	mfhi $t2
	
# if r == 0 -> not prime, ie, $t0 divides $s0
	
# $t9 = 0
	li $t9, 0
	
	beq $t2, $t9, breaking
	
# else
# add $t0 by 1
	addi $t0, $t0, 1
	
# jump to loop
	j loop
	
	
	
breaking:
	li $v0, 4
	la $a0, msg3
	syscall
	
	j exit
	
valid:
	li $v0, 4
	la $a0, msg2
	syscall
	
	j exit

exit:
	li $v0, 10
	syscall
	
	
	
	.data
msg1: .asciiz "Enter a number : "
msg2: .asciiz "It is Prime"
msg3: .asciiz "It is Not Prime"