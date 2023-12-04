    #Program to bubble sort an input array

    .text 
    .globl main

    main:
    move $t0, $zero
    move $t1, $zero
    li $t9, 40
    li $t8, 36


    input_loop:
        beq $t0, $t9,bubble_sort_array 

        li $v0, 5
        syscall
        sw $a0, array($t0)

        add $t0, $t0, 4
        j input_loop

bubble_sort_array:

    move $t0, $zero
    move $t1, $zero
    move $t2, $zero
    move $t3, $zero
    move $t4, $zero
    move $t5, $zero
    move $t6, $zero
    move $t7, $zero
    move $t8, $zero
    move $t9, $zero

    li $t9, 40
    li $t8, 36

    outer_loop:
        beq $t0, $t8, print
        move $t5, $zero
        inner_loop:
            beq $t1, $t9, outer_loop
            add $t5, $t1, 4
            lw $t2, array($t1)
            lw $t3, array($t1+4)

            ble $t2, $t3, increment_inner_loop

            sw $t3, array($t1)
            sw $t2, array($t1+4)

            increment_inner_loop:
                add $t1, $t1, 4
                j inner_loop

        increment_outer_loop:
            add $t0, $t0, 4
            j outer_


        

print:
    move $t0, $zero
    print_loop:
    beq $t9, $t0, exit
    
    li $v0, 1
    lw $a0, array($t0)
    syscall
    
    li $v0, 4
    la $a0, newLine
    syscall
    
    add $t0, $t0, 4
    j print_loop


    exit:
        li $v0, 10
        syscall
    .data 
        array:
        .align 2
        .space 40
        newLine: .asciiz "\n"
