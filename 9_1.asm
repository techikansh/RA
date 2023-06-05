.data
Input:		.space 181
text0: 		.asciiz "\nGeben Sie eine String ein : "
text1: 		.asciiz "String : "
#character:	.space 2
text2: 		.asciiz "Eneter a character : "
text3:		.asciiz "\n"
text4:		.asciiz "character : "
text5: 		.asciiz "length : "
text6:		.asciiz "\nanzahl : "
text7: 		.ascii  "/"
.text

start:		li $v0, 4
		la $a0, text0
		syscall
		
		#getting string from user
		li $v0, 8
		la $a0, Input
		la $a1, 181
		syscall
		lb $t6, text7
		lb $t7, Input
		beq $t6, $t7, exit
		
		#printing string
		li $v0, 4
		la $a0, text1
		syscall
		li $v0, 4
		la $a0, Input
		syscall
		
		#getting character from user
		li $v0, 4
		la $a0, text2
		syscall
		
		#li $v0, 8
		li $v0, 12
		#la $a0, character
		#la $a1, 2
		syscall
		#storing character in $t3
		#lb $t3, ($a0)
		add $t3, $v0, $0
		
		#printing character
		li $v0, 4
		la $a0, text4
		syscall
		li $v0, 11
		la $a0, ($t3)
		syscall
		
		#getting length of string
		la $t0, Input
strlen:		lb $t1, ($t0)
		beqz $t1, stop_strlen
		addi $t2, $t2, 1	#length++
		addi $t0, $t0, 1	#string pointer++
		j strlen
		
		
stop_strlen:	li $v0, 4
		la $a0, text3	#printing "\n"
		syscall
		li $v0, 4
		la $a0, text5	#printing "Length : "
		syscall
		li $v0, 1
		add $a0, $t2, $0
		subi $a0, $a0, 1
		syscall
		
		
		#getting count
		addi $t4, $0, 0		#setting count = 0
		addi $t2, $a0, 0 	#length
		addi $t5, $0, 0	#length check counter
		
		la $t0, Input	#loading input in a register to divide it further
		
for:		lb $t1, ($t0)	#loading every single byte in $t1
		beq $t1, $t3, increment
		j stringPointerIncrement
		j for
		
		
increment:			addi $t4, $t4, 1	#count increment
				j stringPointerIncrement

stringPointerIncrement:		
				addi $t0, $t0, 1	#string pointer increment
				addi $t5, $t5, 1	#length check counter increment
				beq  $t5, $t2, ende
				j for
				
ende:				li $v0, 4
				la $a0, text6
				syscall
				li $v0, 1
				add $a0, $0, $t4
				syscall 
				j start
		
		
		
		
exit:				li $v0, 10
				syscall
		
		
		
		
		
		
		
		
		
		