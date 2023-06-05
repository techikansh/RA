.data
prompt1:	.asciiz "Geben Sie einen Text ein :\n"
prompt2:	.asciiz "Geben Sie einen Schluessel ein : \n"
prompt3:	.asciiz "Verschluesselter Text : "
input:		.space	100

.text 

		li $v0, 4
		la $a0, prompt1
		syscall
		
		#getting String
		li $v0, 8
		la $a0, input
		la $a1, 100
		syscall
		
		li $v0, 4
		la $a0, prompt2
		syscall
		
		 #getting key
		 li $v0, 5
		 syscall
		 move $s0, $v0		#storing key in $s0 => $s0 = key
		
		 #Verschlüsselung
		la $t0, input
loop:		lb $t1, ($t0)
		beqz $t1, done
		add  $t1, $t1, $s0
		sb   $t1, input($t2)
		
		addi $t2, $t2, 1
		addi $t0, $t0, 1
		j    loop
		
done:		li $v0, 4
		la $a0, prompt3
		syscall
		
		#printing verschluesselter text
		li $v0, 4
		la $a0, input
		syscall
		
		#exit
		li $v0, 10
		syscall





