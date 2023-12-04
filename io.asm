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
    beq $t0, $t9, end_input

    li $v0,5
    syscall
    sw $v0, array_input($t0)

    add $t0, $t0, 4
    j input_loop

end_input:
    li $v0, 4
    la $a0, newLine
    syscall
    j sum_loop

sum_loop:
    beq $t3, $t9, print_loop2
    lw $t4, array_input($t3)
    add $t2, $t2,$t4
    add $t3, $t3, 4
    j sum_loop
print_loop1:
    beq $t1, 40, sum_loop
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

print_loop2:
    li $v0, 4
    la $a0, space
    syscall

    li $v0, 1
    move $a0, $t2
    syscall
    j exit

.data
    array_input:
    .align 2
    .space 40
    newLine: .asciiz "\n"
    space: .asciiz " "