;;;-----------------------------------------
;;; Start MC68HC12 gcc assembly output
;;; gcc compiler 3.3.6-m68hc1x-20060122
;;; Command:	C:\gcc-hcs12\usr\bin\..\lib\gcc-lib\m6811-elf\3.3.6-m68hc1x-20060122\cc1.exe -quiet -I./include -iprefix C:\gcc-hcs12\usr\bin/../lib/gcc-lib/m6811-elf\3.3.6-m68hc1x-20060122\ -D__GNUC__=3 -D__GNUC_MINOR__=3 -D__GNUC_PATCHLEVEL__=6 -D__mc68hc1x__ -D__mc68hc1x -D__HAVE_SHORT_INT__ -D__INT__=16 -Dmc6812 -DMC6812 -Dmc68hc12 main.c -quiet -dumpbase main.c -m68hc12 -mshort -auxbase main -O2 -std=c99 -fno-ident -fno-common -fomit-frame-pointer -o main.s
;;; Compiled:	Thu Feb 10 22:31:41 2022
;;; (META)compiled by GNU C version 3.3.2.
;;;-----------------------------------------
	.file	"main.c"
	.mode mshort
	.globl	segment_decoder
	.sect	.data
	.type	segment_decoder, @object
	.size	segment_decoder, 36
segment_decoder:
	.word	63
	.word	6
	.word	91
	.word	79
	.word	102
	.word	109
	.word	125
	.word	7
	.word	127
	.word	111
	.word	119
	.word	124
	.word	57
	.word	94
	.word	121
	.word	113
	.word	61
	.word	118
	.local	index_on_7segment_LEDs.0
	.comm	index_on_7segment_LEDs.0,2,1
	.local	number.1
	.comm	number.1,2,1
	.sect	.text
	.globl	main
	.type	main,@function
main:
	movb	#-1,3
	bset	602, #15
	ldy	index_on_7segment_LEDs.0
	stx	_.xy
	ldx	number.1
	stx	_.z
	ldx	_.xy
.L17:
	ldx	#3
	pshy
	xgdx
	subd	2,sp+
	xgdx
	ldd	#1
	bsr	___lshlhi3
	comb
	stab	600
	ldd	_.z
	asld
	tfr	d,x
	ldab	segment_decoder+1,x
	xgdx
	xgdx
	stab	1
	xgdx
	iny
	ldx	_.z
	inx
	stx	_.z
	cpy	#3
	ble	.L5
	ldy	#0
.L5:
	ldd	_.z
	cpd	#15
	ble	.L6
	clr	_.z
	clr	_.z+1
.L6:
	ldx	#0
.L16:
	ldd	#-536
.L23:
; Begin inline assembler code
#APP
	nop
; End of inline assembler code
#NO_APP
	dbne	d,.L23
	inx
	cpx	#99
	bls	.L16
	bra	.L17
	.size	main, .-main
