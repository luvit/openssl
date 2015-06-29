TITLE	../openssl/crypto/bn/asm/bn-586.asm
IF @Version LT 800
ECHO MASM version 8.00 or later is strongly recommended.
ENDIF
.486
.MODEL	FLAT
OPTION	DOTNAME
IF @Version LT 800
.text$	SEGMENT PAGE 'CODE'
ELSE
.text$	SEGMENT ALIGN(64) 'CODE'
ENDIF
ALIGN	16
_bn_mul_add_words	PROC PUBLIC
$L_bn_mul_add_words_begin::
	push	ebp
	push	ebx
	push	esi
	push	edi
	;

	xor	esi,esi
	mov	edi,DWORD PTR 20[esp]
	mov	ecx,DWORD PTR 28[esp]
	mov	ebx,DWORD PTR 24[esp]
	and	ecx,4294967288
	mov	ebp,DWORD PTR 32[esp]
	push	ecx
	jz	$L000maw_finish
ALIGN	16
$L001maw_loop:
	; Round 0
	mov	eax,DWORD PTR [ebx]
	mul	ebp
	add	eax,esi
	adc	edx,0
	add	eax,DWORD PTR [edi]
	adc	edx,0
	mov	DWORD PTR [edi],eax
	mov	esi,edx
	; Round 4
	mov	eax,DWORD PTR 4[ebx]
	mul	ebp
	add	eax,esi
	adc	edx,0
	add	eax,DWORD PTR 4[edi]
	adc	edx,0
	mov	DWORD PTR 4[edi],eax
	mov	esi,edx
	; Round 8
	mov	eax,DWORD PTR 8[ebx]
	mul	ebp
	add	eax,esi
	adc	edx,0
	add	eax,DWORD PTR 8[edi]
	adc	edx,0
	mov	DWORD PTR 8[edi],eax
	mov	esi,edx
	; Round 12
	mov	eax,DWORD PTR 12[ebx]
	mul	ebp
	add	eax,esi
	adc	edx,0
	add	eax,DWORD PTR 12[edi]
	adc	edx,0
	mov	DWORD PTR 12[edi],eax
	mov	esi,edx
	; Round 16
	mov	eax,DWORD PTR 16[ebx]
	mul	ebp
	add	eax,esi
	adc	edx,0
	add	eax,DWORD PTR 16[edi]
	adc	edx,0
	mov	DWORD PTR 16[edi],eax
	mov	esi,edx
	; Round 20
	mov	eax,DWORD PTR 20[ebx]
	mul	ebp
	add	eax,esi
	adc	edx,0
	add	eax,DWORD PTR 20[edi]
	adc	edx,0
	mov	DWORD PTR 20[edi],eax
	mov	esi,edx
	; Round 24
	mov	eax,DWORD PTR 24[ebx]
	mul	ebp
	add	eax,esi
	adc	edx,0
	add	eax,DWORD PTR 24[edi]
	adc	edx,0
	mov	DWORD PTR 24[edi],eax
	mov	esi,edx
	; Round 28
	mov	eax,DWORD PTR 28[ebx]
	mul	ebp
	add	eax,esi
	adc	edx,0
	add	eax,DWORD PTR 28[edi]
	adc	edx,0
	mov	DWORD PTR 28[edi],eax
	mov	esi,edx
	;

	sub	ecx,8
	lea	ebx,DWORD PTR 32[ebx]
	lea	edi,DWORD PTR 32[edi]
	jnz	$L001maw_loop
$L000maw_finish:
	mov	ecx,DWORD PTR 32[esp]
	and	ecx,7
	jnz	$L002maw_finish2
	jmp	$L003maw_end
$L002maw_finish2:
	; Tail Round 0
	mov	eax,DWORD PTR [ebx]
	mul	ebp
	add	eax,esi
	adc	edx,0
	add	eax,DWORD PTR [edi]
	adc	edx,0
	dec	ecx
	mov	DWORD PTR [edi],eax
	mov	esi,edx
	jz	$L003maw_end
	; Tail Round 1
	mov	eax,DWORD PTR 4[ebx]
	mul	ebp
	add	eax,esi
	adc	edx,0
	add	eax,DWORD PTR 4[edi]
	adc	edx,0
	dec	ecx
	mov	DWORD PTR 4[edi],eax
	mov	esi,edx
	jz	$L003maw_end
	; Tail Round 2
	mov	eax,DWORD PTR 8[ebx]
	mul	ebp
	add	eax,esi
	adc	edx,0
	add	eax,DWORD PTR 8[edi]
	adc	edx,0
	dec	ecx
	mov	DWORD PTR 8[edi],eax
	mov	esi,edx
	jz	$L003maw_end
	; Tail Round 3
	mov	eax,DWORD PTR 12[ebx]
	mul	ebp
	add	eax,esi
	adc	edx,0
	add	eax,DWORD PTR 12[edi]
	adc	edx,0
	dec	ecx
	mov	DWORD PTR 12[edi],eax
	mov	esi,edx
	jz	$L003maw_end
	; Tail Round 4
	mov	eax,DWORD PTR 16[ebx]
	mul	ebp
	add	eax,esi
	adc	edx,0
	add	eax,DWORD PTR 16[edi]
	adc	edx,0
	dec	ecx
	mov	DWORD PTR 16[edi],eax
	mov	esi,edx
	jz	$L003maw_end
	; Tail Round 5
	mov	eax,DWORD PTR 20[ebx]
	mul	ebp
	add	eax,esi
	adc	edx,0
	add	eax,DWORD PTR 20[edi]
	adc	edx,0
	dec	ecx
	mov	DWORD PTR 20[edi],eax
	mov	esi,edx
	jz	$L003maw_end
	; Tail Round 6
	mov	eax,DWORD PTR 24[ebx]
	mul	ebp
	add	eax,esi
	adc	edx,0
	add	eax,DWORD PTR 24[edi]
	adc	edx,0
	mov	DWORD PTR 24[edi],eax
	mov	esi,edx
$L003maw_end:
	mov	eax,esi
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	pop	ebp
	ret
_bn_mul_add_words ENDP
ALIGN	16
_bn_mul_words	PROC PUBLIC
$L_bn_mul_words_begin::
	push	ebp
	push	ebx
	push	esi
	push	edi
	;

	xor	esi,esi
	mov	edi,DWORD PTR 20[esp]
	mov	ebx,DWORD PTR 24[esp]
	mov	ebp,DWORD PTR 28[esp]
	mov	ecx,DWORD PTR 32[esp]
	and	ebp,4294967288
	jz	$L004mw_finish
$L005mw_loop:
	; Round 0
	mov	eax,DWORD PTR [ebx]
	mul	ecx
	add	eax,esi
	adc	edx,0
	mov	DWORD PTR [edi],eax
	mov	esi,edx
	; Round 4
	mov	eax,DWORD PTR 4[ebx]
	mul	ecx
	add	eax,esi
	adc	edx,0
	mov	DWORD PTR 4[edi],eax
	mov	esi,edx
	; Round 8
	mov	eax,DWORD PTR 8[ebx]
	mul	ecx
	add	eax,esi
	adc	edx,0
	mov	DWORD PTR 8[edi],eax
	mov	esi,edx
	; Round 12
	mov	eax,DWORD PTR 12[ebx]
	mul	ecx
	add	eax,esi
	adc	edx,0
	mov	DWORD PTR 12[edi],eax
	mov	esi,edx
	; Round 16
	mov	eax,DWORD PTR 16[ebx]
	mul	ecx
	add	eax,esi
	adc	edx,0
	mov	DWORD PTR 16[edi],eax
	mov	esi,edx
	; Round 20
	mov	eax,DWORD PTR 20[ebx]
	mul	ecx
	add	eax,esi
	adc	edx,0
	mov	DWORD PTR 20[edi],eax
	mov	esi,edx
	; Round 24
	mov	eax,DWORD PTR 24[ebx]
	mul	ecx
	add	eax,esi
	adc	edx,0
	mov	DWORD PTR 24[edi],eax
	mov	esi,edx
	; Round 28
	mov	eax,DWORD PTR 28[ebx]
	mul	ecx
	add	eax,esi
	adc	edx,0
	mov	DWORD PTR 28[edi],eax
	mov	esi,edx
	;

	add	ebx,32
	add	edi,32
	sub	ebp,8
	jz	$L004mw_finish
	jmp	$L005mw_loop
$L004mw_finish:
	mov	ebp,DWORD PTR 28[esp]
	and	ebp,7
	jnz	$L006mw_finish2
	jmp	$L007mw_end
$L006mw_finish2:
	; Tail Round 0
	mov	eax,DWORD PTR [ebx]
	mul	ecx
	add	eax,esi
	adc	edx,0
	mov	DWORD PTR [edi],eax
	mov	esi,edx
	dec	ebp
	jz	$L007mw_end
	; Tail Round 1
	mov	eax,DWORD PTR 4[ebx]
	mul	ecx
	add	eax,esi
	adc	edx,0
	mov	DWORD PTR 4[edi],eax
	mov	esi,edx
	dec	ebp
	jz	$L007mw_end
	; Tail Round 2
	mov	eax,DWORD PTR 8[ebx]
	mul	ecx
	add	eax,esi
	adc	edx,0
	mov	DWORD PTR 8[edi],eax
	mov	esi,edx
	dec	ebp
	jz	$L007mw_end
	; Tail Round 3
	mov	eax,DWORD PTR 12[ebx]
	mul	ecx
	add	eax,esi
	adc	edx,0
	mov	DWORD PTR 12[edi],eax
	mov	esi,edx
	dec	ebp
	jz	$L007mw_end
	; Tail Round 4
	mov	eax,DWORD PTR 16[ebx]
	mul	ecx
	add	eax,esi
	adc	edx,0
	mov	DWORD PTR 16[edi],eax
	mov	esi,edx
	dec	ebp
	jz	$L007mw_end
	; Tail Round 5
	mov	eax,DWORD PTR 20[ebx]
	mul	ecx
	add	eax,esi
	adc	edx,0
	mov	DWORD PTR 20[edi],eax
	mov	esi,edx
	dec	ebp
	jz	$L007mw_end
	; Tail Round 6
	mov	eax,DWORD PTR 24[ebx]
	mul	ecx
	add	eax,esi
	adc	edx,0
	mov	DWORD PTR 24[edi],eax
	mov	esi,edx
$L007mw_end:
	mov	eax,esi
	pop	edi
	pop	esi
	pop	ebx
	pop	ebp
	ret
_bn_mul_words ENDP
ALIGN	16
_bn_sqr_words	PROC PUBLIC
$L_bn_sqr_words_begin::
	push	ebp
	push	ebx
	push	esi
	push	edi
	;

	mov	esi,DWORD PTR 20[esp]
	mov	edi,DWORD PTR 24[esp]
	mov	ebx,DWORD PTR 28[esp]
	and	ebx,4294967288
	jz	$L008sw_finish
$L009sw_loop:
	; Round 0
	mov	eax,DWORD PTR [edi]
	mul	eax
	mov	DWORD PTR [esi],eax
	mov	DWORD PTR 4[esi],edx
	; Round 4
	mov	eax,DWORD PTR 4[edi]
	mul	eax
	mov	DWORD PTR 8[esi],eax
	mov	DWORD PTR 12[esi],edx
	; Round 8
	mov	eax,DWORD PTR 8[edi]
	mul	eax
	mov	DWORD PTR 16[esi],eax
	mov	DWORD PTR 20[esi],edx
	; Round 12
	mov	eax,DWORD PTR 12[edi]
	mul	eax
	mov	DWORD PTR 24[esi],eax
	mov	DWORD PTR 28[esi],edx
	; Round 16
	mov	eax,DWORD PTR 16[edi]
	mul	eax
	mov	DWORD PTR 32[esi],eax
	mov	DWORD PTR 36[esi],edx
	; Round 20
	mov	eax,DWORD PTR 20[edi]
	mul	eax
	mov	DWORD PTR 40[esi],eax
	mov	DWORD PTR 44[esi],edx
	; Round 24
	mov	eax,DWORD PTR 24[edi]
	mul	eax
	mov	DWORD PTR 48[esi],eax
	mov	DWORD PTR 52[esi],edx
	; Round 28
	mov	eax,DWORD PTR 28[edi]
	mul	eax
	mov	DWORD PTR 56[esi],eax
	mov	DWORD PTR 60[esi],edx
	;

	add	edi,32
	add	esi,64
	sub	ebx,8
	jnz	$L009sw_loop
$L008sw_finish:
	mov	ebx,DWORD PTR 28[esp]
	and	ebx,7
	jz	$L010sw_end
	; Tail Round 0
	mov	eax,DWORD PTR [edi]
	mul	eax
	mov	DWORD PTR [esi],eax
	dec	ebx
	mov	DWORD PTR 4[esi],edx
	jz	$L010sw_end
	; Tail Round 1
	mov	eax,DWORD PTR 4[edi]
	mul	eax
	mov	DWORD PTR 8[esi],eax
	dec	ebx
	mov	DWORD PTR 12[esi],edx
	jz	$L010sw_end
	; Tail Round 2
	mov	eax,DWORD PTR 8[edi]
	mul	eax
	mov	DWORD PTR 16[esi],eax
	dec	ebx
	mov	DWORD PTR 20[esi],edx
	jz	$L010sw_end
	; Tail Round 3
	mov	eax,DWORD PTR 12[edi]
	mul	eax
	mov	DWORD PTR 24[esi],eax
	dec	ebx
	mov	DWORD PTR 28[esi],edx
	jz	$L010sw_end
	; Tail Round 4
	mov	eax,DWORD PTR 16[edi]
	mul	eax
	mov	DWORD PTR 32[esi],eax
	dec	ebx
	mov	DWORD PTR 36[esi],edx
	jz	$L010sw_end
	; Tail Round 5
	mov	eax,DWORD PTR 20[edi]
	mul	eax
	mov	DWORD PTR 40[esi],eax
	dec	ebx
	mov	DWORD PTR 44[esi],edx
	jz	$L010sw_end
	; Tail Round 6
	mov	eax,DWORD PTR 24[edi]
	mul	eax
	mov	DWORD PTR 48[esi],eax
	mov	DWORD PTR 52[esi],edx
$L010sw_end:
	pop	edi
	pop	esi
	pop	ebx
	pop	ebp
	ret
_bn_sqr_words ENDP
ALIGN	16
_bn_div_words	PROC PUBLIC
$L_bn_div_words_begin::
	mov	edx,DWORD PTR 4[esp]
	mov	eax,DWORD PTR 8[esp]
	mov	ecx,DWORD PTR 12[esp]
	div	ecx
	ret
_bn_div_words ENDP
ALIGN	16
_bn_add_words	PROC PUBLIC
$L_bn_add_words_begin::
	push	ebp
	push	ebx
	push	esi
	push	edi
	;

	mov	ebx,DWORD PTR 20[esp]
	mov	esi,DWORD PTR 24[esp]
	mov	edi,DWORD PTR 28[esp]
	mov	ebp,DWORD PTR 32[esp]
	xor	eax,eax
	and	ebp,4294967288
	jz	$L011aw_finish
$L012aw_loop:
	; Round 0
	mov	ecx,DWORD PTR [esi]
	mov	edx,DWORD PTR [edi]
	add	ecx,eax
	mov	eax,0
	adc	eax,eax
	add	ecx,edx
	adc	eax,0
	mov	DWORD PTR [ebx],ecx
	; Round 1
	mov	ecx,DWORD PTR 4[esi]
	mov	edx,DWORD PTR 4[edi]
	add	ecx,eax
	mov	eax,0
	adc	eax,eax
	add	ecx,edx
	adc	eax,0
	mov	DWORD PTR 4[ebx],ecx
	; Round 2
	mov	ecx,DWORD PTR 8[esi]
	mov	edx,DWORD PTR 8[edi]
	add	ecx,eax
	mov	eax,0
	adc	eax,eax
	add	ecx,edx
	adc	eax,0
	mov	DWORD PTR 8[ebx],ecx
	; Round 3
	mov	ecx,DWORD PTR 12[esi]
	mov	edx,DWORD PTR 12[edi]
	add	ecx,eax
	mov	eax,0
	adc	eax,eax
	add	ecx,edx
	adc	eax,0
	mov	DWORD PTR 12[ebx],ecx
	; Round 4
	mov	ecx,DWORD PTR 16[esi]
	mov	edx,DWORD PTR 16[edi]
	add	ecx,eax
	mov	eax,0
	adc	eax,eax
	add	ecx,edx
	adc	eax,0
	mov	DWORD PTR 16[ebx],ecx
	; Round 5
	mov	ecx,DWORD PTR 20[esi]
	mov	edx,DWORD PTR 20[edi]
	add	ecx,eax
	mov	eax,0
	adc	eax,eax
	add	ecx,edx
	adc	eax,0
	mov	DWORD PTR 20[ebx],ecx
	; Round 6
	mov	ecx,DWORD PTR 24[esi]
	mov	edx,DWORD PTR 24[edi]
	add	ecx,eax
	mov	eax,0
	adc	eax,eax
	add	ecx,edx
	adc	eax,0
	mov	DWORD PTR 24[ebx],ecx
	; Round 7
	mov	ecx,DWORD PTR 28[esi]
	mov	edx,DWORD PTR 28[edi]
	add	ecx,eax
	mov	eax,0
	adc	eax,eax
	add	ecx,edx
	adc	eax,0
	mov	DWORD PTR 28[ebx],ecx
	;

	add	esi,32
	add	edi,32
	add	ebx,32
	sub	ebp,8
	jnz	$L012aw_loop
$L011aw_finish:
	mov	ebp,DWORD PTR 32[esp]
	and	ebp,7
	jz	$L013aw_end
	; Tail Round 0
	mov	ecx,DWORD PTR [esi]
	mov	edx,DWORD PTR [edi]
	add	ecx,eax
	mov	eax,0
	adc	eax,eax
	add	ecx,edx
	adc	eax,0
	dec	ebp
	mov	DWORD PTR [ebx],ecx
	jz	$L013aw_end
	; Tail Round 1
	mov	ecx,DWORD PTR 4[esi]
	mov	edx,DWORD PTR 4[edi]
	add	ecx,eax
	mov	eax,0
	adc	eax,eax
	add	ecx,edx
	adc	eax,0
	dec	ebp
	mov	DWORD PTR 4[ebx],ecx
	jz	$L013aw_end
	; Tail Round 2
	mov	ecx,DWORD PTR 8[esi]
	mov	edx,DWORD PTR 8[edi]
	add	ecx,eax
	mov	eax,0
	adc	eax,eax
	add	ecx,edx
	adc	eax,0
	dec	ebp
	mov	DWORD PTR 8[ebx],ecx
	jz	$L013aw_end
	; Tail Round 3
	mov	ecx,DWORD PTR 12[esi]
	mov	edx,DWORD PTR 12[edi]
	add	ecx,eax
	mov	eax,0
	adc	eax,eax
	add	ecx,edx
	adc	eax,0
	dec	ebp
	mov	DWORD PTR 12[ebx],ecx
	jz	$L013aw_end
	; Tail Round 4
	mov	ecx,DWORD PTR 16[esi]
	mov	edx,DWORD PTR 16[edi]
	add	ecx,eax
	mov	eax,0
	adc	eax,eax
	add	ecx,edx
	adc	eax,0
	dec	ebp
	mov	DWORD PTR 16[ebx],ecx
	jz	$L013aw_end
	; Tail Round 5
	mov	ecx,DWORD PTR 20[esi]
	mov	edx,DWORD PTR 20[edi]
	add	ecx,eax
	mov	eax,0
	adc	eax,eax
	add	ecx,edx
	adc	eax,0
	dec	ebp
	mov	DWORD PTR 20[ebx],ecx
	jz	$L013aw_end
	; Tail Round 6
	mov	ecx,DWORD PTR 24[esi]
	mov	edx,DWORD PTR 24[edi]
	add	ecx,eax
	mov	eax,0
	adc	eax,eax
	add	ecx,edx
	adc	eax,0
	mov	DWORD PTR 24[ebx],ecx
$L013aw_end:
	pop	edi
	pop	esi
	pop	ebx
	pop	ebp
	ret
_bn_add_words ENDP
ALIGN	16
_bn_sub_words	PROC PUBLIC
$L_bn_sub_words_begin::
	push	ebp
	push	ebx
	push	esi
	push	edi
	;

	mov	ebx,DWORD PTR 20[esp]
	mov	esi,DWORD PTR 24[esp]
	mov	edi,DWORD PTR 28[esp]
	mov	ebp,DWORD PTR 32[esp]
	xor	eax,eax
	and	ebp,4294967288
	jz	$L014aw_finish
$L015aw_loop:
	; Round 0
	mov	ecx,DWORD PTR [esi]
	mov	edx,DWORD PTR [edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR [ebx],ecx
	; Round 1
	mov	ecx,DWORD PTR 4[esi]
	mov	edx,DWORD PTR 4[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR 4[ebx],ecx
	; Round 2
	mov	ecx,DWORD PTR 8[esi]
	mov	edx,DWORD PTR 8[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR 8[ebx],ecx
	; Round 3
	mov	ecx,DWORD PTR 12[esi]
	mov	edx,DWORD PTR 12[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR 12[ebx],ecx
	; Round 4
	mov	ecx,DWORD PTR 16[esi]
	mov	edx,DWORD PTR 16[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR 16[ebx],ecx
	; Round 5
	mov	ecx,DWORD PTR 20[esi]
	mov	edx,DWORD PTR 20[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR 20[ebx],ecx
	; Round 6
	mov	ecx,DWORD PTR 24[esi]
	mov	edx,DWORD PTR 24[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR 24[ebx],ecx
	; Round 7
	mov	ecx,DWORD PTR 28[esi]
	mov	edx,DWORD PTR 28[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR 28[ebx],ecx
	;

	add	esi,32
	add	edi,32
	add	ebx,32
	sub	ebp,8
	jnz	$L015aw_loop
$L014aw_finish:
	mov	ebp,DWORD PTR 32[esp]
	and	ebp,7
	jz	$L016aw_end
	; Tail Round 0
	mov	ecx,DWORD PTR [esi]
	mov	edx,DWORD PTR [edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	dec	ebp
	mov	DWORD PTR [ebx],ecx
	jz	$L016aw_end
	; Tail Round 1
	mov	ecx,DWORD PTR 4[esi]
	mov	edx,DWORD PTR 4[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	dec	ebp
	mov	DWORD PTR 4[ebx],ecx
	jz	$L016aw_end
	; Tail Round 2
	mov	ecx,DWORD PTR 8[esi]
	mov	edx,DWORD PTR 8[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	dec	ebp
	mov	DWORD PTR 8[ebx],ecx
	jz	$L016aw_end
	; Tail Round 3
	mov	ecx,DWORD PTR 12[esi]
	mov	edx,DWORD PTR 12[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	dec	ebp
	mov	DWORD PTR 12[ebx],ecx
	jz	$L016aw_end
	; Tail Round 4
	mov	ecx,DWORD PTR 16[esi]
	mov	edx,DWORD PTR 16[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	dec	ebp
	mov	DWORD PTR 16[ebx],ecx
	jz	$L016aw_end
	; Tail Round 5
	mov	ecx,DWORD PTR 20[esi]
	mov	edx,DWORD PTR 20[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	dec	ebp
	mov	DWORD PTR 20[ebx],ecx
	jz	$L016aw_end
	; Tail Round 6
	mov	ecx,DWORD PTR 24[esi]
	mov	edx,DWORD PTR 24[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR 24[ebx],ecx
$L016aw_end:
	pop	edi
	pop	esi
	pop	ebx
	pop	ebp
	ret
_bn_sub_words ENDP
ALIGN	16
_bn_sub_part_words	PROC PUBLIC
$L_bn_sub_part_words_begin::
	push	ebp
	push	ebx
	push	esi
	push	edi
	;

	mov	ebx,DWORD PTR 20[esp]
	mov	esi,DWORD PTR 24[esp]
	mov	edi,DWORD PTR 28[esp]
	mov	ebp,DWORD PTR 32[esp]
	xor	eax,eax
	and	ebp,4294967288
	jz	$L017aw_finish
$L018aw_loop:
	; Round 0
	mov	ecx,DWORD PTR [esi]
	mov	edx,DWORD PTR [edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR [ebx],ecx
	; Round 1
	mov	ecx,DWORD PTR 4[esi]
	mov	edx,DWORD PTR 4[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR 4[ebx],ecx
	; Round 2
	mov	ecx,DWORD PTR 8[esi]
	mov	edx,DWORD PTR 8[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR 8[ebx],ecx
	; Round 3
	mov	ecx,DWORD PTR 12[esi]
	mov	edx,DWORD PTR 12[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR 12[ebx],ecx
	; Round 4
	mov	ecx,DWORD PTR 16[esi]
	mov	edx,DWORD PTR 16[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR 16[ebx],ecx
	; Round 5
	mov	ecx,DWORD PTR 20[esi]
	mov	edx,DWORD PTR 20[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR 20[ebx],ecx
	; Round 6
	mov	ecx,DWORD PTR 24[esi]
	mov	edx,DWORD PTR 24[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR 24[ebx],ecx
	; Round 7
	mov	ecx,DWORD PTR 28[esi]
	mov	edx,DWORD PTR 28[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR 28[ebx],ecx
	;

	add	esi,32
	add	edi,32
	add	ebx,32
	sub	ebp,8
	jnz	$L018aw_loop
$L017aw_finish:
	mov	ebp,DWORD PTR 32[esp]
	and	ebp,7
	jz	$L019aw_end
	; Tail Round 0
	mov	ecx,DWORD PTR [esi]
	mov	edx,DWORD PTR [edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR [ebx],ecx
	add	esi,4
	add	edi,4
	add	ebx,4
	dec	ebp
	jz	$L019aw_end
	; Tail Round 1
	mov	ecx,DWORD PTR [esi]
	mov	edx,DWORD PTR [edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR [ebx],ecx
	add	esi,4
	add	edi,4
	add	ebx,4
	dec	ebp
	jz	$L019aw_end
	; Tail Round 2
	mov	ecx,DWORD PTR [esi]
	mov	edx,DWORD PTR [edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR [ebx],ecx
	add	esi,4
	add	edi,4
	add	ebx,4
	dec	ebp
	jz	$L019aw_end
	; Tail Round 3
	mov	ecx,DWORD PTR [esi]
	mov	edx,DWORD PTR [edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR [ebx],ecx
	add	esi,4
	add	edi,4
	add	ebx,4
	dec	ebp
	jz	$L019aw_end
	; Tail Round 4
	mov	ecx,DWORD PTR [esi]
	mov	edx,DWORD PTR [edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR [ebx],ecx
	add	esi,4
	add	edi,4
	add	ebx,4
	dec	ebp
	jz	$L019aw_end
	; Tail Round 5
	mov	ecx,DWORD PTR [esi]
	mov	edx,DWORD PTR [edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR [ebx],ecx
	add	esi,4
	add	edi,4
	add	ebx,4
	dec	ebp
	jz	$L019aw_end
	; Tail Round 6
	mov	ecx,DWORD PTR [esi]
	mov	edx,DWORD PTR [edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR [ebx],ecx
	add	esi,4
	add	edi,4
	add	ebx,4
$L019aw_end:
	cmp	DWORD PTR 36[esp],0
	je	$L020pw_end
	mov	ebp,DWORD PTR 36[esp]
	cmp	ebp,0
	je	$L020pw_end
	jge	$L021pw_pos
	; pw_neg
	mov	edx,0
	sub	edx,ebp
	mov	ebp,edx
	and	ebp,4294967288
	jz	$L022pw_neg_finish
$L023pw_neg_loop:
	; dl<0 Round 0
	mov	ecx,0
	mov	edx,DWORD PTR [edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR [ebx],ecx
	; dl<0 Round 1
	mov	ecx,0
	mov	edx,DWORD PTR 4[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR 4[ebx],ecx
	; dl<0 Round 2
	mov	ecx,0
	mov	edx,DWORD PTR 8[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR 8[ebx],ecx
	; dl<0 Round 3
	mov	ecx,0
	mov	edx,DWORD PTR 12[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR 12[ebx],ecx
	; dl<0 Round 4
	mov	ecx,0
	mov	edx,DWORD PTR 16[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR 16[ebx],ecx
	; dl<0 Round 5
	mov	ecx,0
	mov	edx,DWORD PTR 20[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR 20[ebx],ecx
	; dl<0 Round 6
	mov	ecx,0
	mov	edx,DWORD PTR 24[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR 24[ebx],ecx
	; dl<0 Round 7
	mov	ecx,0
	mov	edx,DWORD PTR 28[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR 28[ebx],ecx
	;

	add	edi,32
	add	ebx,32
	sub	ebp,8
	jnz	$L023pw_neg_loop
$L022pw_neg_finish:
	mov	edx,DWORD PTR 36[esp]
	mov	ebp,0
	sub	ebp,edx
	and	ebp,7
	jz	$L020pw_end
	; dl<0 Tail Round 0
	mov	ecx,0
	mov	edx,DWORD PTR [edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	dec	ebp
	mov	DWORD PTR [ebx],ecx
	jz	$L020pw_end
	; dl<0 Tail Round 1
	mov	ecx,0
	mov	edx,DWORD PTR 4[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	dec	ebp
	mov	DWORD PTR 4[ebx],ecx
	jz	$L020pw_end
	; dl<0 Tail Round 2
	mov	ecx,0
	mov	edx,DWORD PTR 8[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	dec	ebp
	mov	DWORD PTR 8[ebx],ecx
	jz	$L020pw_end
	; dl<0 Tail Round 3
	mov	ecx,0
	mov	edx,DWORD PTR 12[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	dec	ebp
	mov	DWORD PTR 12[ebx],ecx
	jz	$L020pw_end
	; dl<0 Tail Round 4
	mov	ecx,0
	mov	edx,DWORD PTR 16[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	dec	ebp
	mov	DWORD PTR 16[ebx],ecx
	jz	$L020pw_end
	; dl<0 Tail Round 5
	mov	ecx,0
	mov	edx,DWORD PTR 20[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	dec	ebp
	mov	DWORD PTR 20[ebx],ecx
	jz	$L020pw_end
	; dl<0 Tail Round 6
	mov	ecx,0
	mov	edx,DWORD PTR 24[edi]
	sub	ecx,eax
	mov	eax,0
	adc	eax,eax
	sub	ecx,edx
	adc	eax,0
	mov	DWORD PTR 24[ebx],ecx
	jmp	$L020pw_end
$L021pw_pos:
	and	ebp,4294967288
	jz	$L024pw_pos_finish
$L025pw_pos_loop:
	; dl>0 Round 0
	mov	ecx,DWORD PTR [esi]
	sub	ecx,eax
	mov	DWORD PTR [ebx],ecx
	jnc	$L026pw_nc0
	; dl>0 Round 1
	mov	ecx,DWORD PTR 4[esi]
	sub	ecx,eax
	mov	DWORD PTR 4[ebx],ecx
	jnc	$L027pw_nc1
	; dl>0 Round 2
	mov	ecx,DWORD PTR 8[esi]
	sub	ecx,eax
	mov	DWORD PTR 8[ebx],ecx
	jnc	$L028pw_nc2
	; dl>0 Round 3
	mov	ecx,DWORD PTR 12[esi]
	sub	ecx,eax
	mov	DWORD PTR 12[ebx],ecx
	jnc	$L029pw_nc3
	; dl>0 Round 4
	mov	ecx,DWORD PTR 16[esi]
	sub	ecx,eax
	mov	DWORD PTR 16[ebx],ecx
	jnc	$L030pw_nc4
	; dl>0 Round 5
	mov	ecx,DWORD PTR 20[esi]
	sub	ecx,eax
	mov	DWORD PTR 20[ebx],ecx
	jnc	$L031pw_nc5
	; dl>0 Round 6
	mov	ecx,DWORD PTR 24[esi]
	sub	ecx,eax
	mov	DWORD PTR 24[ebx],ecx
	jnc	$L032pw_nc6
	; dl>0 Round 7
	mov	ecx,DWORD PTR 28[esi]
	sub	ecx,eax
	mov	DWORD PTR 28[ebx],ecx
	jnc	$L033pw_nc7
	;

	add	esi,32
	add	ebx,32
	sub	ebp,8
	jnz	$L025pw_pos_loop
$L024pw_pos_finish:
	mov	ebp,DWORD PTR 36[esp]
	and	ebp,7
	jz	$L020pw_end
	; dl>0 Tail Round 0
	mov	ecx,DWORD PTR [esi]
	sub	ecx,eax
	mov	DWORD PTR [ebx],ecx
	jnc	$L034pw_tail_nc0
	dec	ebp
	jz	$L020pw_end
	; dl>0 Tail Round 1
	mov	ecx,DWORD PTR 4[esi]
	sub	ecx,eax
	mov	DWORD PTR 4[ebx],ecx
	jnc	$L035pw_tail_nc1
	dec	ebp
	jz	$L020pw_end
	; dl>0 Tail Round 2
	mov	ecx,DWORD PTR 8[esi]
	sub	ecx,eax
	mov	DWORD PTR 8[ebx],ecx
	jnc	$L036pw_tail_nc2
	dec	ebp
	jz	$L020pw_end
	; dl>0 Tail Round 3
	mov	ecx,DWORD PTR 12[esi]
	sub	ecx,eax
	mov	DWORD PTR 12[ebx],ecx
	jnc	$L037pw_tail_nc3
	dec	ebp
	jz	$L020pw_end
	; dl>0 Tail Round 4
	mov	ecx,DWORD PTR 16[esi]
	sub	ecx,eax
	mov	DWORD PTR 16[ebx],ecx
	jnc	$L038pw_tail_nc4
	dec	ebp
	jz	$L020pw_end
	; dl>0 Tail Round 5
	mov	ecx,DWORD PTR 20[esi]
	sub	ecx,eax
	mov	DWORD PTR 20[ebx],ecx
	jnc	$L039pw_tail_nc5
	dec	ebp
	jz	$L020pw_end
	; dl>0 Tail Round 6
	mov	ecx,DWORD PTR 24[esi]
	sub	ecx,eax
	mov	DWORD PTR 24[ebx],ecx
	jnc	$L040pw_tail_nc6
	mov	eax,1
	jmp	$L020pw_end
$L041pw_nc_loop:
	mov	ecx,DWORD PTR [esi]
	mov	DWORD PTR [ebx],ecx
$L026pw_nc0:
	mov	ecx,DWORD PTR 4[esi]
	mov	DWORD PTR 4[ebx],ecx
$L027pw_nc1:
	mov	ecx,DWORD PTR 8[esi]
	mov	DWORD PTR 8[ebx],ecx
$L028pw_nc2:
	mov	ecx,DWORD PTR 12[esi]
	mov	DWORD PTR 12[ebx],ecx
$L029pw_nc3:
	mov	ecx,DWORD PTR 16[esi]
	mov	DWORD PTR 16[ebx],ecx
$L030pw_nc4:
	mov	ecx,DWORD PTR 20[esi]
	mov	DWORD PTR 20[ebx],ecx
$L031pw_nc5:
	mov	ecx,DWORD PTR 24[esi]
	mov	DWORD PTR 24[ebx],ecx
$L032pw_nc6:
	mov	ecx,DWORD PTR 28[esi]
	mov	DWORD PTR 28[ebx],ecx
$L033pw_nc7:
	;

	add	esi,32
	add	ebx,32
	sub	ebp,8
	jnz	$L041pw_nc_loop
	mov	ebp,DWORD PTR 36[esp]
	and	ebp,7
	jz	$L042pw_nc_end
	mov	ecx,DWORD PTR [esi]
	mov	DWORD PTR [ebx],ecx
$L034pw_tail_nc0:
	dec	ebp
	jz	$L042pw_nc_end
	mov	ecx,DWORD PTR 4[esi]
	mov	DWORD PTR 4[ebx],ecx
$L035pw_tail_nc1:
	dec	ebp
	jz	$L042pw_nc_end
	mov	ecx,DWORD PTR 8[esi]
	mov	DWORD PTR 8[ebx],ecx
$L036pw_tail_nc2:
	dec	ebp
	jz	$L042pw_nc_end
	mov	ecx,DWORD PTR 12[esi]
	mov	DWORD PTR 12[ebx],ecx
$L037pw_tail_nc3:
	dec	ebp
	jz	$L042pw_nc_end
	mov	ecx,DWORD PTR 16[esi]
	mov	DWORD PTR 16[ebx],ecx
$L038pw_tail_nc4:
	dec	ebp
	jz	$L042pw_nc_end
	mov	ecx,DWORD PTR 20[esi]
	mov	DWORD PTR 20[ebx],ecx
$L039pw_tail_nc5:
	dec	ebp
	jz	$L042pw_nc_end
	mov	ecx,DWORD PTR 24[esi]
	mov	DWORD PTR 24[ebx],ecx
$L040pw_tail_nc6:
$L042pw_nc_end:
	mov	eax,0
$L020pw_end:
	pop	edi
	pop	esi
	pop	ebx
	pop	ebp
	ret
_bn_sub_part_words ENDP
.text$	ENDS
END
