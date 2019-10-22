#numero 1 esta em $a0 = a
#numero 2 esta em $a1 = b
#resultado esta em $v0
addi $a0, $zero, 3
addi $a1, $zero, 1
jal mult
j Exit

mult:
addi $sp, $sp, -12 	#ajustando a pilha para 3 itens
sw $ra, 8($sp)		#salvar o endereço de retorno
sw $a0, 4($sp)		#salvar argumento
sw $a1, 0($sp)		#salvar argumento
slt $t0, $a0, $zero	# se (a < 0)
beq $t0, $zero, main
add $v0, $zero, $a1 	# se sim, o resultado é
addi $sp, $sp, 12	#pop 3 itens da pilha
jr $ra

main:
addi $a0, $a0, -1	#senao decrementa 1 dos numeros
jal mult
lw $a0, 0($sp)		#restaura a original
lw $a1, 4($sp)		#restaura a original
lw $ra, 8($sp)		#endereco de retorno
addi $sp, $sp, 12	#pop 3 itens da pilha
add $v0, $v0, $a1 	#soma para obter o valor final
jr $ra

Exit:

 
