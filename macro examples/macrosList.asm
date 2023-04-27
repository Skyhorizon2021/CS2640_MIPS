#Name: CS2640 - Example
#Date: November 2022
#Objective: list of macros used for "macros2params.asm"; separate file for .include example

.macro printS(%str)
li $v0, 4
la $a0, %str
syscall
.end_macro

.macro twoParams(%int, %str)
li $t1, 2
mul  $t0, $t1, %int
li $v0, 1
move $a0, $t0
syscall
printS(%str)
.end_macro
