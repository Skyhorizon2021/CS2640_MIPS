#Loc N
#11/14/2022
#Objective - Array traversal and print out element 

.data
array: .word 7,6,5,4,3,2,1
result: .asciiz "The elements of days array are "

.text
main:
	#print out result message
	

	#load array into register
	la $s0,array
	
loop:
	#load word into register
	lw $t1,array($t0)