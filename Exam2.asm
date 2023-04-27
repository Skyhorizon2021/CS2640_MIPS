#Name - Loc Nguyen
#Date - 11/21/2022
#Objective - write a program that take sin two user strings, prints out their addresses after printintg out all elements for the days array provided
#Make sure to include macros that get user string, prints strings, prints ints, exits the program. A loop, a loop counter, at least a maina nd loop label

.macro getStr 
	li $v0, 8
	syscall
.end_macro

.macro prtStr(%str)
	li $v0, 4
	la $a0, %str
	syscall
.end_macro

.macro prtInt(%int)
	li $v0, 1
	la $a0, %int
	syscall
.end_macro

.macro exit
	li $v0, 4
	la $a0, exitMsg
	syscall
	li $v0, 10
	syscall
.end_macro

.data
days: .word 31,28,31,30,31,20,31,30,30,31,30,31
prompt: .asciiz "\nPlease enter a string (max 50 chars): "
displayArr: .asciiz "\nDays array elements are: "
address1: .asciiz "\nThe address for first string is: "
address2: .asciiz "\nThe address for second string is: "
exitMsg: .asciiz "\nThe program will now exit"
space: .asciiz " "

.text
main:
	#get string input 1
	prtStr(prompt)
	getStr
	move $s1, $a0
	#get string input 2
	prtStr(prompt)
	getStr
	move $s2, $a0
	
	#print out address 1 and 2
	prtStr(address1)
	prtInt($s1)
	prtStr(address2)
	prt(Int($s2)
	#load days array and words into register
	la $s0, days
	
	prtStr(displayArr)
	

	
loop:
	#get element at position $t0
	lw $t1, days($t0)
	
	#print value
	li $v0, 1
	move $a0, $t1
	syscall
	
	#add space
	prtStr(space)
	
	#counter, add 4 to get to next word
	add $t0, $t0, 4

	#we know 12 elements, times 4 is 48
	blt $t0, 48, loop
	exit


