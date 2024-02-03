.text
.globl main
main:
	la $s0, array # base address
	li $t0, 1 # start
	li $t1, 7 # ending
	
	lw $s1, ($s0) # load first element into $s1, it is the current max
	addi $s0, $s0, 4 # go to next word
	
# s1 first element
# s0 to next address

	
loop1:
	beq $t0, $t1, exit # exit case
	
	lw $s2, ($s0) # $s2 new value
	
	# s1 = old, s2 = new	
	
	slt $s5, $s1, $s2 # $s5 if $s1 is less than new value, then $s5 will be 1    s1 < s2, s5 = 1
	
	li $t8, 1
	
	beq $s5, $t8, update # s5 = 1 then s2 > s1, new value is larger
	
return: 
	addi $t0, $t0, 1
	addi $s0, $s0, 4
	
	j loop1
		
update: 
	move $s1, $s2
	j return
	
exit:
	# printing result
	li $v0, 1
	move $a0, $s1
	syscall
	# ending
	li $v0, 10
	syscall
	
	
	.data
array: .word 40, 20, 10, 50, 60, 80, 90