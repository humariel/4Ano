.data
values:	.word 1,2,3,4,5,6,7,8,9,10 	;values to be added
nelem:	.word 10 			;array size
sum:	.space 4 			;sum of the array elements
	.text
	.global main

main: 
	lw 	r1, nelem	; nelem = 10 
	and	r3, r3, r0	; i = 0
	subi	r2, r1, 1	; nelem-1

fori:	slt 	r10, r3, r2
	beqz	r10, endi	; i < nelem-1
	
	addi 	r4, r3, 1	; j = i+1
	slli	r3, r3, 2	;multiplicar i por 4 para calcular o endereço
	addi	r6, r3, values	; calculo de add(values[i])

forj:	slt	r10, r4, r1
	beqz	r10, endj	; j < nelem
	lw	r7, 0(r6)	; values[i]
	slli	r4, r4, 2
	addi	r8, r4, values	; calculo de add(values[j])
	lw	r9, 0(r8)	; values[j]
	nop
	
if:	slt	r10, r7, r9
	beqz	r10, endif	; values[i] < values[j]


	add	r5, r0, r7	; tmp = values[i]
	sw	(r6), r9  	; values[i] = values[j]
	sw	(r8), r5	; values[j] = tmp
endif:
	srli	r4, r4, 2	;dividir j por 4
	addi	r4, r4, 1	; j++
	j 	forj
	nop
	nop
endj:	
	srli	r3, r3, 2	; dividir i por 4
	addi	r3, r3, 1	; i++
	j	fori
	nop
	nop
endi: 
      	trap 0
