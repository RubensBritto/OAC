# Suposto que o endereco para o inicio da palavra esta em $s0
# Quando o char não for uma letra, o programa para e add ao $v1 = 1

addi $a0,$zero,0 		# Contador universal

pilha:
lb $t0, 0($sp)			# Carregue o char da memoria
addi $a1,$sp,$zero 		# Guardando a posicao do topo da pilha (caso desvie)
beq $t0, $zero, inverter	# Caracter nulo, desvie
addi $a0, $a0, 1		# Incremente o contador
addi $s0, $s0, 1		# Proximo caracter
addi $sp, $sp, -4		# Aumente a pilha
sb $t0, 0($sp)			# Guardando o caracter na pilha
j pilha
 
inverter:
beq $a0, $zero, Exit		# Se o contador zerar, desvie
jal minuscula			
addi $sp, $sp, 4		# Desça a pilha
addi $a0, $a0, -1		# Decremente o contador
addi $a1,$a1, -4		# Suba o endereco que esta escrevendo a saida
j inverter

minuscula:
lb $a2, 0($sp)			# Coloque em $a2 o proximo caracter
slti $t1, $a2, 65		# Se o char atual for < 65
slti $t2, $a2, 91		# Se o char atual for < 91
bne $t1, $zero, not_caracter	# Se o char for < 65, desvie para not_caracter
beq $t2, $zero, maiuscula	# Se o char for > 91, desvie para maiuscula
addi $a2 , $a2, 32		# Mudando para maiuscula
sb $a2, 0($a1)			# Escrevendo na memoria
jr $ra

 maiuscula:
 slti $t1, $a2, 97		# Se o char atual for < 97
 slti $t2, $a2, 121		# Se o char atual for < 121
 bne $t1, $zero, not_caracter	# Se o char atual for < 97, desvie para not_caracter
 beq $t2, $zero, not_caracter	# Se o char atual for > 121, desvi para not_caracter
 addi $a2 , $a2, -32		# Mudando para minuscula
 sb $a2, 0($a1)			# Escrevendo na memoria
 jr $ra
 
 not_caracter:
 addi $v1, $zero, 1		# Caso o char não seja uma letra, o $v1 = 1
 j Exit
 
 Exit:
