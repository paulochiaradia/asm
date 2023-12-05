.text
.globl main

main:
    move $t0, $zero
    li $t9, 20
loop_input:
    li $v0, 5
    syscall
    sw $v0, array($t0)

    addi $t0, $t0, 4
    bne $t0, $t9, loop_input
    j end_input_loop
    
end_input_loop:
    la $t1, array
    lw $s0, n 
    subu $s0, $s0, 1
    addu $s5, $zero, $zero
    addu $s1, $zero, $zero
    
for:
    addu $s2, $zero, $zero
    subu $t9, $s0, $s1
    
    internalfor:
    	addu $t2, $t1, 4
    	lw $t4, ($t1)
        lw $t5, ($t2)
        
        bleu $t4, $t5, dontSwap
        sw $t4,($t2)
        sw $t5,($t1)
        addu $s5, $zero, 1
        
        dontSwap:
        beq $s2, $t9, endInternalFor
        addu $s2, $s2, 1
        addu $t1, $t1, 4
        addu $t2, $t2, 4
        b internalfor
endInternalFor:
beqz $s5, endFor
beq $s1, $s0, endFor
addu $s1, $s1, 1
la $t1, array
b for

endFor:
la $t1, array
and $s1, $zero, $zero

print:
	lw $a0, ($t1)
	addu $v0, $zero, 1
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	
	beq $s0, $s1, endPrint
	addu $s1, $s1, 1
	addu $t1, $t1, 4
	b print

endPrint:	
    li $v0, 10
    syscall



.data
    array:
    .align 2
    .space 20
    n: .word 5
    space:.asciiz " "