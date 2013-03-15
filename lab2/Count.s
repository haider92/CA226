.data
	limit:		.word 100
	control:	.word 0x10000
	data:		.word 0x10008
.text

main:
	ld r1,limit(r0)
	daddi r2,r0,0
	
	lwu r3,control(r0)
	lwu r4,data(r0)
	daddi r5,r0,1
	
	loop:
		daddi r2,r2,1
		sd r2,(r4)
		sd r5,(r3)
	bne r1,r2,loop

halt