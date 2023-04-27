#Name: CS2640 - Example
#Date: November 2022
#Objective: given array, write a program that:
# 1) passes an array into the macro
# 2) adds the next element into the array

#prints an int
.macro prInt(%int)
li $v0, 1
move $a0, %int
syscall
.end_macro

#prints a line
.macro prLine
li $v0, 4
la $a0, newLine
syscall
.end_macro

#prints a string
.macro prMsg(%msg)
li $v0, 4
la $a0, %msg
syscall
.end_macro

#takes in an array (in this program, uses arrays of length 3)
#used to find the next element where pattern is add 1
.macro array(%isArr)
la $s0, %isArr		#load base address into $s0
lw $t0, 8($s0)		#load the last element of the array
addi $t1, $t0, 1	#add the value of t0+1 and save into $t1
sw $t1, 12($s0)		#store word in $t1 after array[3]
.end_macro

.data
arr1: .word 1, 2, 3
.space 4		#used to save space for next array element
arr2: .word 5, 6, 7
.space 4		#used to save space for next array element
space: .asciiz " "
newLine: .asciiz "\n"
next: .asciiz "The next element should be: "
newArr: .asciiz "The new array is: "


.text
main:
	#register $t7 is initialized as zero, to be loop counter
	move $t3, $zero
	
	#pass arrays into array macro
	array(arr1)
	prMsg(next)
	prInt($t1)	#prints next element in arr1
	prLine
	
	prMsg(newArr)	#prints new array
	j loop

#runs after the first new array is printed, continues for second new array	
continue:
	prLine		#formatting lines
	prLine
	array(arr2)	
	prMsg(next)
	prInt($t1)	#prints next element in arr2
	prLine
	
	prMsg(newArr)	#prints new array, no need for loop call (will run into loop)

#loop from different 
loop:
	lw $t7, 0($s0)		#get current element and print
	
	#print $t0, the current val
	li $v0, 1
	move $a0, $t7
	syscall
	#print space (you can define your own macro for this)
	li $v0, 4
	la $a0, space
	syscall
	
	addi $s0, $s0, 4	#incremement to next array element
	addi $t3, $t3, 1	#increment loop counter

	beq $t3, 8, exit	#if loop counter is 8, then exit
	beq $t3, 4, continue	#if loop counter is 4, then continue
	
	j loop			#back to start of loop (for next element)
	
exit: #in previous examples, macros were used for exit call
	prLine		#print line for formatting
	li $v0, 10
	syscall
