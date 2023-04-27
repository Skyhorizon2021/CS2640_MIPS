#Name
#Date
#Obj - 

.data
current: .asciiz "\nCurrent stack address is "



.text
main:
	li $t0, 4
	
	#print current stack address
	li $v0, 4
	la $a0, current
	syscall
	li $v0, 1
	la $a0, ($sp)
	syscall
	
	#add to stack
	sub $sp, $sp, 4
	sw $t0, ($sp)
	
	#current address is 
	li $v0, 4
	la $a0, current
	syscall
	li $v0, 1
	la $a0, ($sp)
	syscall
	
	#pop from stack
	add $sp, $sp, 4
	sw $t0, ($sp)
	
	li $v0, 4
	la $a0, current
	syscall
	
	li $v0, 1
	la $a0, ($sp)
	syscall
	
	
