#Program to read  10 integers, store it in array and print it

.text
.globl main

main:
    move $t0, $zero
    move $t1, $zero
    move $t2, $zero
    move $t3, $zero
    li $t9, 40
input_loop:
    beq $t0, $t9, print_loop1

    li $v0,5
    syscall
    sw $v0, array_input($t0)

    add $t0, $t0, 4
    j input_loop

print_loop1:
    beq $t1, 40, exit
    lw $a0, array_input($t1)
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, space
    syscall
    addi $t1, $t1, 4
    j print_loop1

    exit:    
    li $v0, 10
    syscall

.data
    array_input:
    .align 2
    .space 40
    newLine: .asciiz "\n"
    space: .asciiz " "