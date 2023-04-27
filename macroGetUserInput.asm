#Name: CS2640 - Example
#Date: November 2022
#Objective: 
# 1) define a macro that gets user input
#    a) will use $a0 and $a0 in syscall (since read string is 8)
# 2) prompts user for input three times; echoes out the input
# 3) exits the program

#reads a string from user input
.macro getString
li $v0, 8
la $a0, inBuffer
li $a1, 21
syscall
#move $s0, $a0  #note: this instruction is fine inside the macro,
		#      however, if the objective need the string for other purposes later in the program
		#      it's better to place it outside the macro (refer to rest of the program)
.end_macro

#print string stored in register
.macro prUserString(%str)
li $v0, 4
la $a0, (%str)
syscall
.end_macro

#print string
.macro prString(%str)
li $v0, 4
la $a0, %str
syscall
.end_macro

#exit macro
.macro exit
li $v0, 10
syscall
.end_macro

.data
input: .asciiz "\nPlease enter a string less than 20 chars: "
output: .asciiz "\nYour string was: "
inBuffer: .space 20 	#one char is one byte

.text
main:
	#loop counter
	move $t7, $zero
	
#label which uses macros to prompt user, get input, and echo; runs three times
threeString:
	prString(input)			#print user prompt
	getString				#get user input
	beqz $t7, store1		#if $t7 is 0, then first string stored in $s0
	beq $t7, 1, store2		#if $t7 is 1, then second string stored in $s1
	beq $t7, 2, store3		#if $t7 is 2, then third string stored in $s2
	#prUserString($s0)		#prints
	
	continue:
	addi $t7, $t7, 1
	beq $t7, 3, exit
	
	j threeString
	
#labels which will store the first string in $s0, second in $s1, and third in $s2
store1:
	move $s0, $a0
	prUserString($s0)
	j continue
store2:
	move $s1, $a0
	prUserString($s1)
	j continue
store3: 
	move $s2, $a0
	prUserString($s2)
	j continue	

exit:
	exit
	

