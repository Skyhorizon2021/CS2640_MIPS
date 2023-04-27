#Name - Loc Nguyen
#Date - 11/09/2022
#Objective - Take an array, loop through each element, and then print them

.data
array: .word 7,6,5,4,3,2,1
result: .asciiz "The elements of days array are: "
	
.text
main:	
	#print result prompt
	li $v0, 4
	la $a0, result
	syscall
	#load array into register
	la $s0, array
	#use $s1 as offset counter
	add $s1,0,0
	
	j check
check:
	#if offset is 24 (7 elements is 6*4), then branch to loop
	ble $s1,24,loop
	#if offset is 28, jump to exit 
	beq $s1,28,exit
loop:
	#load element into register 
	lw $t0,($s1)($s0)
	#print element
	li $v0, 1
	la $a0, ($s1)($t0)
	syscall
	#using $s1 as offset counter to update value
	add $s1,4,0
exit: 
	li $v0, 10
	exit
	