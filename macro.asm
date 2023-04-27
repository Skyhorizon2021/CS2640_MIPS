#Name
#Date
#obj - print out a string 5 times using macro and a loop

.data
message: .asciiz "This is your doom\n"

.macro printing
	li $v0, 4
	la $a0, message
	syscall
.end_macro

.macro exit
	li $v0,10
	syscall
.end_macro

.text
main:
	#setting loop counter
	li $t0, 1
	j loop
loop:
	printing
	addi $t0,$t0,1
	ble $t0,5,loop
	exit
	
	
