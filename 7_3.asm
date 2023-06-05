
.data



.text
	
	
	addi $8,  $0, 	0
	addi $9,  $0, 	11
	addi $10, $0, 	0x1000
	addi $11, $0, 	-1
	addi $12, $0, 	-0x800
	addi $13, $0, 	0x800 
	#addi  $14, $0, 0xffff0000
	#addi $15,  $0, 0x7fffffff
	addi $24, $0, 	5322
	addi $25, $0, 	75
	
	
	add $2, $10, $9
	sub $3, $10, $9
	
	nor $19, $19, $19
	add $4, $19, $10
	addi $4, $4, 1
	
	sll $5, $13, 5	#shift left in 5 register 13 by 5
	sra $6, $13, 5  #shift right arithmetically $13 by 5
	sll $7, $12, 5
	srl $16, $12, 5
	srlv $17, $13, $9 #srlv low order 5 bit nicht verstanden!!!!
	
	div $18, $24, $25
	 
