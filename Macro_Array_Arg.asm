#Name
#Date
#Obj - macro that tkes in an array

.macro array (%arr)
	la $s0, %arr #load base address
	lw $s1, 8($s0) #load last element of array
	add $s2,$s1,1 #add 1 to last element
	sw $s2, 12($s0) #store output after last element 
	
.end_macro

.data
arr1: .word 1,2,3
.space 4

.text
main:
	array(arr1)