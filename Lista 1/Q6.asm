# No registrador $a0 está a entrada
# O resultado está no registrador $v1

addi $a0, $zero, 6		# Adiciona um valor de entrada no registrador $a0
jal fibonacci			# Chama a funcao para calcular o valor de fibonacci
j Exit

fibonacci:
beq $a0, $zero, zero		# Quando o valor de $a0 == 0, Desvie para a funcao zero
slti $t0, $a0, 2		# Se o valor de ($a0 != 0 && $a0 < 2)
bne $t0, $zero, retorno		# Desvie para a função retorno

#calculo (n-1)
addi $sp, $sp, -8		# Ajustando a pilha para 2 item
sw $ra, 0($sp)			# Salvar o endereço de retorno
addi $a0, $a0, -1 		# (N - 1)
jal fibonacci			# Chmada recursiva
sw $v1, 4($sp)			# Salvar argumento
addi $a0, $a0, 1		# Retorno o valor de $a0
lw $ra, 0($sp)			# Endereço de retorno
addi $sp, $sp, 4		# Pop de 1 item na pilha


#calculo (n-2)
addi $sp, $sp, -4		# Ajustando a pilha para 1 item
sw $ra, 0($sp)			# Salvar o endereço de retorno
addi $a0, $a0, -2 		# (N - 2)
jal fibonacci			# Chamada recursiva
addi $a0, $a0, 2		# Retorno o valor de $a0
lw $ra, 0($sp)			# Endereço de retorno
addi $sp, $sp, 4		# Pop de 1 item na pilha
lw $s1, 0($sp)			# Pega o valor armazenado e guarda em $s1
addi $sp, $sp, 4		# Pop de 1 item
add $v1, $v1, $s1 		# fibonacci(n - 1) + fibonacci(n - 2)
jr $ra				# Retorna

zero:
addi $v1, $zero, 0		# Adiciona zero no valor atual da entrada
jr $ra				# Retorna

retorno:
addi $v1, $zero, 1		# Adiciona um no valor atual da entrada
jr $ra				# Retorna

Exit:
