	.text
	.align 2
	.globl main
main:
	addi $sp, $sp, -3244
	sw $ra, 112($sp)
	li $t2, 1
	move $t3, $t2
	sll $t3, $t3, 2
	addi $t3, $t3, 4
	sw $t3, 0($sp)
	sw $t2, 1152($sp)
	jal _malloc
	lw $t2, 1152($sp)
	move $t3, $v0
	sw $t2, 0($t3)
	move $t2, $t3
	li $t0, 0
	sw $t0, 1160($sp)
	lw $t0, 1160($sp)
	sw $t0, 1164($sp)
	lw $t0, 1164($sp)
	sll $t0, $t0, 2
	sw $t0, 1164($sp)
	lw $t1, 1164($sp)
	add $t2, $t2, $t1
	li $t0, 0
	sw $t0, 3232($sp)
	lw $t0, 3232($sp)
	sw $t0, 4($t2)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	jal getcount
	lw $t3, 116($sp)
	move $t2, $v0
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 124($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 128($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 132($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 136($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 140($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 144($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 148($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 152($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 156($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 160($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 164($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 168($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 172($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 176($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 180($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 184($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 188($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 192($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 196($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 200($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 204($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 208($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 212($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 216($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 220($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 224($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 228($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 232($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 236($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 240($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 244($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 248($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 252($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 256($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 260($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 264($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 268($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 272($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 276($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 280($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 284($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 288($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 292($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 296($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 300($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 304($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 308($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 312($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 316($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 320($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 324($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 328($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 332($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 336($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 340($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 344($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 348($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 352($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 356($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 360($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 364($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 368($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 372($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 376($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 380($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 384($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 388($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 392($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 396($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 400($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 404($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 408($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 412($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 416($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 420($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 424($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 428($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 432($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 436($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 440($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 444($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 448($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 452($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 456($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 460($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 464($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 468($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 472($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 476($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 480($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 484($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 488($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 492($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 496($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 500($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 504($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 508($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 512($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 516($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 520($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 524($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 528($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 532($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 536($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 540($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 544($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 548($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 552($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 556($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 560($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 564($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 568($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 572($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 576($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 580($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 584($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 588($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 592($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 596($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 600($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 604($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 608($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 612($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 616($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 620($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 624($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 628($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 632($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 636($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 640($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 644($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 648($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 652($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 656($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 660($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 664($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 668($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 672($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 676($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 680($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 684($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 688($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 692($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 696($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 700($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 704($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 708($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 712($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 716($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 720($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 724($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 728($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 732($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 736($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 740($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 744($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 748($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 752($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 756($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 760($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 764($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 768($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 772($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 776($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 780($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 784($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 788($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 792($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 796($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 800($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 804($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 808($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 812($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 816($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 820($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 824($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 828($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 832($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 836($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 840($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 844($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 848($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 852($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 856($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 860($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 864($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 868($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 872($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 876($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 880($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 884($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 888($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 892($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 896($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 900($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 904($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 908($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 912($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 916($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 920($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 924($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 928($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 932($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 936($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 940($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 944($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 948($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 952($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 956($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 960($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 964($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 968($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 972($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 976($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 980($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 984($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 988($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 992($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 996($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1000($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1004($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1008($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1012($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1016($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1020($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1024($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1028($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1032($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1036($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1040($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1044($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1048($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1052($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1056($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1060($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1064($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1068($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1072($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1076($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1080($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1084($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1088($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1092($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1096($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1100($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1104($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1108($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1112($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1116($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1120($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1124($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1128($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1132($sp)
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 1136($sp)
	sw $t3, 0($sp)
	sw $t2, 120($sp)
	jal getcount
	lw $t2, 120($sp)
	sw $v0, 1140($sp)
	sw $t2, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 124($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 128($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 132($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 136($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 140($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 144($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 148($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 152($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 156($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 160($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 164($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 168($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 172($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 176($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 180($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 184($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 188($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 192($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 196($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 200($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 204($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 208($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 212($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 216($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 220($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 224($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 228($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 232($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 236($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 240($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 244($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 248($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 252($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 256($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 260($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 264($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 268($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 272($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 276($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 280($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 284($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 288($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 292($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 296($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 300($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 304($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 308($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 312($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 316($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 320($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 324($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 328($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 332($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 336($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 340($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 344($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 348($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 352($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 356($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 360($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 364($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 368($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 372($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 376($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 380($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 384($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 388($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 392($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 396($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 400($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 404($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 408($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 412($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 416($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 420($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 424($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 428($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 432($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 436($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 440($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 444($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 448($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 452($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 456($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 460($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 464($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 468($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 472($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 476($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 480($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 484($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 488($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 492($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 496($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 500($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 504($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 508($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 512($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 516($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 520($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 524($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 528($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 532($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 536($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 540($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 544($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 548($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 552($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 556($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 560($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 564($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 568($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 572($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 576($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 580($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 584($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 588($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 592($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 596($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 600($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 604($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 608($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 612($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 616($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 620($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 624($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 628($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 632($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 636($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 640($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 644($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 648($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 652($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 656($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 660($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 664($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 668($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 672($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 676($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 680($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 684($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 688($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 692($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 696($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 700($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 704($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 708($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 712($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 716($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 720($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 724($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 728($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 732($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 736($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 740($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 744($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 748($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 752($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 756($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 760($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 764($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 768($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 772($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 776($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 780($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 784($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 788($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 792($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 796($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 800($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 804($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 808($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 812($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 816($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 820($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 824($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 828($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 832($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 836($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 840($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 844($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 848($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 852($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 856($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 860($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 864($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 868($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 872($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 876($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 880($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 884($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 888($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 892($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 896($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 900($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 904($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 908($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 912($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 916($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 920($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 924($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 928($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 932($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 936($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 940($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 944($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 948($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 952($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 956($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 960($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 964($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 968($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 972($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 976($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 980($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 984($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 988($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 992($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 996($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1000($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1004($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1008($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1012($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1016($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1020($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1024($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1028($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1032($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1036($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1040($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1044($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1048($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1052($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1056($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1060($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1064($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1068($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1072($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1076($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1080($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1084($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1088($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1092($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1096($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1100($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1104($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1108($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1112($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1116($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1120($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1124($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1128($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1132($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1136($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	lw $t0, 1140($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printInt
	lw $t2, 120($sp)
	la $t0, _L0
	sw $t0, 3236($sp)
	lw $t0, 3236($sp)
	sw $t0, 2192($sp)
	lw $t0, 2192($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	jal printString
	lw $t2, 120($sp)
	sw $t2, 0($sp)
	jal printInt
	lw $t0, 124($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 128($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 132($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 136($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 140($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 144($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 148($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 152($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 156($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 160($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 164($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 168($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 172($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 176($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 180($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 184($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 188($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 192($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 196($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 200($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 204($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 208($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 212($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 216($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 220($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 224($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 228($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 232($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 236($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 240($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 244($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 248($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 252($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 256($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 260($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 264($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 268($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 272($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 276($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 280($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 284($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 288($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 292($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 296($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 300($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 304($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 308($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 312($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 316($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 320($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 324($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 328($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 332($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 336($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 340($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 344($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 348($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 352($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 356($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 360($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 364($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 368($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 372($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 376($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 380($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 384($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 388($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 392($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 396($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 400($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 404($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 408($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 412($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 416($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 420($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 424($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 428($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 432($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 436($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 440($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 444($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 448($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 452($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 456($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 460($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 464($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 468($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 472($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 476($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 480($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 484($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 488($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 492($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 496($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 500($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 504($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 508($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 512($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 516($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 520($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 524($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 528($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 532($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 536($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 540($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 544($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 548($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 552($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 556($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 560($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 564($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 568($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 572($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 576($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 580($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 584($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 588($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 592($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 596($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 600($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 604($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 608($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 612($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 616($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 620($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 624($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 628($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 632($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 636($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 640($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 644($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 648($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 652($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 656($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 660($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 664($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 668($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 672($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 676($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 680($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 684($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 688($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 692($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 696($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 700($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 704($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 708($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 712($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 716($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 720($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 724($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 728($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 732($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 736($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 740($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 744($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 748($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 752($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 756($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 760($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 764($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 768($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 772($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 776($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 780($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 784($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 788($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 792($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 796($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 800($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 804($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 808($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 812($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 816($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 820($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 824($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 828($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 832($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 836($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 840($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 844($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 848($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 852($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 856($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 860($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 864($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 868($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 872($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 876($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 880($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 884($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 888($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 892($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 896($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 900($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 904($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 908($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 912($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 916($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 920($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 924($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 928($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 932($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 936($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 940($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 944($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 948($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 952($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 956($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 960($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 964($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 968($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 972($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 976($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 980($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 984($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 988($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 992($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 996($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1000($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1004($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1008($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1012($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1016($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1020($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1024($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1028($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1032($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1036($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1040($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1044($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1048($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1052($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1056($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1060($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1064($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1068($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1072($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1076($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1080($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1084($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1088($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1092($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1096($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1100($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1104($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1108($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1112($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1116($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1120($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1124($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1128($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1132($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1136($sp)
	sw $t0, 0($sp)
	jal printInt
	lw $t0, 1140($sp)
	sw $t0, 0($sp)
	jal printInt
	la $t2, _L1
	sw $t2, 0($sp)
	jal printString
	lw $ra, 112($sp)
	addi $sp, $sp, 3244
	jr $ra
getcount:
	addi $sp, $sp, -176
	sw $ra, 112($sp)
	lw $t2, 176($sp)
	move $t3, $t2
	move $t2, $t3
	li $t0, 0
	sw $t0, 124($sp)
	lw $t0, 124($sp)
	sw $t0, 128($sp)
	lw $t0, 128($sp)
	sll $t0, $t0, 2
	sw $t0, 128($sp)
	lw $t1, 128($sp)
	add $t2, $t2, $t1
	sw $t3, 132($sp)
	li $t0, 0
	sw $t0, 136($sp)
	lw $t0, 136($sp)
	sw $t0, 140($sp)
	lw $t0, 140($sp)
	sll $t0, $t0, 2
	sw $t0, 140($sp)
	lw $t0, 132($sp)
	lw $t1, 140($sp)
	add $t0, $t0, $t1
	sw $t0, 132($sp)
	lw $t1, 132($sp)
	lw $t0, 4($t1)
	sw $t0, 164($sp)
	li $t0, 1
	sw $t0, 168($sp)
	lw $t0, 164($sp)
	lw $t1, 168($sp)
	add $t0, $t0, $t1
	sw $t0, 144($sp)
	lw $t0, 144($sp)
	sw $t0, 4($t2)
	li $t2, 0
	sll $t2, $t2, 2
	add $t3, $t3, $t2
	lw $t2, 4($t3)
	move $v0, $t2
	lw $ra, 112($sp)
	addi $sp, $sp, 176
	jr $ra
	lw $ra, 112($sp)
	addi $sp, $sp, 176
	jr $ra
substring:
	addi $sp, $sp, -196
	sw $ra, 112($sp)
	lw $t2, 196($sp)
	move $t3, $t2
	lw $t2, 200($sp)
	lw $t0, 204($sp)
	sw $t0, 180($sp)
	lw $t0, 180($sp)
	sw $t0, 124($sp)
	la $t0, _L2
	sw $t0, 184($sp)
	lw $t0, 184($sp)
	sw $t0, 132($sp)
	sw $t3, 136($sp)
	sw $t2, 140($sp)
	lw $t0, 136($sp)
	lw $t1, 140($sp)
	add $t0, $t0, $t1
	sw $t0, 136($sp)
	lw $t1, 136($sp)
	lb $t0, 0($t1)
	sb $t0, 188($sp)
	lw $t0, 188($sp)
	sw $t0, 148($sp)
	lw $t0, 148($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	sw $t3, 116($sp)
	jal _charToString
	lw $t2, 120($sp)
	lw $t3, 116($sp)
	sw $v0, 144($sp)
	lw $t0, 132($sp)
	sw $t0, 0($sp)
	lw $t0, 144($sp)
	sw $t0, 4($sp)
	sw $t2, 120($sp)
	sw $t3, 116($sp)
	jal _strcat
	lw $t2, 120($sp)
	lw $t3, 116($sp)
	sw $v0, 132($sp)
	#FOR   :: DEBUG
	addi $t0, $t2, 1
	sw $t0, 128($sp)
_L3:
	lw $t1, 124($sp)
	add $t0, $t2, $t1
	sw $t0, 152($sp)
	lw $t0, 128($sp)
	lw $t1, 152($sp)
	bge  $t0, $t1, _L5
_L4:
	sw $t3, 156($sp)
	lw $t0, 128($sp)
	sw $t0, 160($sp)
	lw $t0, 156($sp)
	lw $t1, 160($sp)
	add $t0, $t0, $t1
	sw $t0, 156($sp)
	lw $t1, 156($sp)
	lb $t0, 0($t1)
	sb $t0, 192($sp)
	lw $t0, 192($sp)
	sw $t0, 168($sp)
	lw $t0, 168($sp)
	sw $t0, 0($sp)
	sw $t2, 120($sp)
	sw $t3, 116($sp)
	jal _charToString
	lw $t2, 120($sp)
	lw $t3, 116($sp)
	sw $v0, 164($sp)
	lw $t0, 132($sp)
	sw $t0, 0($sp)
	lw $t0, 164($sp)
	sw $t0, 4($sp)
	sw $t2, 120($sp)
	sw $t3, 116($sp)
	jal _strcat
	lw $t2, 120($sp)
	lw $t3, 116($sp)
	sw $v0, 132($sp)
	lw $t1, 128($sp)
	addi $t0, $t1, 1
	sw $t0, 128($sp)
	j _L3
_L5:
	lw $v0, 132($sp)
	lw $ra, 112($sp)
	addi $sp, $sp, 196
	jr $ra
	lw $ra, 112($sp)
	addi $sp, $sp, 196
	jr $ra
readString:
	addi $sp, $sp, -200
	sw $ra, 112($sp)
	la $t2, _L2
	sw $t2, 120($sp)
	jal readChar
	lw $t2, 120($sp)
	move $t3, $v0
	#WHILE   :: DEBUG
_L6:
	li $t0, 32
	sw $t0, 176($sp)
	lw $t1, 176($sp)
	seq $t0, $t3, $t1
	sw $t0, 132($sp)
	lw $t1, 132($sp)
	bnez $t1, _L11
	li $t0, 10
	sw $t0, 180($sp)
	lw $t1, 180($sp)
	seq $t0, $t3, $t1
	sw $t0, 136($sp)
	li $t0, 0
	sw $t0, 128($sp)
	lw $t1, 136($sp)
	beqz $t1, _L12
_L11:
	li $t0, 1
	sw $t0, 128($sp)
_L12:
	lw $t1, 128($sp)
	bnez $t1, _L9
	li $t0, 9
	sw $t0, 184($sp)
	lw $t1, 184($sp)
	seq $t0, $t3, $t1
	sw $t0, 140($sp)
	li $t0, 0
	sw $t0, 124($sp)
	lw $t1, 140($sp)
	beqz $t1, _L10
_L9:
	li $t0, 1
	sw $t0, 124($sp)
_L10:
	lw $t1, 124($sp)
	beqz $t1, _L8
_L7:
	sw $t2, 120($sp)
	jal readChar
	lw $t2, 120($sp)
	move $t3, $v0
	j _L6
_L8:
	sw $t3, 0($sp)
	sw $t2, 120($sp)
	jal _charToString
	lw $t2, 120($sp)
	move $t3, $v0
	sw $t2, 0($sp)
	sw $t3, 4($sp)
	jal _strcat
	move $t2, $v0
	sw $t2, 120($sp)
	jal readChar
	lw $t2, 120($sp)
	move $t3, $v0
	#WHILE   :: DEBUG
_L13:
	li $t0, 32
	sw $t0, 188($sp)
	lw $t1, 188($sp)
	sne $t0, $t3, $t1
	sw $t0, 156($sp)
	lw $t1, 156($sp)
	beqz $t1, _L18
	li $t0, 10
	sw $t0, 192($sp)
	lw $t1, 192($sp)
	sne $t0, $t3, $t1
	sw $t0, 160($sp)
	li $t0, 1
	sw $t0, 152($sp)
	lw $t1, 160($sp)
	bnez $t1, _L19
_L18:
	li $t0, 0
	sw $t0, 152($sp)
_L19:
	lw $t1, 152($sp)
	beqz $t1, _L16
	li $t0, 9
	sw $t0, 196($sp)
	lw $t1, 196($sp)
	sne $t0, $t3, $t1
	sw $t0, 164($sp)
	li $t0, 1
	sw $t0, 148($sp)
	lw $t1, 164($sp)
	bnez $t1, _L17
_L16:
	li $t0, 0
	sw $t0, 148($sp)
_L17:
	lw $t1, 148($sp)
	beqz $t1, _L15
_L14:
	sw $t3, 0($sp)
	sw $t2, 120($sp)
	jal _charToString
	lw $t2, 120($sp)
	move $t3, $v0
	sw $t2, 0($sp)
	sw $t3, 4($sp)
	jal _strcat
	move $t2, $v0
	sw $t2, 120($sp)
	jal readChar
	lw $t2, 120($sp)
	move $t3, $v0
	j _L13
_L15:
	move $v0, $t2
	lw $ra, 112($sp)
	addi $sp, $sp, 200
	jr $ra
	lw $ra, 112($sp)
	addi $sp, $sp, 200
	jr $ra
readLine:
	addi $sp, $sp, -156
	sw $ra, 112($sp)
	jal readChar
	move $t3, $v0
	#WHILE   :: DEBUG
_L20:
	li $t2, 10
	seq $t2, $t3, $t2
	beqz $t2, _L22
_L21:
	jal readChar
	move $t3, $v0
	j _L20
_L22:
	la $t2, _L2
	sw $t3, 0($sp)
	sw $t2, 128($sp)
	sw $t3, 120($sp)
	jal _charToString
	lw $t2, 128($sp)
	lw $t3, 120($sp)
	sw $v0, 132($sp)
	sw $t2, 0($sp)
	lw $t0, 132($sp)
	sw $t0, 4($sp)
	sw $t3, 120($sp)
	jal _strcat
	lw $t3, 120($sp)
	move $t2, $v0
	#WHILE   :: DEBUG
_L23:
	li $t0, 10
	sw $t0, 152($sp)
	lw $t1, 152($sp)
	sne $t0, $t3, $t1
	sw $t0, 136($sp)
	lw $t1, 136($sp)
	beqz $t1, _L25
_L24:
	sw $t3, 0($sp)
	sw $t3, 120($sp)
	sw $t2, 116($sp)
	jal _charToString
	lw $t3, 120($sp)
	lw $t2, 116($sp)
	sw $v0, 140($sp)
	sw $t2, 0($sp)
	lw $t0, 140($sp)
	sw $t0, 4($sp)
	sw $t3, 120($sp)
	jal _strcat
	lw $t3, 120($sp)
	move $t2, $v0
	j _L23
_L25:
	move $v0, $t2
	lw $ra, 112($sp)
	addi $sp, $sp, 156
	jr $ra
	lw $ra, 112($sp)
	addi $sp, $sp, 156
	jr $ra
parseInt:
	addi $sp, $sp, -172
	sw $ra, 112($sp)
	lw $t2, 172($sp)
	move $t3, $t2
	li $t2, 0
	#FOR   :: DEBUG
	li $t0, 0
	sw $t0, 124($sp)
_L26:
	sw $t3, 0($sp)
	sw $t3, 116($sp)
	sw $t2, 120($sp)
	jal _strlen
	lw $t3, 116($sp)
	lw $t2, 120($sp)
	sw $v0, 128($sp)
	lw $t0, 124($sp)
	lw $t1, 128($sp)
	bge  $t0, $t1, _L28
_L27:
	li $t0, 10
	sw $t0, 160($sp)
	lw $t1, 160($sp)
	mul $t0, $t2, $t1
	sw $t0, 132($sp)
	sw $t3, 136($sp)
	lw $t0, 124($sp)
	sw $t0, 140($sp)
	lw $t0, 136($sp)
	lw $t1, 140($sp)
	add $t0, $t0, $t1
	sw $t0, 136($sp)
	lw $t1, 136($sp)
	lb $t0, 0($t1)
	sb $t0, 164($sp)
	lw $t0, 164($sp)
	sw $t0, 144($sp)
	lw $t0, 144($sp)
	sw $t0, 0($sp)
	sw $t3, 116($sp)
	jal ord
	lw $t3, 116($sp)
	sw $v0, 148($sp)
	lw $t0, 132($sp)
	lw $t1, 148($sp)
	add $t0, $t0, $t1
	sw $t0, 152($sp)
	li $t0, 48
	sw $t0, 168($sp)
	lw $t0, 152($sp)
	lw $t1, 168($sp)
	sub $t2, $t0, $t1
	lw $t1, 124($sp)
	addi $t0, $t1, 1
	sw $t0, 124($sp)
	j _L26
_L28:
	move $v0, $t2
	lw $ra, 112($sp)
	addi $sp, $sp, 172
	jr $ra
	lw $ra, 112($sp)
	addi $sp, $sp, 172
	jr $ra
fillIntArray:
	addi $sp, $sp, -152
	sw $ra, 112($sp)
	lw $t2, 152($sp)
	move $t3, $t2
	lw $t2, 156($sp)
	#FOR   :: DEBUG
	li $t0, 0
	sw $t0, 124($sp)
_L29:
	lw $t0, 0($t3)
	sw $t0, 144($sp)
	lw $t0, 124($sp)
	lw $t1, 144($sp)
	bge  $t0, $t1, _L31
_L30:
	sw $t3, 128($sp)
	lw $t0, 124($sp)
	sw $t0, 132($sp)
	lw $t0, 132($sp)
	sll $t0, $t0, 2
	sw $t0, 132($sp)
	lw $t0, 128($sp)
	lw $t1, 132($sp)
	add $t0, $t0, $t1
	sw $t0, 128($sp)
	lw $t1, 128($sp)
	sw $t2, 4($t1)
	lw $t1, 124($sp)
	addi $t0, $t1, 1
	sw $t0, 124($sp)
	j _L29
_L31:
	li $t2, 1
	move $v0, $t2
	lw $ra, 112($sp)
	addi $sp, $sp, 152
	jr $ra
	lw $ra, 112($sp)
	addi $sp, $sp, 152
	jr $ra
native:
_malloc:  				#done
    lw $a0, 0($sp)
    li $v0, 9
    syscall
    jr $ra

_strcmp:   			#done t0<t1 r -1 t0=t1 r 0 t0>t1 r 1
    lw $t0, 0($sp)
    lw $t1, 4($sp)
_strcmp_begin:
    lb $t2, 0($t0)
    lb $t3, 0($t1)
    blt $t2, $t3, _strcmp_less
    bgt $t2, $t3, _strcmp_greater
    beq $t2, $zero, _strcmp_equal
    addi $t0, $t0, 1
    addi $t1, $t1, 1
    j _strcmp_begin
_strcmp_less:				
    li $v0, -1
    jr $ra
_strcmp_greater:
    li $v0, 1
    jr $ra
_strcmp_equal:
    li $v0, 0
    jr $ra

_intToString:			#done
    lw $t0, 0($sp)
    li $t1, 0
    bge $t0, $zero, intToString_l1
    li $t1, 1
    neg $t0, $t0
intToString_l1:
    move $t3, $t0
    li $t2, 0
intToString_l2:
    addi $t2, $t2, 1
    div $t3, $t3, 10
    bne $t3, $zero, intToString_l2
    addi $a0, $t2, 1
    beq $t1, $zero, intToString_l3
    addi $a0, $a0, 1
intToString_l3:
    li $v0, 9
    move $t3, $a0
    syscall
    beq $t1, $zero, intToString_l5
    li $t4, 45
    sb $t4, 0($v0)
intToString_l5:
    add $t3, $v0, $t3
    addi $t3, $t3, -1
    sb $zero, 0($t3)    
    addi $t3, $t3, -1
intToString_l4:
    rem $t4, $t0, 10
    addi $t4, $t4, 48
    sb $t4, 0($t3)
    addi $t3, $t3, -1
    div $t0, $t0, 10
    bne $t0, $zero, intToString_l4
    jr $ra

_charToString: 		#done
    li $a0, 2
    li $v0, 9
    syscall
    lb $t0, 0($sp)
    sb $t0, 0($v0)
    sb $zero, 1($v0)
    jr $ra

_strlen:
    lw $t0, 0($sp)
    li $v0, 0
_strlen_begin:
    lb $t1, 0($t0)
    beq $t1, $zero, _strlen_end
    addi $t0, $t0, 1
    addi $v0, $v0, 1
    j _strlen_begin
_strlen_end:
    jr $ra

_strcat:			#done  t0.t1
    lw $t0, 0($sp)
    move $t7, $t0
    lw $t6, 4($sp)
    addi $sp, $sp, -8
    sw $ra, 4($sp)	#aa
    sw $t0, 0($sp)	#aa
    jal _strlen
    move $t2, $v0
    move $t1, $t6
    sw $t1, 0($sp)  #aa
    jal _strlen
    move $t1, $t6
    move $t3, $v0
    add $a0, $t2, $t3
    addi $a0, $a0, 1
    li $v0,9
    syscall
    move $t1, $t6
	move $t0, $t7
    move $t5, $v0
_strcat_l1:
    lb $t4, 0($t0)
    beq $t4, $zero, _strcat_l2
    sb $t4, 0($t5)
    addi $t0, $t0, 1
    addi $t5, $t5, 1
    j _strcat_l1
_strcat_l2:
    lb $t4, 0($t1)
    beq $t4, $zero, _strcat_l3
    sb $t4, 0($t5)
    addi $t1, $t1, 1
    addi $t5, $t5, 1	#wrong
    j _strcat_l2
_strcat_l3:
    sb $zero, 0($t5)
    lw $ra, 4($sp)	#myself
    addi $sp, $sp, 8
    jr $ra

readInt:			#done
    li $v0, 5
    syscall
    jr $ra

readChar:			#done
    li $v0, 8
    move $a0, $sp
    li $a1, 2
    syscall
    lb $v0, 0($sp)
    jr $ra

printInt:			#done
    li $v0, 1
    lw $a0, 0($sp)
    syscall
    jr $ra

printChar:			#done
    sb $zero, 1($sp)
    li $v0, 4
    move $a0, $sp
    syscall
    jr $ra

printString:		#done
    lw $a0, 0($sp)
    li $v0, 4
    syscall
    jr $ra

printLine:			#done
    lw $a0, 0($sp)
    li $v0, 4
    syscall
    li $t0, 10
    sb $t0, 0($sp)
    sb $zero, 1($sp)
    li $v0, 4
    move $a0, $sp
    syscall
    jr $ra

ord:		#myself
	lb	$v0 0($sp)
	jr $ra

chr: 		#myself
	lb	$v0 0($sp)
	jr $ra

	.data
_L2:
	.asciiz ""
_L0:
	.asciiz "
"
_L1:
	.asciiz "end"
