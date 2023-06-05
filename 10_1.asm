.data
fibs:		.word 0:12
max:		.word 12
text1:		.asciiz "Anzahl der Fibionacci Zahlen( <12) : "
text2:		.asciiz "\nGewaehlte Zahl ist : "
newline:	.asciiz "\n"

.text
ReadInput:	li $v0, 4
	la $a0, text1
	syscall
	
	#readingsizeofarray
	li $v0, 5
	syscall
	
	lw $t5, max
	bgt $v0, $t5, ReadInput
	move $t5, $v0
	
	la $a0, text2
	li $v0, 4
	syscall
	
	move $a0, $t5
	li $v0, 1
	syscall
	
	move 	$t7, $t5
	
	#jetzt FIB zahlen rechnen
	addi $t1, $0, 0	#index
	
	la  	$t0, fibs($t1)
	addi 	$t2, $0, 1
	sw  	$t2, 0($t0)
	sw  	$t2, 4($t0)
	subi 	$t5, $t5, 2
	
for:	beqz	$t5, print
	lw 	$t3, ($t0)
	addi 	$t0, $t0, 4
	lw 	$t4, ($t0)
	
	add 	$t6, $t3, $t4
	addi 	$t0, $t0, 4
	sw  	$t6, ($t0)
	subi 	$t0, $t0, 4
	subi	$t5, $t5, 1
	j for
	
	
	
print:	li 	$v0, 4
	la 	$a0, newline
	syscall
	addi 	$t0, $0, 0
	la	$t0, fibs
	loop:	lw  	$a0, ($t0)
		li 	$v0, 1
		syscall	
		li	$v0, 4
		la	$a0, newline
		syscall
		addi 	$t0, $t0, 4
		subi	$t7, $t7, 1
		beqz	$t7, exit
		j	loop

exit:	li $v0, 10
	syscall	
	
	
	
	
	
	