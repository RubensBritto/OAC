j Main
Loop: add $a2, $a2, $a0		# $a2 soma o valor atual de $a2 + a 
slt $t0, $a0, $a1		# if (a < b)
addi $a0, $a0, 1		# adicionando 1 ao a
bne  $t0, $zero, Loop		# Loop enquanto (b>a) 
j Exit				#Exit para (a > b)


Main:addi $a0, $zero, 2 	#variavel a recebe qualquer valor
addi $a1, $zero, 4		#variavel b recebe qualquer valor
slt $t0, $a1, $a0		# if (b < a)
bne $t0, $zero, Else		# else para (b < a)

j Loop				#vai para o loop

Else: addi $v1, $zero, 1	# se (b < a) $v1 recebe 1

Exit:
