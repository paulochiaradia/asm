#Sort Array with 15 numbers lenght in MIPS Assembly
.text
.globl main 

main:
    move $t0, $zero
    li $t9, 60
    li $t8, 56
    
input_loop:
    beq $t9, $t0, after_loop
    
    li $v0, 5
    syscall
    move $t2, $v0
    
    sw $t2, array_input($t0)
    
    add $t0,$t0,4
    j input_loop


print:
    move $t0, $zero
    print_loop:
    beq $t9, $t0, exit
    
    li $v0, 1
    lw $a0, array_input($t0)
    syscall
    
    li $v0, 4
    la $a0, newLine
    syscall
    
    add $t0, $t0, 4
    j print_loop

after_loop:
    move $t0, $zero
    move $t1, $zero
    j out_loop
    
#(i = 0; i < n - 1; i++)    
out_loop:
    beq $t8, $t0, copy_array

    inner_loop:
        beq $t8, $t1, out_loop
        li $t2, 4
        mul $t3, $t0, $t2
        lw $t4, array_input($t3)
        addi $t5, $t0, 1
        mul $t6, $t5, $t2
        lw $t7, array_input($t6)
        ble $t4, $t7, else
        sw $t7, array_input($t3)
        sw $t4, array_input($t6)
    else:
        addi $t1, $t1, 1
        j inner_loop

    add $t0, $t0, 4
    j out_loop

copy_array:
    move $t0, $zero
    move $t1, $zero
    j copy_loop
    
copy_loop:

    beq $t9, $t0, print

    li $t2, 4
    mul $t3, $t0, $t2
    lw $t4, array_input($t3)
    sw $t4, array_output($t3)
    add $t0, $t0, 4
    j copy_loop

    

exit:
    li $v0, 10
    syscall

.data
    array_input:
        .align 2
        .space 60
    array_output:
        .align 2
        .space 60
    newLine: .asciiz"\n"
    teste: .asciiz"teste"