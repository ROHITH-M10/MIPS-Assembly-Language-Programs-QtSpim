.text
.globl main
main:
	la $s0, array
	
	li $t0, 0
	li $t1, 5
	
	li $s1, 0
	
loop:
	beq $t0, $t1, exit
	
	lw $t3, ($s0)
	
	add $s1, $s1, $t3
	
	addi $t0, $t0, 1
	addi $s0, $s0, 4
	
	j loop

exit:
	
	li $v0, 1
	move $a0, $s1
	syscall
	
	li $v0, 10
	syscall
		
	.data
	
array: .word 1, 4 ,7, 5, 9