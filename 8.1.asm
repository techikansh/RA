.data
	byte:	 	.byte 0xa0
			.half 0xb1b0
	integer:	.word 0xc3c2c1c0
	string:		.ascii "The End\n" 
.text
	
	#li $v0, 0xa0 # ? können wir la nutzen
	#li $v1, 0xb1b0
	
	#li $v0, 4
	#la $a0, string
	#syscall
	
	#li $v0, 1
	#la $a0, integer
	#syscall
