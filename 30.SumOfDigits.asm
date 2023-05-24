.text
.globl main
main:

	# msg1
	li $v0, 4
	la $a0, msg1
	syscall
	
	# $s0 = n get the number and pass it  
	li $v0, 5
	syscall
	move $s0, $v0
	
	# $s1 = 0 sum variable 
	li $s1, 0
	
	# $t0 = 10
	li $t0, 10
	
	li $t8, 0
	
loop:
	
	# if n == 0 exit 
	beq $s0, $t8, exit
	
	# divide by 10
	
	div $s0, $t0
	
	# $t1 temp last digit, mfhi = r
	mfhi $t1
	
	# adding it with sum 
	add $s1, $s1, $t1

	# pass low reg value

	# $t2 = mflo = q
	mflo $t2
	move $s0, $t2
	
	# jumping	
	j loop
	
	
	
exit:

# print result
# msg2
	li $v0, 4
	la $a0, msg2
	syscall

# $s0 print
	li $v0, 1
	move $a0, $s1
	syscall
	
# return - exit

	li $v0, 10
	syscall
	
	
	
	.data
msg1: .asciiz "Enter a number :"
msg2: .asciiz "Sum of Digits = "