#Name: CS2640 - Example
#Date: November 2022
#Objective: given array, write a program that:
# 1) passes programmer defined string to the macro
# 2) uses a loop to print the string 3 times (each on a new line)
# 3) exits the program


#aString macro as defined on slide 26 (from Wednesday 11/18)
.macro aString(%strings)
li $v0, 4
.data
userString: .asciiz %strings
.text
la $a0, userString
syscall
.end_macro

#exit macro
.macro exit
li $v0, 10
syscall
.end_macro

.text
main:
	move $s0, $zero		#$s0 is loop counter, set to zero

	loop:
		aString("i like webtoons\n")
		addi $s0, $s0, 1	#increment the loop counter
		blt $s0, 3, loop	#if loop counter is less than 3, continue to loop

	exit	#loop counter is three, exit macro is called and the program exits