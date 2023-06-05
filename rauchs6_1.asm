.data
str1: 		.ascii "Lager"
str2: 		.ascii "Regal"
str3: 		.space  10
      		.byte  0xff
      		.byte  0xff
newline:		.ascii  "\n"
      		
.text
	#print str1
	li 	$v0, 4
	la	$a0, str1
	syscall
	
	la 	$t0, str1
	jal	tolower1
	
	la 	$t0, str2
	jal	tolower2
	
	li 	$v0, 4
	la	$a0, newline
	syscall 
	
	li 	$v0, 4
	la	$a0, str1
	syscall 
	
	li 	$v0, 4
	la	$a0, newline
	syscall 
	
	li 	$v0, 4
	la	$a0, str2
	syscall 


tolower1:	
do:	lb	$t1, ($t0)
	addi 	$t0, $t0, 1	
	beqz	$t1, done
	bge	$t1, 65, then
	j else
	
then:	ble	$t1, 90, then2
	j else
	
then2:	addi	$t1, $t1, 32
else:	sb 	$t1, str1($t2)
	addi 	$t2, $t2, 1
	j do
	
done:	jr	$ra


tolower2:	
do2:	lb	$t1, ($t0)
	addi 	$t0, $t0, 1	
	beqz	$t1, done2
	bge	$t1, 65, then
	j else2
	
then3:	ble	$t1, 90, then4
	j else2
	
then4:	addi	$t1, $t1, 32
else2:	sb 	$t1, str2($t2)
	addi 	$t2, $t2, 1
	j do2
	
done2:	jr	$ra #devanshGithubUpdate
	