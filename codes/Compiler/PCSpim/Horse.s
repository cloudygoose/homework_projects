########################################
############### CODE GEN ###############
########################################
	.data
	.align 2
	.globl args
args:	.space 12
	.align 2
	.globl disp
disp:	.space 8
	.align 2
gc_sp_limit:
	.word 0
	.align 2
L19:
	.asciiz "no solution!"
	.align 2
	.text
	.align 2
	.globl main
main:
	sw $sp, gc_sp_limit
	addiu $sp, $sp, -648
	move $fp, $sp # use $fp to hold top level display
	la $gp, disp
	la $v1, args
	sw $ra, 644($sp)
	lw $ra, 0($gp)
	sw $ra, 640($sp)
	sw $sp, 0($gp)
	sw $s0, 600($sp)
	sw $t7, 596($sp)
	sw $t6, 592($sp)
	sw $t5, 588($sp)
	sw $t4, 584($sp)
	sw $t3, 580($sp)
	sw $t2, 576($sp)
	sw $t1, 572($sp)
	sw $t0, 568($sp)
	li $t0, 100
	sw $t0, 0($fp) #optRTLD
	lw $t0, 0($fp) #optRTLD
	sll $t1, $t0, 2 #optSR
	move $a0, $t1
	jal malloc
	move $t2, $v0
	move $t0, $t2
	addu $t1, $t1, $t2
L0:
	bge $t0, $t1, L1
	li $t3, -1
	lw $t5, 0($fp) #optRTLD
	move $t6, $t5
	move $t4, $t3
	move $a0, $t6
	move $a1, $t4
	jal initArray
	move $t5, $v0
	sw $t5, 0($t0)
	addiu $t0, $t0, 4 #I
	j L0
L1:
	sw $t2, 60($fp) #optRTLD
	lw $t0, 0($fp) #optRTLD
	lw $t1, 0($fp) #optRTLD
	mul $t3, $t0, $t1
	move $t2, $t3
	move $t0, $zero # MoveI
	move $a0, $t2
	move $a1, $t0
	jal initArray
	move $t1, $v0
	sw $t1, 100($fp) #optRTLD
	lw $t1, 0($fp) #optRTLD
	lw $t0, 0($fp) #optRTLD
	mul $t3, $t1, $t0
	move $t2, $t3
	move $t0, $zero # MoveI
	move $a0, $t2
	move $a1, $t0
	jal initArray
	move $t1, $v0
	sw $t1, 140($fp) #optRTLD
	move $t0, $zero # MoveI
	move $t1, $fp # top level display
	sw $zero, 152($t1) # StoreZ
	move $t2, $zero # MoveI
	move $t1, $zero # MoveI
	lw $t4, 0($fp) #optRTLD
	subu $t5, $t4, 1 #I
	sw $t5, 180($fp) #optRTLD
	lw $t3, 0($fp) #optRTLD
	subu $t5, $t3, 1 #I
	sw $t5, 200($fp) #optRTLD
	move $t3, $zero # MoveI
	move $t4, $zero # MoveI
	move $t5, $fp # top level display
	sw $zero, 216($t5) # StoreZ
	move $t6, $fp # top level display
	sw $zero, 224($t6) # StoreZ
	lw $t6, 100($fp) #optRTLD
	lw $t7, 0($t6) # loadsubscriptConst
	seq $t5, $t7, $t2
	lw $t5, 100($fp) #optRTLD
	lw $t7, 0($t5) # loadsubscriptConst
	seq $t6, $t7, $t1
	lw $t6, 60($fp) #optRTLD
	sll $t7, $t2, 2 #optSR
	addu $t5, $t6, $t7 # subscriptPLUS
	lw $s0, 0($t5) # loadsubscript
	sll $t6, $t1, 2 #optSR
	addu $t5, $s0, $t6 # assignSubscriptPLUS
	sw $zero, 0($t5) # StoreZ
	lw $t5, 60($fp) #optRTLD
	sll $t7, $t2, 2 #optSR
	addu $t6, $t5, $t7 # subscriptPLUS
	lw $t2, 0($t6) # loadsubscript
	sll $t5, $t1, 2 #optSR
	addu $t6, $t2, $t5 # subscriptPLUS
	lw $t1, 0($t6) # loadsubscript
	move $a0, $t1
	jal printi
L14:
	lw $t2, 152($fp) #optRTLD
	bgt $t0, $t2, L15
	lw $t2, 100($fp) #optRTLD
	sll $t5, $t0, 2 #optSR
	addu $t1, $t2, $t5 # subscriptPLUS
	lw $t6, 0($t1) # loadsubscript
	move $t3, $t6
	lw $t2, 140($fp) #optRTLD
	sll $t5, $t0, 2 #optSR
	addu $t1, $t2, $t5 # subscriptPLUS
	lw $t6, 0($t1) # loadsubscript
	move $t4, $t6
	lw $t2, 60($fp) #optRTLD
	sll $t5, $t3, 2 #optSR
	addu $t1, $t2, $t5 # subscriptPLUS
	lw $t6, 0($t1) # loadsubscript
	sll $t2, $t4, 2 #optSR
	addu $t1, $t6, $t2 # subscriptPLUS
	lw $t5, 0($t1) # loadsubscript
	sw $t5, 216($fp) #optRTLD
	lw $t2, 216($fp) #optRTLD
	move $a0, $t2
	jal printi
	subu $t1, $t3, 1 #I
	subu $t2, $t4, 2 #I
	move $a0, $t1
	move $a1, $t2
	jal L3_addList
	subu $t5, $t3, 1 #I
	addiu $t1, $t4, 2 #I
	move $a0, $t5
	move $a1, $t1
	jal L3_addList
	addiu $t2, $t3, 1 #I
	subu $t1, $t4, 2 #I
	move $a0, $t2
	move $a1, $t1
	jal L3_addList
	addiu $t5, $t3, 1 #I
	addiu $t1, $t4, 2 #I
	move $a0, $t5
	move $a1, $t1
	jal L3_addList
	subu $t2, $t3, 2 #I
	subu $t1, $t4, 1 #I
	move $a0, $t2
	move $a1, $t1
	jal L3_addList
	subu $t5, $t3, 2 #I
	addiu $t1, $t4, 1 #I
	move $a0, $t5
	move $a1, $t1
	jal L3_addList
	addiu $t2, $t3, 2 #I
	subu $t1, $t4, 1 #I
	move $a0, $t2
	move $a1, $t1
	jal L3_addList
	addiu $t5, $t3, 2 #I
	addiu $t1, $t4, 1 #I
	move $a0, $t5
	move $a1, $t1
	jal L3_addList
	lw $t1, 224($fp) #optRTLD
	bne $t1, 1, L16
	j L15
L16:
	addiu $t1, $t0, 1 #I
	move $t0, $t1
	j L14
L15:
	lw $t1, 224($fp) #optRTLD
	bne $t1, 1, L18
	lw $t1, 60($fp) #optRTLD
	lw $t0, 180($fp) #optRTLD
	sll $t3, $t0, 2 #optSR
	addu $t2, $t1, $t3 # subscriptPLUS
	lw $t0, 0($t2) # loadsubscript
	lw $t2, 200($fp) #optRTLD
	sll $t3, $t2, 2 #optSR
	addu $t1, $t0, $t3 # subscriptPLUS
	lw $t2, 0($t1) # loadsubscript
	move $a0, $t2
	jal printi
	j L17
L18:
	la $t0, L19
	move $a0, $t0
	jal print
L17:
	lw $s0, 600($sp)
	lw $t7, 596($sp)
	lw $t6, 592($sp)
	lw $t5, 588($sp)
	lw $t4, 584($sp)
	lw $t3, 580($sp)
	lw $t2, 576($sp)
	lw $t1, 572($sp)
	lw $t0, 568($sp)
	lw $ra, 640($sp)
	sw $ra, 0($gp)
	lw $ra, 644($sp)
	addiu $sp, $sp, 648
	jr $ra
L2_check:
	addiu $sp, $sp, -104
	sw $ra, 100($sp)
	lw $ra, 4($gp)
	sw $ra, 96($sp)
	sw $sp, 4($gp)
	sw $t2, 32($sp)
	sw $t1, 28($sp)
	sw $t0, 24($sp)
	move $t0, $a0
	lw $t2, 0($fp) #optRTLD
	bge $t0, $t2, L5
	sge $t1, $t0, 0 #I
	move $t2, $t1
	j L4
L5:
	move $t2, $zero # MoveI
L4:
	move $v0, $t2
	lw $t2, 32($sp)
	lw $t1, 28($sp)
	lw $t0, 24($sp)
	lw $ra, 96($sp)
	sw $ra, 4($gp)
	lw $ra, 100($sp)
	addiu $sp, $sp, 104
	jr $ra
L3_addList:
	addiu $sp, $sp, -292
	sw $ra, 288($sp)
	lw $ra, 4($gp)
	sw $ra, 284($sp)
	sw $sp, 4($gp)
	sw $t6, 236($sp)
	sw $t5, 232($sp)
	sw $t4, 228($sp)
	sw $t3, 224($sp)
	sw $t2, 220($sp)
	sw $t1, 216($sp)
	sw $t0, 212($sp)
	move $t1, $a0
	move $t0, $a1
	move $a0, $t1
	jal L2_check
	move $t2, $v0
	bne $t2, 1, L10
	move $a0, $t0
	jal L2_check
	move $t3, $v0
	seq $t2, $t3, 1 #I
	move $t4, $t2
	j L9
L10:
	move $t4, $zero # MoveI
L9:
	beqz $t4, L8
	li $t2, -1
	lw $t4, 60($fp) #optRTLD
	sll $t5, $t1, 2 #optSR
	addu $t3, $t4, $t5 # subscriptPLUS
	lw $t6, 0($t3) # loadsubscript
	sll $t4, $t0, 2 #optSR
	addu $t3, $t6, $t4 # subscriptPLUS
	lw $t5, 0($t3) # loadsubscript
	seq $t4, $t5, $t2
	move $t3, $t4
	j L7
L8:
	move $t3, $zero # MoveI
L7:
	beqz $t3, L11
	lw $t3, 152($fp) #optRTLD
	addiu $t4, $t3, 1 #I
	sw $t4, 152($fp) #optRTLD
	lw $t2, 100($fp) #optRTLD
	lw $t3, 152($fp) #optRTLD
	sll $t5, $t3, 2 #optSR
	addu $t4, $t2, $t5 # assignSubscriptPLUS
	sw $t1, 0($t4) # []=
	lw $t3, 140($fp) #optRTLD
	lw $t2, 152($fp) #optRTLD
	sll $t5, $t2, 2 #optSR
	addu $t4, $t3, $t5 # assignSubscriptPLUS
	sw $t0, 0($t4) # []=
	lw $t3, 216($fp) #optRTLD
	addiu $t4, $t3, 1 #I
	lw $t3, 60($fp) #optRTLD
	sll $t5, $t1, 2 #optSR
	addu $t2, $t3, $t5 # subscriptPLUS
	lw $t6, 0($t2) # loadsubscript
	sll $t3, $t0, 2 #optSR
	addu $t2, $t6, $t3 # assignSubscriptPLUS
	sw $t4, 0($t2) # []=
	lw $t2, 180($fp) #optRTLD
	bne $t1, $t2, L13
	lw $t1, 200($fp) #optRTLD
	seq $t2, $t0, $t1
	move $t3, $t2
	j L12
L13:
	move $t3, $zero # MoveI
L12:
	beqz $t3, L11
	li $t0, 1
	sw $t0, 224($fp) #optRTLD
L11:
	lw $t6, 236($sp)
	lw $t5, 232($sp)
	lw $t4, 228($sp)
	lw $t3, 224($sp)
	lw $t2, 220($sp)
	lw $t1, 216($sp)
	lw $t0, 212($sp)
	lw $ra, 284($sp)
	sw $ra, 4($gp)
	lw $ra, 288($sp)
	addiu $sp, $sp, 292
	jr $ra
########################################
############### RUN-TIME ###############
########################################
	.text
	.align 2

flush:
	jr $ra

malloc:
	# a0 -- size in bytes (already x4)
	li $v0, 9
	syscall
	jr $ra

initArray:
	# a0 -- size
	# a1 -- init
	sll $a0, $a0, 2
	li $v0, 9
	syscall
	move $a3, $v0
	add $a0, $a0, $v0
_initArray_loop:
	sw $a1, 0($a3)
	add $a3, $a3, 4
	bne $a3, $a0, _initArray_loop
	jr $ra

allocRecord:
	# a0 -- size
	li $v0, 9
	syscall
	move $v1, $v0
	add $a0, $a0, $v0
_allocRecord_loop:
	sw $zero, 0($v1)
	add $v1, $v1, 4
	bne $v1, $a0, _allocRecord_loop
	jr $ra

print:
	# a0 -- str
	li $v0, 4
	syscall
	jr $ra

printi:
	# a0 -- num
	li $v0, 1
	syscall
	jr $ra

size:
	# a0 -- str
	# v0 -- size of str
	move $v0, $zero
_size_loop:
	lb $a1, 0($a0)
	beq $a1, $zero, _size_done
	add $v0, $v0, 1
	add $a0, $a0, 1
	j _size_loop
_size_done:
	jr $ra

substring:
	# a0 -- str
	# a1 -- first
	# a2 -- length
	# v0 -- new string
	add $a1, $a1, $a0  # start pos
	add $a0, $a2, 1    # length + '\0'
	li $v0, 9          # sbrk
	syscall            # substring in $v0
	add $a2, $a2, $a1  # end pos
	move $a0, $v0      # pointer in $a0
_substring_loop:
	beq $a1, $a2, _substring_done
	lb $a3, 0($a1)     # load byte
	sb $a3, 0($a0)     # store byte
	add $a1, $a1, 1    # start_pos++
	add $a0, $a0, 1    # pointer++
	j _substring_loop  # continue
_substring_done:
	sb $zero, 0($a0)   # store '\0'
	jr $ra             # return

concat:
	# a0 -- s1
	# a1 -- s2
	# v0 -- new string
	move $a2, $a0
	# a2 -- s1
	move $a0, $zero
_size_loop_s1:
	lb $a3, 0($a2)
	beq $a3, $zero, _size_done_s1
	add $a2, $a2, 1
	add $a0, $a0, 1
	j _size_loop_s1
_size_done_s1:
	# a0 -- size of s1
	subu $a2, $a2, $a0  # restore s1
	move $v0, $zero
_size_loop_s2:
	lb $a3, 0($a1)
	beq $a3, $zero, _size_done_s2
	add $a1, $a1, 1
	add $v0, $v0, 1
	j _size_loop_s2
_size_done_s2:
	# v0 -- size of s2
	subu $a1, $a1, $v0  # restore s2
	add $a0, $a0, $v0   # size of s1+s2
	add $a0, $a0, 1     # + '\0'
	li $v0, 9           # sbrk
	syscall             # new string in $v0
	move $a0, $v0       # pointer in $a0
_copy_s1:
	lb $a3, 0($a2)
	beq $a3, $zero, _copy_s2
	sb $a3, 0($a0)
	add $a0, $a0, 1
	add $a2, $a2, 1
	j _copy_s1
_copy_s2:
	lb $a3, 0($a1)
	beq $a3, $zero, _copy_done
	sb $a3, 0($a0)
	add $a0, $a0, 1
	add $a1, $a1, 1
	j _copy_s2
_copy_done:
	sb $zero, 0($a0)
	jr $ra

getchar:
	li $a0, 2
	li $v0, 9
	syscall
	move $a0, $v0
	li $a1, 2
	li $v0, 8
	syscall
	move $v0, $a0
	jr $ra

ord:
	lb $v0, 0($a0)
	bnez $v0, _ord_done
	li $v0, -1
_ord_done:
	jr $ra

chr:
	move $a1, $a0
	li $a0, 2
	li $v0, 9
	syscall
	sb $a1, 0($v0)
	sb $zero, 1($v0)
	jr $ra

strcmp:
	# a0 -- s1
	# a1 -- s2
_strcmp_loop:
	lb $a2, 0($a0)
	lb $a3, 0($a1)
	beq $a2, $zero, _strcmp_done
	beq $a3, $zero, _strcmp_done
	blt $a2, $a3, _strcmp_lt
	bgt $a2, $a3, _strcmp_gt
	add $a0, $a0, 1
	add $a1, $a1, 1
	j _strcmp_loop
_strcmp_done:
	bne $a2, $zero, _strcmp_gt
	bne $a3 $zero, _strcmp_lt
	li $v0, 0
	jr $ra
_strcmp_lt:
	li $v0, -1
	jr $ra
_strcmp_gt:
	li $v0, 1
	jr $ra

not_:
	# a0 -- num
	seq $v0, $a0, 0
	jr $ra

exit:
	li $v0, 10
	syscall
	jr $ra

