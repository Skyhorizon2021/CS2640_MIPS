#Loc Nguyen
#10/21/2022
#Obj 1: Take in 2 user inputs, have user select from 4 arithmetic options, then print the result
#Obj 2: Error handling
#Obj 3: Change user inputs
#Obj 4: Change chosen operation
#Obj 5: exit program when user is finished
#Obj 6: Re-prompt user when given error
.data
	message: .asciiz "\nEnter an integer: " 
	operation: .asciiz "Please select the operation:\n1:add \n2:subtract \n3:multiply \n4:divide \n5:exit\n"
	result: .asciiz "Your result is "
	remainder: .asciiz "\nRemainer is "
	invalid: .asciiz "Invalid input. Please start over"
	termination: .asciiz "\nProgram finished"
	
.text
main:
	#Prompt user input 1
	li $v0, 4
	la $a0, message
	syscall 
	#Read user input 1
	li $v0, 5
	syscall
	#check valid input 1
	
	#Move input 1
	move $s0,$v0
	
	
	#Prompt user input 2
	li $v0, 4
	la $a0, message
	syscall 
	#Read user input 2
	li $v0, 5
	syscall 
	#Move input 2
	move $s1,$v0
	
	
	#Print operations choices
	li $v0, 4
	la $a0, operation
	syscall 
	#Take in user selection
	li $v0, 5
	syscall
	#Move selection 
	move $s2,$v0
	
	#check user input for operation
	beq $s2, 1, ADD
	beq $s2, 2, SUB
	beq $s2, 3, MUL
	beq $s2, 4, DIV
	beq $s2, 5, exit
	
	j opexcept
	
	#implementation for each arithmetic operations then jump to result to print answer
ADD: 
	add $s3,$s0,$s1
	j answer
	
SUB:
	sub $s3,$s0,$s1
	j answer
	
MUL:
	mul $s3,$s0,$s1
	j answer
DIV: 
	div $s0,$1
	li $v0, 4
	la $a0, result
	syscall
	#move quotient to another register from low
	mflo $s4 
	#print quotient
	li $v0, 1
	la $a0, ($s4) 
	syscall
	#move remainder to another register from hi
	mfhi $s5
	#print remainder
	li $v0, 4
	la $a0, remainder
	syscall 
	li $v0, 1
	la $a0, ($s5)
	syscall  
	j exit
	
answer: 
	li $v0, 4
	la $a0, result
	syscall 
	li $v0, 1
	la $a0, ($s3)
	syscall 
	j exit
opexcept:
	li $v0, 4
	la $a0, invalid
	syscall 
	j main
exit: 
	li $v0, 4
	la $a0, termination
	syscall 
	li $v0, 10
	syscall
	
