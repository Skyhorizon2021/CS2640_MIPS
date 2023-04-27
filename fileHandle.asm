#Name: Evan Cheng
#Date: 11/30/22
#Objective: Print contents of a file and copy to another file.

.data
	file1: .asciiz "gradedItems.txt"
	file2: .asciiz "cs2640items.txt"
	buffer: .space 0
	exitMsg: .asciiz "done"

.text
main:
	#open gradedItems.txt
	li $v0, 13
	la $a0, file1
	li $a1, 0
	li $a2, 0
	syscall
	move $s0, $v0

	#read gradedItems.txt
	li $v0, 14
	move $a0, $s0
	la $a1, buffer
	li $a2, 175
	syscall

	#create cs2640items.txt
	li $v0, 13
	la $a0, file2
	li $a1, 1
	li $a2, 0
	syscall
	move $s1, $v0
	
	#write cs 2640items.txt
	li $v0, 15
	move $a0, $s1
	la $a1, buffer
	li $a2, 175
	syscall

	#close both files
	li $v0, 16
	move $a0, $s0
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	

	j exit
exit:
	#exit Msg
	li $v0, 4
	la $a0, exitMsg
	syscall
	#print contents
	li $v0, 4
	la $a0, buffer
	syscall
	li $v0, 10
	syscall
