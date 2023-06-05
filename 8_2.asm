.data 	
prompt:		.asciiz "Geben Sie 2 nummer ein  : \n"
prompt2: 	.asciiz "GGT : "

.text
		li $v0, 4
		la $a0, prompt
		syscall
		
		#Eingabe $4
		li $v0, 5
		syscall
		add $4, $0, $v0
		
		#Eingabe $5
		li $v0, 5
		syscall
		add $5, $0, $v0
		
		
		add $2, $0, $5
	
	
		beqz $4, line10
		beqz $5, line11
jumpto5:	beqz $5, line9
		bgt  $4, $5, then
		jal else
	 	j jumpto5
	
	

then : 		sub $4, $4, $5
		j jumpto5
else : 		sub $5, $5 ,$4
		jr $ra
	

line10: 	j line9
line11: 	add $4, $0 ,$5
		j line9
		
		#li $v0, 4
		#la $a0, text
		#syscall
		#j exit
	
line9:  	add $3, $0, $4
		li $v0, 4
		la $a0, prompt2
		syscall
		
		
		la $a0, ($3)
		li $v0, 1
		#la $a0, ($2)
		#move $a0, $2
		#add $a0, $0, $2
		syscall
		j exit
	

exit : 
		li $v0, 10
		syscall

