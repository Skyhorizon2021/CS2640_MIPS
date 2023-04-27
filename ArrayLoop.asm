# Class CS2560
# Name: Bryce Lam
# Date: 11/2/22
# Objective: Traverse and print each array element
.data
array: .word 1,2,3,4,5
arrayMsg: .asciiz "Elements of array: "
space: .asciiz " "
.text
main:
	#load array into address
	la $s0, array
	
	#print message
	li $v0, 4
	la $a0, arrayMsg
	syscall
loop:
	#get element at position $t0
	lw $t1, array($t0)
	
	#OR
	#lw $s1 ($t0)
	#addi $s0, $s0, 4
	
	#print value
	li $v0, 1
	move $a0, $t1
	syscall
	
	#add space
	li $v0, 4
	la $a0, space
	syscall
	
	#counter
	#add 4 to $t0, the size of a word (so we can go the next word in array)
	add $t0, $t0, 4

	#since each word is 4 bytes and there are 5 elements,
	#we know 20 will be the greatest
	blt $t0, 20, loop
	j exit

exit:
	li $v0, 10
	syscall
	
	
	
