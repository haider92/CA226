.data
	result:	.word 0
.text
main:
	daddi r1,r0,1	; First Number
	daddi r2,r0,1	; Second Number
	daddi r3,r0,18	; Counter 
	daddi r4,r0,1	; Increment By
	
	loop:
		dadd r5,r1,r2
		movz r1,r2,r0
		movz r2,r5,r0
		dsub r3,r3,r4
	bnez r3,loop

	sd r5,result(r0)
	
	halt