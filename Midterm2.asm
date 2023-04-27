#Name - Loc Nguyen
#Date - 11/09/2022
#Objective - Take an int from a user and echo it in output

.data
prompt: .asciiz "Please enter an int: "
echo: .asciiz "Your int was: "
	


.text
main:	
	#prompt user input
	li $v0, 4
	la $a0, prompt
	syscall
	#read user input
	li $v0, 5
	syscall
	#move user input to $s0
	move $s0,$v0
	
	#Echo user input to output screen
	li $v0, 4
	la $a0, echo
	syscall
	li $v0, 1
	la $a0, ($s0)
	syscall
	
	j exit
exit:	
	li $v0, 10
	syscall 