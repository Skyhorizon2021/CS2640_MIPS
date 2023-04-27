#Name: CS2640 - Example
#Date: November 2022
#Objective: 
# 1) use .include to call macros from separate file, "macrosList.asm"
#	a) define a macro that takes in two parameters
#	   - one int, one string
#	   - doubles the int
#	   - calls another macro to print string to user
# 2) uses macro in main
#    a) programmer chooses the parameters (defined when passed into macro and in .data segment)

#printing macro
.include "macrosList.asm"

.data
string: .asciiz "\nmy string"

.text
main:
	twoParams(5, string)
	
	li $v0, 10
	syscall
