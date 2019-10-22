addi $a0, $zero, 1 				# variavel a recebe qualquer valor
addi $a1, $zero, 2 				# variavel b recebe qualquer valor
addi $a2, $zero, 0 				# variavel x 
slt $t0, $a0, $zero				# if (a < 0)
bne $t0, $zero, Elseif 				# elseif para (a < 0)
slt $t0, $a0, $a1 				# se (a >=0)
beq $t0, $zero, Elseif 				# elseif para (a >= b) 
addi $a2, $zero, 1 				# se (a < b) , x = 1

j Exit

 Elseif: slt $t0, $a0, $zero			# if(a<0)
 beq $t0, $zero, Else				# else para (a >= 0)
 slt $t0, $a0, $a1				# if (a < b)
 bne $t0, $zero, Else				#else para (a < b)
 addi $a2, $zero, 2 				# se (a > b) , x = 2
 
 j Exit
 
 Else:  addi $a2, $zero, 3			# Else , x = 3
 Exit: