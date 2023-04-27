#Loc Nguyen
#2 Nov 2022
#Objective - given a 5 elements array, traverse and print out the array elements to the user

.data
arr: .word 1,2,3,4,5
message: .asciiz "The elements of the array are "

.text
main:
	#load array into register
	la $s0, arr
	
	#print message
	#load elements into registers 
	lw $s0, 0($s0) 

loop:
	lw $t1, array($t0)
	

exit:
	li $v0, 10
	syscall