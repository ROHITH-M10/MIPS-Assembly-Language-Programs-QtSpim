.text
.globl main
main:
	
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 10
	syscall
	
	.data
msg1: .asciiz "Hello World\n"