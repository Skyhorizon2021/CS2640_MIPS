#Name: CS2640 - Example
#Date: November 2022
#Objective: print multiple strings declared in the only .data segment of this file using a macro

.macro printString(%str)
li $v0, 4
la $a0, %str
syscall
.end_macro

.macro exit
li $v0, 10
syscall
.end_macro

.data
str1: .asciiz "\nThis is one string."
str2: .asciiz "\nThere is only one .data segment in this file."
str3: .asciiz "\nBy passing in the string label into the macro, we can print all the strings declared."

.text
main:
	#print the strings by calling the macro and passing in the string name
	printString(str1)
	printString(str2)
	printString(str3)
	
exit