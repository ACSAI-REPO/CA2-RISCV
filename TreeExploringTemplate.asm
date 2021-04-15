.data
tree:	.word n01
n01:	.word 8, n02, n03
n02:	.word 5, n04, n05
n03:	.word 13, n06, 0
n04:	.word 3, 0, 0
n05:	.word 2, 0, 0
n06:	.word -7, 0, 0


.text
	lw a0, tree	# carichiamo l'albero
	jal foo
  
  
 
foo:	bne a0, zero, foo_ric
	    jalr zero, ra, 0
  
foo_ric:
	addi sp, sp, -12
	sw ra, 0(sp)
	sw a0, 4(sp)
	lw a0, 4(a0)	
	jal foo
		
	sw a0, 8(sp) 
	lw a0, 4(sp)	
	lw a0, 8(a0)	
	jal foo
  
  	lw t0, 8(sp)
  
  	# Assume to have in a0(right) and t0(left) what you need ... then just complete as if you were at a base case
  
  	lw ra, 0(sp)
	addi sp, sp, 12
	jalr zero, ra, 0
