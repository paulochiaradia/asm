#Program to sum the elements of an array
.text
.globl main

main:
    move $t0, $zero
    li $t9, 40

    input_loop:
    beq $t0, $t9, input_loop_end
    
    li $v0, 5
    syscall
    sw $v0, aray_input($t0)
    
    add $t0, $t0, 4
    j input_loop

    input_loop_end:
    move $t0, $zero
    move $t1, $zero

    sum_loop:
    beq $t0, $t9, sum_loop_end

    lw $t2, aray_input($t0)
    add $t1, $t1, $t2

    add $t0, $t0, 4
    j sum_loop

    sum_loop_end:
    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 10
    syscall

.data
    aray_input:
        .align 2
        .space 40
