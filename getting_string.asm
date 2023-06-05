.data
input:		.asciiz "Hello world\n"
.text
		li $v0, 4
		la $a0, input
		syscall
		
string_in:	la $a0, input
		la $a1, 128
		li $v0, 8
		syscall
		
		
string_out:	li $v0, 4
		la $a0, input
		syscall