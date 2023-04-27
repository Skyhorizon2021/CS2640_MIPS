#Name: Loc Nguyen
#Date: 12/06/2022
#Obj - given "gradedItems.txt", write a program that open the file, read given file, print it in I/O, copy contents and write to new file, close the file

.data
file: .asciiz "gradedItems.txt"
file2: .asciiz "cs2640io.txt"
buffer: .space 0
.text
main: 
	#open a file
	li $v0, 13
	la $a0, file
	li $a1, 0	#reading
	li $a2, 0	#ignored
	syscall
	move $s0, $v0
	
	#read a file
	li $v0, 14
	move $a0, $s0 	#file descriptor
	la $a1, buffer
	li $a2, 175
	syscall

	#open file for writing
	li $v0, 13
	la $a0, file2
	li $a1, 1	#writing
	li $a2, 0
	syscall
	move $s1, $v0
	
	#write whatever on buffer is to output file
	li $v0, 15
	move $a0, $s1
	la $a1, buffer
	li $a2, 175
	syscall
	
	#closing both files
	li $v0, 16
	move $a0, $s0
	syscall
	li $v0, 16
	move $a0, $s1
	syscall 
	
	#print buffer
	li $v0, 4
	la $a0, buffer
	syscall
	#exit
	li $v0, 10
	syscall
	
	
	
	
