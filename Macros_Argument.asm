#Name
#Date
#Obj - define an 'ints" macro that take an int as argument and then print it

.data
space: .asciiz "\n"
.macro ints(%x,)
	li $v0, 1
	add $a0,$zero,%x
	syscall
	li $v0, 4
	la $a0, space
	syscall 
.end_macro

.macro exit
	li $v0, 10
	syscall
.end_macro


.text
	ints(1)
	ints(2)
	ints(3)
	ints(4)
	ints(5)
	exit


	
	
	