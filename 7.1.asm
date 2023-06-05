.data
	
.text	
	addi $8, $0, 0				# $8 = 0
	addi $8, $8, 1				# $8 = 1
	ori $8, $0, 0xffff			# $8 = 0x0000ffff
	addi $9, $0, -16384			# $9 = 
	add $8, $8, $9				# $8 = 
