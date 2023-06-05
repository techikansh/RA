.data
input:		.space 128
output:		.space 128
text1:		.asciiz "Geben Sie Einen Text ein : "
newline:	.asciiz "\n"
text2:		.asciiz "\nOutput : "

.text
		li $v0, 4
		la $a0, text1
		syscall
		li $v0, 8
		la $a0, input
		la $a1, 128
		syscall
		#li $v0, 4
		#la $a0, input
		#syscall
		
		li $v0, 5
		syscall
		beq, $v0, 1, toupper
		beq, $v0, 2, tolower
toupper:	la $t0, input
		for:		lb $t1, ($t0)
				addi	$t0, $t0, 1
				#la $a0, ($t1)
				#li $v0, 11
				#syscall
				beqz	$t1, exit
				bge 	$t1, 97,  then
				j 	else
		then:		ble 	$t1, 122, then1
				j 	else
		then1:		subi 	$t1, $t1, 32
		else:		sb	$t1, output($t2)
				addi	$t2, $t2, 1
				j for
				
				
		exit:		li $v0, 4
				la $a0, text2
				syscall
				li $v0, 4
				la $a0, output
				syscall
				li $v0, 10
				syscall

tolower:	la $t0, input
		for1:		lb $t1, ($t0)
				addi	$t0, $t0, 1
				#la $a0, ($t1)
				#li $v0, 11
				#syscall
				beqz	$t1, exit1
				bge 	$t1, 65,  then2
				j 	else1
		then2:		ble 	$t1, 90, then3
				j 	else1
		then3:		addi 	$t1, $t1, 32
		else1:		sb	$t1, output($t2)
				addi	$t2, $t2, 1
				j for1
				
				
		exit1:		li $v0, 4
				la $a0, text2
				syscall
				li $v0, 4
				la $a0, output
				syscall
				li $v0, 10
				syscall

		
		
		
		
		
