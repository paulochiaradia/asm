.text 
.globl main

main:
    move $t0, $zero
    move $t1, $zero
    li $t9, 40

input_loop:
    beq $t9, $t0, end_input
    li $v0, 5
    syscall
    sw $a0, array_input($t0)

    add $t0, $t0, 4
    j input_loop

end_input:
    li $v0, 10
    syscall

.data
    array_input:
    .align 2
    .space 40