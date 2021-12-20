	.file	"core.cpp"
	.text
	.section	.text$_Z6printfPKcz,"x"
	.linkonce discard
	.p2align 4,,15
	.globl	_Z6printfPKcz
	.def	_Z6printfPKcz;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z6printfPKcz
_Z6printfPKcz:
.LFB51:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	leaq	88(%rsp), %rbx
	movq	%rcx, %rsi
	movq	%rdx, 88(%rsp)
	movl	$1, %ecx
	movq	%r8, 96(%rsp)
	movq	%r9, 104(%rsp)
	movq	%rbx, 40(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, %r8
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	__mingw_vfprintf
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.section	.text$_Z7sprintfPcPKcz,"x"
	.linkonce discard
	.p2align 4,,15
	.globl	_Z7sprintfPcPKcz
	.def	_Z7sprintfPcPKcz;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z7sprintfPcPKcz
_Z7sprintfPcPKcz:
.LFB52:
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	%r8, 80(%rsp)
	leaq	80(%rsp), %r8
	movq	%r9, 88(%rsp)
	movq	%r8, 40(%rsp)
	call	__mingw_vsprintf
	addq	$56, %rsp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "%s at \33[38;5;129m<%s>\33[0m \33[38;5;245m(line %d)\33[0m:\12 \0"
.LC1:
	.ascii "%s at <%s> (line %d):\12 \0"
.LC2:
	.ascii " = \33[38;5;41m%s\33[0m\12\0"
.LC3:
	.ascii " = %s\12\0"
	.align 8
.LC4:
	.ascii "%s at \33[38;5;129m<core>\33[0m:\12 = \33[38;5;41m%s\33[0m\12\0"
.LC5:
	.ascii "%s at <core>:\12 = %s\12\0"
	.text
	.p2align 4,,15
	.globl	_Z5raiseR7error_t
	.def	_Z5raiseR7error_t;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z5raiseR7error_t
_Z5raiseR7error_t:
.LFB964:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	(%rcx), %rdx
	movq	%rcx, %rbp
	testq	%rdx, %rdx
	movzbl	colored(%rip), %ecx
	movzbl	8(%rbp), %eax
	je	.L5
	testb	%cl, %cl
	movl	12(%rbp), %r9d
	movq	32(%rdx), %r8
	jne	.L17
	leaq	errorName(%rip), %rdx
	movq	(%rdx,%rax,8), %rdx
	leaq	.LC1(%rip), %rcx
	call	_Z6printfPKcz
.L8:
	movq	0(%rbp), %rax
	movl	$1, %esi
	movq	(%rax), %rdx
	movq	8(%rax), %r8
	xorl	%eax, %eax
	jmp	.L7
	.p2align 4,,10
.L10:
	jb	.L9
.L11:
	xorl	%eax, %eax
	cmpb	$10, %cl
	sete	%al
	addl	%eax, %esi
	movl	%ebx, %eax
.L7:
	leal	1(%rax), %ebx
	movq	%r8, %rcx
	subq	%rdx, %rcx
	cmpl	%ecx, %eax
	jnb	.L9
	cmpl	%esi, 12(%rbp)
	movl	%ebx, %edi
	movsbl	(%rdx,%rdi), %ecx
	jne	.L10
	call	putchar
	movq	0(%rbp), %rax
	movq	(%rax), %rdx
	movq	8(%rax), %r8
	movzbl	(%rdx,%rdi), %ecx
	jmp	.L11
	.p2align 4,,10
.L17:
	leaq	errorNameColor(%rip), %rdx
	movq	(%rdx,%rax,8), %rdx
	leaq	.LC0(%rip), %rcx
	call	_Z6printfPKcz
	jmp	.L8
	.p2align 4,,10
.L9:
	cmpb	$0, colored(%rip)
	movq	16(%rbp), %rdx
	je	.L13
	leaq	.LC2(%rip), %rcx
	call	_Z6printfPKcz
.L14:
	cmpb	$0, 8(%rbp)
	jne	.L18
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L13:
	leaq	.LC3(%rip), %rcx
	call	_Z6printfPKcz
	jmp	.L14
	.p2align 4,,10
.L5:
	testb	%cl, %cl
	movq	16(%rbp), %r8
	je	.L15
	leaq	errorNameColor(%rip), %rdx
	movq	(%rdx,%rax,8), %rdx
	leaq	.LC4(%rip), %rcx
	call	_Z6printfPKcz
	jmp	.L14
	.p2align 4,,10
.L15:
	leaq	errorName(%rip), %rdx
	movq	(%rdx,%rax,8), %rdx
	leaq	.LC5(%rip), %rcx
	call	_Z6printfPKcz
	jmp	.L14
.L18:
	movl	$1, %ecx
	call	exit
	nop
	.seh_endproc
	.section .rdata,"dr"
.LC6:
	.ascii "wb\0"
	.text
	.p2align 4,,15
	.def	_Z9fileWriteR6file_t.part.24;	.scl	3;	.type	32;	.endef
	.seh_proc	_Z9fileWriteR6file_t.part.24
_Z9fileWriteR6file_t.part.24:
.LFB2421:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$288, %rsp
	.seh_stackalloc	288
	.seh_endprologue
	leaq	.LC6(%rip), %rdx
	movq	%rcx, %rdi
	movq	32(%rcx), %rcx
	call	fopen
	testq	%rax, %rax
	movq	%rax, %rsi
	je	.L24
.L20:
	movq	(%rdi), %rbx
	movq	8(%rdi), %rdi
	cmpq	%rdi, %rbx
	je	.L21
	.p2align 4,,10
.L22:
	movzbl	(%rbx), %ecx
	movq	%rsi, %rdx
	addq	$1, %rbx
	call	fputc
	cmpq	%rdi, %rbx
	jne	.L22
.L21:
	movq	%rsi, %rcx
	call	fclose
	nop
	addq	$288, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L24:
	leaq	32(%rsp), %rbx
	xorl	%ecx, %ecx
	call	fclose
	movq	32(%rdi), %r8
	movq	%rbx, %rcx
	movq	48+errorMessage(%rip), %rdx
	call	_Z7sprintfPcPKcz
	leaq	glerr(%rip), %rcx
	movq	%rbx, 16+glerr(%rip)
	call	_Z5raiseR7error_t
	jmp	.L20
	.seh_endproc
	.p2align 4,,15
	.globl	_Z17transformFilenamePcb
	.def	_Z17transformFilenamePcb;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z17transformFilenamePcb
_Z17transformFilenamePcb:
.LFB968:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%edx, %esi
	movq	%rcx, %rbx
	call	strlen
	movl	%eax, %edx
	movl	%eax, %edi
	subl	$1, %edx
	js	.L26
	movslq	%edx, %rcx
	cmpb	$46, (%rbx,%rcx)
	je	.L27
	subl	$2, %eax
	cltq
	jmp	.L28
	.p2align 4,,10
.L29:
	subq	$1, %rax
	cmpb	$46, 1(%rbx,%rax)
	je	.L27
.L28:
	testl	%eax, %eax
	movl	%eax, %edx
	jns	.L29
.L26:
	cmpl	$-1, %edx
	jne	.L27
	leal	5(%rdi), %ecx
	movslq	%ecx, %rcx
	call	_Znay
	testl	%edi, %edi
	jle	.L35
.L40:
	leal	-1(%rdi), %r8d
	xorl	%edx, %edx
	jmp	.L32
	.p2align 4,,10
.L36:
	movq	%rcx, %rdx
.L32:
	movzbl	(%rbx,%rdx), %ecx
	cmpq	%r8, %rdx
	movb	%cl, (%rax,%rdx)
	leaq	1(%rdx), %rcx
	jne	.L36
	leal	1(%rdi), %r8d
	movslq	%edi, %r9
	leal	2(%rdi), %ecx
	addq	%rax, %r9
	movslq	%r8d, %r8
	leal	3(%rdi), %edx
	addl	$4, %edi
	movslq	%ecx, %rcx
	movslq	%edx, %rdx
	movslq	%edi, %rdi
.L31:
	addq	%rax, %r8
	addq	%rax, %rcx
	addq	%rax, %rdx
	movb	$46, (%r9)
	testb	%sil, %sil
	je	.L33
	movb	$100, (%r8)
	movb	$97, (%rcx)
	movb	$116, (%rdx)
	movb	$0, (%rax,%rdi)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L27:
	movl	%edx, %edi
	leal	5(%rdi), %ecx
	movslq	%ecx, %rcx
	call	_Znay
	testl	%edi, %edi
	jg	.L40
.L35:
	movq	%rax, %r9
	movl	$4, %edi
	movl	$3, %edx
	movl	$2, %ecx
	movl	$1, %r8d
	jmp	.L31
	.p2align 4,,10
.L33:
	movb	$97, (%r8)
	movb	$115, (%rcx)
	movb	$109, (%rdx)
	movb	$0, (%rax,%rdi)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	_Z12createStringSt6vectorIcSaIcEE
	.def	_Z12createStringSt6vectorIcSaIcEE;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z12createStringSt6vectorIcSaIcEE
_Z12createStringSt6vectorIcSaIcEE:
.LFB969:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbx
	movq	8(%rcx), %rcx
	subq	(%rbx), %rcx
	call	_Znay
	movq	(%rbx), %r8
	movq	8(%rbx), %rdx
	subq	%r8, %rdx
	testl	%edx, %edx
	je	.L41
	leal	-1(%rdx), %r9d
	xorl	%edx, %edx
	jmp	.L43
	.p2align 4,,10
.L44:
	movq	%rcx, %rdx
.L43:
	movzbl	(%r8,%rdx), %ecx
	cmpq	%rdx, %r9
	movb	%cl, (%rax,%rdx)
	leaq	1(%rdx), %rcx
	jne	.L44
.L41:
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	_Z15transformEscapec
	.def	_Z15transformEscapec;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z15transformEscapec
_Z15transformEscapec:
.LFB970:
	.seh_endprologue
	xorl	%eax, %eax
	subl	$34, %ecx
	cmpb	$84, %cl
	ja	.L45
	leaq	CSWTCH.272(%rip), %rax
	movzbl	%cl, %ecx
	movzbl	(%rax,%rcx), %eax
.L45:
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	_Z7isValidc
	.def	_Z7isValidc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z7isValidc
_Z7isValidc:
.LFB971:
	.seh_endprologue
	leal	-32(%rcx), %eax
	cmpb	$94, %al
	setbe	%al
	subl	$9, %ecx
	cmpb	$1, %cl
	setbe	%dl
	orl	%edx, %eax
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	_Z15transformOpcodePKc
	.def	_Z15transformOpcodePKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z15transformOpcodePKc
_Z15transformOpcodePKc:
.LFB976:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	leaq	instructionNames(%rip), %rsi
	xorl	%ebx, %ebx
	movq	%rcx, %rdi
	jmp	.L52
	.p2align 4,,10
.L50:
	addq	$1, %rbx
	cmpq	$98, %rbx
	je	.L54
.L52:
	movq	(%rsi,%rbx,8), %rdx
	movq	%rdi, %rcx
	call	strcmpi
	testl	%eax, %eax
	jne	.L50
	movl	%ebx, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L54:
	movl	$98, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	_Z17transformOperatorPc
	.def	_Z17transformOperatorPc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z17transformOperatorPc
_Z17transformOperatorPc:
.LFB977:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	leaq	operatorName(%rip), %rsi
	xorl	%ebx, %ebx
	movq	%rcx, %rdi
	.p2align 4,,10
.L58:
	movq	(%rsi,%rbx,8), %rdx
	movq	%rdi, %rcx
	call	strcmpi
	testl	%eax, %eax
	je	.L60
	addq	$1, %rbx
	cmpq	$10, %rbx
	jne	.L58
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L60:
	movl	%ebx, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	_Z8isBranchN13instruction_t5namesE
	.def	_Z8isBranchN13instruction_t5namesE;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z8isBranchN13instruction_t5namesE
_Z8isBranchN13instruction_t5namesE:
.LFB978:
	.seh_endprologue
	subl	$64, %ecx
	cmpl	$8, %ecx
	setbe	%al
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	_Z10isIndirectN13instruction_t5namesE
	.def	_Z10isIndirectN13instruction_t5namesE;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z10isIndirectN13instruction_t5namesE
_Z10isIndirectN13instruction_t5namesE:
.LFB979:
	.seh_endprologue
	subl	$79, %ecx
	cmpl	$2, %ecx
	setbe	%al
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	_Z9parseTypeR7token_tRbS1_
	.def	_Z9parseTypeR7token_tRbS1_;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z9parseTypeR7token_tRbS1_
_Z9parseTypeR7token_tRbS1_:
.LFB980:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	leaq	glerr(%rip), %rbp
	xorl	%eax, %eax
	leal	1(%rax), %ebx
	movq	%rcx, %rsi
	movq	24(%rcx), %rcx
	movq	%rdx, %r12
	movq	%r8, %rdi
	movzbl	(%rcx,%rax), %eax
	testb	%al, %al
	je	.L63
	.p2align 4,,10
.L73:
	cmpb	$36, %al
	je	.L72
	cmpb	$37, %al
	jne	.L69
	cmpb	$0, (%r12)
	jne	.L70
	cmpb	$0, (%rdi)
	je	.L71
.L70:
	movq	184+errorMessage(%rip), %rax
	movq	%rbp, %rcx
	movq	%rax, 16+glerr(%rip)
	movl	32(%rsi), %eax
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	movq	24(%rsi), %rcx
.L71:
	movb	$1, (%rdi)
.L69:
	movl	%ebx, %eax
.L74:
	leal	1(%rax), %ebx
	movzbl	(%rcx,%rax), %eax
	testb	%al, %al
	jne	.L73
.L63:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L72:
	cmpb	$0, (%r12)
	jne	.L67
	cmpb	$0, (%rdi)
	je	.L68
.L67:
	movq	184+errorMessage(%rip), %rax
	movq	%rbp, %rcx
	movq	%rax, 16+glerr(%rip)
	movl	32(%rsi), %eax
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	movq	24(%rsi), %rcx
.L68:
	movb	$1, (%r12)
	movl	%ebx, %eax
	jmp	.L74
	.seh_endproc
	.p2align 4,,15
	.globl	_Z11parseStringR7token_tbb
	.def	_Z11parseStringR7token_tbb;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z11parseStringR7token_tbb
_Z11parseStringR7token_tbb:
.LFB981:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$296, %rsp
	.seh_stackalloc	296
	.seh_endprologue
	movzbl	36(%rdx), %eax
	cmpb	$4, %al
	movq	%rcx, %r13
	movq	%rdx, %rdi
	movb	$0, (%rcx)
	movl	%r8d, %ebx
	movl	%r9d, %esi
	movb	$0, 8(%rcx)
	movq	$0, 16(%rcx)
	movl	$0, 4(%rcx)
	je	.L76
	leaq	typeName(%rip), %rdx
	movq	32+typeName(%rip), %r8
	movq	(%rdx,%rax,8), %r9
	leaq	32(%rsp), %rbp
	movq	104+errorMessage(%rip), %rdx
	movq	%rbp, %rcx
	call	_Z7sprintfPcPKcz
	movl	32(%rdi), %eax
	leaq	glerr(%rip), %rcx
	movq	%rbp, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
.L76:
	movq	24(%rdi), %r8
	testb	%bl, %bl
	movq	%r8, %rcx
	movsbl	(%r8), %eax
	je	.L117
	leaq	32(%rsp), %rbp
	xorl	%esi, %esi
	xorl	%ebx, %ebx
	leaq	glerr(%rip), %r12
	jmp	.L77
	.p2align 4,,10
.L118:
	leal	-48(%rbx,%rax), %ebx
.L81:
	movl	%esi, %eax
	movsbl	(%r8,%rax), %eax
.L77:
	addl	$1, %esi
	testb	%al, %al
	je	.L96
	leal	-48(%rax), %edx
	sall	$4, %ebx
	cmpb	$9, %dl
	jbe	.L118
	leal	-65(%rax), %edx
	cmpb	$5, %dl
	ja	.L82
	leal	-55(%rbx,%rax), %ebx
	jmp	.L81
	.p2align 4,,10
.L82:
	leal	-97(%rax), %edx
	cmpb	$5, %dl
	ja	.L83
	leal	-87(%rbx,%rax), %ebx
	jmp	.L81
	.p2align 4,,10
.L96:
	movl	%ebx, %eax
	shrl	$16, %eax
	testl	%eax, %eax
	jne	.L119
	movl	%ebx, %eax
	shrl	$8, %eax
	testl	%eax, %eax
	setne	%al
	addl	$1, %eax
.L100:
	movb	%al, 8(%r13)
	movw	%bx, 24(%r13)
.L75:
	movq	%r13, %rax
	addq	$296, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
.L117:
	testb	%sil, %sil
	je	.L120
	leaq	32(%rsp), %rsi
	xorl	%r12d, %r12d
	xorl	%ebx, %ebx
	leaq	glerr(%rip), %rbp
	jmp	.L87
	.p2align 4,,10
.L121:
	leal	-48(%rbx,%rax), %ebx
.L91:
	movl	%r12d, %eax
	movsbl	(%r8,%rax), %eax
.L87:
	addl	$1, %r12d
	testb	%al, %al
	je	.L96
	leal	-48(%rax), %edx
	addl	%ebx, %ebx
	cmpb	$1, %dl
	jbe	.L121
	movq	160+errorMessage(%rip), %rdx
	movq	%rsi, %rcx
	call	_Z7sprintfPcPKcz
	movl	32(%rdi), %eax
	movq	%rbp, %rcx
	movq	%rsi, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	movq	24(%rdi), %r8
	jmp	.L91
	.p2align 4,,10
.L120:
	leal	-48(%rax), %edx
	xorl	%ebx, %ebx
	leaq	8+registerNames(%rip), %rsi
	cmpb	$9, %dl
	ja	.L95
	leaq	32(%rsp), %rsi
	movl	$1, %r12d
	xorl	%ebx, %ebx
	leaq	glerr(%rip), %rbp
	jmp	.L94
	.p2align 4,,10
.L122:
	leal	-48(%rbx,%rax), %ebx
.L98:
	movsbl	(%rcx,%r12), %eax
	leal	1(%r12), %edx
	testb	%al, %al
	je	.L96
	movl	%edx, %r12d
.L94:
	leal	(%rbx,%rbx,4), %ebx
	leal	-48(%rax), %edx
	addl	%ebx, %ebx
	cmpb	$9, %dl
	jbe	.L122
	movq	168+errorMessage(%rip), %rdx
	movq	%rcx, %r8
	movq	%rsi, %rcx
	call	_Z7sprintfPcPKcz
	movl	32(%rdi), %eax
	movq	%rbp, %rcx
	movq	%rsi, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	movq	24(%rdi), %rcx
	jmp	.L98
	.p2align 4,,10
.L95:
	movq	(%rsi,%rbx,8), %rdx
	movq	%r8, %rcx
	call	strcmpi
	testl	%eax, %eax
	je	.L123
	addq	$1, %rbx
	movq	24(%rdi), %r8
	cmpq	$4, %rbx
	jne	.L95
	movq	%r8, 16(%r13)
	jmp	.L75
	.p2align 4,,10
.L83:
	movq	152+errorMessage(%rip), %rdx
	movq	%rbp, %rcx
	call	_Z7sprintfPcPKcz
	movl	32(%rdi), %eax
	movq	%r12, %rcx
	movq	%rbp, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	movq	24(%rdi), %r8
	jmp	.L81
	.p2align 4,,10
.L119:
	movq	176+errorMessage(%rip), %rdx
	leaq	32(%rsp), %rsi
	movl	%ebx, %r8d
	movq	%rsi, %rcx
	call	_Z7sprintfPcPKcz
	movl	32(%rdi), %eax
	leaq	glerr(%rip), %rcx
	movq	%rsi, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	movl	$2, %eax
	jmp	.L100
.L123:
	addl	$5, %ebx
	movb	%bl, 8(%r13)
	jmp	.L75
	.seh_endproc
	.p2align 4,,15
	.globl	_Z11parseOffsetR7token_t
	.def	_Z11parseOffsetR7token_t;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z11parseOffsetR7token_t
_Z11parseOffsetR7token_t:
.LFB983:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$288, %rsp
	.seh_stackalloc	288
	.seh_endprologue
	leaq	glerr(%rip), %r12
	xorl	%eax, %eax
	xorl	%esi, %esi
	leal	1(%rax), %ebx
	movq	24(%rcx), %rdx
	movsbl	(%rdx,%rax), %r8d
	leaq	32(%rsp), %rbp
	movq	%rcx, %rdi
	testb	%r8b, %r8b
	je	.L126
	.p2align 4,,10
.L137:
	cmpb	$43, %r8b
	je	.L135
	cmpb	$45, %r8b
	je	.L136
	movq	288+errorMessage(%rip), %rdx
	movq	%rbp, %rcx
	call	_Z7sprintfPcPKcz
	movl	32(%rdi), %eax
	movq	%r12, %rcx
	movq	%rbp, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	movq	24(%rdi), %rdx
	movl	%ebx, %eax
.L139:
	movsbl	(%rdx,%rax), %r8d
	leal	1(%rax), %ebx
	testb	%r8b, %r8b
	jne	.L137
.L126:
	testw	%si, %si
	je	.L138
	movl	%esi, %eax
	addq	$288, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L136:
	testw	%si, %si
	jle	.L131
	movq	280+errorMessage(%rip), %rax
	movq	%r12, %rcx
	movq	%rax, 16+glerr(%rip)
	movl	32(%rdi), %eax
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	movq	24(%rdi), %rdx
.L131:
	subl	$1, %esi
	movl	%ebx, %eax
	jmp	.L139
	.p2align 4,,10
.L135:
	testw	%si, %si
	js	.L140
.L128:
	addl	$1, %esi
	movl	%ebx, %eax
	jmp	.L139
	.p2align 4,,10
.L140:
	movq	280+errorMessage(%rip), %rax
	movq	%r12, %rcx
	movq	%rax, 16+glerr(%rip)
	movl	32(%rdi), %eax
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	movq	24(%rdi), %rdx
	jmp	.L128
	.p2align 4,,10
.L138:
	movq	312+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	32(%rdi), %eax
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	movl	%esi, %eax
	addq	$288, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	_Z9streamRefRSt6vectorI8stream_tSaIS0_EE
	.def	_Z9streamRefRSt6vectorI8stream_tSaIS0_EE;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z9streamRefRSt6vectorI8stream_tSaIS0_EE
_Z9streamRefRSt6vectorI8stream_tSaIS0_EE:
.LFB984:
	.seh_endprologue
	movq	8(%rcx), %r8
	movq	%r8, %rdx
	subq	(%rcx), %rdx
	movq	-24(%r8), %rax
	subl	-32(%r8), %eax
	sarq	$5, %rdx
	subl	$1, %edx
	salq	$32, %rax
	orq	%rdx, %rax
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	_Z9fileWriteR6file_t
	.def	_Z9fileWriteR6file_t;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z9fileWriteR6file_t
_Z9fileWriteR6file_t:
.LFB992:
	.seh_endprologue
	cmpb	$0, 24(%rcx)
	jne	.L144
	ret
	.p2align 4,,10
.L144:
	jmp	_Z9fileWriteR6file_t.part.24
	.seh_endproc
	.p2align 4,,15
	.globl	_Z6getVarRSt6vectorI5var_tSaIS0_EEPc
	.def	_Z6getVarRSt6vectorI5var_tSaIS0_EEPc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z6getVarRSt6vectorI5var_tSaIS0_EEPc
_Z6getVarRSt6vectorI5var_tSaIS0_EEPc:
.LFB1019:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	(%rcx), %rbx
	movq	8(%rcx), %rsi
	movq	%rdx, %rdi
	cmpq	%rsi, %rbx
	jne	.L147
	jmp	.L148
	.p2align 4,,10
.L153:
	addq	$16, %rbx
	cmpq	%rbx, %rsi
	je	.L148
.L147:
	movq	(%rbx), %rdx
	movq	%rdi, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L153
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L148:
	xorl	%ebx, %ebx
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	_Z8getLabelRSt6vectorI5lab_tSaIS0_EEPc
	.def	_Z8getLabelRSt6vectorI5lab_tSaIS0_EEPc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z8getLabelRSt6vectorI5lab_tSaIS0_EEPc
_Z8getLabelRSt6vectorI5lab_tSaIS0_EEPc:
.LFB1020:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	(%rcx), %rbx
	movq	8(%rcx), %rdi
	movq	%rdx, %rbp
	cmpq	%rdi, %rbx
	je	.L158
	.p2align 4,,10
.L157:
	movq	(%rbx), %rdx
	movq	%rbx, %rsi
	testq	%rdx, %rdx
	je	.L156
	movq	%rbp, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L154
.L156:
	addq	$16, %rbx
	cmpq	%rbx, %rdi
	jne	.L157
.L158:
	xorl	%esi, %esi
.L154:
	movq	%rsi, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	_Z5applyN11operation_t10operator_tER6data_tS2_
	.def	_Z5applyN11operation_t10operator_tER6data_tS2_;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z5applyN11operation_t10operator_tER6data_tS2_
_Z5applyN11operation_t10operator_tER6data_tS2_:
.LFB1021:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$296, %rsp
	.seh_stackalloc	296
	.seh_endprologue
	cmpb	$0, (%r8)
	movl	%ecx, %edi
	movq	%rdx, %rbx
	movq	%r8, %rsi
	jne	.L184
.L167:
	movzbl	8(%rbx), %eax
	subl	$1, %eax
	cmpb	$1, %al
	jbe	.L168
	movq	232+errorMessage(%rip), %rdx
	leaq	32(%rsp), %rbp
	movl	$4, %r8d
	movq	%rbp, %rcx
	call	_Z7sprintfPcPKcz
	movl	4(%rbx), %eax
	leaq	glerr(%rip), %rcx
	movq	%rbp, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
.L168:
	movzbl	8(%rsi), %eax
	subl	$1, %eax
	cmpb	$1, %al
	jbe	.L169
	movq	232+errorMessage(%rip), %rdx
	leaq	32(%rsp), %rbp
	movl	$5, %r8d
	movq	%rbp, %rcx
	call	_Z7sprintfPcPKcz
	movl	4(%rsi), %eax
	leaq	glerr(%rip), %rcx
	movq	%rbp, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
.L169:
	cmpl	$9, %edi
	movzwl	24(%rbx), %eax
	ja	.L170
	leaq	.L172(%rip), %rcx
	movslq	(%rcx,%rdi,4), %rdx
	addq	%rcx, %rdx
	jmp	*%rdx
	.section .rdata,"dr"
	.align 4
.L172:
	.long	.L170-.L172
	.long	.L180-.L172
	.long	.L179-.L172
	.long	.L178-.L172
	.long	.L177-.L172
	.long	.L176-.L172
	.long	.L175-.L172
	.long	.L174-.L172
	.long	.L173-.L172
	.long	.L171-.L172
	.text
	.p2align 4,,10
.L177:
	addw	24(%rsi), %ax
	movw	%ax, 24(%rbx)
	.p2align 4,,10
.L170:
	cmpw	$255, %ax
	movl	$2, %edx
	ja	.L181
	cmpb	$1, 8(%rbx)
	je	.L185
.L181:
	movb	%dl, 8(%rbx)
	addq	$296, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L184:
	movzbl	8(%r8), %edx
	leaq	dataName(%rip), %rax
	leaq	32(%rsp), %rbp
	movq	%rbp, %rcx
	movq	(%rax,%rdx,8), %r8
	movq	248+errorMessage(%rip), %rdx
	call	_Z7sprintfPcPKcz
	movl	4(%rbx), %eax
	leaq	glerr(%rip), %rcx
	movq	%rbp, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	jmp	.L167
	.p2align 4,,10
.L185:
	movzbl	8(%rsi), %edx
	movb	%dl, 8(%rbx)
	addq	$296, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L180:
	andw	24(%rsi), %ax
	movw	%ax, 24(%rbx)
	jmp	.L170
	.p2align 4,,10
.L179:
	orw	24(%rsi), %ax
	movw	%ax, 24(%rbx)
	jmp	.L170
	.p2align 4,,10
.L178:
	xorw	24(%rsi), %ax
	movw	%ax, 24(%rbx)
	jmp	.L170
	.p2align 4,,10
.L176:
	subw	24(%rsi), %ax
	movw	%ax, 24(%rbx)
	jmp	.L170
	.p2align 4,,10
.L175:
	imulw	24(%rsi), %ax
	movw	%ax, 24(%rbx)
	jmp	.L170
	.p2align 4,,10
.L174:
	xorl	%edx, %edx
	divw	24(%rsi)
	movw	%ax, 24(%rbx)
	jmp	.L170
	.p2align 4,,10
.L173:
	movzwl	24(%rsi), %ecx
	movzwl	%ax, %edx
	sall	%cl, %edx
	movl	%edx, %eax
	movw	%dx, 24(%rbx)
	jmp	.L170
	.p2align 4,,10
.L171:
	movzwl	24(%rsi), %ecx
	movzwl	%ax, %edx
	sarl	%cl, %edx
	movl	%edx, %eax
	movw	%dx, 24(%rbx)
	jmp	.L170
	.seh_endproc
	.p2align 4,,15
	.globl	_Z10getAddressRSt6vectorI5lab_tSaIS0_EEjsj
	.def	_Z10getAddressRSt6vectorI5lab_tSaIS0_EEjsj;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z10getAddressRSt6vectorI5lab_tSaIS0_EEjsj
_Z10getAddressRSt6vectorI5lab_tSaIS0_EEjsj:
.LFB1022:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	xorl	%ebx, %ebx
	movq	(%rcx), %r10
	testw	%r8w, %r8w
	movq	%rcx, %rdi
	movl	%r8d, %esi
	setle	%al
	setg	%bl
	leal	-1(%rbx,%rbx), %ebx
	movzbl	%al, %eax
	subl	%eax, %edx
	movq	8(%rcx), %rax
	subq	%r10, %rax
	sarq	$4, %rax
	cmpw	%r8w, %bx
	movl	%eax, %r11d
	je	.L198
.L188:
	testw	%r8w, %r8w
	setg	%r8b
	movzbl	%r8b, %r8d
	leal	-1(%r8,%r8), %r8d
	jmp	.L191
	.p2align 4,,10
.L200:
	leal	(%rbx,%r8), %ecx
	movl	%edx, %eax
	salq	$4, %rax
	addq	%r10, %rax
	cmpq	$0, (%rax)
	cmove	%ecx, %ebx
	cmpw	%si, %bx
	je	.L199
	leal	1(%rdx), %eax
	subl	$1, %edx
	testw	%si, %si
	cmovg	%eax, %edx
.L191:
	cmpl	%r11d, %edx
	jb	.L200
	movq	384+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movl	%r9d, 12+glerr(%rip)
	movq	%rax, 16+glerr(%rip)
	call	_Z5raiseR7error_t
	xorl	%eax, %eax
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L199:
	movzwl	8(%rax), %eax
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L198:
	cmpl	%eax, %edx
	jnb	.L189
	salq	$4, %rdx
	movzwl	8(%r10,%rdx), %eax
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
.L189:
	movq	384+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movl	%r8d, 44(%rsp)
	movl	%edx, 40(%rsp)
	movl	%r9d, 12+glerr(%rip)
	movl	%r9d, 104(%rsp)
	movq	%rax, 16+glerr(%rip)
	call	_Z5raiseR7error_t
	movq	(%rdi), %r10
	movq	8(%rdi), %r11
	movl	44(%rsp), %r8d
	movl	40(%rsp), %edx
	movl	104(%rsp), %r9d
	subq	%r10, %r11
	sarq	$4, %r11
	jmp	.L188
	.seh_endproc
	.p2align 4,,15
	.globl	_Z15assembleUnknownR5crt_tR5unv_t
	.def	_Z15assembleUnknownR5crt_tR5unv_t;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z15assembleUnknownR5crt_tR5unv_t
_Z15assembleUnknownR5crt_tR5unv_t:
.LFB1031:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$312, %rsp
	.seh_stackalloc	312
	.seh_endprologue
	movzbl	40(%rdx), %eax
	testb	%al, %al
	movq	%rcx, %r14
	movq	%rdx, %rbx
	je	.L221
	leal	-1(%rax), %edx
	cmpb	$1, %dl
	jbe	.L222
	cmpb	$4, %al
	je	.L223
	leaq	dataName(%rip), %rdx
	movq	(%rdx,%rax,8), %r8
	leaq	48(%rsp), %rsi
	movq	392+errorMessage(%rip), %rdx
	movq	%rsi, %rcx
	call	_Z7sprintfPcPKcz
	movl	36(%rbx), %eax
	leaq	glerr(%rip), %rcx
	movq	%rsi, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
.L204:
	movq	8(%rbx), %r9
	movq	16(%rbx), %rbp
	cmpq	%rbp, %r9
	je	.L207
	leaq	24(%r14), %rax
	movq	%r9, %r15
	leaq	48(%rsp), %rsi
	movq	%rax, 40(%rsp)
	leaq	dataName(%rip), %r13
	leaq	glerr(%rip), %r12
	jmp	.L213
	.p2align 4,,10
.L208:
	leal	-1(%rax), %edx
	cmpb	$1, %dl
	jbe	.L219
	movq	0(%r13,%rax,8), %r8
	movq	%rsi, %rcx
	addq	$40, %r15
	movq	200+errorMessage(%rip), %rdx
	call	_Z7sprintfPcPKcz
	movl	36(%rbx), %eax
	movq	%r12, %rcx
	movq	%rsi, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	cmpq	%r15, %rbp
	je	.L207
.L213:
	movzbl	16(%r15), %eax
	testb	%al, %al
	jne	.L208
	movq	24(%r15), %rdx
	movq	40(%rsp), %rcx
	call	_Z8getLabelRSt6vectorI5lab_tSaIS0_EEPc
	testq	%rax, %rax
	je	.L224
.L219:
	movb	$2, 56(%rsp)
	movl	(%r15), %ecx
	leaq	8(%r15), %r8
	movq	%rsi, %rdx
	addq	$40, %r15
	movw	%di, 72(%rsp)
	movb	$0, 48(%rsp)
	movq	$0, 64(%rsp)
	movl	$0, 52(%rsp)
	call	_Z5applyN11operation_t10operator_tER6data_tS2_
	cmpq	%r15, %rbp
	movzwl	72(%rsp), %edi
	jne	.L213
.L207:
	cmpb	$0, (%rbx)
	movzwl	%di, %edx
	je	.L214
	movzwl	80(%rbx), %eax
	movl	%edx, %esi
	subl	%eax, %esi
	cmpl	$127, %esi
	jg	.L225
	cmpl	$-128, %esi
	jl	.L226
.L216:
	movl	72(%rbx), %eax
	movl	76(%rbx), %edx
	salq	$5, %rax
	addq	(%r14), %rax
	movq	(%rax), %rax
	movb	%sil, (%rax,%rdx)
.L201:
	addq	$312, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
.L222:
	movzwl	56(%rbx), %edi
	jmp	.L204
	.p2align 4,,10
.L224:
	movq	48(%rbx), %r8
	movq	%rsi, %rcx
	movq	400+errorMessage(%rip), %rdx
	call	_Z7sprintfPcPKcz
	movl	36(%rbx), %eax
	movq	%r12, %rcx
	movq	%rsi, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	jmp	.L219
	.p2align 4,,10
.L214:
	movl	72(%rbx), %eax
	movl	76(%rbx), %ecx
	salq	$5, %rax
	addq	(%r14), %rax
	movq	(%rax), %rax
	movb	%dil, (%rax,%rcx)
	movl	72(%rbx), %eax
	movl	76(%rbx), %ecx
	salq	$5, %rax
	addq	(%r14), %rax
	addl	$1, %ecx
	movq	(%rax), %rax
	movb	%dh, (%rax,%rcx)
	jmp	.L201
	.p2align 4,,10
.L221:
	movq	48(%rdx), %rbp
	leaq	24(%rcx), %rcx
	movq	%rbp, %rdx
	call	_Z8getLabelRSt6vectorI5lab_tSaIS0_EEPc
	testq	%rax, %rax
	movq	%rax, %rdi
	je	.L227
.L203:
	movzwl	8(%rdi), %edi
	jmp	.L204
	.p2align 4,,10
.L226:
	movq	304+errorMessage(%rip), %rdx
	leaq	48(%rsp), %rdi
	movl	%esi, %r8d
.L220:
	movq	%rdi, %rcx
	call	_Z7sprintfPcPKcz
	movl	36(%rbx), %eax
	leaq	glerr(%rip), %rcx
	movq	%rdi, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	jmp	.L216
	.p2align 4,,10
.L225:
	leaq	48(%rsp), %rdi
	movl	%esi, %r8d
	movq	296+errorMessage(%rip), %rdx
	jmp	.L220
	.p2align 4,,10
.L223:
	movl	84(%rbx), %edx
	leaq	24(%rcx), %rcx
	movl	36(%rbx), %r9d
	movswl	56(%rbx), %r8d
	call	_Z10getAddressRSt6vectorI5lab_tSaIS0_EEjsj
	movl	%eax, %edi
	jmp	.L204
.L227:
	movq	400+errorMessage(%rip), %rdx
	leaq	48(%rsp), %rsi
	movq	%rbp, %r8
	movq	%rsi, %rcx
	call	_Z7sprintfPcPKcz
	movl	36(%rbx), %eax
	leaq	glerr(%rip), %rcx
	movq	%rsi, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	jmp	.L203
	.seh_endproc
	.section	.text$_ZN5crt_tD1Ev,"x"
	.linkonce discard
	.align 2
	.p2align 4,,15
	.globl	_ZN5crt_tD1Ev
	.def	_ZN5crt_tD1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN5crt_tD1Ev
_ZN5crt_tD1Ev:
.LFB1043:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rsi
	movq	48(%rcx), %rcx
	testq	%rcx, %rcx
	je	.L229
	call	_ZdlPv
.L229:
	movq	24(%rsi), %rcx
	testq	%rcx, %rcx
	je	.L230
	call	_ZdlPv
.L230:
	movq	8(%rsi), %rdi
	movq	(%rsi), %rbx
	cmpq	%rbx, %rdi
	je	.L231
	.p2align 4,,10
.L233:
	movq	(%rbx), %rcx
	testq	%rcx, %rcx
	je	.L232
	call	_ZdlPv
.L232:
	addq	$32, %rbx
	cmpq	%rbx, %rdi
	jne	.L233
	movq	(%rsi), %rbx
.L231:
	testq	%rbx, %rbx
	je	.L228
	movq	%rbx, %rcx
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	_ZdlPv
	.p2align 4,,10
.L228:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.seh_endproc
	.section	.text$_ZNSt6vectorI7token_tSaIS0_EED1Ev,"x"
	.linkonce discard
	.align 2
	.p2align 4,,15
	.globl	_ZNSt6vectorI7token_tSaIS0_EED1Ev
	.def	_ZNSt6vectorI7token_tSaIS0_EED1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorI7token_tSaIS0_EED1Ev
_ZNSt6vectorI7token_tSaIS0_EED1Ev:
.LFB1068:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	8(%rcx), %rsi
	movq	(%rcx), %rbx
	movq	%rcx, %rdi
	cmpq	%rbx, %rsi
	je	.L246
	.p2align 4,,10
.L247:
	movq	%rbx, %rcx
	addq	$40, %rbx
	call	_ZNSt6vectorI7token_tSaIS0_EED1Ev
	cmpq	%rbx, %rsi
	jne	.L247
	movq	(%rdi), %rbx
.L246:
	testq	%rbx, %rbx
	je	.L245
	movq	%rbx, %rcx
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	_ZdlPv
	.p2align 4,,10
.L245:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.seh_endproc
	.section	.text$_ZNSt6vectorI5arg_tSaIS0_EED1Ev,"x"
	.linkonce discard
	.align 2
	.p2align 4,,15
	.globl	_ZNSt6vectorI5arg_tSaIS0_EED1Ev
	.def	_ZNSt6vectorI5arg_tSaIS0_EED1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorI5arg_tSaIS0_EED1Ev
_ZNSt6vectorI5arg_tSaIS0_EED1Ev:
.LFB1100:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	8(%rcx), %rsi
	movq	(%rcx), %rbx
	movq	%rcx, %rdi
	cmpq	%rbx, %rsi
	je	.L251
	.p2align 4,,10
.L253:
	movq	(%rbx), %rcx
	testq	%rcx, %rcx
	je	.L252
	call	_ZdlPv
.L252:
	addq	$56, %rbx
	cmpq	%rbx, %rsi
	jne	.L253
	movq	(%rdi), %rbx
.L251:
	testq	%rbx, %rbx
	je	.L250
	movq	%rbx, %rcx
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	jmp	_ZdlPv
	.p2align 4,,10
.L250:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.seh_endproc
	.section	.text$_ZNSt6vectorI11operation_tSaIS0_EEaSERKS2_,"x"
	.linkonce discard
	.align 2
	.p2align 4,,15
	.globl	_ZNSt6vectorI11operation_tSaIS0_EEaSERKS2_
	.def	_ZNSt6vectorI11operation_tSaIS0_EEaSERKS2_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorI11operation_tSaIS0_EEaSERKS2_
_ZNSt6vectorI11operation_tSaIS0_EEaSERKS2_:
.LFB1192:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	cmpq	%rcx, %rdx
	movq	%rcx, %rsi
	je	.L260
	movq	8(%rdx), %rdi
	movabsq	$-3689348814741910323, %r10
	movq	(%rdx), %rbx
	movq	(%rcx), %rcx
	movq	16(%rsi), %rax
	movq	%rdi, %rbp
	subq	%rbx, %rbp
	movq	%rbp, %rdx
	subq	%rcx, %rax
	sarq	$3, %rdx
	imulq	%r10, %rdx
	sarq	$3, %rax
	imulq	%r10, %rax
	movq	%rdx, %r8
	cmpq	%rax, %rdx
	ja	.L287
	movq	8(%rsi), %r9
	movq	%r9, %r11
	subq	%rcx, %r11
	movq	%r11, %rax
	sarq	$3, %rax
	imulq	%rax, %r10
	leaq	(%rcx,%rbp), %rax
	cmpq	%r10, %rdx
	ja	.L271
	testq	%rbp, %rbp
	jle	.L270
	xorl	%edx, %edx
	.p2align 4,,10
.L272:
	movq	(%rbx,%rdx), %r9
	movq	%r9, (%rcx,%rdx)
	movq	8(%rbx,%rdx), %r9
	movq	%r9, 8(%rcx,%rdx)
	movq	16(%rbx,%rdx), %r9
	movq	%r9, 16(%rcx,%rdx)
	movq	24(%rbx,%rdx), %r9
	movq	%r9, 24(%rcx,%rdx)
	movq	32(%rbx,%rdx), %r9
	movq	%r9, 32(%rcx,%rdx)
	addq	$40, %rdx
	subq	$1, %r8
	jne	.L272
.L270:
	movq	%rax, 8(%rsi)
.L260:
	movq	%rsi, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L287:
	xorl	%r12d, %r12d
	testq	%rdx, %rdx
	je	.L263
	movabsq	$461168601842738790, %rax
	cmpq	%rax, %rdx
	ja	.L288
	movq	%rbp, %rcx
	call	_Znwy
	movq	(%rsi), %rcx
	movq	%rax, %r12
.L263:
	cmpq	%rdi, %rbx
	movq	%r12, %rdx
	je	.L269
	.p2align 4,,10
.L268:
	movq	(%rbx), %r8
	addq	$40, %rbx
	addq	$40, %rdx
	movq	%r8, -40(%rdx)
	movq	-32(%rbx), %r8
	movq	%r8, -32(%rdx)
	movq	-24(%rbx), %r8
	movq	%r8, -24(%rdx)
	movq	-16(%rbx), %r8
	movq	%r8, -16(%rdx)
	movq	-8(%rbx), %r8
	movq	%r8, -8(%rdx)
	cmpq	%rbx, %rdi
	jne	.L268
.L269:
	testq	%rcx, %rcx
	je	.L267
	call	_ZdlPv
.L267:
	leaq	(%r12,%rbp), %rax
	movq	%r12, (%rsi)
	movq	%rax, 16(%rsi)
	movq	%rax, 8(%rsi)
	jmp	.L260
	.p2align 4,,10
.L271:
	leaq	(%rbx,%r11), %r8
	xorl	%edx, %edx
	testq	%r11, %r11
	jle	.L275
	.p2align 4,,10
.L273:
	movq	(%rbx,%rdx), %r11
	movq	%r11, (%rcx,%rdx)
	movq	8(%rbx,%rdx), %r11
	movq	%r11, 8(%rcx,%rdx)
	movq	16(%rbx,%rdx), %r11
	movq	%r11, 16(%rcx,%rdx)
	movq	24(%rbx,%rdx), %r11
	movq	%r11, 24(%rcx,%rdx)
	movq	32(%rbx,%rdx), %r11
	movq	%r11, 32(%rcx,%rdx)
	addq	$40, %rdx
	subq	$1, %r10
	jne	.L273
.L275:
	cmpq	%rdi, %r8
	je	.L270
	.p2align 4,,10
.L274:
	movq	(%r8), %rdx
	addq	$40, %r8
	addq	$40, %r9
	movq	%rdx, -40(%r9)
	movq	-32(%r8), %rdx
	movq	%rdx, -32(%r9)
	movq	-24(%r8), %rdx
	movq	%rdx, -24(%r9)
	movq	-16(%r8), %rdx
	movq	%rdx, -16(%r9)
	movq	-8(%r8), %rdx
	movq	%rdx, -8(%r9)
	cmpq	%r8, %rdi
	jne	.L274
	movq	%rax, 8(%rsi)
	jmp	.L260
.L288:
	call	_ZSt17__throw_bad_allocv
	nop
	.seh_endproc
	.section	.text$_ZNSt6vectorI5asm_tSaIS0_EED1Ev,"x"
	.linkonce discard
	.align 2
	.p2align 4,,15
	.globl	_ZNSt6vectorI5asm_tSaIS0_EED1Ev
	.def	_ZNSt6vectorI5asm_tSaIS0_EED1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorI5asm_tSaIS0_EED1Ev
_ZNSt6vectorI5asm_tSaIS0_EED1Ev:
.LFB1257:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	8(%rcx), %rbp
	movq	(%rcx), %rsi
	movq	%rcx, %r12
	cmpq	%rsi, %rbp
	je	.L290
	.p2align 4,,10
.L295:
	movq	8(%rsi), %rdi
	movq	(%rsi), %rbx
	cmpq	%rbx, %rdi
	je	.L291
	.p2align 4,,10
.L293:
	movq	(%rbx), %rcx
	testq	%rcx, %rcx
	je	.L292
	call	_ZdlPv
.L292:
	addq	$56, %rbx
	cmpq	%rbx, %rdi
	jne	.L293
	movq	(%rsi), %rbx
.L291:
	testq	%rbx, %rbx
	je	.L294
	movq	%rbx, %rcx
	call	_ZdlPv
.L294:
	addq	$48, %rsi
	cmpq	%rsi, %rbp
	jne	.L295
	movq	(%r12), %rsi
.L290:
	testq	%rsi, %rsi
	je	.L289
	movq	%rsi, %rcx
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	jmp	_ZdlPv
	.p2align 4,,10
.L289:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC7:
	.ascii "vector::_M_realloc_insert\0"
	.section	.text$_ZNSt6vectorIcSaIcEE17_M_realloc_insertIJRKcEEEvN9__gnu_cxx17__normal_iteratorIPcS1_EEDpOT_,"x"
	.linkonce discard
	.align 2
	.p2align 4,,15
	.globl	_ZNSt6vectorIcSaIcEE17_M_realloc_insertIJRKcEEEvN9__gnu_cxx17__normal_iteratorIPcS1_EEDpOT_
	.def	_ZNSt6vectorIcSaIcEE17_M_realloc_insertIJRKcEEEvN9__gnu_cxx17__normal_iteratorIPcS1_EEDpOT_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorIcSaIcEE17_M_realloc_insertIJRKcEEEvN9__gnu_cxx17__normal_iteratorIPcS1_EEDpOT_
_ZNSt6vectorIcSaIcEE17_M_realloc_insertIJRKcEEEvN9__gnu_cxx17__normal_iteratorIPcS1_EEDpOT_:
.LFB1359:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	8(%rcx), %rbx
	movq	(%rcx), %r12
	movq	%rbx, %rax
	movq	%rcx, %rsi
	movq	%rdx, %r13
	subq	%r12, %rax
	movq	%r8, %r15
	cmpq	$-1, %rax
	je	.L316
	movq	%rdx, %r14
	movl	$1, %edi
	subq	%r12, %r14
	testq	%rax, %rax
	je	.L307
	leaq	(%rax,%rax), %rdi
	cmpq	%rdi, %rax
	movq	$-1, %rax
	cmova	%rax, %rdi
.L307:
	movq	%rdi, %rcx
	subq	%r13, %rbx
	call	_Znwy
	movq	%rax, %rbp
	addq	%rax, %rdi
	movzbl	(%r15), %eax
	testq	%r14, %r14
	leaq	1(%rbp,%r14), %r9
	leaq	(%r9,%rbx), %r15
	movb	%al, 0(%rbp,%r14)
	jne	.L317
	testq	%rbx, %rbx
	jne	.L309
	testq	%r12, %r12
	jne	.L312
.L310:
	movq	%rbp, (%rsi)
	movq	%r15, 8(%rsi)
	movq	%rdi, 16(%rsi)
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
.L317:
	movq	%r14, %r8
	movq	%r12, %rdx
	movq	%rbp, %rcx
	movq	%r9, 40(%rsp)
	call	memmove
	testq	%rbx, %rbx
	movq	40(%rsp), %r9
	jne	.L309
.L312:
	movq	%r12, %rcx
	call	_ZdlPv
	jmp	.L310
	.p2align 4,,10
.L309:
	movq	%rbx, %r8
	movq	%r13, %rdx
	movq	%r9, %rcx
	call	memcpy
	testq	%r12, %r12
	je	.L310
	jmp	.L312
.L316:
	leaq	.LC7(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
	nop
	.seh_endproc
	.section	.text$_ZNSt6vectorIcSaIcEE12emplace_backIJcEEEvDpOT_,"x"
	.linkonce discard
	.align 2
	.p2align 4,,15
	.globl	_ZNSt6vectorIcSaIcEE12emplace_backIJcEEEvDpOT_
	.def	_ZNSt6vectorIcSaIcEE12emplace_backIJcEEEvDpOT_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorIcSaIcEE12emplace_backIJcEEEvDpOT_
_ZNSt6vectorIcSaIcEE12emplace_backIJcEEEvDpOT_:
.LFB1360:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	8(%rcx), %r8
	cmpq	16(%rcx), %r8
	movq	%rcx, %rbx
	je	.L319
	movzbl	(%rdx), %eax
	movb	%al, (%r8)
	addq	$1, 8(%rcx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L319:
	movq	(%rcx), %r12
	movq	%r8, %rsi
	subq	%r12, %rsi
	cmpq	$-1, %rsi
	je	.L332
	testq	%rsi, %rsi
	movl	$1, %edi
	je	.L322
	leaq	(%rsi,%rsi), %rdi
	movq	$-1, %rax
	cmpq	%rdi, %rsi
	cmova	%rax, %rdi
.L322:
	movq	%rdi, %rcx
	movq	%rdx, 88(%rsp)
	call	_Znwy
	movq	88(%rsp), %rdx
	movq	%rax, %rbp
	addq	%rax, %rdi
	testq	%rsi, %rsi
	movzbl	(%rdx), %eax
	movb	%al, 0(%rbp,%rsi)
	jne	.L333
	leaq	1(%rbp), %rsi
	testq	%r12, %r12
	jne	.L324
.L325:
	movq	%rbp, (%rbx)
	movq	%rsi, 8(%rbx)
	movq	%rdi, 16(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L333:
	movq	%rsi, %r8
	movq	%r12, %rdx
	movq	%rbp, %rcx
	call	memmove
	leaq	1(%rbp,%rsi), %rsi
.L324:
	movq	%r12, %rcx
	call	_ZdlPv
	jmp	.L325
.L332:
	leaq	.LC7(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
	nop
	.seh_endproc
	.text
	.p2align 4,,15
	.globl	_Z11parseQuotesR7token_t
	.def	_Z11parseQuotesR7token_t;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z11parseQuotesR7token_t
_Z11parseQuotesR7token_t:
.LFB982:
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$336, %rsp
	.seh_stackalloc	336
	.seh_endprologue
	xorl	%eax, %eax
	xorl	%edi, %edi
	xorl	%esi, %esi
	leaq	CSWTCH.272(%rip), %r13
	movq	24(%rcx), %rdx
	movq	$0, 48(%rsp)
	movq	%rcx, %rbp
	movq	$0, 56(%rsp)
	leaq	80(%rsp), %r12
	movq	$0, 64(%rsp)
	leaq	46(%rsp), %r14
	.p2align 4,,10
.L335:
	movsbl	(%rdx,%rax), %r8d
	leal	1(%rax), %ebx
	testb	%r8b, %r8b
	movb	%r8b, 46(%rsp)
	je	.L336
	testb	%sil, %sil
	je	.L337
	testb	%dil, %dil
	je	.L338
	leal	-34(%r8), %eax
	cmpb	$84, %al
	jbe	.L339
	movb	$0, 47(%rsp)
.L340:
	movq	272+errorMessage(%rip), %rdx
	movq	%r12, %rcx
	call	_Z7sprintfPcPKcz
	movl	32(%rbp), %eax
	leaq	glerr(%rip), %rcx
	movq	%r12, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
.LEHB0:
	call	_Z5raiseR7error_t
	movq	56(%rsp), %rdx
	cmpq	64(%rsp), %rdx
	je	.L342
.L382:
	movzbl	47(%rsp), %eax
	movb	%al, (%rdx)
	addq	$1, 56(%rsp)
.L343:
	movl	%edi, %esi
	movq	24(%rbp), %rdx
	xorl	%edi, %edi
	movl	%ebx, %eax
	jmp	.L335
	.p2align 4,,10
.L337:
	cmpb	$34, %r8b
	je	.L358
	movq	232+errorMessage(%rip), %rdx
	movq	%r12, %rcx
	movl	$3, %r8d
	call	_Z7sprintfPcPKcz
	movl	32(%rbp), %eax
	leaq	glerr(%rip), %rcx
	movq	%r12, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
.L380:
	movq	24(%rbp), %rdx
	movl	%ebx, %eax
	jmp	.L335
	.p2align 4,,10
.L358:
	movl	$1, %esi
	movl	%ebx, %eax
	jmp	.L335
	.p2align 4,,10
.L338:
	cmpb	$92, %r8b
	je	.L357
	cmpb	$34, %r8b
	je	.L345
	movq	56(%rsp), %rdx
	cmpq	64(%rsp), %rdx
	je	.L346
	movb	%r8b, (%rdx)
	movl	%ebx, %eax
	movq	24(%rbp), %rdx
	addq	$1, 56(%rsp)
	jmp	.L335
	.p2align 4,,10
.L339:
	movzbl	%al, %eax
	movzbl	0(%r13,%rax), %eax
	testb	%al, %al
	movb	%al, 47(%rsp)
	je	.L340
	movq	56(%rsp), %rdx
	cmpq	64(%rsp), %rdx
	jne	.L382
.L342:
	leaq	48(%rsp), %rcx
	leaq	47(%rsp), %r8
	call	_ZNSt6vectorIcSaIcEE17_M_realloc_insertIJRKcEEEvN9__gnu_cxx17__normal_iteratorIPcS1_EEDpOT_
	jmp	.L343
	.p2align 4,,10
.L336:
	leaq	80(%rsp), %rsi
	movb	$0, 80(%rsp)
	leaq	48(%rsp), %rcx
	movq	%rsi, %rdx
	call	_ZNSt6vectorIcSaIcEE12emplace_backIJcEEEvDpOT_
	movq	$0, 80(%rsp)
	movq	56(%rsp), %rcx
	movq	$0, 88(%rsp)
	subq	48(%rsp), %rcx
	movq	$0, 96(%rsp)
	movq	%rcx, %rbx
	je	.L349
	call	_Znwy
.LEHE0:
	leaq	(%rax,%rbx), %rcx
	movq	48(%rsp), %rdx
	movq	%rax, %r9
	movq	%rax, 80(%rsp)
	movq	56(%rsp), %rbx
	movq	%rax, 88(%rsp)
	movq	%rcx, 96(%rsp)
	subq	%rdx, %rbx
	je	.L350
	movq	%rbx, %r8
	movq	%rax, %rcx
	call	memmove
	movq	%rax, %r9
.L350:
	addq	%rbx, %r9
	movq	%rsi, %rcx
	movq	%r9, 88(%rsp)
.LEHB1:
	call	_Z12createStringSt6vectorIcSaIcEE
.LEHE1:
	movq	80(%rsp), %rcx
	movq	%rax, %rbx
	testq	%rcx, %rcx
	je	.L351
	call	_ZdlPv
.L351:
	movq	48(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L334
	call	_ZdlPv
.L334:
	movq	%rbx, %rax
	addq	$336, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
.L357:
	movl	%esi, %edi
.L345:
	movl	%edi, %esi
	movl	%ebx, %eax
	jmp	.L335
	.p2align 4,,10
.L349:
	xorl	%ebx, %ebx
	xorl	%r9d, %r9d
	jmp	.L350
	.p2align 4,,10
.L346:
	leaq	48(%rsp), %rcx
	movq	%r14, %r8
.LEHB2:
	call	_ZNSt6vectorIcSaIcEE17_M_realloc_insertIJRKcEEEvN9__gnu_cxx17__normal_iteratorIPcS1_EEDpOT_
.LEHE2:
	jmp	.L380
.L360:
	movq	80(%rsp), %rcx
	movq	%rax, %rbx
	testq	%rcx, %rcx
	je	.L355
	call	_ZdlPv
.L355:
	movq	48(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L356
	call	_ZdlPv
.L356:
	movq	%rbx, %rcx
.LEHB3:
	call	_Unwind_Resume
.LEHE3:
.L359:
	movq	%rax, %rbx
	jmp	.L355
	.def	__gxx_personality_seh0;	.scl	2;	.type	32;	.endef
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA982:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE982-.LLSDACSB982
.LLSDACSB982:
	.uleb128 .LEHB0-.LFB982
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L359-.LFB982
	.uleb128 0
	.uleb128 .LEHB1-.LFB982
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L360-.LFB982
	.uleb128 0
	.uleb128 .LEHB2-.LFB982
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L359-.LFB982
	.uleb128 0
	.uleb128 .LEHB3-.LFB982
	.uleb128 .LEHE3-.LEHB3
	.uleb128 0
	.uleb128 0
.LLSDACSE982:
	.text
	.seh_endproc
	.section	.text$_ZNSt6vectorIhSaIhEE12emplace_backIJhEEEvDpOT_,"x"
	.linkonce discard
	.align 2
	.p2align 4,,15
	.globl	_ZNSt6vectorIhSaIhEE12emplace_backIJhEEEvDpOT_
	.def	_ZNSt6vectorIhSaIhEE12emplace_backIJhEEEvDpOT_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorIhSaIhEE12emplace_backIJhEEEvDpOT_
_ZNSt6vectorIhSaIhEE12emplace_backIJhEEEvDpOT_:
.LFB1374:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	8(%rcx), %r8
	cmpq	16(%rcx), %r8
	movq	%rcx, %rbx
	je	.L384
	movzbl	(%rdx), %eax
	movb	%al, (%r8)
	addq	$1, 8(%rcx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L384:
	movq	(%rcx), %r12
	movq	%r8, %rsi
	subq	%r12, %rsi
	cmpq	$-1, %rsi
	je	.L397
	testq	%rsi, %rsi
	movl	$1, %edi
	je	.L387
	leaq	(%rsi,%rsi), %rdi
	movq	$-1, %rax
	cmpq	%rdi, %rsi
	cmova	%rax, %rdi
.L387:
	movq	%rdi, %rcx
	movq	%rdx, 88(%rsp)
	call	_Znwy
	movq	88(%rsp), %rdx
	movq	%rax, %rbp
	addq	%rax, %rdi
	testq	%rsi, %rsi
	movzbl	(%rdx), %eax
	movb	%al, 0(%rbp,%rsi)
	jne	.L398
	leaq	1(%rbp), %rsi
	testq	%r12, %r12
	jne	.L389
.L390:
	movq	%rbp, (%rbx)
	movq	%rsi, 8(%rbx)
	movq	%rdi, 16(%rbx)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
.L398:
	movq	%rsi, %r8
	movq	%r12, %rdx
	movq	%rbp, %rcx
	call	memmove
	leaq	1(%rbp,%rsi), %rsi
.L389:
	movq	%r12, %rcx
	call	_ZdlPv
	jmp	.L390
.L397:
	leaq	.LC7(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
	nop
	.seh_endproc
	.section .rdata,"dr"
.LC8:
	.ascii "r\0"
	.text
	.p2align 4,,15
	.globl	_Z8fileReadPKc
	.def	_Z8fileReadPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z8fileReadPKc
_Z8fileReadPKc:
.LFB985:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$296, %rsp
	.seh_stackalloc	296
	.seh_endprologue
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	movq	$0, (%rcx)
	movq	$0, 8(%rcx)
	movq	$0, 16(%rcx)
	movb	$0, 24(%rcx)
	movq	%rdi, %rcx
	movq	%rdx, 32(%rsi)
	leaq	.LC8(%rip), %rdx
.LEHB4:
	call	fopen
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L410
.L400:
	leaq	32(%rsp), %rdi
	jmp	.L402
	.p2align 4,,10
.L411:
	movq	%rbx, %rcx
	call	fgetc
	movq	%rdi, %rdx
	movq	%rsi, %rcx
	movb	%al, 32(%rsp)
	call	_ZNSt6vectorIhSaIhEE12emplace_backIJhEEEvDpOT_
.L402:
	movq	%rbx, %rcx
	call	feof
	testl	%eax, %eax
	je	.L411
	leaq	32(%rsp), %rdx
	movq	%rsi, %rcx
	movb	$10, 32(%rsp)
	call	_ZNSt6vectorIhSaIhEE12emplace_backIJhEEEvDpOT_
	movb	$1, 24(%rsi)
	movq	%rbx, %rcx
	call	fclose
	movq	%rsi, %rax
	addq	$296, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L410:
	xorl	%ecx, %ecx
	call	fclose
	movq	48+errorMessage(%rip), %rdx
	leaq	32(%rsp), %rbp
	movq	%rdi, %r8
	movq	%rbp, %rcx
	call	_Z7sprintfPcPKcz
	leaq	glerr(%rip), %rcx
	movq	%rbp, 16+glerr(%rip)
	call	_Z5raiseR7error_t
.LEHE4:
	jmp	.L400
.L405:
	movq	(%rsi), %rcx
	movq	%rax, %rbx
	testq	%rcx, %rcx
	je	.L404
	call	_ZdlPv
.L404:
	movq	%rbx, %rcx
.LEHB5:
	call	_Unwind_Resume
	nop
.LEHE5:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA985:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE985-.LLSDACSB985
.LLSDACSB985:
	.uleb128 .LEHB4-.LFB985
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L405-.LFB985
	.uleb128 0
	.uleb128 .LEHB5-.LFB985
	.uleb128 .LEHE5-.LEHB5
	.uleb128 0
	.uleb128 0
.LLSDACSE985:
	.text
	.seh_endproc
	.p2align 4,,15
	.globl	_Z12assembleFileR5crt_tPKc
	.def	_Z12assembleFileR5crt_tPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z12assembleFileR5crt_tPKc
_Z12assembleFileR5crt_tPKc:
.LFB1047:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	(%rdx), %rbx
	movq	8(%rdx), %rbp
	movq	%rcx, %rsi
	movq	$0, (%rcx)
	cmpq	%rbp, %rbx
	movq	$0, 8(%rcx)
	movq	$0, 16(%rcx)
	movb	$0, 24(%rcx)
	movq	%r8, 32(%rcx)
	je	.L413
	leaq	47(%rsp), %rdi
	xorl	%eax, %eax
	xorl	%r8d, %r8d
	.p2align 4,,10
.L419:
	movq	(%rbx), %rcx
	subq	%r8, %rax
	movq	8(%rbx), %r12
	movl	%eax, %r13d
	subq	%rcx, %r12
	movl	%r12d, %edx
	addl	24(%rbx), %r12d
	cmpl	%r12d, %eax
	jb	.L415
.L414:
	xorl	%eax, %eax
	testl	%edx, %edx
	je	.L418
	.p2align 4,,10
.L416:
	movl	%eax, %edx
	movzbl	(%rcx,%rdx), %r8d
	movl	%eax, %edx
	addl	$1, %eax
	addl	24(%rbx), %edx
	movq	(%rsi), %rcx
	movb	%r8b, (%rcx,%rdx)
	movq	(%rbx), %rcx
	movq	8(%rbx), %rdx
	subq	%rcx, %rdx
	cmpl	%edx, %eax
	jb	.L416
.L418:
	addq	$32, %rbx
	cmpq	%rbx, %rbp
	je	.L413
	movq	(%rsi), %r8
	movq	8(%rsi), %rax
	jmp	.L419
	.p2align 4,,10
.L415:
	movq	%rdi, %rdx
	movq	%rsi, %rcx
	movb	$0, 47(%rsp)
.LEHB6:
	call	_ZNSt6vectorIhSaIhEE12emplace_backIJhEEEvDpOT_
.LEHE6:
	addl	$1, %r13d
	cmpl	%r13d, %r12d
	ja	.L415
	movq	(%rbx), %rcx
	movl	8(%rbx), %edx
	subl	%ecx, %edx
	jmp	.L414
	.p2align 4,,10
.L413:
	movq	%rsi, %rax
	movb	$1, 24(%rsi)
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L423:
	movq	(%rsi), %rcx
	movq	%rax, %rbx
	testq	%rcx, %rcx
	je	.L421
	call	_ZdlPv
.L421:
	movq	%rbx, %rcx
.LEHB7:
	call	_Unwind_Resume
	nop
.LEHE7:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA1047:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1047-.LLSDACSB1047
.LLSDACSB1047:
	.uleb128 .LEHB6-.LFB1047
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L423-.LFB1047
	.uleb128 0
	.uleb128 .LEHB7-.LFB1047
	.uleb128 .LEHE7-.LEHB7
	.uleb128 0
	.uleb128 0
.LLSDACSE1047:
	.text
	.seh_endproc
	.section	.text$_ZNSt6vectorIPS_I7token_tSaIS0_EESaIS3_EE17_M_realloc_insertIJRKS3_EEEvN9__gnu_cxx17__normal_iteratorIPS3_S5_EEDpOT_,"x"
	.linkonce discard
	.align 2
	.p2align 4,,15
	.globl	_ZNSt6vectorIPS_I7token_tSaIS0_EESaIS3_EE17_M_realloc_insertIJRKS3_EEEvN9__gnu_cxx17__normal_iteratorIPS3_S5_EEDpOT_
	.def	_ZNSt6vectorIPS_I7token_tSaIS0_EESaIS3_EE17_M_realloc_insertIJRKS3_EEEvN9__gnu_cxx17__normal_iteratorIPS3_S5_EEDpOT_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorIPS_I7token_tSaIS0_EESaIS3_EE17_M_realloc_insertIJRKS3_EEEvN9__gnu_cxx17__normal_iteratorIPS3_S5_EEDpOT_
_ZNSt6vectorIPS_I7token_tSaIS0_EESaIS3_EE17_M_realloc_insertIJRKS3_EEEvN9__gnu_cxx17__normal_iteratorIPS3_S5_EEDpOT_:
.LFB1411:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	8(%rcx), %r13
	movq	(%rcx), %rsi
	movq	%r13, %rax
	movq	%rdx, %r14
	movq	%rcx, %rbx
	subq	%rsi, %rax
	subq	%rsi, %r14
	movq	%rdx, %rdi
	sarq	$3, %rax
	movq	%r8, %r15
	testq	%rax, %rax
	je	.L440
	leaq	(%rax,%rax), %rdx
	movq	$-8, %r12
	cmpq	%rdx, %rax
	jbe	.L445
.L433:
	movq	%r12, %rcx
	call	_Znwy
	movq	%rax, %rbp
	addq	%rax, %r12
.L434:
	movq	(%r15), %rax
	leaq	8(%rbp,%r14), %r10
	movq	%r13, %r9
	subq	%rdi, %r9
	cmpq	%rsi, %rdi
	leaq	(%r10,%r9), %r15
	movq	%rax, 0(%rbp,%r14)
	je	.L435
	movq	%r14, %r8
	movq	%rsi, %rdx
	movq	%rbp, %rcx
	movq	%r10, 40(%rsp)
	movq	%r9, 32(%rsp)
	call	memmove
	cmpq	%r13, %rdi
	movq	32(%rsp), %r9
	movq	40(%rsp), %r10
	je	.L439
.L436:
	movq	%r9, %r8
	movq	%rdi, %rdx
	movq	%r10, %rcx
	call	memcpy
.L438:
	testq	%rsi, %rsi
	jne	.L439
.L437:
	movq	%rbp, (%rbx)
	movq	%r15, 8(%rbx)
	movq	%r12, 16(%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
.L439:
	movq	%rsi, %rcx
	call	_ZdlPv
	jmp	.L437
	.p2align 4,,10
.L445:
	movabsq	$2305843009213693951, %rax
	cmpq	%rax, %rdx
	ja	.L433
	xorl	%r12d, %r12d
	xorl	%ebp, %ebp
	testq	%rdx, %rdx
	je	.L434
	jmp	.L432
	.p2align 4,,10
.L435:
	cmpq	%r13, %rdi
	jne	.L436
	jmp	.L438
	.p2align 4,,10
.L440:
	movl	$1, %edx
.L432:
	leaq	0(,%rdx,8), %r12
	jmp	.L433
	.seh_endproc
	.section	.text$_ZNSt6vectorI7token_tSaIS0_EE12emplace_backIJS0_EEEvDpOT_,"x"
	.linkonce discard
	.align 2
	.p2align 4,,15
	.globl	_ZNSt6vectorI7token_tSaIS0_EE12emplace_backIJS0_EEEvDpOT_
	.def	_ZNSt6vectorI7token_tSaIS0_EE12emplace_backIJS0_EEEvDpOT_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorI7token_tSaIS0_EE12emplace_backIJS0_EEEvDpOT_
_ZNSt6vectorI7token_tSaIS0_EE12emplace_backIJS0_EEEvDpOT_:
.LFB1412:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	8(%rcx), %rbx
	cmpq	16(%rcx), %rbx
	movq	%rcx, %r15
	je	.L447
	movq	$0, 8(%rbx)
	movq	$0, 16(%rbx)
	movq	$0, (%rbx)
	movq	(%rdx), %rax
	movq	%rax, (%rbx)
	movq	8(%rdx), %rcx
	movq	$0, (%rdx)
	movq	8(%rbx), %rax
	movq	%rcx, 8(%rbx)
	movq	16(%rdx), %rcx
	movq	%rax, 8(%rdx)
	movq	16(%rbx), %rax
	movq	%rcx, 16(%rbx)
	movq	%rax, 16(%rdx)
	movq	24(%rdx), %rax
	movq	%rax, 24(%rbx)
	movl	32(%rdx), %eax
	movl	%eax, 32(%rbx)
	movzbl	36(%rdx), %eax
	movb	%al, 36(%rbx)
	addq	$40, 8(%r15)
.L446:
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
.L447:
	movabsq	$-3689348814741910323, %rax
	movq	(%rcx), %rdi
	movq	%rbx, %rsi
	subq	%rdi, %rsi
	movq	%rsi, %r8
	sarq	$3, %r8
	imulq	%r8, %rax
	testq	%rax, %rax
	je	.L460
	leaq	(%rax,%rax), %rcx
	movq	$-16, %r12
	cmpq	%rcx, %rax
	jbe	.L474
.L449:
	movq	%r12, %rcx
	movq	%rdx, 136(%rsp)
	call	_Znwy
	movq	136(%rsp), %rdx
	movq	%rax, %rbp
	leaq	(%rax,%r12), %rax
	movq	%rax, 40(%rsp)
	leaq	40(%rbp), %r14
.L450:
	movq	(%rdx), %rcx
	leaq	0(%rbp,%rsi), %rax
	movq	$0, (%rdx)
	cmpq	%rdi, %rbx
	movq	%rcx, (%rax)
	movq	8(%rdx), %rcx
	movq	$0, 8(%rdx)
	movq	%rcx, 8(%rax)
	movq	16(%rdx), %rcx
	movq	$0, 16(%rdx)
	movq	%rcx, 16(%rax)
	movq	24(%rdx), %rcx
	movq	%rcx, 24(%rax)
	movl	32(%rdx), %ecx
	movzbl	36(%rdx), %edx
	movl	%ecx, 32(%rax)
	movb	%dl, 36(%rax)
	je	.L459
	movq	%rdi, %rdx
	movq	%rbp, %rax
	.p2align 4,,10
.L452:
	movq	$0, 8(%rax)
	addq	$40, %rdx
	addq	$40, %rax
	movq	$0, -24(%rax)
	movq	$0, -40(%rax)
	movq	-40(%rdx), %rcx
	movq	%rcx, -40(%rax)
	movq	-32(%rdx), %r8
	movq	$0, -40(%rdx)
	movq	-32(%rax), %rcx
	movq	%r8, -32(%rax)
	movq	-24(%rdx), %r8
	movq	%rcx, -32(%rdx)
	movq	-24(%rax), %rcx
	movq	%r8, -24(%rax)
	movq	%rcx, -24(%rdx)
	movq	-16(%rdx), %rcx
	movq	%rcx, -16(%rax)
	movl	-8(%rdx), %ecx
	movl	%ecx, -8(%rax)
	movzbl	-4(%rdx), %ecx
	movb	%cl, -4(%rax)
	cmpq	%rdx, %rbx
	jne	.L452
	leaq	-40(%rbx), %rax
	movq	%rdi, %r13
	movabsq	$922337203685477581, %rdx
	subq	%rdi, %rax
	shrq	$3, %rax
	imulq	%rdx, %rax
	movabsq	$2305843009213693951, %rdx
	andq	%rdx, %rax
	leaq	(%rax,%rax,4), %rax
	leaq	80(%rbp,%rax,8), %r14
	.p2align 4,,10
.L457:
	movq	8(%r13), %r12
	movq	0(%r13), %rsi
	cmpq	%rsi, %r12
	je	.L454
	.p2align 4,,10
.L455:
	movq	%rsi, %rcx
	addq	$40, %rsi
	call	_ZNSt6vectorI7token_tSaIS0_EED1Ev
	cmpq	%rsi, %r12
	jne	.L455
	movq	0(%r13), %rsi
.L454:
	testq	%rsi, %rsi
	je	.L456
	movq	%rsi, %rcx
	call	_ZdlPv
.L456:
	addq	$40, %r13
	cmpq	%r13, %rbx
	jne	.L457
.L459:
	testq	%rdi, %rdi
	je	.L458
	movq	%rdi, %rcx
	call	_ZdlPv
.L458:
	movq	40(%rsp), %rax
	movq	%rbp, (%r15)
	movq	%r14, 8(%r15)
	movq	%rax, 16(%r15)
	jmp	.L446
	.p2align 4,,10
.L474:
	movabsq	$461168601842738790, %rax
	cmpq	%rax, %rcx
	ja	.L449
	testq	%rcx, %rcx
	jne	.L475
	movl	$40, %r14d
	xorl	%ebp, %ebp
	movq	$0, 40(%rsp)
	jmp	.L450
	.p2align 4,,10
.L460:
	movl	$40, %r12d
	jmp	.L449
.L475:
	salq	$4, %r8
	movq	%r8, %r12
	jmp	.L449
	.seh_endproc
	.section	.text$_ZNSt6vectorI5arg_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"x"
	.linkonce discard
	.align 2
	.p2align 4,,15
	.globl	_ZNSt6vectorI5arg_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.def	_ZNSt6vectorI5arg_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorI5arg_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
_ZNSt6vectorI5arg_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_:
.LFB1430:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	8(%rcx), %rbx
	movq	(%rcx), %rbp
	movq	%rbx, %rax
	movq	%rdx, %rsi
	movq	%rcx, %r14
	subq	%rbp, %rax
	movq	%rsi, %rdi
	movq	%r8, %r12
	sarq	$3, %rax
	subq	%rbp, %rdi
	movabsq	$7905747460161236407, %rdx
	imulq	%rdx, %rax
	testq	%rax, %rax
	je	.L499
	leaq	(%rax,%rax), %r13
	cmpq	%r13, %rax
	jbe	.L519
	movq	$-16, %rcx
	movabsq	$329406144173384850, %r13
.L478:
.LEHB8:
	call	_Znwy
.LEHE8:
	movq	%rax, %r15
.L479:
	movq	8(%r12), %r8
	addq	%r15, %rdi
	movabsq	$-3689348814741910323, %rdx
	movq	(%r12), %r10
	movq	$0, (%rdi)
	movq	$0, 8(%rdi)
	movq	$0, 16(%rdi)
	movq	%r8, %rax
	subq	%r10, %rax
	movq	%rax, 40(%rsp)
	sarq	$3, %rax
	imulq	%rdx, %rax
	testq	%rax, %rax
	je	.L481
	movabsq	$461168601842738790, %rdx
	cmpq	%rdx, %rax
	ja	.L520
	movq	40(%rsp), %rcx
.LEHB9:
	call	_Znwy
	movq	8(%r12), %r8
	movq	(%r12), %r10
.L481:
	movq	40(%rsp), %rdx
	movq	%rax, (%rdi)
	movq	%rax, 8(%rdi)
	addq	%rax, %rdx
	cmpq	%r8, %r10
	movq	%rdx, 16(%rdi)
	je	.L483
	movq	%r10, %rdx
	movq	%rax, %rcx
	.p2align 4,,10
.L484:
	movq	(%rdx), %r9
	addq	$40, %rdx
	addq	$40, %rcx
	movq	%r9, -40(%rcx)
	movq	-32(%rdx), %r9
	movq	%r9, -32(%rcx)
	movq	-24(%rdx), %r9
	movq	%r9, -24(%rcx)
	movq	-16(%rdx), %r9
	movq	%r9, -16(%rcx)
	movq	-8(%rdx), %r9
	movq	%r9, -8(%rcx)
	cmpq	%rdx, %r8
	jne	.L484
	leaq	-40(%r8), %rdx
	movabsq	$922337203685477581, %r8
	movabsq	$2305843009213693951, %rcx
	subq	%r10, %rdx
	shrq	$3, %rdx
	imulq	%r8, %rdx
	andq	%rcx, %rdx
	leaq	5(%rdx,%rdx,4), %rdx
	leaq	(%rax,%rdx,8), %rax
.L483:
	movq	%rax, 8(%rdi)
	movq	24(%r12), %rax
	cmpq	%rbp, %rsi
	movq	%rax, 24(%rdi)
	movq	32(%r12), %rax
	movq	%rax, 32(%rdi)
	movq	40(%r12), %rax
	movq	%rax, 40(%rdi)
	movq	48(%r12), %rax
	movq	%rax, 48(%rdi)
	je	.L503
	movq	%rbp, %rdx
	movq	%r15, %rax
	.p2align 4,,10
.L486:
	movq	$0, 8(%rax)
	addq	$56, %rdx
	addq	$56, %rax
	movq	$0, -40(%rax)
	movq	$0, -56(%rax)
	movq	-56(%rdx), %rcx
	movq	%rcx, -56(%rax)
	movq	-48(%rdx), %r8
	movq	$0, -56(%rdx)
	movq	-48(%rax), %rcx
	movq	%r8, -48(%rax)
	movq	-40(%rdx), %r8
	movq	%rcx, -48(%rdx)
	movq	-40(%rax), %rcx
	movq	%r8, -40(%rax)
	movq	%rcx, -40(%rdx)
	movq	-32(%rdx), %rcx
	movq	%rcx, -32(%rax)
	movq	-24(%rdx), %rcx
	movq	%rcx, -24(%rax)
	movq	-16(%rdx), %rcx
	movq	%rcx, -16(%rax)
	movq	-8(%rdx), %rcx
	movq	%rcx, -8(%rax)
	cmpq	%rdx, %rsi
	jne	.L486
	leaq	-56(%rsi), %rdi
	movabsq	$988218432520154551, %rax
	subq	%rbp, %rdi
	shrq	$3, %rdi
	imulq	%rax, %rdi
	movabsq	$2305843009213693951, %rax
	andq	%rax, %rdi
	addq	$1, %rdi
	imulq	$56, %rdi, %rdi
	addq	%r15, %rdi
.L485:
	addq	$56, %rdi
	cmpq	%rbx, %rsi
	je	.L487
	movq	%rsi, %rax
	movq	%rdi, %rdx
	.p2align 4,,10
.L488:
	movq	(%rax), %rcx
	movq	$0, (%rax)
	addq	$56, %rax
	addq	$56, %rdx
	movq	%rcx, -56(%rdx)
	movq	-48(%rax), %rcx
	movq	$0, -48(%rax)
	movq	%rcx, -48(%rdx)
	movq	-40(%rax), %rcx
	movq	$0, -40(%rax)
	movq	%rcx, -40(%rdx)
	movq	-32(%rax), %rcx
	movq	%rcx, -32(%rdx)
	movq	-24(%rax), %rcx
	movq	%rcx, -24(%rdx)
	movq	-16(%rax), %rcx
	movq	%rcx, -16(%rdx)
	movq	-8(%rax), %rcx
	movq	%rcx, -8(%rdx)
	cmpq	%rax, %rbx
	jne	.L488
	movabsq	$988218432520154551, %rdx
	movq	%rbx, %rax
	subq	%rsi, %rax
	subq	$56, %rax
	shrq	$3, %rax
	imulq	%rdx, %rax
	movabsq	$2305843009213693951, %rdx
	andq	%rdx, %rax
	addq	$1, %rax
	imulq	$56, %rax, %rax
	addq	%rax, %rdi
.L487:
	cmpq	%rbx, %rbp
	movq	%rbp, %rsi
	je	.L493
	.p2align 4,,10
.L489:
	movq	(%rsi), %rcx
	testq	%rcx, %rcx
	je	.L492
	call	_ZdlPv
.L492:
	addq	$56, %rsi
	cmpq	%rbx, %rsi
	jne	.L489
.L493:
	testq	%rbp, %rbp
	je	.L491
	movq	%rbp, %rcx
	call	_ZdlPv
.L491:
	imulq	$56, %r13, %r13
	movq	%r15, (%r14)
	movq	%rdi, 8(%r14)
	addq	%r13, %r15
	movq	%r15, 16(%r14)
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
.L519:
	movabsq	$329406144173384850, %rax
	cmpq	%rax, %r13
	jbe	.L521
	movq	$-16, %rcx
	movq	%rax, %r13
	jmp	.L478
	.p2align 4,,10
.L499:
	movl	$1, %r13d
.L477:
	imulq	$56, %r13, %rcx
	jmp	.L478
	.p2align 4,,10
.L503:
	movq	%r15, %rdi
	jmp	.L485
.L521:
	xorl	%r15d, %r15d
	testq	%r13, %r13
	je	.L479
	jmp	.L477
.L520:
	call	_ZSt17__throw_bad_allocv
.LEHE9:
.L505:
	movq	%rax, %rcx
	call	__cxa_begin_catch
	testq	%r15, %r15
	je	.L522
	movq	%r15, %rcx
	call	_ZdlPv
.L498:
.LEHB10:
	call	__cxa_rethrow
.LEHE10:
.L522:
	movq	(%rdi), %rcx
	testq	%rcx, %rcx
	je	.L498
	call	_ZdlPv
	jmp	.L498
.L506:
	movq	%rax, %rbx
	call	__cxa_end_catch
	movq	%rbx, %rcx
.LEHB11:
	call	_Unwind_Resume
	nop
.LEHE11:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
	.align 4
.LLSDA1430:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT1430-.LLSDATTD1430
.LLSDATTD1430:
	.byte	0x1
	.uleb128 .LLSDACSE1430-.LLSDACSB1430
.LLSDACSB1430:
	.uleb128 .LEHB8-.LFB1430
	.uleb128 .LEHE8-.LEHB8
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB9-.LFB1430
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L505-.LFB1430
	.uleb128 0x1
	.uleb128 .LEHB10-.LFB1430
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L506-.LFB1430
	.uleb128 0
	.uleb128 .LEHB11-.LFB1430
	.uleb128 .LEHE11-.LEHB11
	.uleb128 0
	.uleb128 0
.LLSDACSE1430:
	.byte	0x1
	.byte	0
	.align 4
	.long	0

.LLSDATT1430:
	.section	.text$_ZNSt6vectorI5arg_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"x"
	.linkonce discard
	.seh_endproc
	.section	.text$_ZNSt6vectorI11operation_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"x"
	.linkonce discard
	.align 2
	.p2align 4,,15
	.globl	_ZNSt6vectorI11operation_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.def	_ZNSt6vectorI11operation_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorI11operation_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
_ZNSt6vectorI11operation_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_:
.LFB1441:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	8(%rcx), %rsi
	movq	(%rcx), %r12
	movq	%rsi, %rax
	movq	%rdx, %rbx
	movq	%rcx, %rdi
	movabsq	$-3689348814741910323, %rdx
	subq	%r12, %rax
	movq	%rbx, %r15
	sarq	$3, %rax
	subq	%r12, %r15
	imulq	%rdx, %rax
	testq	%rax, %rax
	je	.L532
	leaq	(%rax,%rax), %rdx
	movq	$-16, %r13
	cmpq	%rdx, %rax
	jbe	.L541
.L525:
	movq	%r13, %rcx
	movq	%r8, 128(%rsp)
	call	_Znwy
	movq	128(%rsp), %r8
	leaq	40(%rax), %r14
	movq	%rax, %rbp
	addq	%rax, %r13
.L526:
	movq	(%r8), %rax
	cmpq	%r12, %rbx
	movq	%rax, 0(%rbp,%r15)
	movq	8(%r8), %rax
	movq	%rax, 8(%rbp,%r15)
	movq	16(%r8), %rax
	movq	%rax, 16(%rbp,%r15)
	movq	24(%r8), %rax
	movq	%rax, 24(%rbp,%r15)
	movq	32(%r8), %rax
	movq	%rax, 32(%rbp,%r15)
	je	.L527
	movq	%r12, %r8
	movq	%rbp, %r9
	.p2align 4,,10
.L528:
	movq	(%r8), %rax
	addq	$40, %r8
	addq	$40, %r9
	movq	%rax, -40(%r9)
	movq	-32(%r8), %rax
	movq	%rax, -32(%r9)
	movq	-24(%r8), %rax
	movq	%rax, -24(%r9)
	movq	-16(%r8), %rax
	movq	%rax, -16(%r9)
	movq	-8(%r8), %rax
	movq	%rax, -8(%r9)
	cmpq	%r8, %rbx
	jne	.L528
	leaq	-40(%rbx), %rax
	movabsq	$922337203685477581, %rdx
	subq	%r12, %rax
	shrq	$3, %rax
	imulq	%rdx, %rax
	movabsq	$2305843009213693951, %rdx
	andq	%rdx, %rax
	leaq	10(%rax,%rax,4), %rax
	leaq	0(%rbp,%rax,8), %r14
.L527:
	cmpq	%rsi, %rbx
	je	.L529
	movq	%rbx, %r8
	movq	%r14, %r9
	.p2align 4,,10
.L530:
	movq	8(%r8), %r10
	addq	$40, %r8
	addq	$40, %r9
	movq	-40(%r8), %rax
	movq	%r10, -32(%r9)
	movq	-24(%r8), %r10
	movq	%rax, -40(%r9)
	movq	%r10, -24(%r9)
	movq	-16(%r8), %r10
	movq	%r10, -16(%r9)
	movq	-8(%r8), %r10
	movq	%r10, -8(%r9)
	cmpq	%r8, %rsi
	jne	.L530
	movabsq	$922337203685477581, %rdx
	subq	%rbx, %rsi
	leaq	-40(%rsi), %rax
	shrq	$3, %rax
	imulq	%rdx, %rax
	movabsq	$2305843009213693951, %rdx
	andq	%rdx, %rax
	leaq	5(%rax,%rax,4), %rax
	leaq	(%r14,%rax,8), %r14
.L529:
	testq	%r12, %r12
	je	.L531
	movq	%r12, %rcx
	call	_ZdlPv
.L531:
	movq	%rbp, (%rdi)
	movq	%r14, 8(%rdi)
	movq	%r13, 16(%rdi)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
.L541:
	movabsq	$461168601842738790, %rax
	cmpq	%rax, %rdx
	ja	.L525
	testq	%rdx, %rdx
	jne	.L524
	movl	$40, %r14d
	xorl	%r13d, %r13d
	xorl	%ebp, %ebp
	jmp	.L526
	.p2align 4,,10
.L532:
	movl	$1, %edx
.L524:
	leaq	(%rdx,%rdx,4), %r13
	salq	$3, %r13
	jmp	.L525
	.seh_endproc
	.section .rdata,"dr"
.LC9:
	.ascii "offset\0"
	.text
	.p2align 4,,15
	.globl	_Z13translateLineR7token_t
	.def	_Z13translateLineR7token_t;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z13translateLineR7token_t
_Z13translateLineR7token_t:
.LFB1008:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$456, %rsp
	.seh_stackalloc	456
	.seh_endprologue
	movq	(%rdx), %rbx
	movq	8(%rdx), %rsi
	movq	%rcx, %r15
	movq	%rdx, %r14
	movq	$0, 96(%rsp)
	cmpq	%rsi, %rbx
	movb	$0, 94(%rsp)
	movq	$0, 104(%rsp)
	movq	$0, 112(%rsp)
	movb	$0, 95(%rsp)
	je	.L674
	movb	$0, 48(%rsp)
	xorl	%r13d, %r13d
	movl	$1, %edi
	movl	$98, %r12d
	movq	$0, 40(%rsp)
	movb	$0, 56(%rsp)
	.p2align 4,,10
.L631:
	cmpb	$1, 36(%rbx)
	je	.L544
	testb	%dil, %dil
	je	.L545
	cmpb	$1, %dil
	je	.L781
	cmpb	$2, %dil
	je	.L782
	cmpb	$3, %dil
	je	.L783
	cmpb	$4, %dil
	jne	.L544
	movzbl	36(%rbx), %eax
	cmpb	$3, %al
	je	.L622
	leaq	typeName(%rip), %rdi
	movq	104+errorMessage(%rip), %rdx
	movq	(%rdi,%rax,8), %r9
	leaq	192(%rsp), %rbp
	leaq	.LC9(%rip), %r8
	movq	%rbp, %rcx
	call	_Z7sprintfPcPKcz
	movl	32(%rbx), %eax
	leaq	glerr(%rip), %rcx
	movq	%rbp, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
.LEHB12:
	call	_Z5raiseR7error_t
.L622:
	movq	%rbx, %rcx
	call	_Z11parseOffsetR7token_t
	movl	32(%rbx), %edx
	movq	$0, 192(%rsp)
	movq	$0, 200(%rsp)
	movq	$0, 208(%rsp)
	movb	$0, 216(%rsp)
	movl	%edx, 220(%rsp)
	movq	104(%rsp), %rdx
	cmpq	112(%rsp), %rdx
	movb	$4, 224(%rsp)
	movq	$0, 232(%rsp)
	movw	%ax, 240(%rsp)
	je	.L623
	movq	$0, (%rdx)
	xorl	%eax, %eax
	movq	$0, 8(%rdx)
	movq	$0, 16(%rdx)
	movq	200(%rsp), %r9
	movq	192(%rsp), %rcx
	cmpq	%rcx, %r9
	je	.L627
	movq	%rcx, %rax
	xorl	%r8d, %r8d
	.p2align 4,,10
.L628:
	movq	(%rax), %r10
	addq	$40, %rax
	addq	$40, %r8
	movq	%r10, -40(%r8)
	movq	-32(%rax), %r10
	movq	%r10, -32(%r8)
	movq	-24(%rax), %r10
	movq	%r10, -24(%r8)
	movq	-16(%rax), %r10
	movq	%r10, -16(%r8)
	movq	-8(%rax), %r10
	movq	%r10, -8(%r8)
	cmpq	%rax, %r9
	jne	.L628
	leaq	-40(%r9), %rax
	movabsq	$922337203685477581, %rdi
	subq	%rcx, %rax
	shrq	$3, %rax
	imulq	%rdi, %rax
	movabsq	$2305843009213693951, %rdi
	andq	%rdi, %rax
	leaq	5(%rax,%rax,4), %rax
	salq	$3, %rax
.L627:
	movq	%rax, 8(%rdx)
	movq	216(%rsp), %rax
	addq	$56, %rdx
	movq	%rax, -32(%rdx)
	movq	224(%rsp), %rax
	movq	%rax, -24(%rdx)
	movq	232(%rsp), %rax
	movq	%rax, -16(%rdx)
	movq	240(%rsp), %rax
	movq	%rax, -8(%rdx)
	movq	%rdx, 104(%rsp)
.L629:
	testq	%rcx, %rcx
	je	.L630
	call	_ZdlPv
.L630:
	xorl	%edi, %edi
	.p2align 4,,10
.L544:
	addq	$40, %rbx
	cmpq	%rbx, %rsi
	jne	.L631
	cmpb	$0, 94(%rsp)
	jne	.L632
	cmpb	$0, 95(%rsp)
	je	.L633
.L632:
	movq	256+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	32(%r14), %eax
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
.L633:
	cmpb	$0, 48(%rsp)
	jne	.L784
	testb	%r13b, %r13b
	jne	.L785
.L635:
	cmpb	$4, %dil
	je	.L786
.L543:
	cmpb	$0, 56(%rsp)
	movq	96(%rsp), %rbx
	movq	104(%rsp), %rbp
	jne	.L787
	cmpl	$98, %r12d
	jne	.L638
	cmpq	$0, 40(%rsp)
	jne	.L638
	xorl	%edx, %edx
	movq	$0, (%r15)
	movq	$0, 8(%r15)
	movq	$0, 16(%r15)
	movl	$98, 24(%r15)
	movq	$0, 32(%r15)
	movw	%dx, 40(%r15)
	movl	$0, 44(%r15)
.L637:
	cmpq	%rbx, %rbp
	je	.L661
	.p2align 4,,10
.L663:
	movq	(%rbx), %rcx
	testq	%rcx, %rcx
	je	.L662
	call	_ZdlPv
.L662:
	addq	$56, %rbx
	cmpq	%rbx, %rbp
	jne	.L663
	movq	96(%rsp), %rbx
.L661:
	testq	%rbx, %rbx
	je	.L542
	movq	%rbx, %rcx
	call	_ZdlPv
.L542:
	movq	%r15, %rax
	addq	$456, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
.L781:
	movzbl	36(%rbx), %eax
	cmpb	$5, %al
	je	.L675
	cmpb	$4, %al
	je	.L549
	leaq	typeName(%rip), %rdi
	movq	56+typeName(%rip), %r8
	movq	(%rdi,%rax,8), %r9
	leaq	192(%rsp), %rbp
	movq	104+errorMessage(%rip), %rdx
	movq	%rbp, %rcx
	call	_Z7sprintfPcPKcz
	movl	32(%rbx), %eax
	leaq	glerr(%rip), %rcx
	movq	%rbp, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
.L549:
	movq	24(%rbx), %rbp
	leaq	instructionNames(%rip), %r12
	xorl	%edi, %edi
	jmp	.L552
	.p2align 4,,10
.L550:
	addq	$1, %rdi
	cmpq	$98, %rdi
	je	.L788
.L552:
	movq	(%r12,%rdi,8), %rdx
	movq	%rbp, %rcx
	call	strcmpi
	testl	%eax, %eax
	jne	.L550
	movl	%edi, %r12d
	movl	$3, %edi
	jmp	.L544
	.p2align 4,,10
.L545:
	movq	112+errorMessage(%rip), %rax
.L773:
	movq	%rax, 16+glerr(%rip)
	movl	32(%rbx), %eax
	leaq	glerr(%rip), %rcx
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	jmp	.L544
	.p2align 4,,10
.L782:
	movzbl	36(%rbx), %eax
	movq	24(%rbx), %rcx
	cmpb	$5, %al
	je	.L789
	cmpb	$8, %al
	jne	.L556
	call	strlen
	cmpl	$1, %eax
	jle	.L557
	movq	128+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	32(%rbx), %eax
	movb	$0, 8+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
.L557:
	movq	40(%rsp), %rax
	movq	$0, 192(%rsp)
	movq	104(%rsp), %rdx
	movb	$0, 216(%rsp)
	cmpq	112(%rsp), %rdx
	movq	$0, 200(%rsp)
	movq	$0, 208(%rsp)
	movl	$0, 220(%rsp)
	movb	$0, 224(%rsp)
	movq	%rax, 232(%rsp)
	je	.L558
	movq	$0, (%rdx)
	xorl	%eax, %eax
	movq	$0, 8(%rdx)
	movq	$0, 16(%rdx)
	movq	200(%rsp), %r9
	movq	192(%rsp), %rcx
	cmpq	%rcx, %r9
	je	.L562
	movq	%rcx, %rax
	xorl	%r8d, %r8d
	.p2align 4,,10
.L563:
	movq	(%rax), %r10
	addq	$40, %rax
	addq	$40, %r8
	movq	%r10, -40(%r8)
	movq	-32(%rax), %r10
	movq	%r10, -32(%r8)
	movq	-24(%rax), %r10
	movq	%r10, -24(%r8)
	movq	-16(%rax), %r10
	movq	%r10, -16(%r8)
	movq	-8(%rax), %r10
	movq	%r10, -8(%r8)
	cmpq	%rax, %r9
	jne	.L563
	leaq	-40(%r9), %rax
	movabsq	$922337203685477581, %rdi
	subq	%rcx, %rax
	shrq	$3, %rax
	imulq	%rdi, %rax
	movabsq	$2305843009213693951, %rdi
	andq	%rdi, %rax
	leaq	5(%rax,%rax,4), %rax
	salq	$3, %rax
.L562:
	movq	%rax, 8(%rdx)
	movq	216(%rsp), %rax
	addq	$56, %rdx
	movq	%rax, -32(%rdx)
	movq	224(%rsp), %rax
	movq	%rax, -24(%rdx)
	movq	232(%rsp), %rax
	movq	%rax, -16(%rdx)
	movq	240(%rsp), %rax
	movq	%rax, -8(%rdx)
	movq	%rdx, 104(%rsp)
.L564:
	testq	%rcx, %rcx
	je	.L565
	call	_ZdlPv
.L565:
	movl	$3, %edi
	movl	$89, %r12d
	movq	$0, 40(%rsp)
	jmp	.L544
	.p2align 4,,10
.L783:
	movzbl	36(%rbx), %eax
	cmpb	$2, %al
	je	.L790
	cmpb	$6, %al
	je	.L791
	testb	%r13b, %r13b
	je	.L572
	cmpb	$3, %al
	je	.L792
.L573:
	cmpb	$4, %al
	je	.L793
	cmpb	$7, %al
	je	.L794
	leaq	192(%rsp), %rbp
	cmpb	$5, %al
	jne	.L586
	movq	40+typeName(%rip), %r8
	movq	%rbp, %rcx
	movq	200+errorMessage(%rip), %rdx
	call	_Z7sprintfPcPKcz
	movl	32(%rbx), %eax
	leaq	glerr(%rip), %rcx
	movq	%rbp, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	movzbl	36(%rbx), %eax
	jmp	.L586
	.p2align 4,,10
.L788:
	movq	24(%rbx), %rax
	movl	$2, %edi
	movl	$98, %r12d
	movq	%rax, 40(%rsp)
	jmp	.L544
	.p2align 4,,10
.L556:
	movq	136+errorMessage(%rip), %rdx
	leaq	192(%rsp), %rbp
	movq	%rcx, %r8
	movq	%rbp, %rcx
	call	_Z7sprintfPcPKcz
	movl	32(%rbx), %eax
	leaq	glerr(%rip), %rcx
	movq	%rbp, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	jmp	.L544
	.p2align 4,,10
.L572:
	cmpb	$3, %al
	je	.L795
	cmpb	$4, %al
	je	.L796
	cmpb	$5, %al
	je	.L797
	leaq	192(%rsp), %rbp
	cmpb	$7, %al
	je	.L798
.L586:
	leaq	typeName(%rip), %rcx
	movq	144+errorMessage(%rip), %rdx
	movq	(%rcx,%rax,8), %r8
	movq	%rbp, %rcx
	call	_Z7sprintfPcPKcz
	movl	32(%r14), %eax
	leaq	glerr(%rip), %rcx
	movq	%rbp, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
.LEHE12:
	jmp	.L544
.L638:
	movabsq	$7905747460161236407, %rdx
	movq	%rbp, %rsi
	xorl	%eax, %eax
	movq	$0, 192(%rsp)
	subq	%rbx, %rsi
	movw	%ax, 232(%rsp)
	movq	$0, 200(%rsp)
	movq	%rsi, %rax
	movq	$0, 208(%rsp)
	sarq	$3, %rax
	movl	$98, 216(%rsp)
	imulq	%rdx, %rax
	movq	$0, 224(%rsp)
	movl	$0, 236(%rsp)
	testq	%rax, %rax
	je	.L799
	movabsq	$329406144173384850, %rdx
	cmpq	%rdx, %rax
	ja	.L800
	movq	%rsi, %rcx
.LEHB13:
	call	_Znwy
.LEHE13:
	movq	104(%rsp), %rbp
	movq	%rax, 48(%rsp)
	movq	96(%rsp), %rbx
.L640:
	movq	48(%rsp), %rax
	addq	%rax, %rsi
	cmpq	%rbp, %rbx
	movq	%rsi, 56(%rsp)
	je	.L681
	movabsq	$-3689348814741910323, %r13
	movq	%rax, %rsi
	.p2align 4,,10
.L648:
	movq	8(%rbx), %rdi
	subq	(%rbx), %rdi
	movq	$0, (%rsi)
	movq	$0, 8(%rsi)
	movq	$0, 16(%rsi)
	movq	%rdi, %rax
	sarq	$3, %rax
	imulq	%r13, %rax
	testq	%rax, %rax
	je	.L644
	movabsq	$461168601842738790, %rcx
	cmpq	%rcx, %rax
	ja	.L801
	movq	%rdi, %rcx
.LEHB14:
	call	_Znwy
.LEHE14:
.L644:
	addq	%rax, %rdi
	movq	%rax, (%rsi)
	movq	%rax, 8(%rsi)
	movq	%rdi, 16(%rsi)
	movq	8(%rbx), %r8
	movq	(%rbx), %r10
	cmpq	%r10, %r8
	je	.L646
	movq	%r10, %rdx
	movq	%rax, %rcx
	.p2align 4,,10
.L647:
	movq	(%rdx), %r9
	addq	$40, %rdx
	addq	$40, %rcx
	movq	%r9, -40(%rcx)
	movq	-32(%rdx), %r9
	movq	%r9, -32(%rcx)
	movq	-24(%rdx), %r9
	movq	%r9, -24(%rcx)
	movq	-16(%rdx), %r9
	movq	%r9, -16(%rcx)
	movq	-8(%rdx), %r9
	movq	%r9, -8(%rcx)
	cmpq	%rdx, %r8
	jne	.L647
	leaq	-40(%r8), %rdx
	movabsq	$922337203685477581, %rdi
	movabsq	$2305843009213693951, %rcx
	subq	%r10, %rdx
	shrq	$3, %rdx
	imulq	%rdi, %rdx
	andq	%rcx, %rdx
	leaq	5(%rdx,%rdx,4), %rdx
	leaq	(%rax,%rdx,8), %rax
.L646:
	movq	%rax, 8(%rsi)
	movq	24(%rbx), %rax
	addq	$56, %rbx
	addq	$56, %rsi
	movq	%rax, -32(%rsi)
	movq	-24(%rbx), %rax
	movq	%rax, -24(%rsi)
	movq	-16(%rbx), %rax
	movq	%rax, -16(%rsi)
	movq	-8(%rbx), %rax
	movq	%rax, -8(%rsi)
	cmpq	%rbx, %rbp
	jne	.L648
.L642:
	movq	48(%rsp), %rax
	movq	192(%rsp), %rdi
	movq	200(%rsp), %rbx
	movq	%rsi, 200(%rsp)
	movq	%rax, 192(%rsp)
	movq	56(%rsp), %rax
	movq	%rdi, %rsi
	cmpq	%rbx, %rdi
	movq	%rax, 208(%rsp)
	je	.L660
	.p2align 4,,10
.L649:
	movq	(%rsi), %rcx
	testq	%rcx, %rcx
	je	.L659
	call	_ZdlPv
.L659:
	addq	$56, %rsi
	cmpq	%rsi, %rbx
	jne	.L649
.L660:
	testq	%rdi, %rdi
	je	.L651
	movq	%rdi, %rcx
	call	_ZdlPv
.L651:
	movq	192(%rsp), %rdx
	movl	32(%r14), %eax
	movl	%r12d, 24(%r15)
	movq	40(%rsp), %rsi
	movb	$1, 40(%r15)
	movq	104(%rsp), %rbp
	movq	%rdx, (%r15)
	movq	200(%rsp), %rdx
	movl	%eax, 44(%r15)
	movq	96(%rsp), %rbx
	movq	%rsi, 32(%r15)
	movq	%rdx, 8(%r15)
	movq	208(%rsp), %rdx
	movq	%rdx, 16(%r15)
	movzbl	233(%rsp), %edx
	movb	%dl, 41(%r15)
	jmp	.L637
	.p2align 4,,10
.L789:
	call	strlen
	xorl	%edi, %edi
	cmpl	$1, %eax
	jle	.L544
	movq	120+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	32(%rbx), %eax
	movb	$0, 8+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
.LEHB15:
	call	_Z5raiseR7error_t
	jmp	.L630
	.p2align 4,,10
.L675:
	xorl	%edi, %edi
	movb	$1, 56(%rsp)
	jmp	.L544
	.p2align 4,,10
.L791:
	cmpb	$0, 94(%rsp)
	jne	.L570
	cmpb	$0, 95(%rsp)
	jne	.L570
	cmpb	$0, 48(%rsp)
	jne	.L802
.L678:
	movb	$1, 48(%rsp)
	jmp	.L544
.L570:
	movq	240+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	32(%rbx), %eax
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	cmpb	$0, 48(%rsp)
	je	.L678
.L802:
	movq	192+errorMessage(%rip), %rax
	jmp	.L773
	.p2align 4,,10
.L784:
	movq	264+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	32(%r14), %eax
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	testb	%r13b, %r13b
	je	.L635
.L785:
	movq	216+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	32(%r14), %eax
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	cmpb	$4, %dil
	jne	.L543
.L786:
	movq	312+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	32(%r14), %eax
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
.LEHE15:
	jmp	.L543
	.p2align 4,,10
.L787:
	movl	32(%r14), %eax
	movl	$257, %ecx
	movq	$0, (%r15)
	movq	$0, 8(%r15)
	movq	$0, 16(%r15)
	movl	$98, 24(%r15)
	movq	$0, 32(%r15)
	movw	%cx, 40(%r15)
	movl	%eax, 44(%r15)
	jmp	.L637
.L623:
	leaq	96(%rsp), %rbp
	leaq	192(%rsp), %r8
	movq	%rbp, %rcx
.LEHB16:
	call	_ZNSt6vectorI5arg_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
.LEHE16:
	movq	192(%rsp), %rcx
	jmp	.L629
.L794:
	cmpb	$0, 94(%rsp)
	jne	.L581
	cmpb	$0, 95(%rsp)
	je	.L582
.L581:
	movq	240+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	32(%rbx), %eax
	movl	%eax, 12+glerr(%rip)
.LEHB17:
	call	_Z5raiseR7error_t
.L582:
	movq	104(%rsp), %rax
	cmpq	96(%rsp), %rax
	je	.L803
.L583:
	movq	-56(%rax), %rcx
	cmpq	%rcx, -48(%rax)
	je	.L804
.L584:
	movq	%rbx, %rcx
	call	_Z11parseQuotesR7token_t
.LEHE17:
	movq	%rax, %rcx
	movq	%rax, %rbp
	call	strlen
	movl	$3, %edx
	cmpq	$1, %rax
	jne	.L585
	movsbw	0(%rbp), %ax
	movl	$1, %edx
	xorl	%ebp, %ebp
	movw	%ax, 78(%rsp)
.L585:
	movl	32(%rbx), %ecx
	xorl	%r13d, %r13d
	movq	104(%rsp), %rax
	movzbl	48(%rsp), %r11d
	movb	$0, 48(%rsp)
	movq	-48(%rax), %rax
	movl	%ecx, 196(%rsp)
	movb	%dl, 200(%rsp)
	movzwl	78(%rsp), %ecx
	movb	%r11b, 192(%rsp)
	movq	192(%rsp), %rdx
	movq	%rbp, 208(%rsp)
	movw	%cx, 216(%rsp)
	movq	%rdx, -32(%rax)
	movq	200(%rsp), %rdx
	movq	%rdx, -24(%rax)
	movq	208(%rsp), %rdx
	movq	%rdx, -16(%rax)
	movzwl	216(%rsp), %edx
	movw	%dx, -8(%rax)
	jmp	.L544
.L799:
	movq	$0, 48(%rsp)
	jmp	.L640
.L558:
	leaq	96(%rsp), %rbp
	leaq	192(%rsp), %r8
	movq	%rbp, %rcx
.LEHB18:
	call	_ZNSt6vectorI5arg_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
.LEHE18:
	movq	192(%rsp), %rcx
	jmp	.L564
.L790:
	leaq	94(%rsp), %rdx
	movq	%rbx, %rcx
	leaq	95(%rsp), %r8
.LEHB19:
	call	_Z9parseTypeR7token_tRbS1_
	jmp	.L544
.L674:
	movq	$0, 40(%rsp)
	movl	$98, %r12d
	movb	$0, 56(%rsp)
	jmp	.L543
.L795:
	cmpb	$0, 94(%rsp)
	jne	.L588
	cmpb	$0, 95(%rsp)
	jne	.L588
.L589:
	cmpb	$0, 48(%rsp)
	jne	.L805
.L590:
	movq	96(%rsp), %rax
	cmpq	%rax, 104(%rsp)
	je	.L806
.L591:
	movq	24(%rbx), %rax
	leaq	operatorName(%rip), %rbp
	xorl	%edi, %edi
	movq	%rax, 64(%rsp)
	.p2align 4,,10
.L595:
	movq	0(%rbp,%rdi,8), %rdx
	movq	64(%rsp), %rcx
	call	strcmpi
	testl	%eax, %eax
	je	.L807
	addq	$1, %rdi
	cmpq	$10, %rdi
	jne	.L595
.L593:
	movq	24(%rbx), %r8
	leaq	192(%rsp), %rbp
	movq	224+errorMessage(%rip), %rdx
	movq	%rbp, %rcx
	call	_Z7sprintfPcPKcz
	movl	32(%rbx), %eax
	leaq	glerr(%rip), %rcx
	movq	%rbp, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	xorl	%edi, %edi
.L594:
	movq	104(%rsp), %rax
	movb	$0, 208(%rsp)
	movb	$0, 200(%rsp)
	movq	$0, 216(%rsp)
	movl	$0, 204(%rsp)
	movq	-48(%rax), %rdx
	movl	%edi, 192(%rsp)
	cmpq	-40(%rax), %rdx
	je	.L596
	movq	192(%rsp), %rcx
	addq	$40, %rdx
	movq	%rcx, -40(%rdx)
	movq	200(%rsp), %rcx
	movq	%rcx, -32(%rdx)
	movq	208(%rsp), %rcx
	movq	%rcx, -24(%rdx)
	movq	216(%rsp), %rcx
	movq	%rcx, -16(%rdx)
	movq	224(%rsp), %rcx
	movq	%rcx, -8(%rdx)
	movq	%rdx, -48(%rax)
.L597:
	movl	$3, %edi
	movl	$1, %r13d
	jmp	.L544
.L588:
	movq	240+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	32(%rbx), %eax
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	jmp	.L589
.L793:
	movq	104(%rsp), %rax
	cmpq	%rax, 96(%rsp)
	je	.L808
.L578:
	movq	-56(%rax), %rcx
	cmpq	%rcx, -48(%rax)
	je	.L809
.L579:
	movzbl	95(%rsp), %r9d
	leaq	128(%rsp), %rcx
	movq	%rbx, %rdx
	movzbl	94(%rsp), %r8d
	call	_Z11parseStringR7token_tbb
	movq	104(%rsp), %rax
	xorl	%r13d, %r13d
	movq	128(%rsp), %rdx
	movzbl	48(%rsp), %ecx
	movb	$0, 48(%rsp)
	movq	-48(%rax), %rax
	movq	%rdx, -32(%rax)
	movq	136(%rsp), %rdx
	movb	%cl, -32(%rax)
	movq	%rdx, -24(%rax)
	movq	144(%rsp), %rdx
	movq	%rdx, -16(%rax)
	movzwl	152(%rsp), %edx
	movw	%dx, -8(%rax)
	movl	32(%rbx), %edx
	movl	%edx, -28(%rax)
	movb	$0, 94(%rsp)
	movb	$0, 95(%rsp)
	jmp	.L544
.L792:
	cmpb	$0, 94(%rsp)
	jne	.L574
	cmpb	$0, 95(%rsp)
	jne	.L574
.L575:
	cmpb	$0, 48(%rsp)
	je	.L576
	movq	24+typeName(%rip), %r8
	leaq	192(%rsp), %rbp
	movq	248+errorMessage(%rip), %rdx
	movq	%rbp, %rcx
	call	_Z7sprintfPcPKcz
	movl	32(%rbx), %eax
	leaq	glerr(%rip), %rcx
	movq	%rbp, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
.L576:
	movq	216+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	32(%rbx), %eax
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	movzbl	36(%rbx), %eax
	jmp	.L573
.L574:
	movq	240+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	32(%rbx), %eax
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	jmp	.L575
.L797:
	cmpb	$0, 94(%rsp)
	jne	.L608
	cmpb	$0, 95(%rsp)
	je	.L609
.L608:
	movq	240+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	32(%rbx), %eax
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
.LEHE19:
.L609:
	cmpb	$0, 48(%rsp)
	jne	.L810
	xorl	%r13d, %r13d
.L774:
	movl	$4, %edi
	jmp	.L544
.L807:
	testl	%edi, %edi
	jne	.L594
	jmp	.L593
	.p2align 4,,10
.L796:
	movzbl	95(%rsp), %r9d
	leaq	160(%rsp), %rcx
	movq	%rbx, %rdx
	movq	$0, 192(%rsp)
	movzbl	94(%rsp), %r8d
	movb	$0, 216(%rsp)
	leaq	96(%rsp), %rbp
	movq	$0, 200(%rsp)
	movq	$0, 208(%rsp)
	movq	$0, 232(%rsp)
	movl	$0, 220(%rsp)
	movb	$0, 224(%rsp)
.LEHB20:
	call	_Z11parseStringR7token_tbb
	movq	160(%rsp), %rax
	movq	104(%rsp), %rcx
	cmpq	112(%rsp), %rcx
	movq	%rax, 216(%rsp)
	movq	168(%rsp), %rax
	movq	%rax, 224(%rsp)
	movq	176(%rsp), %rax
	movq	%rax, 232(%rsp)
	movzwl	184(%rsp), %eax
	movw	%ax, 240(%rsp)
	movzbl	48(%rsp), %eax
	movq	%rcx, 48(%rsp)
	movb	%al, 216(%rsp)
	movl	32(%rbx), %eax
	movl	%eax, 220(%rsp)
	je	.L599
	movq	200(%rsp), %rax
	movq	%rcx, %r10
	movabsq	$-3689348814741910323, %rdx
	subq	192(%rsp), %rax
	movq	$0, (%rcx)
	movq	$0, 8(%rcx)
	movq	$0, 16(%rcx)
	movq	%rax, 64(%rsp)
	sarq	$3, %rax
	imulq	%rdx, %rax
	testq	%rax, %rax
	je	.L601
	movabsq	$461168601842738790, %rdx
	leaq	96(%rsp), %rbp
	cmpq	%rdx, %rax
	ja	.L811
	movq	64(%rsp), %rcx
	call	_Znwy
.LEHE20:
	movq	104(%rsp), %r10
.L601:
	movq	64(%rsp), %rdx
	movq	48(%rsp), %rcx
	addq	%rax, %rdx
	movq	%rax, (%rcx)
	movq	%rax, 8(%rcx)
	movq	%rdx, 16(%rcx)
	movq	200(%rsp), %r9
	movq	192(%rsp), %rcx
	cmpq	%rcx, %r9
	je	.L603
	movq	%rcx, %rdx
	movq	%rax, %r8
.L604:
	movq	(%rdx), %r11
	addq	$40, %rdx
	addq	$40, %r8
	movq	%r11, -40(%r8)
	movq	-32(%rdx), %r11
	movq	%r11, -32(%r8)
	movq	-24(%rdx), %r11
	movq	%r11, -24(%r8)
	movq	-16(%rdx), %r11
	movq	%r11, -16(%r8)
	movq	-8(%rdx), %r11
	movq	%r11, -8(%r8)
	cmpq	%rdx, %r9
	jne	.L604
	leaq	-40(%r9), %rdx
	movabsq	$922337203685477581, %r11
	subq	%rcx, %rdx
	shrq	$3, %rdx
	imulq	%r11, %rdx
	movabsq	$2305843009213693951, %r11
	andq	%r11, %rdx
	leaq	5(%rdx,%rdx,4), %rdx
	leaq	(%rax,%rdx,8), %rax
.L603:
	movq	48(%rsp), %rdx
	addq	$56, %r10
	movq	%rax, 8(%rdx)
	movq	216(%rsp), %rax
	movq	%r10, 104(%rsp)
	movq	%rax, 24(%rdx)
	movq	224(%rsp), %rax
	movq	%rax, 32(%rdx)
	movq	232(%rsp), %rax
	movq	%rax, 40(%rdx)
	movq	240(%rsp), %rax
	movq	%rax, 48(%rdx)
.L605:
	testq	%rcx, %rcx
	movb	$0, 94(%rsp)
	movb	$0, 95(%rsp)
	je	.L621
.L776:
	call	_ZdlPv
.L621:
	movb	$0, 48(%rsp)
	jmp	.L544
.L798:
	cmpb	$0, 94(%rsp)
	jne	.L610
	cmpb	$0, 95(%rsp)
	je	.L611
.L610:
	movq	240+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	32(%rbx), %eax
	movl	%eax, 12+glerr(%rip)
.LEHB21:
	call	_Z5raiseR7error_t
.LEHE21:
.L611:
	movq	%rbx, %rcx
	movq	$0, 192(%rsp)
	movb	$0, 216(%rsp)
	leaq	96(%rsp), %rbp
	movq	$0, 200(%rsp)
	movq	$0, 208(%rsp)
	movq	$0, 232(%rsp)
	movl	$0, 220(%rsp)
	movb	$0, 224(%rsp)
.LEHB22:
	call	_Z11parseQuotesR7token_t
	movq	%rax, %rcx
	movq	%rax, %rbp
	call	strlen
	cmpq	$1, %rax
	je	.L812
	movb	$3, 224(%rsp)
	movq	%rbp, 232(%rsp)
.L613:
	movzbl	48(%rsp), %eax
	movq	104(%rsp), %rcx
	cmpq	112(%rsp), %rcx
	movb	%al, 216(%rsp)
	movl	32(%rbx), %eax
	movq	%rcx, 48(%rsp)
	movl	%eax, 220(%rsp)
	je	.L614
	movq	200(%rsp), %rax
	movq	%rcx, %r10
	movabsq	$-3689348814741910323, %rdx
	subq	192(%rsp), %rax
	movq	$0, (%rcx)
	movq	$0, 8(%rcx)
	movq	$0, 16(%rcx)
	movq	%rax, 64(%rsp)
	sarq	$3, %rax
	imulq	%rdx, %rax
	testq	%rax, %rax
	je	.L616
	movabsq	$461168601842738790, %rdx
	leaq	96(%rsp), %rbp
	cmpq	%rdx, %rax
	ja	.L813
	movq	64(%rsp), %rcx
	call	_Znwy
.LEHE22:
	movq	104(%rsp), %r10
.L616:
	movq	64(%rsp), %rdx
	movq	48(%rsp), %rcx
	addq	%rax, %rdx
	movq	%rax, (%rcx)
	movq	%rax, 8(%rcx)
	movq	%rdx, 16(%rcx)
	movq	200(%rsp), %r9
	movq	192(%rsp), %rcx
	cmpq	%rcx, %r9
	je	.L618
	movq	%rcx, %rdx
	movq	%rax, %r8
.L619:
	movq	(%rdx), %r11
	addq	$40, %rdx
	addq	$40, %r8
	movq	%r11, -40(%r8)
	movq	-32(%rdx), %r11
	movq	%r11, -32(%r8)
	movq	-24(%rdx), %r11
	movq	%r11, -24(%r8)
	movq	-16(%rdx), %r11
	movq	%r11, -16(%r8)
	movq	-8(%rdx), %r11
	movq	%r11, -8(%r8)
	cmpq	%rdx, %r9
	jne	.L619
	leaq	-40(%r9), %rdx
	movabsq	$922337203685477581, %r11
	subq	%rcx, %rdx
	shrq	$3, %rdx
	imulq	%r11, %rdx
	movabsq	$2305843009213693951, %r11
	andq	%r11, %rdx
	leaq	5(%rdx,%rdx,4), %rdx
	leaq	(%rax,%rdx,8), %rax
.L618:
	movq	48(%rsp), %rdx
	addq	$56, %r10
	movq	%rax, 8(%rdx)
	movq	216(%rsp), %rax
	movq	%r10, 104(%rsp)
	movq	%rax, 24(%rdx)
	movq	224(%rsp), %rax
	movq	%rax, 32(%rdx)
	movq	232(%rsp), %rax
	movq	%rax, 40(%rdx)
	movq	240(%rsp), %rax
	movq	%rax, 48(%rdx)
.L620:
	testq	%rcx, %rcx
	jne	.L776
	jmp	.L621
.L805:
	movq	24+typeName(%rip), %r8
	leaq	192(%rsp), %rbp
	movq	248+errorMessage(%rip), %rdx
	movq	%rbp, %rcx
	call	_Z7sprintfPcPKcz
	movl	32(%rbx), %eax
	leaq	glerr(%rip), %rcx
	movq	%rbp, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
.LEHB23:
	call	_Z5raiseR7error_t
	jmp	.L590
.L809:
	movq	232+errorMessage(%rip), %rdx
	leaq	192(%rsp), %rbp
	movl	$2, %r8d
	movq	%rbp, %rcx
	call	_Z7sprintfPcPKcz
	movl	32(%rbx), %eax
	leaq	glerr(%rip), %rcx
	movq	%rbp, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	jmp	.L579
.L681:
	movq	48(%rsp), %rsi
	jmp	.L642
.L804:
	movq	232+errorMessage(%rip), %rdx
	leaq	192(%rsp), %rbp
	movl	$2, %r8d
	movq	%rbp, %rcx
	call	_Z7sprintfPcPKcz
	movl	32(%rbx), %eax
	leaq	glerr(%rip), %rcx
	movq	%rbp, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	jmp	.L584
.L810:
	movq	40+typeName(%rip), %r8
	leaq	192(%rsp), %rbp
	movq	248+errorMessage(%rip), %rdx
	movq	%rbp, %rcx
	call	_Z7sprintfPcPKcz
	movl	32(%rbx), %eax
	leaq	glerr(%rip), %rcx
	movq	%rbp, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	jmp	.L774
.L806:
	movq	208+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	32(%rbx), %eax
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	jmp	.L591
.L808:
	movq	232+errorMessage(%rip), %rdx
	leaq	192(%rsp), %rbp
	movl	$1, %r8d
	movq	%rbp, %rcx
	call	_Z7sprintfPcPKcz
	movl	32(%rbx), %eax
	leaq	glerr(%rip), %rcx
	movq	%rbp, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	movq	104(%rsp), %rax
	jmp	.L578
.L596:
	leaq	-56(%rax), %rcx
	leaq	192(%rsp), %r8
	call	_ZNSt6vectorI11operation_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
.LEHE23:
	jmp	.L597
.L614:
	movq	48(%rsp), %rdx
	leaq	96(%rsp), %rbp
	leaq	192(%rsp), %r8
	movq	%rbp, %rcx
.LEHB24:
	call	_ZNSt6vectorI5arg_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
.LEHE24:
	movq	192(%rsp), %rcx
	jmp	.L620
.L812:
	movb	$1, 224(%rsp)
	movsbw	0(%rbp), %ax
	movw	%ax, 240(%rsp)
	jmp	.L613
.L803:
	movq	232+errorMessage(%rip), %rdx
	leaq	192(%rsp), %rbp
	movl	$1, %r8d
	movq	%rbp, %rcx
	call	_Z7sprintfPcPKcz
	movl	32(%rbx), %eax
	leaq	glerr(%rip), %rcx
	movq	%rbp, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
.LEHB25:
	call	_Z5raiseR7error_t
.LEHE25:
	movq	104(%rsp), %rax
	jmp	.L583
.L599:
	movq	48(%rsp), %rdx
	leaq	96(%rsp), %rbp
	leaq	192(%rsp), %r8
	movq	%rbp, %rcx
.LEHB26:
	call	_ZNSt6vectorI5arg_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	movq	192(%rsp), %rcx
	jmp	.L605
.L811:
	call	_ZSt17__throw_bad_allocv
.LEHE26:
.L813:
.LEHB27:
	call	_ZSt17__throw_bad_allocv
.LEHE27:
.L801:
.LEHB28:
	call	_ZSt17__throw_bad_allocv
.LEHE28:
.L800:
.LEHB29:
	call	_ZSt17__throw_bad_allocv
.LEHE29:
.L688:
	movq	%rax, %rbx
.L658:
	leaq	192(%rsp), %rcx
	call	_ZNSt6vectorI5arg_tSaIS0_EED1Ev
	leaq	96(%rsp), %rbp
.L667:
	movq	%rbp, %rcx
	call	_ZNSt6vectorI5arg_tSaIS0_EED1Ev
	movq	%rbx, %rcx
.LEHB30:
	call	_Unwind_Resume
.LEHE30:
.L686:
.L778:
	movq	192(%rsp), %rcx
	movq	%rax, %rbx
	testq	%rcx, %rcx
	je	.L667
	call	_ZdlPv
	jmp	.L667
.L687:
	leaq	96(%rsp), %rbp
	movq	%rax, %rbx
	jmp	.L667
.L684:
	jmp	.L778
.L683:
	jmp	.L778
.L685:
	jmp	.L778
.L690:
	movq	%rax, %rcx
	call	__cxa_begin_catch
	movq	48(%rsp), %rbx
.L655:
	cmpq	%rsi, %rbx
	jne	.L814
.LEHB31:
	call	__cxa_rethrow
.LEHE31:
.L814:
	movq	(%rbx), %rcx
	testq	%rcx, %rcx
	je	.L654
	call	_ZdlPv
.L654:
	addq	$56, %rbx
	jmp	.L655
.L689:
	movq	%rax, %rbx
	call	__cxa_end_catch
	cmpq	$0, 48(%rsp)
	je	.L658
	movq	48(%rsp), %rcx
	call	_ZdlPv
	jmp	.L658
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
	.align 4
.LLSDA1008:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT1008-.LLSDATTD1008
.LLSDATTD1008:
	.byte	0x1
	.uleb128 .LLSDACSE1008-.LLSDACSB1008
.LLSDACSB1008:
	.uleb128 .LEHB12-.LFB1008
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L687-.LFB1008
	.uleb128 0
	.uleb128 .LEHB13-.LFB1008
	.uleb128 .LEHE13-.LEHB13
	.uleb128 .L688-.LFB1008
	.uleb128 0
	.uleb128 .LEHB14-.LFB1008
	.uleb128 .LEHE14-.LEHB14
	.uleb128 .L690-.LFB1008
	.uleb128 0x1
	.uleb128 .LEHB15-.LFB1008
	.uleb128 .LEHE15-.LEHB15
	.uleb128 .L687-.LFB1008
	.uleb128 0
	.uleb128 .LEHB16-.LFB1008
	.uleb128 .LEHE16-.LEHB16
	.uleb128 .L686-.LFB1008
	.uleb128 0
	.uleb128 .LEHB17-.LFB1008
	.uleb128 .LEHE17-.LEHB17
	.uleb128 .L687-.LFB1008
	.uleb128 0
	.uleb128 .LEHB18-.LFB1008
	.uleb128 .LEHE18-.LEHB18
	.uleb128 .L683-.LFB1008
	.uleb128 0
	.uleb128 .LEHB19-.LFB1008
	.uleb128 .LEHE19-.LEHB19
	.uleb128 .L687-.LFB1008
	.uleb128 0
	.uleb128 .LEHB20-.LFB1008
	.uleb128 .LEHE20-.LEHB20
	.uleb128 .L684-.LFB1008
	.uleb128 0
	.uleb128 .LEHB21-.LFB1008
	.uleb128 .LEHE21-.LEHB21
	.uleb128 .L687-.LFB1008
	.uleb128 0
	.uleb128 .LEHB22-.LFB1008
	.uleb128 .LEHE22-.LEHB22
	.uleb128 .L685-.LFB1008
	.uleb128 0
	.uleb128 .LEHB23-.LFB1008
	.uleb128 .LEHE23-.LEHB23
	.uleb128 .L687-.LFB1008
	.uleb128 0
	.uleb128 .LEHB24-.LFB1008
	.uleb128 .LEHE24-.LEHB24
	.uleb128 .L685-.LFB1008
	.uleb128 0
	.uleb128 .LEHB25-.LFB1008
	.uleb128 .LEHE25-.LEHB25
	.uleb128 .L687-.LFB1008
	.uleb128 0
	.uleb128 .LEHB26-.LFB1008
	.uleb128 .LEHE26-.LEHB26
	.uleb128 .L684-.LFB1008
	.uleb128 0
	.uleb128 .LEHB27-.LFB1008
	.uleb128 .LEHE27-.LEHB27
	.uleb128 .L685-.LFB1008
	.uleb128 0
	.uleb128 .LEHB28-.LFB1008
	.uleb128 .LEHE28-.LEHB28
	.uleb128 .L690-.LFB1008
	.uleb128 0x1
	.uleb128 .LEHB29-.LFB1008
	.uleb128 .LEHE29-.LEHB29
	.uleb128 .L688-.LFB1008
	.uleb128 0
	.uleb128 .LEHB30-.LFB1008
	.uleb128 .LEHE30-.LEHB30
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB31-.LFB1008
	.uleb128 .LEHE31-.LEHB31
	.uleb128 .L689-.LFB1008
	.uleb128 0
.LLSDACSE1008:
	.byte	0x1
	.byte	0
	.align 4
	.long	0

.LLSDATT1008:
	.text
	.seh_endproc
	.p2align 4,,15
	.globl	_Z16assembleArgumentRSt6vectorI5var_tSaIS0_EER5arg_tbbb
	.def	_Z16assembleArgumentRSt6vectorI5var_tSaIS0_EER5arg_tbbb;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z16assembleArgumentRSt6vectorI5var_tSaIS0_EER5arg_tbbb
_Z16assembleArgumentRSt6vectorI5var_tSaIS0_EER5arg_tbbb:
.LFB1023:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$328, %rsp
	.seh_stackalloc	328
	.seh_endprologue
	movl	440(%rsp), %eax
	movl	432(%rsp), %edi
	movq	%rcx, %rsi
	movb	$0, 24(%rcx)
	movq	%r8, %rbx
	movq	$0, (%rcx)
	movq	$0, 8(%rcx)
	movq	$0, 16(%rcx)
	movq	$0, 40(%rcx)
	movl	$0, 28(%rcx)
	movb	$0, 32(%rcx)
	xorl	%ecx, %ecx
	movl	%eax, 60(%rsp)
	movb	%al, 59(%rsp)
	movw	%cx, 56(%rsi)
	movzbl	32(%r8), %eax
	movq	%rdx, 408(%rsp)
	cmpb	$3, %al
	je	.L923
	cmpb	$4, %al
	jbe	.L822
	testb	%dil, %dil
	jne	.L924
.L817:
	movq	8(%rbx), %rax
	cmpq	%rax, (%rbx)
	je	.L819
	movzbl	32(%rbx), %edx
	leaq	dataName(%rip), %rax
	leaq	64(%rsp), %rdi
	movq	%rdi, %rcx
	movq	(%rax,%rdx,8), %r8
	movq	200+errorMessage(%rip), %rdx
	call	_Z7sprintfPcPKcz
	movl	28(%rbx), %eax
	leaq	glerr(%rip), %rcx
	movq	%rdi, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
.LEHB32:
	call	_Z5raiseR7error_t
.L819:
	cmpb	$0, 24(%rbx)
	je	.L820
	movzbl	32(%rbx), %edx
	leaq	dataName(%rip), %rax
	leaq	64(%rsp), %rdi
	movq	%rdi, %rcx
	movq	(%rax,%rdx,8), %r8
	movq	248+errorMessage(%rip), %rdx
	call	_Z7sprintfPcPKcz
	movl	28(%rbx), %eax
	leaq	glerr(%rip), %rcx
	movq	%rdi, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
.L820:
	movq	%rbx, %rdx
	movq	%rsi, %rcx
	call	_ZNSt6vectorI11operation_tSaIS0_EEaSERKS2_
	movq	24(%rbx), %rax
	movq	%rax, 24(%rsi)
	movq	32(%rbx), %rax
	movq	%rax, 32(%rsi)
	movq	40(%rbx), %rax
	movq	%rax, 40(%rsi)
	movzwl	48(%rbx), %eax
	movw	%ax, 48(%rsi)
.L815:
	movq	%rsi, %rax
	addq	$328, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
.L822:
	je	.L925
	testb	%al, %al
	je	.L926
.L831:
	subl	$1, %eax
	cmpb	$1, %al
	ja	.L848
	movq	24(%rbx), %rax
	movq	%rax, 24(%rsi)
	movq	32(%rbx), %rax
	movq	%rax, 32(%rsi)
	movq	40(%rbx), %rax
	movq	%rax, 40(%rsi)
	movzwl	48(%rbx), %eax
	movw	%ax, 48(%rsi)
.L848:
	movabsq	$-3689348814741910323, %rcx
	movq	(%rbx), %rdx
	xorl	%edi, %edi
	movq	8(%rbx), %rax
	subq	%rdx, %rax
	sarq	$3, %rax
	imulq	%rcx, %rax
	testl	%eax, %eax
	je	.L868
	leaq	64(%rsp), %rax
	movq	%rcx, 40(%rsp)
	movq	%rax, 48(%rsp)
	jmp	.L849
	.p2align 4,,10
.L850:
	testb	%al, %al
	je	.L927
	movq	48(%rsp), %r14
	leaq	dataName(%rip), %rcx
	movq	(%rcx,%rax,8), %r8
	movq	200+errorMessage(%rip), %rdx
	movq	%r14, %rcx
	call	_Z7sprintfPcPKcz
	movl	28(%rbx), %eax
	leaq	glerr(%rip), %rcx
	movq	%r14, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
.L851:
	movq	(%rbx), %rdx
	addl	$1, %edi
	movq	8(%rbx), %rax
	subq	%rdx, %rax
	sarq	$3, %rax
	imulq	40(%rsp), %rax
	cmpl	%eax, %edi
	jnb	.L868
.L849:
	movl	%edi, %r12d
	leaq	(%r12,%r12,4), %rax
	leaq	(%rdx,%rax,8), %rbp
	movzbl	16(%rbp), %eax
	leal	-1(%rax), %edx
	cmpb	$1, %dl
	ja	.L850
	movl	0(%rbp), %ecx
	leaq	24(%rsi), %rdx
	leaq	8(%rbp), %r8
	call	_Z5applyN11operation_t10operator_tER6data_tS2_
	jmp	.L851
	.p2align 4,,10
.L923:
	cmpb	$1, %r9b
	jne	.L887
	testb	%dil, %dil
	je	.L817
.L887:
	movq	24+dataName(%rip), %r8
	leaq	64(%rsp), %rdi
.L922:
	movq	320+errorMessage(%rip), %rdx
	movq	%rdi, %rcx
	call	_Z7sprintfPcPKcz
	movl	28(%rbx), %eax
	leaq	glerr(%rip), %rcx
	movq	%rdi, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	jmp	.L817
	.p2align 4,,10
.L926:
	movq	408(%rsp), %rax
	movq	40(%r8), %r12
	movq	(%rax), %rdi
	movq	8(%rax), %rbp
	cmpq	%rdi, %rbp
	jne	.L834
	jmp	.L832
	.p2align 4,,10
.L928:
	addq	$16, %rdi
	cmpq	%rdi, %rbp
	je	.L832
.L834:
	movq	(%rdi), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L928
	movzbl	12(%rdi), %eax
	movb	%al, 32(%rsi)
	movzwl	10(%rdi), %eax
	movw	%ax, 48(%rsi)
	movl	28(%rbx), %eax
	movl	%eax, 28(%rsi)
	movzbl	24(%rbx), %eax
	movb	%al, 24(%rsi)
	movzbl	32(%rbx), %eax
	jmp	.L831
	.p2align 4,,10
.L927:
	movq	408(%rsp), %rax
	movq	24(%rbp), %r14
	movq	(%rax), %r8
	movq	8(%rax), %r13
	cmpq	%r13, %r8
	je	.L853
	movq	%r8, %r15
	jmp	.L855
	.p2align 4,,10
.L929:
	addq	$16, %r15
	cmpq	%r15, %r13
	je	.L853
.L855:
	movq	(%r15), %rdx
	movq	%r14, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L929
	movq	$0, 80(%rsp)
	movl	28(%rbx), %eax
	leaq	24(%rsi), %rdx
	movq	48(%rsp), %r8
	movl	%eax, 68(%rsp)
	movzbl	24(%rbx), %eax
	movb	%al, 64(%rsp)
	movzbl	12(%r15), %eax
	movb	%al, 72(%rsp)
	movzwl	10(%r15), %eax
	movl	0(%rbp), %ecx
	movw	%ax, 88(%rsp)
	call	_Z5applyN11operation_t10operator_tER6data_tS2_
	jmp	.L851
	.p2align 4,,10
.L868:
	movzbl	32(%rsi), %eax
	movb	%al, 57(%rsi)
	jmp	.L815
	.p2align 4,,10
.L925:
	movq	8(%r8), %rax
	cmpq	%rax, (%r8)
	je	.L828
	movq	32+dataName(%rip), %r8
	leaq	64(%rsp), %rbp
	movq	200+errorMessage(%rip), %rdx
	movq	%rbp, %rcx
	call	_Z7sprintfPcPKcz
	movl	28(%rbx), %eax
	leaq	glerr(%rip), %rcx
	movq	%rbp, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
.L828:
	cmpb	$0, 24(%rbx)
	jne	.L930
.L829:
	movl	28(%rbx), %eax
	testb	%dil, %dil
	movl	%eax, 28(%rsi)
	movzwl	48(%rbx), %eax
	movb	$4, 32(%rsi)
	movw	%ax, 48(%rsi)
	sete	%al
	addl	$1, %eax
	movb	%al, 57(%rsi)
	jmp	.L815
	.p2align 4,,10
.L924:
	leaq	dataName(%rip), %rdx
	leaq	64(%rsp), %rdi
	movq	(%rdx,%rax,8), %r8
	jmp	.L922
.L930:
	movzbl	32(%rbx), %edx
	leaq	dataName(%rip), %rax
	leaq	64(%rsp), %rbp
	movq	%rbp, %rcx
	movq	(%rax,%rdx,8), %r8
	movq	248+errorMessage(%rip), %rdx
	call	_Z7sprintfPcPKcz
	movl	28(%rbx), %eax
	leaq	glerr(%rip), %rcx
	movq	%rbp, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	jmp	.L829
	.p2align 4,,10
.L853:
	cmpb	$0, 60(%rsp)
	je	.L931
.L880:
	movabsq	$-3689348814741910323, %r15
	movl	$513, %eax
	movw	%ax, 56(%rsi)
	movq	(%rbx), %rdx
	movq	8(%rbx), %rax
	subq	%rdx, %rax
	sarq	$3, %rax
	imulq	%r15, %rax
	cmpl	%eax, %edi
	jnb	.L815
	leaq	64(%rsp), %r14
	movq	%r15, 40(%rsp)
	jmp	.L867
	.p2align 4,,10
.L857:
	leal	-1(%rax), %edx
	cmpb	$1, %dl
	jbe	.L916
	leaq	dataName(%rip), %rcx
	movq	200+errorMessage(%rip), %rdx
	movq	(%rcx,%rax,8), %r8
	movq	%r14, %rcx
	call	_Z7sprintfPcPKcz
	movl	28(%rbx), %eax
	leaq	glerr(%rip), %rcx
	movq	%r14, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
.L864:
	movq	(%rbx), %rdx
	addl	$1, %edi
	movq	8(%rbx), %rax
	subq	%rdx, %rax
	sarq	$3, %rax
	imulq	40(%rsp), %rax
	cmpl	%eax, %edi
	jnb	.L815
	movl	%edi, %r12d
.L867:
	leaq	(%r12,%r12,4), %rax
	leaq	(%rdx,%rax,8), %rbp
	movzbl	16(%rbp), %eax
	testb	%al, %al
	jne	.L857
	movq	408(%rsp), %rax
	movq	24(%rbp), %r13
	movq	(%rax), %r8
	movq	8(%rax), %r12
	cmpq	%r12, %r8
	je	.L858
	movq	%r8, %r15
	jmp	.L860
	.p2align 4,,10
.L932:
	addq	$16, %r15
	cmpq	%r15, %r12
	je	.L858
.L860:
	movq	(%r15), %rdx
	movq	%r13, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L932
	movb	$0, 80(%rsp)
	movq	8(%rsi), %rdx
	movl	$0, 76(%rsp)
	movl	12(%rbp), %eax
	movb	$0, 72(%rsp)
	cmpq	16(%rsi), %rdx
	movl	$0, 64(%rsp)
	movq	$0, 88(%rsp)
	movl	%eax, 76(%rsp)
	movzbl	8(%rbp), %eax
	movb	%al, 72(%rsp)
	movzbl	12(%r15), %eax
	movb	%al, 80(%rsp)
	movzwl	10(%r15), %eax
	movw	%ax, 96(%rsp)
	movl	0(%rbp), %eax
	movl	%eax, 64(%rsp)
	je	.L933
	movq	64(%rsp), %rax
	addq	$40, %rdx
	movq	%rax, -40(%rdx)
	movq	72(%rsp), %rax
	movq	%rax, -32(%rdx)
	movq	80(%rsp), %rax
	movq	%rax, -24(%rdx)
	movq	88(%rsp), %rax
	movq	%rax, -16(%rdx)
	movq	96(%rsp), %rax
	movq	%rax, -8(%rdx)
	movq	%rdx, 8(%rsi)
	jmp	.L864
.L858:
	cmpb	$0, 59(%rsp)
	jne	.L916
	movq	368+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	12(%rbp), %eax
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
.L916:
	movq	8(%rsi), %rdx
	cmpq	16(%rsi), %rdx
	je	.L866
	movq	0(%rbp), %rax
	addq	$40, %rdx
	movq	%rax, -40(%rdx)
	movq	8(%rbp), %rax
	movq	%rax, -32(%rdx)
	movq	16(%rbp), %rax
	movq	%rax, -24(%rdx)
	movq	24(%rbp), %rax
	movq	%rax, -16(%rdx)
	movq	32(%rbp), %rax
	movq	%rax, -8(%rdx)
	movq	%rdx, 8(%rsi)
	jmp	.L864
	.p2align 4,,10
.L832:
	cmpb	$0, 60(%rsp)
	je	.L934
.L882:
	movq	24(%rbx), %rax
	leaq	64(%rsp), %r13
	movl	$513, %edx
	movq	%rax, 24(%rsi)
	movq	32(%rbx), %rax
	movq	%rax, 32(%rsi)
	movq	40(%rbx), %rax
	movq	%rax, 40(%rsi)
	movzwl	48(%rbx), %eax
	movw	%dx, 56(%rsi)
	movq	8(%rbx), %r14
	movq	(%rbx), %rdi
	movw	%ax, 48(%rsi)
	cmpq	%rdi, %r14
	jne	.L846
	jmp	.L815
	.p2align 4,,10
.L836:
	leal	-1(%rax), %edx
	cmpb	$1, %dl
	jbe	.L914
	leaq	dataName(%rip), %rcx
	movq	200+errorMessage(%rip), %rdx
	movq	(%rcx,%rax,8), %r8
	movq	%r13, %rcx
	call	_Z7sprintfPcPKcz
	movl	28(%rbx), %eax
	leaq	glerr(%rip), %rcx
	movq	%r13, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
.L843:
	addq	$40, %rdi
	cmpq	%rdi, %r14
	je	.L815
.L846:
	movzbl	16(%rdi), %eax
	testb	%al, %al
	jne	.L836
	movq	408(%rsp), %rax
	movq	24(%rdi), %r12
	movq	(%rax), %r8
	movq	8(%rax), %rbp
	cmpq	%rbp, %r8
	je	.L837
	movq	%r8, %r15
	jmp	.L839
	.p2align 4,,10
.L935:
	addq	$16, %r15
	cmpq	%r15, %rbp
	je	.L837
.L839:
	movq	(%r15), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L935
	movb	$0, 80(%rsp)
	movq	8(%rsi), %rdx
	movl	$0, 76(%rsp)
	movl	12(%rdi), %eax
	movb	$0, 72(%rsp)
	cmpq	16(%rsi), %rdx
	movl	$0, 64(%rsp)
	movq	$0, 88(%rsp)
	movl	%eax, 76(%rsp)
	movzbl	8(%rdi), %eax
	movb	%al, 72(%rsp)
	movzbl	12(%r15), %eax
	movb	%al, 80(%rsp)
	movzwl	10(%r15), %eax
	movw	%ax, 96(%rsp)
	movl	(%rdi), %eax
	movl	%eax, 64(%rsp)
	je	.L936
	movq	64(%rsp), %rax
	addq	$40, %rdx
	movq	%rax, -40(%rdx)
	movq	72(%rsp), %rax
	movq	%rax, -32(%rdx)
	movq	80(%rsp), %rax
	movq	%rax, -24(%rdx)
	movq	88(%rsp), %rax
	movq	%rax, -16(%rdx)
	movq	96(%rsp), %rax
	movq	%rax, -8(%rdx)
	movq	%rdx, 8(%rsi)
	jmp	.L843
.L837:
	cmpb	$0, 59(%rsp)
	jne	.L914
	movq	368+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	12(%rdi), %eax
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
.L914:
	movq	8(%rsi), %rdx
	cmpq	16(%rsi), %rdx
	je	.L845
	movq	(%rdi), %rax
	addq	$40, %rdx
	movq	%rax, -40(%rdx)
	movq	8(%rdi), %rax
	movq	%rax, -32(%rdx)
	movq	16(%rdi), %rax
	movq	%rax, -24(%rdx)
	movq	24(%rdi), %rax
	movq	%rax, -16(%rdx)
	movq	32(%rdi), %rax
	movq	%rax, -8(%rdx)
	movq	%rdx, 8(%rsi)
	jmp	.L843
.L845:
	movq	%rdi, %r8
	movq	%rsi, %rcx
	call	_ZNSt6vectorI11operation_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	jmp	.L843
.L866:
	movq	%rbp, %r8
	movq	%rsi, %rcx
	call	_ZNSt6vectorI11operation_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	jmp	.L864
.L934:
	movq	368+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	28(%rbx), %eax
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	jmp	.L882
.L931:
	movq	368+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	12(%rbp), %eax
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	jmp	.L880
.L933:
	movq	%r14, %r8
	movq	%rsi, %rcx
	call	_ZNSt6vectorI11operation_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	jmp	.L864
.L936:
	movq	%r13, %r8
	movq	%rsi, %rcx
	call	_ZNSt6vectorI11operation_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
.LEHE32:
	jmp	.L843
.L886:
	movq	(%rsi), %rcx
	movq	%rax, %rbx
	testq	%rcx, %rcx
	je	.L870
	call	_ZdlPv
.L870:
	movq	%rbx, %rcx
.LEHB33:
	call	_Unwind_Resume
	nop
.LEHE33:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA1023:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1023-.LLSDACSB1023
.LLSDACSB1023:
	.uleb128 .LEHB32-.LFB1023
	.uleb128 .LEHE32-.LEHB32
	.uleb128 .L886-.LFB1023
	.uleb128 0
	.uleb128 .LEHB33-.LFB1023
	.uleb128 .LEHE33-.LEHB33
	.uleb128 0
	.uleb128 0
.LLSDACSE1023:
	.text
	.seh_endproc
	.section	.text$_ZNSt6vectorI5asm_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"x"
	.linkonce discard
	.align 2
	.p2align 4,,15
	.globl	_ZNSt6vectorI5asm_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.def	_ZNSt6vectorI5asm_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorI5asm_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
_ZNSt6vectorI5asm_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_:
.LFB1458:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$72, %rsp
	.seh_stackalloc	72
	.seh_endprologue
	movq	8(%rcx), %rbp
	movq	(%rcx), %rdi
	movq	%rbp, %rax
	movq	%rdx, %r12
	movq	%rcx, 144(%rsp)
	movq	%r8, %r15
	subq	%rdi, %rax
	movq	%r12, %r13
	movq	%rdi, 32(%rsp)
	movabsq	$-6148914691236517205, %rdx
	sarq	$4, %rax
	subq	%rdi, %r13
	imulq	%rdx, %rax
	testq	%rax, %rax
	je	.L974
	leaq	(%rax,%rax), %rdi
	cmpq	%rdi, %rax
	movq	%rdi, 48(%rsp)
	jbe	.L1007
	movabsq	$384307168202282325, %rax
	movq	$-16, %rcx
	movq	%rax, 48(%rsp)
.L939:
.LEHB34:
	call	_Znwy
.LEHE34:
	movq	%rax, 40(%rsp)
.L940:
	movabsq	$7905747460161236407, %rdx
	movq	8(%r15), %r14
	movq	(%r15), %rsi
	addq	40(%rsp), %r13
	movq	%r14, %rbx
	subq	%rsi, %rbx
	movq	%rbx, %rax
	movq	$0, 0(%r13)
	sarq	$3, %rax
	movq	$0, 8(%r13)
	imulq	%rdx, %rax
	movq	$0, 16(%r13)
	testq	%rax, %rax
	je	.L1008
	movabsq	$329406144173384850, %rdx
	cmpq	%rdx, %rax
	ja	.L1009
	movq	%rbx, %rcx
.LEHB35:
	call	_Znwy
.LEHE35:
	movq	8(%r15), %r14
	movq	%rax, 56(%rsp)
	movq	(%r15), %rsi
.L942:
	movq	56(%rsp), %rax
	addq	%rax, %rbx
	cmpq	%r14, %rsi
	movq	%rax, 0(%r13)
	movq	%rax, 8(%r13)
	movq	%rbx, 16(%r13)
	je	.L978
	movq	%rax, %rbx
	.p2align 4,,10
.L950:
	movabsq	$-3689348814741910323, %rdx
	movq	8(%rsi), %rdi
	subq	(%rsi), %rdi
	movq	$0, (%rbx)
	movq	$0, 8(%rbx)
	movq	$0, 16(%rbx)
	movq	%rdi, %rax
	sarq	$3, %rax
	imulq	%rdx, %rax
	testq	%rax, %rax
	je	.L946
	movabsq	$461168601842738790, %rdx
	cmpq	%rdx, %rax
	ja	.L1010
	movq	%rdi, %rcx
.LEHB36:
	call	_Znwy
.L946:
	addq	%rax, %rdi
	movq	%rax, (%rbx)
	movq	%rax, 8(%rbx)
	movq	%rdi, 16(%rbx)
	movq	8(%rsi), %rdx
	movq	(%rsi), %r9
	cmpq	%r9, %rdx
	je	.L948
	movq	%r9, %rcx
	movq	%rax, %r8
	.p2align 4,,10
.L949:
	movq	(%rcx), %r10
	addq	$40, %rcx
	addq	$40, %r8
	movq	%r10, -40(%r8)
	movq	-32(%rcx), %r10
	movq	%r10, -32(%r8)
	movq	-24(%rcx), %r10
	movq	%r10, -24(%r8)
	movq	-16(%rcx), %r10
	movq	%r10, -16(%r8)
	movq	-8(%rcx), %r10
	movq	%r10, -8(%r8)
	cmpq	%rcx, %rdx
	jne	.L949
	movabsq	$922337203685477581, %rdi
	subq	$40, %rdx
	movabsq	$2305843009213693951, %rcx
	subq	%r9, %rdx
	shrq	$3, %rdx
	imulq	%rdi, %rdx
	andq	%rcx, %rdx
	leaq	5(%rdx,%rdx,4), %rdx
	leaq	(%rax,%rdx,8), %rax
.L948:
	movq	%rax, 8(%rbx)
	movq	24(%rsi), %rax
	addq	$56, %rsi
	addq	$56, %rbx
	movq	%rax, -32(%rbx)
	movq	-24(%rsi), %rax
	movq	%rax, -24(%rbx)
	movq	-16(%rsi), %rax
	movq	%rax, -16(%rbx)
	movq	-8(%rsi), %rax
	movq	%rax, -8(%rbx)
	cmpq	%rsi, %r14
	jne	.L950
.L944:
	movl	24(%r15), %eax
	movq	%rbx, 8(%r13)
	movq	32(%rsp), %rdi
	movl	%eax, 24(%r13)
	movq	32(%r15), %rax
	cmpq	%rdi, %r12
	movq	%rdi, %rdx
	movq	%rax, 32(%r13)
	movzwl	40(%r15), %eax
	movw	%ax, 40(%r13)
	movl	44(%r15), %eax
	movl	%eax, 44(%r13)
	movq	40(%rsp), %rax
	movq	%rax, %rbx
	je	.L952
	.p2align 4,,10
.L960:
	movq	$0, 8(%rax)
	addq	$48, %rdx
	addq	$48, %rax
	movq	$0, -32(%rax)
	movq	$0, -48(%rax)
	movq	-48(%rdx), %rcx
	movq	%rcx, -48(%rax)
	movq	-40(%rdx), %r8
	movq	$0, -48(%rdx)
	movq	-40(%rax), %rcx
	movq	%r8, -40(%rax)
	movq	-32(%rdx), %r8
	movq	%rcx, -40(%rdx)
	movq	-32(%rax), %rcx
	movq	%r8, -32(%rax)
	movq	%rcx, -32(%rdx)
	movl	-24(%rdx), %ecx
	movl	%ecx, -24(%rax)
	movq	-16(%rdx), %rcx
	movq	%rcx, -16(%rax)
	movzbl	-8(%rdx), %ecx
	movb	%cl, -8(%rax)
	movzbl	-7(%rdx), %ecx
	movb	%cl, -7(%rax)
	movl	-4(%rdx), %ecx
	movl	%ecx, -4(%rax)
	cmpq	%rdx, %r12
	jne	.L960
	leaq	-48(%r12), %rax
	subq	32(%rsp), %rax
	movabsq	$768614336404564651, %rdx
	shrq	$4, %rax
	imulq	%rdx, %rax
	movabsq	$1152921504606846975, %rdx
	andq	%rdx, %rax
	leaq	3(%rax,%rax,2), %rbx
	salq	$4, %rbx
	addq	40(%rsp), %rbx
.L952:
	addq	$48, %rbx
	cmpq	%rbp, %r12
	je	.L961
	movq	%r12, %rax
	movq	%rbx, %rdx
	.p2align 4,,10
.L962:
	movq	(%rax), %rcx
	movq	$0, (%rax)
	addq	$48, %rax
	addq	$48, %rdx
	movq	%rcx, -48(%rdx)
	movq	-40(%rax), %rcx
	movq	$0, -40(%rax)
	movq	%rcx, -40(%rdx)
	movq	-32(%rax), %rcx
	movq	$0, -32(%rax)
	movq	%rcx, -32(%rdx)
	movl	-24(%rax), %ecx
	movl	%ecx, -24(%rdx)
	movq	-16(%rax), %rcx
	movq	%rcx, -16(%rdx)
	movzbl	-8(%rax), %ecx
	movb	%cl, -8(%rdx)
	movzbl	-7(%rax), %ecx
	movb	%cl, -7(%rdx)
	movl	-4(%rax), %ecx
	movl	%ecx, -4(%rdx)
	cmpq	%rax, %rbp
	jne	.L962
	movabsq	$768614336404564651, %rdx
	movq	%rbp, %rax
	subq	%r12, %rax
	subq	$48, %rax
	shrq	$4, %rax
	imulq	%rdx, %rax
	movabsq	$1152921504606846975, %rdx
	andq	%rdx, %rax
	leaq	3(%rax,%rax,2), %rax
	salq	$4, %rax
	addq	%rax, %rbx
.L961:
	movq	32(%rsp), %rax
	cmpq	%rbp, %rax
	movq	%rax, %rdi
	je	.L970
	.p2align 4,,10
.L963:
	movq	8(%rdi), %r12
	movq	(%rdi), %rsi
	cmpq	%rsi, %r12
	je	.L966
	.p2align 4,,10
.L968:
	movq	(%rsi), %rcx
	testq	%rcx, %rcx
	je	.L967
	call	_ZdlPv
.L967:
	addq	$56, %rsi
	cmpq	%rsi, %r12
	jne	.L968
	movq	(%rdi), %rsi
.L966:
	testq	%rsi, %rsi
	je	.L969
	movq	%rsi, %rcx
	call	_ZdlPv
.L969:
	addq	$48, %rdi
	cmpq	%rbp, %rdi
	jne	.L963
.L970:
	cmpq	$0, 32(%rsp)
	je	.L965
	movq	32(%rsp), %rcx
	call	_ZdlPv
.L965:
	movq	144(%rsp), %rax
	movq	40(%rsp), %rdi
	movq	%rbx, 8(%rax)
	movq	%rdi, (%rax)
	movq	48(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	salq	$4, %rax
	addq	%rdi, %rax
	movq	144(%rsp), %rdi
	movq	%rax, 16(%rdi)
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
.L1007:
	movabsq	$384307168202282325, %rax
	cmpq	%rax, %rdi
	jbe	.L1011
	movq	$-16, %rcx
	movq	%rax, 48(%rsp)
	jmp	.L939
	.p2align 4,,10
.L974:
	movq	$1, 48(%rsp)
.L938:
	movq	48(%rsp), %rax
	leaq	(%rax,%rax,2), %rcx
	salq	$4, %rcx
	jmp	.L939
	.p2align 4,,10
.L1008:
	movq	$0, 56(%rsp)
	jmp	.L942
	.p2align 4,,10
.L978:
	movq	56(%rsp), %rbx
	jmp	.L944
.L1011:
	movq	$0, 40(%rsp)
	testq	%rdi, %rdi
	je	.L940
	jmp	.L938
.L1010:
	call	_ZSt17__throw_bad_allocv
.LEHE36:
.L1009:
.LEHB37:
	call	_ZSt17__throw_bad_allocv
.LEHE37:
.L980:
.L959:
	movq	%rax, %rcx
	call	__cxa_begin_catch
	cmpq	$0, 40(%rsp)
	je	.L1012
	movq	40(%rsp), %rcx
	call	_ZdlPv
.L973:
.LEHB38:
	call	__cxa_rethrow
.LEHE38:
.L983:
	movq	%rax, %rcx
	call	__cxa_begin_catch
	movq	56(%rsp), %rsi
.L956:
	cmpq	%rbx, %rsi
	jne	.L1013
.LEHB39:
	call	__cxa_rethrow
.LEHE39:
.L1012:
	movq	%r13, %rcx
	call	_ZNSt6vectorI5arg_tSaIS0_EED1Ev
	jmp	.L973
.L981:
	movq	%rax, %rbx
	call	__cxa_end_catch
	movq	%rbx, %rcx
.LEHB40:
	call	_Unwind_Resume
.LEHE40:
.L1013:
	movq	(%rsi), %rcx
	testq	%rcx, %rcx
	je	.L955
	call	_ZdlPv
.L955:
	addq	$56, %rsi
	jmp	.L956
.L982:
	movq	%rax, %rbx
	call	__cxa_end_catch
	movq	0(%r13), %rcx
	testq	%rcx, %rcx
	je	.L958
	call	_ZdlPv
.L958:
	movq	%rbx, %rax
	jmp	.L959
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
	.align 4
.LLSDA1458:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT1458-.LLSDATTD1458
.LLSDATTD1458:
	.byte	0x1
	.uleb128 .LLSDACSE1458-.LLSDACSB1458
.LLSDACSB1458:
	.uleb128 .LEHB34-.LFB1458
	.uleb128 .LEHE34-.LEHB34
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB35-.LFB1458
	.uleb128 .LEHE35-.LEHB35
	.uleb128 .L980-.LFB1458
	.uleb128 0x1
	.uleb128 .LEHB36-.LFB1458
	.uleb128 .LEHE36-.LEHB36
	.uleb128 .L983-.LFB1458
	.uleb128 0x1
	.uleb128 .LEHB37-.LFB1458
	.uleb128 .LEHE37-.LEHB37
	.uleb128 .L980-.LFB1458
	.uleb128 0x1
	.uleb128 .LEHB38-.LFB1458
	.uleb128 .LEHE38-.LEHB38
	.uleb128 .L981-.LFB1458
	.uleb128 0
	.uleb128 .LEHB39-.LFB1458
	.uleb128 .LEHE39-.LEHB39
	.uleb128 .L982-.LFB1458
	.uleb128 0x3
	.uleb128 .LEHB40-.LFB1458
	.uleb128 .LEHE40-.LEHB40
	.uleb128 0
	.uleb128 0
.LLSDACSE1458:
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x7d
	.align 4
	.long	0

.LLSDATT1458:
	.section	.text$_ZNSt6vectorI5asm_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"x"
	.linkonce discard
	.seh_endproc
	.text
	.p2align 4,,15
	.globl	_Z14translateTokenRSt6vectorI5asm_tSaIS0_EER7token_t
	.def	_Z14translateTokenRSt6vectorI5asm_tSaIS0_EER7token_t;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z14translateTokenRSt6vectorI5asm_tSaIS0_EER7token_t
_Z14translateTokenRSt6vectorI5asm_tSaIS0_EER7token_t:
.LFB1018:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$104, %rsp
	.seh_stackalloc	104
	.seh_endprologue
	movq	8(%rdx), %rax
	movq	(%rdx), %r12
	leaq	48(%rsp), %rdi
	movq	%rcx, %r13
	movq	%rax, 40(%rsp)
	cmpq	%rax, %r12
	movq	%rdi, 32(%rsp)
	je	.L1014
	.p2align 4,,10
.L1022:
	movq	32(%rsp), %rcx
	movq	%r12, %rdx
.LEHB41:
	call	_Z13translateLineR7token_t
.LEHE41:
	cmpb	$0, 88(%rsp)
	je	.L1072
	movq	8(%r13), %rbp
	cmpq	16(%r13), %rbp
	je	.L1024
	movq	56(%rsp), %rbx
	xorl	%r14d, %r14d
	movabsq	$7905747460161236407, %rdi
	movq	$0, 8(%rbp)
	subq	48(%rsp), %rbx
	movq	$0, 16(%rbp)
	movq	$0, 0(%rbp)
	movq	%rbx, %rax
	sarq	$3, %rax
	imulq	%rdi, %rax
	testq	%rax, %rax
	je	.L1026
	movabsq	$329406144173384850, %rdx
	cmpq	%rdx, %rax
	ja	.L1073
	movq	%rbx, %rcx
.LEHB42:
	call	_Znwy
.LEHE42:
	movq	%rax, %r14
.L1026:
	addq	%r14, %rbx
	movq	%r14, 0(%rbp)
	movq	%r14, %rsi
	movq	%r14, 8(%rbp)
	movq	56(%rsp), %r15
	movq	%rbx, 16(%rbp)
	movq	48(%rsp), %rbx
	cmpq	%rbx, %r15
	je	.L1028
	.p2align 4,,10
.L1034:
	movabsq	$-3689348814741910323, %rdx
	movq	8(%rbx), %rdi
	subq	(%rbx), %rdi
	movq	$0, (%rsi)
	movq	$0, 8(%rsi)
	movq	$0, 16(%rsi)
	movq	%rdi, %rax
	sarq	$3, %rax
	imulq	%rdx, %rax
	testq	%rax, %rax
	je	.L1030
	movabsq	$461168601842738790, %rcx
	cmpq	%rcx, %rax
	ja	.L1074
	movq	%rdi, %rcx
.LEHB43:
	call	_Znwy
.LEHE43:
.L1030:
	addq	%rax, %rdi
	movq	%rax, (%rsi)
	movq	%rax, 8(%rsi)
	movq	%rdi, 16(%rsi)
	movq	8(%rbx), %rdx
	movq	(%rbx), %r9
	cmpq	%r9, %rdx
	je	.L1032
	movq	%r9, %rcx
	movq	%rax, %r8
	.p2align 4,,10
.L1033:
	movq	(%rcx), %r10
	addq	$40, %rcx
	addq	$40, %r8
	movq	%r10, -40(%r8)
	movq	-32(%rcx), %r10
	movq	%r10, -32(%r8)
	movq	-24(%rcx), %r10
	movq	%r10, -24(%r8)
	movq	-16(%rcx), %r10
	movq	%r10, -16(%r8)
	movq	-8(%rcx), %r10
	movq	%r10, -8(%r8)
	cmpq	%rcx, %rdx
	jne	.L1033
	movabsq	$922337203685477581, %rdi
	subq	$40, %rdx
	movabsq	$2305843009213693951, %rcx
	subq	%r9, %rdx
	shrq	$3, %rdx
	imulq	%rdi, %rdx
	andq	%rcx, %rdx
	leaq	5(%rdx,%rdx,4), %rdx
	leaq	(%rax,%rdx,8), %rax
.L1032:
	movq	%rax, 8(%rsi)
	movq	24(%rbx), %rax
	addq	$56, %rbx
	addq	$56, %rsi
	movq	%rax, -32(%rsi)
	movq	-24(%rbx), %rax
	movq	%rax, -24(%rsi)
	movq	-16(%rbx), %rax
	movq	%rax, -16(%rsi)
	movq	-8(%rbx), %rax
	movq	%rax, -8(%rsi)
	cmpq	%rbx, %r15
	jne	.L1034
	movq	48(%rsp), %rbx
.L1028:
	movl	72(%rsp), %eax
	movq	%rsi, 8(%rbp)
	movl	%eax, 24(%rbp)
	movq	80(%rsp), %rax
	movq	%rax, 32(%rbp)
	movzbl	88(%rsp), %eax
	movb	%al, 40(%rbp)
	movzbl	89(%rsp), %eax
	movb	%al, 41(%rbp)
	movl	92(%rsp), %eax
	movl	%eax, 44(%rbp)
	addq	$48, 8(%r13)
.L1035:
	movq	56(%rsp), %rsi
	cmpq	%rbx, %rsi
	je	.L1043
	.p2align 4,,10
.L1045:
	movq	(%rbx), %rcx
	testq	%rcx, %rcx
	je	.L1044
	call	_ZdlPv
.L1044:
	addq	$56, %rbx
	cmpq	%rbx, %rsi
	jne	.L1045
	movq	48(%rsp), %rbx
.L1043:
	testq	%rbx, %rbx
	je	.L1021
	movq	%rbx, %rcx
	call	_ZdlPv
.L1021:
	addq	$40, %r12
	cmpq	%r12, 40(%rsp)
	jne	.L1022
.L1014:
	addq	$104, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
.L1072:
	movq	56(%rsp), %rbx
	movq	48(%rsp), %rsi
	cmpq	%rsi, %rbx
	je	.L1017
	.p2align 4,,10
.L1019:
	movq	(%rsi), %rcx
	testq	%rcx, %rcx
	je	.L1018
	call	_ZdlPv
.L1018:
	addq	$56, %rsi
	cmpq	%rsi, %rbx
	jne	.L1019
	movq	48(%rsp), %rsi
.L1017:
	testq	%rsi, %rsi
	je	.L1021
	movq	%rsi, %rcx
	call	_ZdlPv
	jmp	.L1021
	.p2align 4,,10
.L1024:
	movq	32(%rsp), %r8
	movq	%rbp, %rdx
	movq	%r13, %rcx
.LEHB44:
	call	_ZNSt6vectorI5asm_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
.LEHE44:
	movq	48(%rsp), %rbx
	jmp	.L1035
.L1074:
.LEHB45:
	call	_ZSt17__throw_bad_allocv
.LEHE45:
.L1073:
.LEHB46:
	call	_ZSt17__throw_bad_allocv
.LEHE46:
.L1048:
	movq	%rax, %rbx
.L1042:
	movq	32(%rsp), %rcx
	call	_ZNSt6vectorI5arg_tSaIS0_EED1Ev
	movq	%rbx, %rcx
.LEHB47:
	call	_Unwind_Resume
.LEHE47:
.L1050:
	movq	%rax, %rcx
	call	__cxa_begin_catch
.L1039:
	cmpq	%rsi, %r14
	jne	.L1075
.LEHB48:
	call	__cxa_rethrow
.LEHE48:
.L1075:
	movq	(%r14), %rcx
	testq	%rcx, %rcx
	je	.L1038
	call	_ZdlPv
.L1038:
	addq	$56, %r14
	jmp	.L1039
.L1049:
	movq	%rax, %rbx
	call	__cxa_end_catch
	movq	0(%rbp), %rcx
	testq	%rcx, %rcx
	je	.L1042
	call	_ZdlPv
	jmp	.L1042
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
	.align 4
.LLSDA1018:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT1018-.LLSDATTD1018
.LLSDATTD1018:
	.byte	0x1
	.uleb128 .LLSDACSE1018-.LLSDACSB1018
.LLSDACSB1018:
	.uleb128 .LEHB41-.LFB1018
	.uleb128 .LEHE41-.LEHB41
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB42-.LFB1018
	.uleb128 .LEHE42-.LEHB42
	.uleb128 .L1048-.LFB1018
	.uleb128 0
	.uleb128 .LEHB43-.LFB1018
	.uleb128 .LEHE43-.LEHB43
	.uleb128 .L1050-.LFB1018
	.uleb128 0x1
	.uleb128 .LEHB44-.LFB1018
	.uleb128 .LEHE44-.LEHB44
	.uleb128 .L1048-.LFB1018
	.uleb128 0
	.uleb128 .LEHB45-.LFB1018
	.uleb128 .LEHE45-.LEHB45
	.uleb128 .L1050-.LFB1018
	.uleb128 0x1
	.uleb128 .LEHB46-.LFB1018
	.uleb128 .LEHE46-.LEHB46
	.uleb128 .L1048-.LFB1018
	.uleb128 0
	.uleb128 .LEHB47-.LFB1018
	.uleb128 .LEHE47-.LEHB47
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB48-.LFB1018
	.uleb128 .LEHE48-.LEHB48
	.uleb128 .L1049-.LFB1018
	.uleb128 0
.LLSDACSE1018:
	.byte	0x1
	.byte	0
	.align 4
	.long	0

.LLSDATT1018:
	.text
	.seh_endproc
	.section	.text$_ZNSt6vectorI5lab_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"x"
	.linkonce discard
	.align 2
	.p2align 4,,15
	.globl	_ZNSt6vectorI5lab_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.def	_ZNSt6vectorI5lab_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorI5lab_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
_ZNSt6vectorI5lab_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_:
.LFB1487:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	8(%rcx), %r13
	movq	(%rcx), %rsi
	movq	%r13, %rax
	movq	%rdx, %r14
	movq	%rcx, %rbx
	subq	%rsi, %rax
	subq	%rsi, %r14
	movq	%rdx, %rdi
	sarq	$4, %rax
	movq	%r8, %r15
	testq	%rax, %rax
	je	.L1085
	leaq	(%rax,%rax), %rdx
	movq	$-16, %r12
	cmpq	%rdx, %rax
	jbe	.L1090
.L1078:
	movq	%r12, %rcx
	call	_Znwy
	movq	%rax, %rbp
	addq	%rax, %r12
.L1079:
	movzwl	8(%r15), %edx
	leaq	0(%rbp,%r14), %rax
	movq	%r13, %r9
	movq	(%r15), %rcx
	leaq	16(%rbp,%r14), %r10
	subq	%rdi, %r9
	cmpq	%rsi, %rdi
	leaq	(%r10,%r9), %r15
	movw	%dx, 8(%rax)
	movq	%rcx, (%rax)
	je	.L1080
	movq	%r14, %r8
	movq	%rsi, %rdx
	movq	%rbp, %rcx
	movq	%r10, 40(%rsp)
	movq	%r9, 32(%rsp)
	call	memmove
	cmpq	%r13, %rdi
	movq	32(%rsp), %r9
	movq	40(%rsp), %r10
	je	.L1084
.L1081:
	movq	%r9, %r8
	movq	%rdi, %rdx
	movq	%r10, %rcx
	call	memcpy
.L1083:
	testq	%rsi, %rsi
	jne	.L1084
.L1082:
	movq	%rbp, (%rbx)
	movq	%r15, 8(%rbx)
	movq	%r12, 16(%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
.L1084:
	movq	%rsi, %rcx
	call	_ZdlPv
	jmp	.L1082
	.p2align 4,,10
.L1090:
	movabsq	$1152921504606846975, %rax
	cmpq	%rax, %rdx
	ja	.L1078
	xorl	%r12d, %r12d
	xorl	%ebp, %ebp
	testq	%rdx, %rdx
	je	.L1079
	jmp	.L1077
	.p2align 4,,10
.L1080:
	cmpq	%r13, %rdi
	jne	.L1081
	jmp	.L1083
	.p2align 4,,10
.L1085:
	movl	$1, %edx
.L1077:
	salq	$4, %rdx
	movq	%rdx, %r12
	jmp	.L1078
	.seh_endproc
	.section	.text$_ZNSt6vectorI5unv_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"x"
	.linkonce discard
	.align 2
	.p2align 4,,15
	.globl	_ZNSt6vectorI5unv_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.def	_ZNSt6vectorI5unv_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorI5unv_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
_ZNSt6vectorI5unv_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_:
.LFB1497:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	8(%rcx), %rbx
	movq	(%rcx), %r12
	movq	%rbx, %rax
	movq	%rdx, %rdi
	movq	%rcx, %r14
	subq	%r12, %rax
	movq	%rdi, %rsi
	movq	%r8, %rbp
	sarq	$3, %rax
	subq	%r12, %rsi
	movabsq	$3353953467947191203, %rdx
	imulq	%rdx, %rax
	testq	%rax, %rax
	je	.L1114
	leaq	(%rax,%rax), %r13
	cmpq	%r13, %rax
	jbe	.L1134
	movq	$-16, %rcx
	movabsq	$209622091746699450, %r13
.L1093:
.LEHB49:
	call	_Znwy
.LEHE49:
	movq	%rax, %r15
.L1094:
	movzbl	0(%rbp), %eax
	addq	%r15, %rsi
	movabsq	$-3689348814741910323, %rdx
	movq	16(%rbp), %r8
	movq	$0, 8(%rsi)
	movq	8(%rbp), %r10
	movq	$0, 16(%rsi)
	movq	$0, 24(%rsi)
	movb	%al, (%rsi)
	movq	%r8, %rax
	subq	%r10, %rax
	movq	%rax, 40(%rsp)
	sarq	$3, %rax
	imulq	%rdx, %rax
	testq	%rax, %rax
	je	.L1096
	movabsq	$461168601842738790, %rdx
	cmpq	%rdx, %rax
	ja	.L1135
	movq	40(%rsp), %rcx
.LEHB50:
	call	_Znwy
	movq	16(%rbp), %r8
	movq	8(%rbp), %r10
.L1096:
	movq	40(%rsp), %rdx
	movq	%rax, 8(%rsi)
	movq	%rax, 16(%rsi)
	addq	%rax, %rdx
	cmpq	%r8, %r10
	movq	%rdx, 24(%rsi)
	je	.L1098
	movq	%r10, %rdx
	movq	%rax, %rcx
	.p2align 4,,10
.L1099:
	movq	(%rdx), %r9
	addq	$40, %rdx
	addq	$40, %rcx
	movq	%r9, -40(%rcx)
	movq	-32(%rdx), %r9
	movq	%r9, -32(%rcx)
	movq	-24(%rdx), %r9
	movq	%r9, -24(%rcx)
	movq	-16(%rdx), %r9
	movq	%r9, -16(%rcx)
	movq	-8(%rdx), %r9
	movq	%r9, -8(%rcx)
	cmpq	%rdx, %r8
	jne	.L1099
	leaq	-40(%r8), %rdx
	movabsq	$922337203685477581, %r8
	movabsq	$2305843009213693951, %rcx
	subq	%r10, %rdx
	shrq	$3, %rdx
	imulq	%r8, %rdx
	andq	%rcx, %rdx
	leaq	5(%rdx,%rdx,4), %rdx
	leaq	(%rax,%rdx,8), %rax
.L1098:
	movq	%rax, 16(%rsi)
	movq	32(%rbp), %rax
	cmpq	%r12, %rdi
	movq	%rax, 32(%rsi)
	movq	40(%rbp), %rax
	movq	%rax, 40(%rsi)
	movq	48(%rbp), %rax
	movq	%rax, 48(%rsi)
	movq	56(%rbp), %rax
	movq	%rax, 56(%rsi)
	movzwl	64(%rbp), %eax
	movw	%ax, 64(%rsi)
	movq	72(%rbp), %rax
	movq	%rax, 72(%rsi)
	movzwl	80(%rbp), %eax
	movw	%ax, 80(%rsi)
	movl	84(%rbp), %eax
	movl	%eax, 84(%rsi)
	je	.L1118
	movq	%r12, %rdx
	movq	%r15, %rax
	.p2align 4,,10
.L1101:
	movzbl	(%rdx), %ecx
	movq	$0, 16(%rax)
	addq	$88, %rdx
	addq	$88, %rax
	movq	$0, -64(%rax)
	movq	$0, -80(%rax)
	movb	%cl, -88(%rax)
	movq	-80(%rdx), %rcx
	movq	%rcx, -80(%rax)
	movq	-72(%rdx), %r8
	movq	$0, -80(%rdx)
	movq	-72(%rax), %rcx
	movq	%r8, -72(%rax)
	movq	-64(%rdx), %r8
	movq	%rcx, -72(%rdx)
	movq	-64(%rax), %rcx
	movq	%r8, -64(%rax)
	movq	%rcx, -64(%rdx)
	movq	-56(%rdx), %rcx
	movq	%rcx, -56(%rax)
	movq	-48(%rdx), %rcx
	movq	%rcx, -48(%rax)
	movq	-40(%rdx), %rcx
	movq	%rcx, -40(%rax)
	movq	-32(%rdx), %rcx
	movq	%rcx, -32(%rax)
	movzbl	-24(%rdx), %ecx
	movb	%cl, -24(%rax)
	movzbl	-23(%rdx), %ecx
	movb	%cl, -23(%rax)
	movq	-16(%rdx), %rcx
	movq	%rcx, -16(%rax)
	movzwl	-8(%rdx), %ecx
	movw	%cx, -8(%rax)
	movl	-4(%rdx), %ecx
	movl	%ecx, -4(%rax)
	cmpq	%rdx, %rdi
	jne	.L1101
	leaq	-88(%rdi), %rsi
	movabsq	$1048110458733497251, %rax
	subq	%r12, %rsi
	shrq	$3, %rsi
	imulq	%rax, %rsi
	movabsq	$2305843009213693951, %rax
	andq	%rax, %rsi
	addq	$1, %rsi
	imulq	$88, %rsi, %rsi
	addq	%r15, %rsi
.L1100:
	addq	$88, %rsi
	cmpq	%rbx, %rdi
	je	.L1102
	movq	%rdi, %rax
	movq	%rsi, %rdx
	.p2align 4,,10
.L1103:
	movzbl	(%rax), %ecx
	addq	$88, %rax
	addq	$88, %rdx
	movb	%cl, -88(%rdx)
	movq	-80(%rax), %rcx
	movq	$0, -80(%rax)
	movq	%rcx, -80(%rdx)
	movq	-72(%rax), %rcx
	movq	$0, -72(%rax)
	movq	%rcx, -72(%rdx)
	movq	-64(%rax), %rcx
	movq	$0, -64(%rax)
	movq	%rcx, -64(%rdx)
	movq	-56(%rax), %rcx
	movq	%rcx, -56(%rdx)
	movq	-48(%rax), %rcx
	movq	%rcx, -48(%rdx)
	movq	-40(%rax), %rcx
	movq	%rcx, -40(%rdx)
	movq	-32(%rax), %rcx
	movq	%rcx, -32(%rdx)
	movzbl	-24(%rax), %ecx
	movb	%cl, -24(%rdx)
	movzbl	-23(%rax), %ecx
	movb	%cl, -23(%rdx)
	movq	-16(%rax), %rcx
	movq	%rcx, -16(%rdx)
	movzwl	-8(%rax), %ecx
	movw	%cx, -8(%rdx)
	movl	-4(%rax), %ecx
	movl	%ecx, -4(%rdx)
	cmpq	%rax, %rbx
	jne	.L1103
	movabsq	$1048110458733497251, %rdx
	movq	%rbx, %rax
	subq	%rdi, %rax
	subq	$88, %rax
	shrq	$3, %rax
	imulq	%rdx, %rax
	movabsq	$2305843009213693951, %rdx
	andq	%rdx, %rax
	addq	$1, %rax
	imulq	$88, %rax, %rax
	addq	%rax, %rsi
.L1102:
	cmpq	%rbx, %r12
	movq	%r12, %rdi
	je	.L1108
	.p2align 4,,10
.L1104:
	movq	8(%rdi), %rcx
	testq	%rcx, %rcx
	je	.L1107
	call	_ZdlPv
.L1107:
	addq	$88, %rdi
	cmpq	%rbx, %rdi
	jne	.L1104
.L1108:
	testq	%r12, %r12
	je	.L1106
	movq	%r12, %rcx
	call	_ZdlPv
.L1106:
	imulq	$88, %r13, %r13
	movq	%r15, (%r14)
	movq	%rsi, 8(%r14)
	addq	%r13, %r15
	movq	%r15, 16(%r14)
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
.L1134:
	movabsq	$209622091746699450, %rax
	cmpq	%rax, %r13
	jbe	.L1136
	movq	$-16, %rcx
	movq	%rax, %r13
	jmp	.L1093
	.p2align 4,,10
.L1114:
	movl	$1, %r13d
.L1092:
	imulq	$88, %r13, %rcx
	jmp	.L1093
	.p2align 4,,10
.L1118:
	movq	%r15, %rsi
	jmp	.L1100
.L1136:
	xorl	%r15d, %r15d
	testq	%r13, %r13
	je	.L1094
	jmp	.L1092
.L1135:
	call	_ZSt17__throw_bad_allocv
.LEHE50:
.L1120:
	movq	%rax, %rcx
	call	__cxa_begin_catch
	testq	%r15, %r15
	je	.L1137
	movq	%r15, %rcx
	call	_ZdlPv
.L1113:
.LEHB51:
	call	__cxa_rethrow
.LEHE51:
.L1137:
	movq	8(%rsi), %rcx
	testq	%rcx, %rcx
	je	.L1113
	call	_ZdlPv
	jmp	.L1113
.L1121:
	movq	%rax, %rbx
	call	__cxa_end_catch
	movq	%rbx, %rcx
.LEHB52:
	call	_Unwind_Resume
	nop
.LEHE52:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
	.align 4
.LLSDA1497:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT1497-.LLSDATTD1497
.LLSDATTD1497:
	.byte	0x1
	.uleb128 .LLSDACSE1497-.LLSDACSB1497
.LLSDACSB1497:
	.uleb128 .LEHB49-.LFB1497
	.uleb128 .LEHE49-.LEHB49
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB50-.LFB1497
	.uleb128 .LEHE50-.LEHB50
	.uleb128 .L1120-.LFB1497
	.uleb128 0x1
	.uleb128 .LEHB51-.LFB1497
	.uleb128 .LEHE51-.LEHB51
	.uleb128 .L1121-.LFB1497
	.uleb128 0
	.uleb128 .LEHB52-.LFB1497
	.uleb128 .LEHE52-.LEHB52
	.uleb128 0
	.uleb128 0
.LLSDACSE1497:
	.byte	0x1
	.byte	0
	.align 4
	.long	0

.LLSDATT1497:
	.section	.text$_ZNSt6vectorI5unv_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"x"
	.linkonce discard
	.seh_endproc
	.section	.text$_ZNSt6vectorI5var_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"x"
	.linkonce discard
	.align 2
	.p2align 4,,15
	.globl	_ZNSt6vectorI5var_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.def	_ZNSt6vectorI5var_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorI5var_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
_ZNSt6vectorI5var_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_:
.LFB1500:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	8(%rcx), %r13
	movq	(%rcx), %rsi
	movq	%r13, %rax
	movq	%rdx, %r15
	movq	%rcx, %rbx
	subq	%rsi, %rax
	subq	%rsi, %r15
	movq	%rdx, %rdi
	sarq	$4, %rax
	movq	%r8, %r14
	testq	%rax, %rax
	je	.L1147
	leaq	(%rax,%rax), %rdx
	movq	$-16, %r12
	cmpq	%rdx, %rax
	jbe	.L1152
.L1140:
	movq	%r12, %rcx
	call	_Znwy
	movq	%rax, %rbp
	addq	%rax, %r12
.L1141:
	movzbl	12(%r14), %edx
	leaq	0(%rbp,%r15), %rax
	movq	%r13, %r9
	movl	8(%r14), %ecx
	leaq	16(%rbp,%r15), %r10
	subq	%rdi, %r9
	cmpq	%rsi, %rdi
	movq	(%r14), %r8
	leaq	(%r10,%r9), %r14
	movb	%dl, 12(%rax)
	movl	%ecx, 8(%rax)
	movq	%r8, (%rax)
	je	.L1142
	movq	%r15, %r8
	movq	%rsi, %rdx
	movq	%rbp, %rcx
	movq	%r10, 40(%rsp)
	movq	%r9, 32(%rsp)
	call	memmove
	cmpq	%r13, %rdi
	movq	32(%rsp), %r9
	movq	40(%rsp), %r10
	je	.L1146
.L1143:
	movq	%r9, %r8
	movq	%rdi, %rdx
	movq	%r10, %rcx
	call	memcpy
.L1145:
	testq	%rsi, %rsi
	jne	.L1146
.L1144:
	movq	%rbp, (%rbx)
	movq	%r14, 8(%rbx)
	movq	%r12, 16(%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
.L1146:
	movq	%rsi, %rcx
	call	_ZdlPv
	jmp	.L1144
	.p2align 4,,10
.L1152:
	movabsq	$1152921504606846975, %rax
	cmpq	%rax, %rdx
	ja	.L1140
	xorl	%r12d, %r12d
	xorl	%ebp, %ebp
	testq	%rdx, %rdx
	je	.L1141
	jmp	.L1139
	.p2align 4,,10
.L1142:
	cmpq	%r13, %rdi
	jne	.L1143
	jmp	.L1145
	.p2align 4,,10
.L1147:
	movl	$1, %edx
.L1139:
	salq	$4, %rdx
	movq	%rdx, %r12
	jmp	.L1140
	.seh_endproc
	.section	.text$_ZNSt6vectorIPcSaIS0_EE17_M_realloc_insertIJS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"x"
	.linkonce discard
	.align 2
	.p2align 4,,15
	.globl	_ZNSt6vectorIPcSaIS0_EE17_M_realloc_insertIJS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.def	_ZNSt6vectorIPcSaIS0_EE17_M_realloc_insertIJS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorIPcSaIS0_EE17_M_realloc_insertIJS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
_ZNSt6vectorIPcSaIS0_EE17_M_realloc_insertIJS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_:
.LFB1643:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	8(%rcx), %r13
	movq	(%rcx), %rsi
	movq	%r13, %rax
	movq	%rdx, %r14
	movq	%rcx, %rbx
	subq	%rsi, %rax
	subq	%rsi, %r14
	movq	%rdx, %rdi
	sarq	$3, %rax
	movq	%r8, %r15
	testq	%rax, %rax
	je	.L1162
	leaq	(%rax,%rax), %rdx
	movq	$-8, %r12
	cmpq	%rdx, %rax
	jbe	.L1167
.L1155:
	movq	%r12, %rcx
	call	_Znwy
	movq	%rax, %rbp
	addq	%rax, %r12
.L1156:
	movq	(%r15), %rax
	leaq	8(%rbp,%r14), %r10
	movq	%r13, %r9
	subq	%rdi, %r9
	cmpq	%rsi, %rdi
	leaq	(%r10,%r9), %r15
	movq	%rax, 0(%rbp,%r14)
	je	.L1157
	movq	%r14, %r8
	movq	%rsi, %rdx
	movq	%rbp, %rcx
	movq	%r10, 40(%rsp)
	movq	%r9, 32(%rsp)
	call	memmove
	cmpq	%r13, %rdi
	movq	32(%rsp), %r9
	movq	40(%rsp), %r10
	je	.L1161
.L1158:
	movq	%r9, %r8
	movq	%rdi, %rdx
	movq	%r10, %rcx
	call	memcpy
.L1160:
	testq	%rsi, %rsi
	jne	.L1161
.L1159:
	movq	%rbp, (%rbx)
	movq	%r15, 8(%rbx)
	movq	%r12, 16(%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
.L1161:
	movq	%rsi, %rcx
	call	_ZdlPv
	jmp	.L1159
	.p2align 4,,10
.L1167:
	movabsq	$2305843009213693951, %rax
	cmpq	%rax, %rdx
	ja	.L1155
	xorl	%r12d, %r12d
	xorl	%ebp, %ebp
	testq	%rdx, %rdx
	je	.L1156
	jmp	.L1154
	.p2align 4,,10
.L1157:
	cmpq	%r13, %rdi
	jne	.L1158
	jmp	.L1160
	.p2align 4,,10
.L1162:
	movl	$1, %edx
.L1154:
	leaq	0(,%rdx,8), %r12
	jmp	.L1155
	.seh_endproc
	.text
	.p2align 4,,15
	.globl	_Z11parseParamsiPPKc
	.def	_Z11parseParamsiPPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z11parseParamsiPPKc
_Z11parseParamsiPPKc:
.LFB993:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$296, %rsp
	.seh_stackalloc	296
	.seh_endprologue
	xorl	%eax, %eax
	cmpl	$1, %edx
	movq	%rcx, %rdi
	movq	$0, 8(%rcx)
	movq	$0, 16(%rcx)
	movq	$0, 24(%rcx)
	movw	%ax, (%rcx)
	movb	$0, 2(%rcx)
	movq	$0, 32(%rcx)
	movq	$0, 40(%rcx)
	jle	.L1205
	leal	-2(%rdx), %eax
	xorl	%ebp, %ebp
	movl	$63, %r15d
	leaq	8(%r8), %rbx
	leaq	16(%r8,%rax,8), %r12
	leaq	32(%rsp), %r14
	leaq	.L1176(%rip), %r13
	jmp	.L1187
	.p2align 4,,10
.L1208:
	cmpb	$45, (%rsi)
	je	.L1206
	movq	%rsi, 40(%rdi)
.L1183:
	addq	$8, %rbx
	cmpq	%r12, %rbx
	je	.L1207
.L1187:
	testb	%bpl, %bpl
	movq	(%rbx), %rsi
	je	.L1208
	cmpb	$1, %bpl
	je	.L1209
	movq	%rsi, 32(%rdi)
	xorl	%ebp, %ebp
.L1212:
	addq	$8, %rbx
	cmpq	%r12, %rbx
	jne	.L1187
.L1207:
	testb	%bpl, %bpl
	jne	.L1210
.L1170:
	cmpq	$0, 40(%rdi)
	je	.L1189
.L1192:
	cmpq	$0, 32(%rdi)
	je	.L1211
.L1168:
	movq	%rdi, %rax
	addq	$296, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
.L1206:
	cmpb	$0, 2(%rsi)
	jne	.L1173
.L1181:
	movzbl	1(%rsi), %r15d
	leal	-67(%r15), %eax
	cmpb	$52, %al
	ja	.L1174
	movzbl	%al, %eax
	movslq	0(%r13,%rax,4), %rax
	addq	%r13, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L1176:
	.long	.L1180-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1179-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1195-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1177-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1175-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1180-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1179-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1195-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1177-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1174-.L1176
	.long	.L1175-.L1176
	.text
	.p2align 4,,10
.L1209:
	movq	16(%rdi), %rdx
	movq	%rsi, 32(%rsp)
	cmpq	24(%rdi), %rdx
	je	.L1185
	movq	%rsi, (%rdx)
	addq	$8, %rdx
	xorl	%ebp, %ebp
	movq	%rdx, 16(%rdi)
	jmp	.L1212
	.p2align 4,,10
.L1195:
	movl	$1, %ebp
	jmp	.L1183
	.p2align 4,,10
.L1179:
	movb	$1, 1(%rdi)
	movzbl	1(%rsi), %r15d
	jmp	.L1183
	.p2align 4,,10
.L1180:
	movb	$1, 2(%rdi)
	movzbl	1(%rsi), %r15d
	movb	$1, colored(%rip)
	jmp	.L1183
	.p2align 4,,10
.L1175:
	movb	$1, (%rdi)
	movzbl	1(%rsi), %r15d
	jmp	.L1183
	.p2align 4,,10
.L1177:
	movl	$2, %ebp
	jmp	.L1183
	.p2align 4,,10
.L1174:
	movq	32+errorMessage(%rip), %rdx
	movq	%r14, %rcx
	movsbl	%r15b, %r8d
	call	_Z7sprintfPcPKcz
	leaq	glerr(%rip), %rcx
	movq	%r14, 16+glerr(%rip)
.LEHB53:
	call	_Z5raiseR7error_t
	movzbl	1(%rsi), %r15d
	jmp	.L1183
	.p2align 4,,10
.L1173:
	movq	16+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	call	_Z5raiseR7error_t
	jmp	.L1181
	.p2align 4,,10
.L1210:
	movq	8+errorMessage(%rip), %rdx
	leaq	32(%rsp), %rbx
	movsbl	%r15b, %r8d
	movq	%rbx, %rcx
	call	_Z7sprintfPcPKcz
	leaq	glerr(%rip), %rcx
	movq	%rbx, 16+glerr(%rip)
	call	_Z5raiseR7error_t
	cmpq	$0, 40(%rdi)
	jne	.L1192
.L1189:
	movq	40+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	call	_Z5raiseR7error_t
	cmpq	$0, 32(%rdi)
	jne	.L1168
	.p2align 4,,10
.L1211:
	movq	40(%rdi), %rcx
	movl	$1, %edx
	call	_Z17transformFilenamePcb
	movq	%rax, 32(%rdi)
	jmp	.L1168
	.p2align 4,,10
.L1205:
	movq	errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	call	_Z5raiseR7error_t
	jmp	.L1170
	.p2align 4,,10
.L1185:
	leaq	8(%rdi), %rcx
	movq	%r14, %r8
	call	_ZNSt6vectorIPcSaIS0_EE17_M_realloc_insertIJS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
.LEHE53:
	xorl	%ebp, %ebp
	jmp	.L1212
.L1196:
	movq	8(%rdi), %rcx
	movq	%rax, %rbx
	testq	%rcx, %rcx
	je	.L1194
	call	_ZdlPv
.L1194:
	movq	%rbx, %rcx
.LEHB54:
	call	_Unwind_Resume
	nop
.LEHE54:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA993:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE993-.LLSDACSB993
.LLSDACSB993:
	.uleb128 .LEHB53-.LFB993
	.uleb128 .LEHE53-.LEHB53
	.uleb128 .L1196-.LFB993
	.uleb128 0
	.uleb128 .LEHB54-.LFB993
	.uleb128 .LEHE54-.LEHB54
	.uleb128 0
	.uleb128 0
.LLSDACSE993:
	.text
	.seh_endproc
	.section	.text$_ZNSt6vectorI8stream_tSaIS0_EE17_M_realloc_insertIJS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"x"
	.linkonce discard
	.align 2
	.p2align 4,,15
	.globl	_ZNSt6vectorI8stream_tSaIS0_EE17_M_realloc_insertIJS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.def	_ZNSt6vectorI8stream_tSaIS0_EE17_M_realloc_insertIJS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorI8stream_tSaIS0_EE17_M_realloc_insertIJS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
_ZNSt6vectorI8stream_tSaIS0_EE17_M_realloc_insertIJS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_:
.LFB1791:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	8(%rcx), %r14
	movq	(%rcx), %rbx
	movq	%r14, %rax
	movq	%rdx, %r12
	movq	%rcx, %rsi
	subq	%rbx, %rax
	subq	%rbx, %rdx
	movq	%r8, %r15
	sarq	$5, %rax
	testq	%rax, %rax
	je	.L1226
	leaq	(%rax,%rax), %rcx
	movq	$-32, %rbp
	cmpq	%rcx, %rax
	jbe	.L1237
.L1215:
	movq	%rbp, %rcx
	movq	%rdx, 40(%rsp)
	call	_Znwy
	movq	40(%rsp), %rdx
	leaq	32(%rax), %r13
	movq	%rax, %rdi
	addq	%rax, %rbp
.L1216:
	leaq	(%rdi,%rdx), %rax
	movq	(%r15), %rdx
	cmpq	%rbx, %r12
	movq	$0, (%r15)
	movq	%rdx, (%rax)
	movq	8(%r15), %rdx
	movq	$0, 8(%r15)
	movq	%rdx, 8(%rax)
	movq	16(%r15), %rdx
	movq	$0, 16(%r15)
	movq	%rdx, 16(%rax)
	movl	24(%r15), %edx
	movl	%edx, 24(%rax)
	je	.L1217
	movq	%rbx, %r8
	movq	%rdi, %rax
	.p2align 4,,10
.L1218:
	movq	$0, 8(%rax)
	addq	$32, %r8
	addq	$32, %rax
	movq	$0, -16(%rax)
	movq	$0, -32(%rax)
	movq	-32(%r8), %rdx
	movq	%rdx, -32(%rax)
	movq	-24(%r8), %rcx
	movq	$0, -32(%r8)
	movq	-24(%rax), %rdx
	movq	%rcx, -24(%rax)
	movq	-16(%r8), %rcx
	movq	%rdx, -24(%r8)
	movq	-16(%rax), %rdx
	movq	%rcx, -16(%rax)
	movq	%rdx, -16(%r8)
	movl	-8(%r8), %edx
	movl	%edx, -8(%rax)
	cmpq	%r8, %r12
	jne	.L1218
	leaq	-32(%r12), %rax
	subq	%rbx, %rax
	andq	$-32, %rax
	leaq	64(%rdi,%rax), %r13
.L1217:
	cmpq	%r14, %r12
	je	.L1219
	movq	%r12, %rax
	movq	%r13, %r8
	.p2align 4,,10
.L1220:
	movq	(%rax), %rdx
	movq	$0, (%rax)
	addq	$32, %rax
	addq	$32, %r8
	movl	-8(%rax), %ecx
	movq	%rdx, -32(%r8)
	movq	-24(%rax), %rdx
	movq	$0, -24(%rax)
	movl	%ecx, -8(%r8)
	movq	%rdx, -24(%r8)
	movq	-16(%rax), %rdx
	movq	$0, -16(%rax)
	movq	%rdx, -16(%r8)
	cmpq	%rax, %r14
	jne	.L1220
	movq	%r14, %rax
	subq	%r12, %rax
	subq	$32, %rax
	andq	$-32, %rax
	leaq	32(%r13,%rax), %r13
.L1219:
	cmpq	%r14, %rbx
	movq	%rbx, %r12
	je	.L1225
	.p2align 4,,10
.L1221:
	movq	(%r12), %rcx
	testq	%rcx, %rcx
	je	.L1224
	call	_ZdlPv
.L1224:
	addq	$32, %r12
	cmpq	%r14, %r12
	jne	.L1221
.L1225:
	testq	%rbx, %rbx
	je	.L1223
	movq	%rbx, %rcx
	call	_ZdlPv
.L1223:
	movq	%rdi, (%rsi)
	movq	%r13, 8(%rsi)
	movq	%rbp, 16(%rsi)
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
.L1237:
	movabsq	$576460752303423487, %rax
	cmpq	%rax, %rcx
	ja	.L1215
	testq	%rcx, %rcx
	jne	.L1214
	movl	$32, %r13d
	xorl	%ebp, %ebp
	xorl	%edi, %edi
	jmp	.L1216
	.p2align 4,,10
.L1226:
	movl	$1, %ecx
.L1214:
	salq	$5, %rcx
	movq	%rcx, %rbp
	jmp	.L1215
	.seh_endproc
	.section	.text$_ZNSt6vectorI8stream_tSaIS0_EE12emplace_backIJS0_EEEvDpOT_,"x"
	.linkonce discard
	.align 2
	.p2align 4,,15
	.globl	_ZNSt6vectorI8stream_tSaIS0_EE12emplace_backIJS0_EEEvDpOT_
	.def	_ZNSt6vectorI8stream_tSaIS0_EE12emplace_backIJS0_EEEvDpOT_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorI8stream_tSaIS0_EE12emplace_backIJS0_EEEvDpOT_
_ZNSt6vectorI8stream_tSaIS0_EE12emplace_backIJS0_EEEvDpOT_:
.LFB1501:
	.seh_endprologue
	movq	8(%rcx), %rax
	cmpq	16(%rcx), %rax
	je	.L1239
	movq	$0, 8(%rax)
	addq	$32, %rax
	movq	$0, -16(%rax)
	movq	$0, -32(%rax)
	movq	(%rdx), %r8
	movq	%r8, -32(%rax)
	movq	8(%rdx), %r9
	movq	$0, (%rdx)
	movq	-24(%rax), %r8
	movq	%r9, -24(%rax)
	movq	16(%rdx), %r9
	movq	%r8, 8(%rdx)
	movq	-16(%rax), %r8
	movq	%r9, -16(%rax)
	movq	%r8, 16(%rdx)
	movl	24(%rdx), %edx
	movl	%edx, -8(%rax)
	movq	%rax, 8(%rcx)
	ret
	.p2align 4,,10
.L1239:
	movq	%rdx, %r8
	movq	%rax, %rdx
	jmp	_ZNSt6vectorI8stream_tSaIS0_EE17_M_realloc_insertIJS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.seh_endproc
	.text
	.p2align 4,,15
	.globl	_Z12assembleUnitR5crt_tR5asm_tRSt6vectorI5unv_tSaIS4_EE
	.def	_Z12assembleUnitR5crt_tR5asm_tRSt6vectorI5unv_tSaIS4_EE;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z12assembleUnitR5crt_tR5asm_tRSt6vectorI5unv_tSaIS4_EE
_Z12assembleUnitR5crt_tR5asm_tRSt6vectorI5unv_tSaIS4_EE:
.LFB1032:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$520, %rsp
	.seh_stackalloc	520
	.seh_endprologue
	cmpb	$0, 40(%rdx)
	movq	%rcx, %r14
	movq	%rdx, %rbx
	movq	%r8, %r13
	je	.L1242
	cmpb	$0, 41(%rdx)
	jne	.L1501
	movq	32(%rdx), %rax
	testq	%rax, %rax
	jne	.L1502
	movslq	24(%rdx), %rax
	cmpl	$83, %eax
	jg	.L1251
	xorl	%esi, %esi
	xorl	%edi, %edi
	movq	$0, 168(%rsp)
	movw	%si, 224(%rsp)
	movq	(%rdx), %rsi
	movw	%di, 240(%rsp)
	movq	8(%rdx), %rdi
	movq	$0, 176(%rsp)
	movq	$0, 184(%rsp)
	movb	$0, 192(%rsp)
	cmpq	%rdi, %rsi
	movb	$0, 200(%rsp)
	movq	$0, 208(%rsp)
	movl	$0, 196(%rsp)
	movb	$0, 160(%rsp)
	movq	$0, 232(%rsp)
	movl	$0, 244(%rsp)
	movq	%rdi, 56(%rsp)
	je	.L1252
	leaq	48(%rcx), %rdi
	xorl	%r11d, %r11d
	movb	$0, 72(%rsp)
	xorl	%r15d, %r15d
	leaq	168(%rsp), %rdx
	movq	%rdi, 64(%rsp)
	xorl	%edi, %edi
	movw	%r11w, 94(%rsp)
	leaq	96(%rsp), %rbp
	movq	%rdx, 80(%rsp)
	.p2align 4,,10
.L1273:
	subl	$64, %eax
	movq	64(%rsp), %rdx
	movq	%rsi, %r8
	movq	%rbp, %rcx
	cmpl	$8, %eax
	movl	$1, 40(%rsp)
	setbe	%al
	xorl	%r9d, %r9d
	movzbl	%al, %eax
	movl	%eax, 32(%rsp)
.LEHB55:
	call	_Z16assembleArgumentRSt6vectorI5var_tSaIS0_EER5arg_tbbb
.LEHE55:
	movzbl	128(%rsp), %eax
	testb	%al, %al
	je	.L1253
	cmpb	$0, 152(%rsp)
	jne	.L1253
	cmpb	$1, %al
	je	.L1503
	cmpb	$2, %al
	je	.L1504
	cmpb	$4, %al
	je	.L1505
	cmpb	$5, %al
	je	.L1506
	cmpb	$6, %al
	je	.L1507
	cmpb	$7, %al
	je	.L1508
	cmpb	$8, %al
	jne	.L1255
	cmpl	$9, %edi
	je	.L1382
	testl	%edi, %edi
	je	.L1382
	cmpl	$6, %edi
	jne	.L1255
	movb	$2, 72(%rsp)
	movl	$8, %edi
	jmp	.L1259
	.p2align 4,,10
.L1253:
	testl	%edi, %edi
	je	.L1509
.L1255:
	movslq	%edi, %rax
	movq	344+errorMessage(%rip), %rdx
	leaq	addrModeNames(%rip), %rcx
	movq	(%rcx,%rax,8), %r8
	leaq	256(%rsp), %r12
	movq	%r12, %rcx
	call	_Z7sprintfPcPKcz
	movl	124(%rsp), %eax
	leaq	glerr(%rip), %rcx
	movq	%r12, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
.LEHB56:
	call	_Z5raiseR7error_t
.LEHE56:
.L1259:
	movq	96(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L1271
	call	_ZdlPv
.L1271:
	addq	$56, %rsi
	cmpq	%rsi, 56(%rsp)
	movslq	24(%rbx), %rax
	jne	.L1273
	leaq	(%rax,%rax,2), %rdx
	movslq	%edi, %rcx
	leaq	(%rax,%rdx,4), %r8
	leaq	_ZL12opcodeMatrix(%rip), %rdx
	addq	%r8, %rdx
	movzbl	(%rdx,%rcx), %ebp
	cmpb	$3, %bpl
	je	.L1510
.L1276:
	movq	8(%r14), %rbx
	movq	-24(%rbx), %rsi
	cmpq	-16(%rbx), %rsi
	je	.L1281
	movb	%bpl, (%rsi)
	addq	$1, -24(%rbx)
.L1282:
	movl	76(%r14), %eax
	addl	$1, %eax
	testb	%r15b, %r15b
	movl	%eax, 76(%r14)
	jne	.L1511
	cmpb	$1, 72(%rsp)
	je	.L1512
	cmpb	$2, 72(%rsp)
	je	.L1513
.L1297:
	movq	168(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L1242
.L1492:
	call	_ZdlPv
	nop
.L1242:
	addq	$520, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
.L1502:
	movl	76(%rcx), %ecx
	movq	%rax, 256(%rsp)
	movq	32(%r14), %rdx
	cmpq	40(%r14), %rdx
	movw	%cx, 264(%rsp)
	je	.L1249
	movq	%rax, (%rdx)
	addq	$16, %rdx
	movw	%cx, -8(%rdx)
	movq	%rdx, 32(%r14)
	jmp	.L1242
	.p2align 4,,10
.L1251:
	cmpl	$89, %eax
	je	.L1514
	cmpl	$92, %eax
	je	.L1515
	cmpl	$94, %eax
	je	.L1516
	cmpl	$93, %eax
	je	.L1517
	cmpl	$85, %eax
	je	.L1518
	cmpl	$86, %eax
	jne	.L1242
	movq	8(%rdx), %rax
	movq	(%rdx), %rdi
	movq	%rax, 56(%rsp)
	cmpq	%rdi, %rax
	je	.L1519
.L1338:
	leaq	48(%r14), %rax
	leaq	256(%rsp), %r12
	movq	%rax, 64(%rsp)
	leaq	8(%r12), %rax
	leaq	160(%rsp), %r15
	movq	%rax, 72(%rsp)
	jmp	.L1356
	.p2align 4,,10
.L1340:
	cmpb	$1, %al
	je	.L1520
	cmpb	$2, %al
	je	.L1521
	cmpb	$3, %al
	je	.L1522
	movq	336+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	44(%rbx), %eax
	movl	%eax, 12+glerr(%rip)
.LEHB57:
	call	_Z5raiseR7error_t
.LEHE57:
	.p2align 4,,10
.L1349:
	movq	160(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L1355
	call	_ZdlPv
.L1355:
	addq	$56, %rdi
	cmpq	%rdi, 56(%rsp)
	je	.L1242
.L1356:
	movq	64(%rsp), %rdx
	movl	$1, %r9d
	movq	%rdi, %r8
	movq	%r15, %rcx
	movl	$1, 40(%rsp)
	movl	$0, 32(%rsp)
.LEHB58:
	call	_Z16assembleArgumentRSt6vectorI5var_tSaIS0_EER5arg_tbbb
.LEHE58:
	movzbl	192(%rsp), %eax
	testb	%al, %al
	je	.L1339
	cmpb	$0, 216(%rsp)
	je	.L1340
.L1339:
	movq	72(%rsp), %rcx
	xorl	%edx, %edx
	xorl	%eax, %eax
	movq	$0, 264(%rsp)
	movw	%dx, 336(%rsp)
	movq	%r15, %rdx
	movq	$0, 272(%rsp)
	movq	$0, 280(%rsp)
	movb	$0, 288(%rsp)
	movq	$0, 304(%rsp)
	movl	$0, 292(%rsp)
	movb	$0, 296(%rsp)
	movw	%ax, 320(%rsp)
	movb	$0, 256(%rsp)
	movq	$0, 328(%rsp)
	movl	$0, 340(%rsp)
.LEHB59:
	call	_ZNSt6vectorI11operation_tSaIS0_EEaSERKS2_
	movq	184(%rsp), %rax
	movq	8(%r14), %rcx
	movq	8(%r13), %rsi
	movq	%rax, 288(%rsp)
	movq	192(%rsp), %rax
	movq	%rax, 296(%rsp)
	movq	200(%rsp), %rax
	movq	%rax, 304(%rsp)
	movzwl	208(%rsp), %eax
	movw	%ax, 312(%rsp)
	movzwl	216(%rsp), %eax
	movw	%ax, 320(%rsp)
	movq	32(%r14), %rax
	subq	24(%r14), %rax
	movq	-24(%rcx), %rdx
	subq	-32(%rcx), %rdx
	sarq	$4, %rax
	movl	%eax, 340(%rsp)
	movq	%rcx, %rax
	subq	(%r14), %rax
	movl	%edx, 332(%rsp)
	sarq	$5, %rax
	subl	$1, %eax
	cmpq	16(%r13), %rsi
	movl	%eax, 328(%rsp)
	je	.L1341
	movzbl	256(%rsp), %eax
	movq	%rsi, %r10
	movabsq	$-3689348814741910323, %rdx
	movq	272(%rsp), %rbp
	subq	264(%rsp), %rbp
	movq	$0, 8(%rsi)
	movq	$0, 16(%rsi)
	movb	%al, (%rsi)
	movq	$0, 24(%rsi)
	movq	%rbp, %rax
	sarq	$3, %rax
	imulq	%rdx, %rax
	testq	%rax, %rax
	je	.L1343
	movabsq	$461168601842738790, %rdx
	cmpq	%rdx, %rax
	ja	.L1523
	movq	%rbp, %rcx
	call	_Znwy
	movq	8(%r13), %r10
	movq	8(%r14), %rcx
.L1343:
	addq	%rax, %rbp
	movq	%rax, 8(%rsi)
	movq	%rax, 16(%rsi)
	movq	%rbp, 24(%rsi)
	movq	272(%rsp), %r9
	movq	264(%rsp), %r11
	cmpq	%r11, %r9
	je	.L1345
	movq	%r11, %rdx
	movq	%rax, %r8
	.p2align 4,,10
.L1346:
	movq	(%rdx), %rbp
	addq	$40, %rdx
	addq	$40, %r8
	movq	%rbp, -40(%r8)
	movq	-32(%rdx), %rbp
	movq	%rbp, -32(%r8)
	movq	-24(%rdx), %rbp
	movq	%rbp, -24(%r8)
	movq	-16(%rdx), %rbp
	movq	%rbp, -16(%r8)
	movq	-8(%rdx), %rbp
	movq	%rbp, -8(%r8)
	cmpq	%rdx, %r9
	jne	.L1346
	leaq	-40(%r9), %rdx
	movabsq	$922337203685477581, %r8
	subq	%r11, %rdx
	shrq	$3, %rdx
	imulq	%r8, %rdx
	movabsq	$2305843009213693951, %r8
	andq	%r8, %rdx
	leaq	5(%rdx,%rdx,4), %rdx
	leaq	(%rax,%rdx,8), %rax
.L1345:
	movq	%rax, 16(%rsi)
	movq	288(%rsp), %rax
	addq	$88, %r10
	movq	%rax, 32(%rsi)
	movq	296(%rsp), %rax
	movq	%rax, 40(%rsi)
	movq	304(%rsp), %rax
	movq	%rax, 48(%rsi)
	movq	312(%rsp), %rax
	movq	%rax, 56(%rsi)
	movzbl	320(%rsp), %eax
	movb	%al, 64(%rsi)
	movzbl	321(%rsp), %eax
	movb	%al, 65(%rsi)
	movq	328(%rsp), %rax
	movq	%rax, 72(%rsi)
	movzwl	336(%rsp), %eax
	movw	%ax, 80(%rsi)
	movl	340(%rsp), %eax
	movl	%eax, 84(%rsi)
	movq	%r10, 8(%r13)
.L1347:
	leaq	96(%rsp), %rbp
	subq	$32, %rcx
	movb	$0, 96(%rsp)
	movq	%rbp, %rdx
	call	_ZNSt6vectorIhSaIhEE12emplace_backIJhEEEvDpOT_
	movq	8(%r14), %rax
	movq	%rbp, %rdx
	movb	$0, 96(%rsp)
	leaq	-32(%rax), %rcx
	call	_ZNSt6vectorIhSaIhEE12emplace_backIJhEEEvDpOT_
.LEHE59:
	movq	264(%rsp), %rcx
	addl	$2, 76(%r14)
	testq	%rcx, %rcx
	je	.L1349
	call	_ZdlPv
	jmp	.L1349
	.p2align 4,,10
.L1509:
	movl	24(%rbx), %eax
	subl	$64, %eax
	cmpl	$8, %eax
	jbe	.L1256
	movzbl	120(%rsp), %eax
	movzbl	153(%rsp), %r15d
	cmpb	$1, %al
	sbbl	%edi, %edi
	cmpb	$2, %r15b
	je	.L1524
	andl	$6, %edi
	addl	$3, %edi
.L1494:
	movq	80(%rsp), %rcx
	movq	%rbp, %rdx
.LEHB60:
	call	_ZNSt6vectorI11operation_tSaIS0_EEaSERKS2_
.LEHE60:
	movq	120(%rsp), %rax
	movq	%rax, 192(%rsp)
	movq	128(%rsp), %rax
	movq	%rax, 200(%rsp)
	movq	136(%rsp), %rax
	movq	%rax, 208(%rsp)
	movzwl	144(%rsp), %eax
	movw	%ax, 216(%rsp)
	movzwl	152(%rsp), %eax
	movw	%ax, 224(%rsp)
	movl	24(%rbx), %eax
	subl	$64, %eax
	cmpl	$8, %eax
	setbe	160(%rsp)
	jmp	.L1259
	.p2align 4,,10
.L1256:
	movb	$1, 153(%rsp)
	movl	$1, %r15d
	movl	$5, %edi
	jmp	.L1494
	.p2align 4,,10
.L1501:
	movq	$0, 256(%rsp)
	movl	76(%rcx), %eax
	movq	32(%rcx), %rdx
	cmpq	40(%rcx), %rdx
	movw	%ax, 264(%rsp)
	je	.L1249
	movq	$0, (%rdx)
	addq	$16, %rdx
	movw	%ax, -8(%rdx)
	movq	%rdx, 32(%rcx)
	jmp	.L1242
	.p2align 4,,10
.L1503:
	testl	%edi, %edi
	jne	.L1255
	cmpb	$1, 120(%rsp)
	movb	$1, 72(%rsp)
	movzwl	144(%rsp), %eax
	sbbl	%edi, %edi
	andl	$6, %edi
	movw	%ax, 94(%rsp)
	addl	$3, %edi
	jmp	.L1259
	.p2align 4,,10
.L1504:
	testl	%edi, %edi
	jne	.L1255
	cmpb	$1, 120(%rsp)
	movb	$2, 72(%rsp)
	movzwl	144(%rsp), %eax
	sbbl	%edi, %edi
	andl	$2, %edi
	movw	%ax, 94(%rsp)
	addl	$4, %edi
	jmp	.L1259
	.p2align 4,,10
.L1249:
	leaq	24(%r14), %rcx
	leaq	256(%rsp), %r8
.LEHB61:
	call	_ZNSt6vectorI5lab_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	jmp	.L1242
	.p2align 4,,10
.L1514:
	movq	(%rdx), %rax
	cmpq	%rax, 8(%rdx)
	je	.L1525
.L1303:
	movq	(%rbx), %rax
	movq	(%rax), %rdi
	cmpq	%rdi, 8(%rax)
	je	.L1526
.L1304:
	movl	28(%rax), %eax
	leaq	glerr(%rip), %rcx
	movq	328+errorMessage(%rip), %rdx
	movl	%eax, 12+glerr(%rip)
	movq	%rdx, 16+glerr(%rip)
	call	_Z5raiseR7error_t
	movq	(%rbx), %rax
.L1305:
	leaq	48(%r14), %rsi
	xorl	%r9d, %r9d
	movl	$0, 40(%rsp)
	leaq	56(%rax), %r8
	movq	%rsi, %rdx
	movl	$0, 32(%rsp)
	leaq	256(%rsp), %rcx
	call	_Z16assembleArgumentRSt6vectorI5var_tSaIS0_EER5arg_tbbb
.LEHE61:
	movq	(%rbx), %rax
	xorl	%r9d, %r9d
	movzwl	304(%rsp), %ecx
	movq	56(%r14), %rdx
	cmpq	64(%r14), %rdx
	movq	40(%rax), %r8
	movw	%r9w, 168(%rsp)
	movzbl	288(%rsp), %eax
	movw	%cx, 170(%rsp)
	movq	%r8, 160(%rsp)
	movb	%al, 172(%rsp)
	je	.L1306
	movq	%r8, (%rdx)
	xorl	%r8d, %r8d
	addq	$16, %rdx
	movw	%r8w, -8(%rdx)
	movw	%cx, -6(%rdx)
	movb	%al, -4(%rdx)
	movq	%rdx, 56(%r14)
.L1497:
	movq	256(%rsp), %rcx
	testq	%rcx, %rcx
	jne	.L1492
	jmp	.L1242
	.p2align 4,,10
.L1524:
	andl	$2, %edi
	addl	$4, %edi
	jmp	.L1494
	.p2align 4,,10
.L1511:
	movq	32(%r14), %rdx
	subq	24(%r14), %rdx
	movq	8(%r13), %rbx
	sarq	$4, %rdx
	movl	%edx, 244(%rsp)
	movzbl	%r15b, %edx
	addl	%edx, %eax
	movw	%ax, 240(%rsp)
	movq	8(%r14), %rax
	movq	-24(%rax), %rdx
	subq	-32(%rax), %rdx
	subq	(%r14), %rax
	movl	%edx, 236(%rsp)
	sarq	$5, %rax
	subl	$1, %eax
	cmpq	16(%r13), %rbx
	movl	%eax, 232(%rsp)
	je	.L1289
	movzbl	160(%rsp), %eax
	movq	%rbx, %r10
	movabsq	$-3689348814741910323, %rdx
	movq	176(%rsp), %rsi
	subq	168(%rsp), %rsi
	movq	$0, 8(%rbx)
	movq	$0, 16(%rbx)
	movb	%al, (%rbx)
	movq	$0, 24(%rbx)
	movq	%rsi, %rax
	sarq	$3, %rax
	imulq	%rdx, %rax
	testq	%rax, %rax
	je	.L1291
	movabsq	$461168601842738790, %rdx
	cmpq	%rdx, %rax
	ja	.L1527
	movq	%rsi, %rcx
.LEHB62:
	call	_Znwy
	movq	8(%r13), %r10
.L1291:
	addq	%rax, %rsi
	movq	%rax, 8(%rbx)
	movq	%rax, 16(%rbx)
	movq	%rsi, 24(%rbx)
	movq	176(%rsp), %r8
	movq	168(%rsp), %r11
	cmpq	%r11, %r8
	je	.L1293
	movq	%r11, %rdx
	movq	%rax, %rcx
	.p2align 4,,10
.L1294:
	movq	(%rdx), %r9
	addq	$40, %rdx
	addq	$40, %rcx
	movq	%r9, -40(%rcx)
	movq	-32(%rdx), %r9
	movq	%r9, -32(%rcx)
	movq	-24(%rdx), %r9
	movq	%r9, -24(%rcx)
	movq	-16(%rdx), %r9
	movq	%r9, -16(%rcx)
	movq	-8(%rdx), %r9
	movq	%r9, -8(%rcx)
	cmpq	%rdx, %r8
	jne	.L1294
	leaq	-40(%r8), %rdx
	movabsq	$922337203685477581, %rcx
	subq	%r11, %rdx
	shrq	$3, %rdx
	imulq	%rcx, %rdx
	movabsq	$2305843009213693951, %rcx
	andq	%rcx, %rdx
	leaq	5(%rdx,%rdx,4), %rdx
	leaq	(%rax,%rdx,8), %rax
.L1293:
	movq	%rax, 16(%rbx)
	movq	192(%rsp), %rax
	addq	$88, %r10
	movq	%rax, 32(%rbx)
	movq	200(%rsp), %rax
	movq	%rax, 40(%rbx)
	movq	208(%rsp), %rax
	movq	%rax, 48(%rbx)
	movq	216(%rsp), %rax
	movq	%rax, 56(%rbx)
	movzbl	224(%rsp), %eax
	movb	%al, 64(%rbx)
	movzbl	225(%rsp), %eax
	movb	%al, 65(%rbx)
	movq	232(%rsp), %rax
	movq	%rax, 72(%rbx)
	movzwl	240(%rsp), %eax
	movw	%ax, 80(%rbx)
	movl	244(%rsp), %eax
	movl	%eax, 84(%rbx)
	movq	%r10, 8(%r13)
.L1295:
	cmpb	$1, %r15b
	je	.L1528
	cmpb	$2, %r15b
	jne	.L1297
	movq	8(%r14), %rax
	leaq	256(%rsp), %rbx
	movb	$0, 256(%rsp)
	movq	%rbx, %rdx
	leaq	-32(%rax), %rcx
	call	_ZNSt6vectorIhSaIhEE12emplace_backIJhEEEvDpOT_
	movq	8(%r14), %rax
	movq	%rbx, %rdx
	movb	$0, 256(%rsp)
	leaq	-32(%rax), %rcx
	call	_ZNSt6vectorIhSaIhEE12emplace_backIJhEEEvDpOT_
.L1486:
	addl	$2, 76(%r14)
	jmp	.L1297
	.p2align 4,,10
.L1510:
	cmpl	$3, %edi
	je	.L1529
	cmpl	$9, %edi
	je	.L1530
	cmpl	$10, %edi
	je	.L1531
	cmpl	$11, %edi
	jne	.L1275
	movzbl	8(%rdx), %ebp
	.p2align 4,,10
.L1278:
	cmpb	$3, %bpl
	movb	$2, 72(%rsp)
	jne	.L1276
.L1275:
	leaq	addrModeNames(%rip), %rdx
	movslq	%edi, %rdi
	movq	(%rdx,%rdi,8), %r9
	leaq	instructionNames(%rip), %rdx
	movq	(%rdx,%rax,8), %r8
	leaq	256(%rsp), %rsi
	movq	360+errorMessage(%rip), %rdx
	movq	%rsi, %rcx
	call	_Z7sprintfPcPKcz
	movl	44(%rbx), %eax
	leaq	glerr(%rip), %rcx
	movq	%rsi, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
.LEHE62:
	movl	$3, %ebp
	jmp	.L1276
	.p2align 4,,10
.L1526:
	cmpb	$0, 32(%rax)
	je	.L1305
	jmp	.L1304
	.p2align 4,,10
.L1516:
	movq	(%rdx), %rax
	cmpq	%rax, 8(%rdx)
	je	.L1532
.L1315:
	movq	(%rbx), %r8
	movq	(%r8), %rax
	cmpq	%rax, 8(%r8)
	je	.L1533
.L1316:
	movq	336+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	28(%r8), %eax
	movl	%eax, 12+glerr(%rip)
.LEHB63:
	call	_Z5raiseR7error_t
	movq	(%rbx), %r8
.L1317:
	leaq	48(%r14), %rdx
	xorl	%r9d, %r9d
	movl	$0, 40(%rsp)
	leaq	256(%rsp), %rcx
	movl	$0, 32(%rsp)
	call	_Z16assembleArgumentRSt6vectorI5var_tSaIS0_EER5arg_tbbb
.LEHE63:
	movq	256(%rsp), %rcx
	movzwl	304(%rsp), %eax
	testq	%rcx, %rcx
	movl	%eax, 72(%r14)
	jne	.L1492
	jmp	.L1242
	.p2align 4,,10
.L1507:
	testl	%edi, %edi
	jne	.L1255
	movl	$2, %edi
	jmp	.L1259
	.p2align 4,,10
.L1529:
	movzbl	4(%rdx), %ebp
	jmp	.L1278
	.p2align 4,,10
.L1289:
	leaq	160(%rsp), %r8
	movq	%rbx, %rdx
	movq	%r13, %rcx
.LEHB64:
	call	_ZNSt6vectorI5unv_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
.LEHE64:
	jmp	.L1295
.L1525:
	movq	376+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	44(%rdx), %eax
	movl	%eax, 12+glerr(%rip)
.LEHB65:
	call	_Z5raiseR7error_t
	jmp	.L1303
	.p2align 4,,10
.L1505:
	testl	%edi, %edi
	jne	.L1255
	movl	24(%rbx), %eax
	xorl	%edi, %edi
	movzbl	153(%rsp), %r15d
	subl	$64, %eax
	cmpl	$8, %eax
	seta	%dil
	addl	$5, %edi
	jmp	.L1494
	.p2align 4,,10
.L1515:
	movq	(%rdx), %rax
	cmpq	%rax, 8(%rdx)
	je	.L1534
.L1310:
	movq	(%rbx), %r8
	movq	(%r8), %rax
	cmpq	%rax, 8(%r8)
	je	.L1535
.L1311:
	movq	336+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	28(%r8), %eax
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	movq	(%rbx), %r8
.L1312:
	leaq	48(%r14), %rdx
	xorl	%r9d, %r9d
	movl	$0, 40(%rsp)
	leaq	256(%rsp), %rcx
	movl	$0, 32(%rsp)
	call	_Z16assembleArgumentRSt6vectorI5var_tSaIS0_EER5arg_tbbb
.LEHE65:
	movq	256(%rsp), %rcx
	movzwl	304(%rsp), %eax
	testq	%rcx, %rcx
	movl	%eax, 76(%r14)
	jne	.L1492
	jmp	.L1242
	.p2align 4,,10
.L1506:
	testl	%edi, %edi
	jne	.L1255
	movl	$1, %edi
	jmp	.L1259
	.p2align 4,,10
.L1281:
	movq	-32(%rbx), %r12
	subq	%r12, %rsi
	cmpq	$-1, %rsi
	je	.L1536
	testq	%rsi, %rsi
	movl	$1, %edi
	je	.L1284
	leaq	(%rsi,%rsi), %rdi
	movq	$-1, %rax
	cmpq	%rdi, %rsi
	cmova	%rax, %rdi
.L1284:
	movq	%rdi, %rcx
.LEHB66:
	call	_Znwy
	addq	%rax, %rdi
	testq	%rsi, %rsi
	movq	%rax, %r9
	movb	%bpl, (%rax,%rsi)
	jne	.L1537
	leaq	1(%rax), %rsi
	testq	%r12, %r12
	jne	.L1286
.L1287:
	movq	%r9, -32(%rbx)
	movq	%rsi, -24(%rbx)
	movq	%rdi, -16(%rbx)
	jmp	.L1282
	.p2align 4,,10
.L1513:
	movq	8(%r14), %rax
	leaq	256(%rsp), %rbx
	movzwl	94(%rsp), %edi
	movq	%rbx, %rdx
	leaq	-32(%rax), %rcx
	movb	%dil, 256(%rsp)
	call	_ZNSt6vectorIhSaIhEE12emplace_backIJhEEEvDpOT_
	movq	8(%r14), %rax
	movq	%rbx, %rdx
	leaq	-32(%rax), %rcx
	movl	%edi, %eax
	movzbl	%ah, %eax
	movb	%al, 256(%rsp)
	call	_ZNSt6vectorIhSaIhEE12emplace_backIJhEEEvDpOT_
.LEHE66:
	jmp	.L1486
	.p2align 4,,10
.L1252:
	leaq	(%rax,%rax,2), %rdx
	xorl	%r10d, %r10d
	xorl	%r15d, %r15d
	leaq	(%rax,%rdx,4), %rdx
	movw	%r10w, 94(%rsp)
	leaq	_ZL12opcodeMatrix(%rip), %rcx
	movzbl	(%rcx,%rdx), %ebp
	cmpb	$3, %bpl
	je	.L1384
	movb	$0, 72(%rsp)
	jmp	.L1276
	.p2align 4,,10
.L1535:
	cmpb	$2, 32(%r8)
	jbe	.L1312
	jmp	.L1311
	.p2align 4,,10
.L1517:
	movq	(%rdx), %r8
	cmpq	%r8, 8(%rdx)
	je	.L1538
.L1320:
	movq	(%r8), %rax
	cmpq	%rax, 8(%r8)
	je	.L1539
.L1321:
	movq	336+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	28(%r8), %eax
	movl	%eax, 12+glerr(%rip)
.LEHB67:
	call	_Z5raiseR7error_t
	movq	(%rbx), %r8
.L1322:
	leaq	48(%r14), %rdx
	movl	$0, 40(%rsp)
	xorl	%r9d, %r9d
	leaq	256(%rsp), %rcx
	movl	$0, 32(%rsp)
	call	_Z16assembleArgumentRSt6vectorI5var_tSaIS0_EER5arg_tbbb
.LEHE67:
	leaq	160(%rsp), %rdx
	movq	%r14, %rcx
	movq	$0, 160(%rsp)
	movq	$0, 168(%rsp)
	movq	$0, 176(%rsp)
	movl	$0, 184(%rsp)
.LEHB68:
	call	_ZNSt6vectorI8stream_tSaIS0_EE12emplace_backIJS0_EEEvDpOT_
.LEHE68:
	movq	160(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L1323
	call	_ZdlPv
.L1323:
	movq	8(%r14), %rax
	movzwl	304(%rsp), %edx
	movl	%edx, -8(%rax)
	jmp	.L1497
.L1537:
	movq	%rsi, %r8
	movq	%r12, %rdx
	movq	%rax, %rcx
	call	memmove
	leaq	1(%rax,%rsi), %rsi
	movq	%rax, %r9
.L1286:
	movq	%r12, %rcx
	movq	%r9, 56(%rsp)
	call	_ZdlPv
	movq	56(%rsp), %r9
	jmp	.L1287
.L1508:
	testl	%edi, %edi
	je	.L1540
	cmpl	$9, %edi
	je	.L1380
	cmpl	$6, %edi
	jne	.L1255
	movb	$2, 72(%rsp)
	movl	$7, %edi
	jmp	.L1259
.L1512:
	movq	8(%r14), %rax
	leaq	256(%rsp), %rdx
	leaq	-32(%rax), %rcx
	movzbl	94(%rsp), %eax
	movb	%al, 256(%rsp)
.LEHB69:
	call	_ZNSt6vectorIhSaIhEE12emplace_backIJhEEEvDpOT_
.LEHE69:
.L1485:
	addl	$1, 76(%r14)
	jmp	.L1297
.L1530:
	movzbl	6(%rdx), %ebp
	jmp	.L1278
.L1533:
	cmpb	$2, 32(%r8)
	jbe	.L1317
	jmp	.L1316
.L1341:
	movq	%r12, %r8
	movq	%rsi, %rdx
	movq	%r13, %rcx
.LEHB70:
	call	_ZNSt6vectorI5unv_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
.LEHE70:
	movq	8(%r14), %rcx
	jmp	.L1347
.L1518:
	movq	8(%rdx), %r12
	movq	(%rdx), %rsi
	cmpq	%rsi, %r12
	je	.L1541
.L1326:
	leaq	48(%r14), %r13
	leaq	160(%rsp), %r15
	leaq	256(%rsp), %rbp
	jmp	.L1337
	.p2align 4,,10
.L1329:
	cmpb	$1, %al
	je	.L1542
	cmpb	$2, %al
	je	.L1488
	cmpb	$3, %al
	je	.L1543
	movq	336+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	44(%rbx), %eax
	movl	%eax, 12+glerr(%rip)
.LEHB71:
	call	_Z5raiseR7error_t
.LEHE71:
	.p2align 4,,10
.L1330:
	movq	160(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L1336
	call	_ZdlPv
.L1336:
	addq	$56, %rsi
	cmpq	%rsi, %r12
	je	.L1242
.L1337:
	movl	$1, 40(%rsp)
	movl	$1, %r9d
	movq	%rsi, %r8
	movq	%r13, %rdx
	movl	$0, 32(%rsp)
	movq	%r15, %rcx
.LEHB72:
	call	_Z16assembleArgumentRSt6vectorI5var_tSaIS0_EER5arg_tbbb
.LEHE72:
	movzbl	192(%rsp), %eax
	testb	%al, %al
	je	.L1488
	cmpb	$0, 216(%rsp)
	je	.L1329
.L1488:
	movq	16+dataName(%rip), %r8
	movq	%rbp, %rcx
	movq	144+errorMessage(%rip), %rdx
	call	_Z7sprintfPcPKcz
	movl	44(%rbx), %eax
	leaq	glerr(%rip), %rcx
	movq	%rbp, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
.LEHB73:
	call	_Z5raiseR7error_t
.LEHE73:
	jmp	.L1330
.L1306:
	leaq	160(%rsp), %r8
	movq	%rsi, %rcx
.LEHB74:
	call	_ZNSt6vectorI5var_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
.LEHE74:
	jmp	.L1497
.L1531:
	movzbl	7(%rdx), %ebp
	jmp	.L1278
.L1539:
	cmpb	$2, 32(%r8)
	jbe	.L1322
	jmp	.L1321
.L1534:
	movq	376+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	44(%rdx), %eax
	movl	%eax, 12+glerr(%rip)
.LEHB75:
	call	_Z5raiseR7error_t
.LEHE75:
	jmp	.L1310
.L1528:
	movq	8(%r14), %rax
	leaq	256(%rsp), %rdx
	movb	$0, 256(%rsp)
	leaq	-32(%rax), %rcx
.LEHB76:
	call	_ZNSt6vectorIhSaIhEE12emplace_backIJhEEEvDpOT_
.LEHE76:
	jmp	.L1485
.L1384:
	xorl	%edi, %edi
	movb	$0, 72(%rsp)
	jmp	.L1275
.L1542:
	movq	8(%r14), %rax
	movq	%rbp, %rdx
	leaq	-32(%rax), %rcx
	movzwl	208(%rsp), %eax
	movb	%al, 256(%rsp)
.LEHB77:
	call	_ZNSt6vectorIhSaIhEE12emplace_backIJhEEEvDpOT_
	addl	$1, 76(%r14)
	jmp	.L1330
.L1543:
	movq	200(%rsp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L1330
	movl	$1, %edi
	jmp	.L1335
	.p2align 4,,10
.L1544:
	movl	%edx, %edi
.L1335:
	movq	8(%r14), %rdx
	movb	%al, 256(%rsp)
	leaq	-32(%rdx), %rcx
	movq	%rbp, %rdx
	call	_ZNSt6vectorIhSaIhEE12emplace_backIJhEEEvDpOT_
.LEHE77:
	movq	200(%rsp), %rax
	leal	1(%rdi), %edx
	addl	$1, 76(%r14)
	movzbl	(%rax,%rdi), %eax
	testb	%al, %al
	jne	.L1544
	jmp	.L1330
.L1540:
	movl	24(%rbx), %eax
	subl	$79, %eax
	cmpl	$3, %eax
	sbbl	%edi, %edi
	addl	$1, %edi
	cmpl	$3, %eax
	movb	%dil, 72(%rsp)
	sbbl	%edi, %edi
	andl	$2, %edi
	addl	$10, %edi
	jmp	.L1259
.L1382:
	movb	$1, 72(%rsp)
	movl	$11, %edi
	jmp	.L1259
.L1532:
	movq	376+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	44(%rdx), %eax
	movl	%eax, 12+glerr(%rip)
.LEHB78:
	call	_Z5raiseR7error_t
.LEHE78:
	jmp	.L1315
.L1520:
	movq	8(%r14), %rax
	movq	%r12, %rdx
	leaq	-32(%rax), %rcx
	movzwl	208(%rsp), %eax
	movb	%al, 256(%rsp)
.LEHB79:
	call	_ZNSt6vectorIhSaIhEE12emplace_backIJhEEEvDpOT_
	movq	8(%r14), %rax
	movq	%r12, %rdx
	movb	$0, 256(%rsp)
	leaq	-32(%rax), %rcx
	call	_ZNSt6vectorIhSaIhEE12emplace_backIJhEEEvDpOT_
.L1489:
	addl	$2, 76(%r14)
	jmp	.L1349
.L1522:
	movq	200(%rsp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L1349
	movl	$1, %esi
	jmp	.L1354
	.p2align 4,,10
.L1545:
	movl	%edx, %esi
.L1354:
	movq	8(%r14), %rdx
	movb	%al, 256(%rsp)
	leaq	-32(%rdx), %rcx
	movq	%r12, %rdx
	call	_ZNSt6vectorIhSaIhEE12emplace_backIJhEEEvDpOT_
	movq	8(%r14), %rax
	movq	%r12, %rdx
	movb	$0, 256(%rsp)
	leaq	-32(%rax), %rcx
	call	_ZNSt6vectorIhSaIhEE12emplace_backIJhEEEvDpOT_
	movq	200(%rsp), %rax
	leal	1(%rsi), %edx
	addl	$1, 76(%r14)
	movzbl	(%rax,%rsi), %eax
	testb	%al, %al
	jne	.L1545
	jmp	.L1349
.L1521:
	movq	8(%r14), %rax
	movq	%r12, %rdx
	leaq	-32(%rax), %rcx
	movzwl	208(%rsp), %eax
	movb	%al, 256(%rsp)
	call	_ZNSt6vectorIhSaIhEE12emplace_backIJhEEEvDpOT_
	movq	8(%r14), %rax
	movq	%r12, %rdx
	leaq	-32(%rax), %rcx
	movzbl	209(%rsp), %eax
	movb	%al, 256(%rsp)
	call	_ZNSt6vectorIhSaIhEE12emplace_backIJhEEEvDpOT_
.LEHE79:
	jmp	.L1489
.L1538:
	movq	376+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	44(%rdx), %eax
	movl	%eax, 12+glerr(%rip)
.LEHB80:
	call	_Z5raiseR7error_t
	movq	(%rbx), %r8
	jmp	.L1320
.L1380:
	movb	$1, 72(%rsp)
	movl	$10, %edi
	jmp	.L1259
.L1541:
	movq	376+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	44(%rdx), %eax
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
	movq	(%rbx), %rsi
	movq	8(%rbx), %r12
	cmpq	%rsi, %r12
	je	.L1242
	jmp	.L1326
.L1519:
	movq	376+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	44(%rdx), %eax
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
.LEHE80:
	movq	8(%rbx), %rax
	movq	(%rbx), %rdi
	movq	%rax, 56(%rsp)
	cmpq	%rdi, %rax
	je	.L1242
	jmp	.L1338
.L1527:
.LEHB81:
	call	_ZSt17__throw_bad_allocv
.LEHE81:
.L1523:
.LEHB82:
	call	_ZSt17__throw_bad_allocv
.LEHE82:
.L1536:
	leaq	.LC7(%rip), %rcx
.LEHB83:
	call	_ZSt20__throw_length_errorPKc
.LEHE83:
.L1388:
	movq	96(%rsp), %rcx
	movq	%rax, %rbx
	testq	%rcx, %rcx
	je	.L1359
	call	_ZdlPv
.L1359:
	movq	168(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L1371
.L1498:
	call	_ZdlPv
.L1371:
	movq	%rbx, %rcx
.LEHB84:
	call	_Unwind_Resume
.LEHE84:
.L1391:
	movq	160(%rsp), %rcx
	movq	%rax, %rbx
	testq	%rcx, %rcx
	je	.L1364
	call	_ZdlPv
.L1364:
	movq	256(%rsp), %rcx
	testq	%rcx, %rcx
	jne	.L1498
	jmp	.L1371
.L1390:
	movq	256(%rsp), %rcx
	movq	%rax, %rbx
	testq	%rcx, %rcx
	jne	.L1498
	jmp	.L1371
.L1392:
.L1500:
	movq	%rax, %rbx
.L1370:
	movq	160(%rsp), %rcx
	testq	%rcx, %rcx
	jne	.L1498
	jmp	.L1371
.L1393:
	movq	264(%rsp), %rcx
	movq	%rax, %rbx
	testq	%rcx, %rcx
	je	.L1370
	call	_ZdlPv
	jmp	.L1370
.L1389:
	movq	%rax, %rbx
	jmp	.L1359
.L1394:
	jmp	.L1500
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA1032:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1032-.LLSDACSB1032
.LLSDACSB1032:
	.uleb128 .LEHB55-.LFB1032
	.uleb128 .LEHE55-.LEHB55
	.uleb128 .L1389-.LFB1032
	.uleb128 0
	.uleb128 .LEHB56-.LFB1032
	.uleb128 .LEHE56-.LEHB56
	.uleb128 .L1388-.LFB1032
	.uleb128 0
	.uleb128 .LEHB57-.LFB1032
	.uleb128 .LEHE57-.LEHB57
	.uleb128 .L1394-.LFB1032
	.uleb128 0
	.uleb128 .LEHB58-.LFB1032
	.uleb128 .LEHE58-.LEHB58
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB59-.LFB1032
	.uleb128 .LEHE59-.LEHB59
	.uleb128 .L1393-.LFB1032
	.uleb128 0
	.uleb128 .LEHB60-.LFB1032
	.uleb128 .LEHE60-.LEHB60
	.uleb128 .L1388-.LFB1032
	.uleb128 0
	.uleb128 .LEHB61-.LFB1032
	.uleb128 .LEHE61-.LEHB61
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB62-.LFB1032
	.uleb128 .LEHE62-.LEHB62
	.uleb128 .L1389-.LFB1032
	.uleb128 0
	.uleb128 .LEHB63-.LFB1032
	.uleb128 .LEHE63-.LEHB63
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB64-.LFB1032
	.uleb128 .LEHE64-.LEHB64
	.uleb128 .L1389-.LFB1032
	.uleb128 0
	.uleb128 .LEHB65-.LFB1032
	.uleb128 .LEHE65-.LEHB65
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB66-.LFB1032
	.uleb128 .LEHE66-.LEHB66
	.uleb128 .L1389-.LFB1032
	.uleb128 0
	.uleb128 .LEHB67-.LFB1032
	.uleb128 .LEHE67-.LEHB67
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB68-.LFB1032
	.uleb128 .LEHE68-.LEHB68
	.uleb128 .L1391-.LFB1032
	.uleb128 0
	.uleb128 .LEHB69-.LFB1032
	.uleb128 .LEHE69-.LEHB69
	.uleb128 .L1389-.LFB1032
	.uleb128 0
	.uleb128 .LEHB70-.LFB1032
	.uleb128 .LEHE70-.LEHB70
	.uleb128 .L1393-.LFB1032
	.uleb128 0
	.uleb128 .LEHB71-.LFB1032
	.uleb128 .LEHE71-.LEHB71
	.uleb128 .L1392-.LFB1032
	.uleb128 0
	.uleb128 .LEHB72-.LFB1032
	.uleb128 .LEHE72-.LEHB72
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB73-.LFB1032
	.uleb128 .LEHE73-.LEHB73
	.uleb128 .L1392-.LFB1032
	.uleb128 0
	.uleb128 .LEHB74-.LFB1032
	.uleb128 .LEHE74-.LEHB74
	.uleb128 .L1390-.LFB1032
	.uleb128 0
	.uleb128 .LEHB75-.LFB1032
	.uleb128 .LEHE75-.LEHB75
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB76-.LFB1032
	.uleb128 .LEHE76-.LEHB76
	.uleb128 .L1389-.LFB1032
	.uleb128 0
	.uleb128 .LEHB77-.LFB1032
	.uleb128 .LEHE77-.LEHB77
	.uleb128 .L1392-.LFB1032
	.uleb128 0
	.uleb128 .LEHB78-.LFB1032
	.uleb128 .LEHE78-.LEHB78
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB79-.LFB1032
	.uleb128 .LEHE79-.LEHB79
	.uleb128 .L1394-.LFB1032
	.uleb128 0
	.uleb128 .LEHB80-.LFB1032
	.uleb128 .LEHE80-.LEHB80
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB81-.LFB1032
	.uleb128 .LEHE81-.LEHB81
	.uleb128 .L1389-.LFB1032
	.uleb128 0
	.uleb128 .LEHB82-.LFB1032
	.uleb128 .LEHE82-.LEHB82
	.uleb128 .L1393-.LFB1032
	.uleb128 0
	.uleb128 .LEHB83-.LFB1032
	.uleb128 .LEHE83-.LEHB83
	.uleb128 .L1389-.LFB1032
	.uleb128 0
	.uleb128 .LEHB84-.LFB1032
	.uleb128 .LEHE84-.LEHB84
	.uleb128 0
	.uleb128 0
.LLSDACSE1032:
	.text
	.seh_endproc
	.p2align 4,,15
	.globl	_Z12assembleListRSt6vectorI5asm_tSaIS0_EE
	.def	_Z12assembleListRSt6vectorI5asm_tSaIS0_EE;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z12assembleListRSt6vectorI5asm_tSaIS0_EE
_Z12assembleListRSt6vectorI5asm_tSaIS0_EE:
.LFB1040:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$104, %rsp
	.seh_stackalloc	104
	.seh_endprologue
	movq	%rdx, %rbx
	movq	$0, (%rcx)
	movq	%rcx, %rdi
	movq	$0, 8(%rcx)
	leaq	64(%rsp), %rdx
	movq	$0, 16(%rcx)
	movq	$0, 24(%rcx)
	movq	$0, 32(%rcx)
	movq	$0, 40(%rcx)
	movq	$0, 48(%rcx)
	movq	$0, 56(%rcx)
	movq	$0, 64(%rcx)
	movq	$0, 72(%rcx)
	movl	$0, 80(%rcx)
	movq	$0, 32(%rsp)
	movq	$0, 40(%rsp)
	movq	$0, 48(%rsp)
	movq	$0, 64(%rsp)
	movq	$0, 72(%rsp)
	movq	$0, 80(%rsp)
	movl	$0, 88(%rsp)
.LEHB85:
	call	_ZNSt6vectorI8stream_tSaIS0_EE12emplace_backIJS0_EEEvDpOT_
.LEHE85:
	movq	64(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L1547
	call	_ZdlPv
.L1547:
	movq	8(%rbx), %rsi
	leaq	32(%rsp), %rbp
	movq	(%rbx), %rbx
	cmpq	%rsi, %rbx
	je	.L1552
	.p2align 4,,10
.L1551:
	movq	%rbp, %r8
	movq	%rbx, %rdx
	movq	%rdi, %rcx
.LEHB86:
	call	_Z12assembleUnitR5crt_tR5asm_tRSt6vectorI5unv_tSaIS4_EE
	addq	$48, %rbx
	cmpq	%rbx, %rsi
	jne	.L1551
.L1552:
	movq	32(%rsp), %rbx
	movq	40(%rsp), %rbp
	movq	%rbx, %rsi
	cmpq	%rbx, %rbp
	je	.L1550
	.p2align 4,,10
.L1553:
	movq	%rsi, %rdx
	movq	%rdi, %rcx
	call	_Z15assembleUnknownR5crt_tR5unv_t
.LEHE86:
	addq	$88, %rsi
	cmpq	%rsi, %rbp
	jne	.L1553
	movq	40(%rsp), %rsi
	movq	32(%rsp), %rbx
	cmpq	%rbx, %rsi
	je	.L1550
	.p2align 4,,10
.L1555:
	movq	8(%rbx), %rcx
	testq	%rcx, %rcx
	je	.L1554
	call	_ZdlPv
.L1554:
	addq	$88, %rbx
	cmpq	%rbx, %rsi
	jne	.L1555
	movq	32(%rsp), %rbx
.L1550:
	testq	%rbx, %rbx
	je	.L1546
	movq	%rbx, %rcx
	call	_ZdlPv
.L1546:
	movq	%rdi, %rax
	addq	$104, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L1564:
	movq	64(%rsp), %rcx
	movq	%rax, %rbx
	testq	%rcx, %rcx
	je	.L1559
	call	_ZdlPv
.L1559:
	movq	%rdi, %rcx
	call	_ZN5crt_tD1Ev
	movq	40(%rsp), %rdi
	movq	32(%rsp), %rsi
.L1562:
	cmpq	%rsi, %rdi
	jne	.L1589
	movq	32(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L1563
	call	_ZdlPv
.L1563:
	movq	%rbx, %rcx
.LEHB87:
	call	_Unwind_Resume
.LEHE87:
.L1565:
	movq	%rax, %rbx
	jmp	.L1559
.L1589:
	movq	8(%rsi), %rcx
	testq	%rcx, %rcx
	je	.L1561
	call	_ZdlPv
.L1561:
	addq	$88, %rsi
	jmp	.L1562
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA1040:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1040-.LLSDACSB1040
.LLSDACSB1040:
	.uleb128 .LEHB85-.LFB1040
	.uleb128 .LEHE85-.LEHB85
	.uleb128 .L1564-.LFB1040
	.uleb128 0
	.uleb128 .LEHB86-.LFB1040
	.uleb128 .LEHE86-.LEHB86
	.uleb128 .L1565-.LFB1040
	.uleb128 0
	.uleb128 .LEHB87-.LFB1040
	.uleb128 .LEHE87-.LEHB87
	.uleb128 0
	.uleb128 0
.LLSDACSE1040:
	.text
	.seh_endproc
	.section	.text$_ZNSt6vectorI7token_tSaIS0_EEC1ERKS2_,"x"
	.linkonce discard
	.align 2
	.p2align 4,,15
	.globl	_ZNSt6vectorI7token_tSaIS0_EEC1ERKS2_
	.def	_ZNSt6vectorI7token_tSaIS0_EEC1ERKS2_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorI7token_tSaIS0_EEC1ERKS2_
_ZNSt6vectorI7token_tSaIS0_EEC1ERKS2_:
.LFB1932:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	xorl	%ebp, %ebp
	movq	8(%rdx), %rbx
	subq	(%rdx), %rbx
	movq	%rdx, %rsi
	movq	%rcx, %rdi
	movabsq	$-3689348814741910323, %rdx
	movq	$0, (%rcx)
	movq	%rbx, %rax
	movq	$0, 8(%rcx)
	sarq	$3, %rax
	movq	$0, 16(%rcx)
	imulq	%rdx, %rax
	testq	%rax, %rax
	je	.L1592
	movabsq	$461168601842738790, %rdx
	cmpq	%rdx, %rax
	ja	.L1609
	movq	%rbx, %rcx
.LEHB88:
	call	_Znwy
.LEHE88:
	movq	%rax, %rbp
.L1592:
	addq	%rbp, %rbx
	movq	%rbp, (%rdi)
	movq	%rbp, 8(%rdi)
	movq	%rbx, 16(%rdi)
	movq	8(%rsi), %r12
	movq	(%rsi), %rbx
	movq	%rbp, %rsi
	cmpq	%rbx, %r12
	je	.L1594
	.p2align 4,,10
.L1595:
	movq	%rbx, %rdx
	movq	%rsi, %rcx
.LEHB89:
	call	_ZNSt6vectorI7token_tSaIS0_EEC1ERKS2_
.LEHE89:
	movq	24(%rbx), %rax
	addq	$40, %rbx
	addq	$40, %rsi
	movq	%rax, -16(%rsi)
	movl	-8(%rbx), %eax
	movl	%eax, -8(%rsi)
	movzbl	-4(%rbx), %eax
	movb	%al, -4(%rsi)
	cmpq	%rbx, %r12
	jne	.L1595
.L1594:
	movq	%rsi, 8(%rdi)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
.L1609:
.LEHB90:
	call	_ZSt17__throw_bad_allocv
.LEHE90:
.L1603:
	movq	%rax, %rcx
	call	__cxa_begin_catch
.L1598:
	cmpq	%rsi, %rbp
	jne	.L1610
.LEHB91:
	call	__cxa_rethrow
.LEHE91:
.L1610:
	movq	%rbp, %rcx
	addq	$40, %rbp
	call	_ZNSt6vectorI7token_tSaIS0_EED1Ev
	jmp	.L1598
.L1602:
	movq	%rax, %rbx
	call	__cxa_end_catch
	movq	(%rdi), %rcx
	testq	%rcx, %rcx
	je	.L1600
	call	_ZdlPv
.L1600:
	movq	%rbx, %rcx
.LEHB92:
	call	_Unwind_Resume
	nop
.LEHE92:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
	.align 4
.LLSDA1932:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT1932-.LLSDATTD1932
.LLSDATTD1932:
	.byte	0x1
	.uleb128 .LLSDACSE1932-.LLSDACSB1932
.LLSDACSB1932:
	.uleb128 .LEHB88-.LFB1932
	.uleb128 .LEHE88-.LEHB88
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB89-.LFB1932
	.uleb128 .LEHE89-.LEHB89
	.uleb128 .L1603-.LFB1932
	.uleb128 0x1
	.uleb128 .LEHB90-.LFB1932
	.uleb128 .LEHE90-.LEHB90
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB91-.LFB1932
	.uleb128 .LEHE91-.LEHB91
	.uleb128 .L1602-.LFB1932
	.uleb128 0
	.uleb128 .LEHB92-.LFB1932
	.uleb128 .LEHE92-.LEHB92
	.uleb128 0
	.uleb128 0
.LLSDACSE1932:
	.byte	0x1
	.byte	0
	.align 4
	.long	0

.LLSDATT1932:
	.section	.text$_ZNSt6vectorI7token_tSaIS0_EEC1ERKS2_,"x"
	.linkonce discard
	.seh_endproc
	.section	.text$_ZNSt6vectorI7token_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"x"
	.linkonce discard
	.align 2
	.p2align 4,,15
	.globl	_ZNSt6vectorI7token_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.def	_ZNSt6vectorI7token_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorI7token_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
_ZNSt6vectorI7token_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_:
.LFB1405:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$72, %rsp
	.seh_stackalloc	72
	.seh_endprologue
	movq	8(%rcx), %rdi
	movq	(%rcx), %r14
	movq	%rdi, %rax
	movq	%rdx, %rbp
	movq	%rcx, 144(%rsp)
	movq	%r8, %r15
	movabsq	$-3689348814741910323, %rdx
	subq	%r14, %rax
	movq	%rbp, %r12
	sarq	$3, %rax
	subq	%r14, %r12
	imulq	%rdx, %rax
	testq	%rax, %rax
	je	.L1641
	leaq	(%rax,%rax), %rbx
	cmpq	%rbx, %rax
	movq	%rbx, 48(%rsp)
	jbe	.L1665
	movabsq	$461168601842738790, %rax
	movq	$-16, %rcx
	movq	%rax, 48(%rsp)
.L1613:
.LEHB93:
	call	_Znwy
.LEHE93:
	movq	%rax, 40(%rsp)
.L1614:
	movabsq	$-3689348814741910323, %rdx
	movq	8(%r15), %r13
	movq	(%r15), %rbx
	addq	40(%rsp), %r12
	movq	%r13, %rsi
	subq	%rbx, %rsi
	movq	%rsi, %rax
	movq	$0, (%r12)
	movq	$0, 8(%r12)
	sarq	$3, %rax
	movq	$0, 16(%r12)
	imulq	%rdx, %rax
	testq	%rax, %rax
	je	.L1666
	movabsq	$461168601842738790, %rdx
	cmpq	%rdx, %rax
	ja	.L1667
	movq	%rsi, %rcx
.LEHB94:
	call	_Znwy
.LEHE94:
	movq	8(%r15), %r13
	movq	%rax, 56(%rsp)
	movq	(%r15), %rbx
.L1616:
	movq	56(%rsp), %rax
	addq	%rax, %rsi
	cmpq	%r13, %rbx
	movq	%rax, (%r12)
	movq	%rax, 8(%r12)
	movq	%rsi, 16(%r12)
	je	.L1645
	movq	%rax, %rsi
	.p2align 4,,10
.L1619:
	movq	%rbx, %rdx
	movq	%rsi, %rcx
.LEHB95:
	call	_ZNSt6vectorI7token_tSaIS0_EEC1ERKS2_
.LEHE95:
	movq	24(%rbx), %rax
	addq	$40, %rbx
	addq	$40, %rsi
	movq	%rax, -16(%rsi)
	movl	-8(%rbx), %eax
	movl	%eax, -8(%rsi)
	movzbl	-4(%rbx), %eax
	movb	%al, -4(%rsi)
	cmpq	%rbx, %r13
	jne	.L1619
.L1618:
	movq	24(%r15), %rax
	cmpq	%r14, %rbp
	movq	%rsi, 8(%r12)
	movq	%r14, %rdx
	movq	%rax, 24(%r12)
	movl	32(%r15), %eax
	movl	%eax, 32(%r12)
	movzbl	36(%r15), %eax
	movb	%al, 36(%r12)
	movq	40(%rsp), %rax
	movq	%rax, %rbx
	je	.L1621
	.p2align 4,,10
.L1628:
	movq	$0, 8(%rax)
	addq	$40, %rdx
	addq	$40, %rax
	movq	$0, -24(%rax)
	movq	$0, -40(%rax)
	movq	-40(%rdx), %rcx
	movq	%rcx, -40(%rax)
	movq	-32(%rdx), %r8
	movq	$0, -40(%rdx)
	movq	-32(%rax), %rcx
	movq	%r8, -32(%rax)
	movq	-24(%rdx), %r8
	movq	%rcx, -32(%rdx)
	movq	-24(%rax), %rcx
	movq	%r8, -24(%rax)
	movq	%rcx, -24(%rdx)
	movq	-16(%rdx), %rcx
	movq	%rcx, -16(%rax)
	movl	-8(%rdx), %ecx
	movl	%ecx, -8(%rax)
	movzbl	-4(%rdx), %ecx
	movb	%cl, -4(%rax)
	cmpq	%rdx, %rbp
	jne	.L1628
	leaq	-40(%rbp), %rax
	movq	40(%rsp), %rbx
	movabsq	$922337203685477581, %rdx
	subq	%r14, %rax
	shrq	$3, %rax
	imulq	%rdx, %rax
	movabsq	$2305843009213693951, %rdx
	andq	%rdx, %rax
	leaq	5(%rax,%rax,4), %rax
	leaq	(%rbx,%rax,8), %rbx
.L1621:
	addq	$40, %rbx
	cmpq	%rdi, %rbp
	je	.L1629
	movq	%rbp, %rax
	movq	%rbx, %rdx
	.p2align 4,,10
.L1630:
	movq	(%rax), %rcx
	movq	$0, (%rax)
	addq	$40, %rax
	addq	$40, %rdx
	movq	%rcx, -40(%rdx)
	movq	-32(%rax), %rcx
	movq	$0, -32(%rax)
	movq	%rcx, -32(%rdx)
	movq	-24(%rax), %rcx
	movq	$0, -24(%rax)
	movq	%rcx, -24(%rdx)
	movq	-16(%rax), %rcx
	movq	%rcx, -16(%rdx)
	movl	-8(%rax), %ecx
	movl	%ecx, -8(%rdx)
	movzbl	-4(%rax), %ecx
	movb	%cl, -4(%rdx)
	cmpq	%rax, %rdi
	jne	.L1630
	movabsq	$922337203685477581, %rdx
	movq	%rdi, %rax
	subq	%rbp, %rax
	subq	$40, %rax
	shrq	$3, %rax
	imulq	%rdx, %rax
	movabsq	$2305843009213693951, %rdx
	andq	%rdx, %rax
	leaq	5(%rax,%rax,4), %rax
	leaq	(%rbx,%rax,8), %rbx
.L1629:
	cmpq	%rdi, %r14
	movq	%r14, %rbp
	je	.L1637
	.p2align 4,,10
.L1631:
	movq	8(%rbp), %r12
	movq	0(%rbp), %rsi
	cmpq	%rsi, %r12
	je	.L1634
	.p2align 4,,10
.L1635:
	movq	%rsi, %rcx
	addq	$40, %rsi
	call	_ZNSt6vectorI7token_tSaIS0_EED1Ev
	cmpq	%rsi, %r12
	jne	.L1635
	movq	0(%rbp), %rsi
.L1634:
	testq	%rsi, %rsi
	je	.L1636
	movq	%rsi, %rcx
	call	_ZdlPv
.L1636:
	addq	$40, %rbp
	cmpq	%rdi, %rbp
	jne	.L1631
.L1637:
	testq	%r14, %r14
	je	.L1633
	movq	%r14, %rcx
	call	_ZdlPv
.L1633:
	movq	144(%rsp), %rax
	movq	40(%rsp), %rdi
	movq	%rbx, 8(%rax)
	movq	%rdi, (%rax)
	movq	48(%rsp), %rax
	leaq	(%rax,%rax,4), %rax
	leaq	(%rdi,%rax,8), %rax
	movq	144(%rsp), %rdi
	movq	%rax, 16(%rdi)
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
.L1665:
	movabsq	$461168601842738790, %rax
	cmpq	%rax, %rbx
	jbe	.L1668
	movq	$-16, %rcx
	movq	%rax, 48(%rsp)
	jmp	.L1613
	.p2align 4,,10
.L1641:
	movq	$1, 48(%rsp)
.L1612:
	movq	48(%rsp), %rax
	leaq	(%rax,%rax,4), %rcx
	salq	$3, %rcx
	jmp	.L1613
	.p2align 4,,10
.L1666:
	movq	$0, 56(%rsp)
	jmp	.L1616
	.p2align 4,,10
.L1645:
	movq	56(%rsp), %rsi
	jmp	.L1618
.L1668:
	movq	$0, 40(%rsp)
	testq	%rbx, %rbx
	je	.L1614
	jmp	.L1612
.L1667:
.LEHB96:
	call	_ZSt17__throw_bad_allocv
.LEHE96:
.L1647:
.L1627:
	movq	%rax, %rcx
	call	__cxa_begin_catch
	cmpq	$0, 40(%rsp)
	je	.L1669
	movq	40(%rsp), %rcx
	call	_ZdlPv
.L1640:
.LEHB97:
	call	__cxa_rethrow
.LEHE97:
.L1650:
	movq	%rax, %rcx
	call	__cxa_begin_catch
.L1624:
	cmpq	%rsi, 56(%rsp)
	jne	.L1670
.LEHB98:
	call	__cxa_rethrow
.LEHE98:
.L1670:
	movq	56(%rsp), %rdi
	movq	%rdi, %rcx
	call	_ZNSt6vectorI7token_tSaIS0_EED1Ev
	movq	%rdi, %rax
	addq	$40, %rax
	movq	%rax, 56(%rsp)
	jmp	.L1624
.L1669:
	movq	%r12, %rcx
	call	_ZNSt6vectorI7token_tSaIS0_EED1Ev
	jmp	.L1640
.L1649:
	movq	%rax, %rbx
	call	__cxa_end_catch
	movq	(%r12), %rcx
	testq	%rcx, %rcx
	je	.L1626
	call	_ZdlPv
.L1626:
	movq	%rbx, %rax
	jmp	.L1627
.L1648:
	movq	%rax, %rbx
	call	__cxa_end_catch
	movq	%rbx, %rcx
.LEHB99:
	call	_Unwind_Resume
	nop
.LEHE99:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
	.align 4
.LLSDA1405:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT1405-.LLSDATTD1405
.LLSDATTD1405:
	.byte	0x1
	.uleb128 .LLSDACSE1405-.LLSDACSB1405
.LLSDACSB1405:
	.uleb128 .LEHB93-.LFB1405
	.uleb128 .LEHE93-.LEHB93
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB94-.LFB1405
	.uleb128 .LEHE94-.LEHB94
	.uleb128 .L1647-.LFB1405
	.uleb128 0x1
	.uleb128 .LEHB95-.LFB1405
	.uleb128 .LEHE95-.LEHB95
	.uleb128 .L1650-.LFB1405
	.uleb128 0x1
	.uleb128 .LEHB96-.LFB1405
	.uleb128 .LEHE96-.LEHB96
	.uleb128 .L1647-.LFB1405
	.uleb128 0x1
	.uleb128 .LEHB97-.LFB1405
	.uleb128 .LEHE97-.LEHB97
	.uleb128 .L1648-.LFB1405
	.uleb128 0
	.uleb128 .LEHB98-.LFB1405
	.uleb128 .LEHE98-.LEHB98
	.uleb128 .L1649-.LFB1405
	.uleb128 0x3
	.uleb128 .LEHB99-.LFB1405
	.uleb128 .LEHE99-.LEHB99
	.uleb128 0
	.uleb128 0
.LLSDACSE1405:
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x7d
	.align 4
	.long	0

.LLSDATT1405:
	.section	.text$_ZNSt6vectorI7token_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"x"
	.linkonce discard
	.seh_endproc
	.text
	.p2align 4,,15
	.globl	_Z12tokenizeLineRSt6vectorIcSaIcEEj
	.def	_Z12tokenizeLineRSt6vectorIcSaIcEEj;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z12tokenizeLineRSt6vectorIcSaIcEEj
_Z12tokenizeLineRSt6vectorIcSaIcEEj:
.LFB1000:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$456, %rsp
	.seh_stackalloc	456
	.seh_endprologue
	movq	$0, 24(%rcx)
	movb	$0, 36(%rcx)
	movq	8(%rdx), %rax
	movq	(%rdx), %rsi
	movq	%rcx, 528(%rsp)
	movl	%r8d, 544(%rsp)
	movq	$0, (%rcx)
	movq	$0, 8(%rcx)
	cmpq	%rax, %rsi
	movl	$0, 32(%rcx)
	movq	$0, 16(%rcx)
	movq	$0, 96(%rsp)
	movq	$0, 104(%rsp)
	movq	$0, 112(%rsp)
	movq	%rcx, 88(%rsp)
	movq	$0, 128(%rsp)
	movq	$0, 136(%rsp)
	movq	$0, 144(%rsp)
	movq	%rax, 40(%rsp)
	je	.L1672
	movb	$0, 55(%rsp)
	xorl	%ebp, %ebp
	xorl	%r12d, %r12d
	jmp	.L1803
	.p2align 4,,10
.L2036:
	cmpb	$0, 55(%rsp)
	jne	.L2032
	cmpb	$92, %r8b
	je	.L2033
	cmpb	$34, %r8b
	je	.L2034
.L2014:
	movq	104(%rsp), %rdx
	cmpq	112(%rsp), %rdx
	je	.L1802
	movb	%r8b, (%rdx)
	addq	$1, 104(%rsp)
.L1676:
	addq	$1, %rsi
	cmpq	%rsi, 40(%rsp)
	je	.L2035
.L1803:
	movzbl	(%rsi), %r8d
	testb	%bpl, %bpl
	movb	%r8b, 87(%rsp)
	jne	.L2036
	cmpb	$64, %r8b
	je	.L1700
	cmpb	$34, %r8b
	je	.L2037
	cmpb	$40, %r8b
	je	.L2038
	cmpb	$41, %r8b
	je	.L2039
	leaq	characterType(%rip), %rdx
	movzbl	%r8b, %eax
	movzbl	(%rdx,%rax), %r13d
	testb	%r13b, %r13b
	je	.L2040
	testb	%r12b, %r12b
	je	.L1773
	leaq	192(%rsp), %r15
	cmpb	%r12b, %r13b
	je	.L2014
.L1778:
	leaq	96(%rsp), %rax
	movq	%r15, %rdx
	movb	$0, 192(%rsp)
	movq	%rax, %rcx
	movq	%rax, 56(%rsp)
.LEHB100:
	call	_ZNSt6vectorIcSaIcEE12emplace_backIJcEEEvDpOT_
.LEHE100:
	movq	104(%rsp), %rbx
	movq	$0, 192(%rsp)
	subq	96(%rsp), %rbx
	movq	$0, 200(%rsp)
	movq	$0, 208(%rsp)
	movq	$0, 216(%rsp)
	movl	$0, 224(%rsp)
	movb	$0, 228(%rsp)
	movq	$0, 160(%rsp)
	movq	$0, 168(%rsp)
	movq	$0, 176(%rsp)
	je	.L1780
	movq	%rbx, %rcx
.LEHB101:
	call	_Znwy
.LEHE101:
	addq	%rax, %rbx
	movq	96(%rsp), %rdx
	movq	%rax, %r9
	movq	%rax, 160(%rsp)
	movq	%rbx, 176(%rsp)
	movq	104(%rsp), %rbx
	movq	%rax, 168(%rsp)
	subq	%rdx, %rbx
	je	.L1781
	movq	%rbx, %r8
	movq	%rax, %rcx
	call	memmove
	movq	%rax, %r9
.L1781:
	leaq	160(%rsp), %rcx
	addq	%r9, %rbx
	movq	%rbx, 168(%rsp)
.LEHB102:
	call	_Z12createStringSt6vectorIcSaIcEE
.LEHE102:
	movq	160(%rsp), %rcx
	movq	%rax, 216(%rsp)
	testq	%rcx, %rcx
	je	.L1782
	call	_ZdlPv
.L1782:
	movl	544(%rsp), %eax
	movb	%r12b, 228(%rsp)
	movl	%eax, 224(%rsp)
	movq	88(%rsp), %rax
	movq	8(%rax), %r12
	movq	%rax, 64(%rsp)
	cmpq	16(%rax), %r12
	je	.L1783
	movq	200(%rsp), %rbx
	movabsq	$-3689348814741910323, %rdx
	subq	192(%rsp), %rbx
	movq	$0, (%r12)
	movq	$0, 8(%r12)
	movq	$0, 16(%r12)
	movq	%rbx, %rax
	sarq	$3, %rax
	imulq	%rdx, %rax
	testq	%rax, %rax
	je	.L2041
	movabsq	$461168601842738790, %rdx
	cmpq	%rdx, %rax
	ja	.L2042
	movq	%rbx, %rcx
.LEHB103:
	call	_Znwy
.LEHE103:
	movq	%rax, 72(%rsp)
.L1785:
	movq	72(%rsp), %rdi
	addq	%rdi, %rbx
	movq	%rdi, (%r12)
	movq	%rdi, 8(%r12)
	movq	%rbx, 16(%r12)
	movq	200(%rsp), %r14
	movq	192(%rsp), %rbx
	cmpq	%rbx, %r14
	je	.L1852
	.p2align 4,,10
.L1788:
	movq	%rbx, %rdx
	movq	%rdi, %rcx
.LEHB104:
	call	_ZNSt6vectorI7token_tSaIS0_EEC1ERKS2_
.LEHE104:
	movq	24(%rbx), %rax
	addq	$40, %rbx
	addq	$40, %rdi
	movq	%rax, -16(%rdi)
	movl	-8(%rbx), %eax
	movl	%eax, -8(%rdi)
	movzbl	-4(%rbx), %eax
	movb	%al, -4(%rdi)
	cmpq	%rbx, %r14
	jne	.L1788
.L1787:
	movq	216(%rsp), %rax
	movq	%rdi, 8(%r12)
	movq	%rax, 24(%r12)
	movl	224(%rsp), %eax
	movl	%eax, 32(%r12)
	movzbl	228(%rsp), %eax
	movb	%al, 36(%r12)
	movq	64(%rsp), %rax
	addq	$40, 8(%rax)
.L1789:
	movq	96(%rsp), %rdx
	cmpq	104(%rsp), %rdx
	je	.L1796
	movq	%rdx, 104(%rsp)
.L1796:
	cmpq	%rdx, 112(%rsp)
	je	.L1797
	movzbl	87(%rsp), %eax
	movb	%al, (%rdx)
	addq	$1, 104(%rsp)
.L1798:
	movq	200(%rsp), %rbx
	movq	192(%rsp), %rdi
	cmpq	%rdi, %rbx
	je	.L1799
	.p2align 4,,10
.L1800:
	movq	%rdi, %rcx
	addq	$40, %rdi
	call	_ZNSt6vectorI7token_tSaIS0_EED1Ev
	cmpq	%rdi, %rbx
	jne	.L1800
	movq	192(%rsp), %rdi
.L1799:
	testq	%rdi, %rdi
	je	.L2013
	movq	%rdi, %rcx
	call	_ZdlPv
.L2013:
	addq	$1, %rsi
	cmpq	%rsi, 40(%rsp)
	movl	%r13d, %r12d
	jne	.L1803
	.p2align 4,,10
.L2035:
	movq	96(%rsp), %rax
	cmpq	%rax, 104(%rsp)
	je	.L1806
.L1845:
	leaq	192(%rsp), %r15
	movb	$0, 192(%rsp)
	leaq	96(%rsp), %rcx
	movq	%r15, %rdx
.LEHB105:
	call	_ZNSt6vectorIcSaIcEE12emplace_backIJcEEEvDpOT_
.LEHE105:
	movq	104(%rsp), %rcx
	movq	$0, 192(%rsp)
	subq	96(%rsp), %rcx
	movq	$0, 200(%rsp)
	movq	$0, 208(%rsp)
	movq	$0, 216(%rsp)
	movl	$0, 224(%rsp)
	movb	$0, 228(%rsp)
	movq	%rcx, %rbx
	movq	$0, 160(%rsp)
	movq	$0, 168(%rsp)
	movq	$0, 176(%rsp)
	je	.L1807
.LEHB106:
	call	_Znwy
.LEHE106:
	leaq	(%rax,%rbx), %rcx
	movq	96(%rsp), %rdx
	movq	%rax, %r9
	movq	%rax, 160(%rsp)
	movq	104(%rsp), %rbx
	movq	%rax, 168(%rsp)
	movq	%rcx, 176(%rsp)
	subq	%rdx, %rbx
	je	.L1808
	movq	%rbx, %r8
	movq	%rax, %rcx
	call	memmove
	movq	%rax, %r9
	jmp	.L1808
	.p2align 4,,10
.L2032:
	movq	104(%rsp), %rdx
	cmpq	112(%rsp), %rdx
	je	.L1675
	movb	%r8b, (%rdx)
	movzbl	55(%rsp), %ebp
	addq	$1, 104(%rsp)
	movb	$0, 55(%rsp)
	jmp	.L1676
	.p2align 4,,10
.L2038:
	movq	96(%rsp), %rax
	cmpq	%rax, 104(%rsp)
	je	.L1723
	leaq	192(%rsp), %r15
	movb	$0, 192(%rsp)
	leaq	96(%rsp), %rcx
	movq	%r15, %rdx
.LEHB107:
	call	_ZNSt6vectorIcSaIcEE12emplace_backIJcEEEvDpOT_
.LEHE107:
	movq	104(%rsp), %rbx
	movq	$0, 192(%rsp)
	subq	96(%rsp), %rbx
	movq	$0, 200(%rsp)
	movq	$0, 208(%rsp)
	movq	$0, 216(%rsp)
	movl	$0, 224(%rsp)
	movb	$0, 228(%rsp)
	movq	$0, 160(%rsp)
	movq	$0, 168(%rsp)
	movq	$0, 176(%rsp)
	je	.L1724
	movq	%rbx, %rcx
.LEHB108:
	call	_Znwy
.LEHE108:
	addq	%rax, %rbx
	movq	96(%rsp), %rdx
	movq	%rax, %r9
	movq	%rax, 160(%rsp)
	movq	%rbx, 176(%rsp)
	movq	104(%rsp), %rbx
	movq	%rax, 168(%rsp)
	subq	%rdx, %rbx
	je	.L1725
	movq	%rbx, %r8
	movq	%rax, %rcx
	call	memmove
	movq	%rax, %r9
.L1725:
	leaq	160(%rsp), %rcx
	addq	%r9, %rbx
	movq	%rbx, 168(%rsp)
.LEHB109:
	call	_Z12createStringSt6vectorIcSaIcEE
.LEHE109:
	movq	160(%rsp), %rcx
	movq	%rax, 216(%rsp)
	testq	%rcx, %rcx
	je	.L1726
	call	_ZdlPv
.L1726:
	movq	88(%rsp), %r14
	movb	%r12b, 228(%rsp)
	movl	544(%rsp), %eax
	movq	8(%r14), %r12
	cmpq	16(%r14), %r12
	movl	%eax, 224(%rsp)
	je	.L1727
	movq	200(%rsp), %rbx
	movabsq	$-3689348814741910323, %rdx
	subq	192(%rsp), %rbx
	movq	$0, (%r12)
	movq	$0, 8(%r12)
	movq	$0, 16(%r12)
	movq	%rbx, %rax
	sarq	$3, %rax
	imulq	%rdx, %rax
	testq	%rax, %rax
	je	.L2043
	movabsq	$461168601842738790, %rdx
	cmpq	%rdx, %rax
	ja	.L2044
	movq	%rbx, %rcx
.LEHB110:
	call	_Znwy
.LEHE110:
	movq	%rax, 56(%rsp)
.L1729:
	movq	56(%rsp), %rdi
	addq	%rdi, %rbx
	movq	%rdi, (%r12)
	movq	%rdi, 8(%r12)
	movq	%rbx, 16(%r12)
	movq	200(%rsp), %r13
	movq	192(%rsp), %rbx
	cmpq	%rbx, %r13
	je	.L1849
	.p2align 4,,10
.L1732:
	movq	%rbx, %rdx
	movq	%rdi, %rcx
.LEHB111:
	call	_ZNSt6vectorI7token_tSaIS0_EEC1ERKS2_
.LEHE111:
	movq	24(%rbx), %rax
	addq	$40, %rbx
	addq	$40, %rdi
	movq	%rax, -16(%rdi)
	movl	-8(%rbx), %eax
	movl	%eax, -8(%rdi)
	movzbl	-4(%rbx), %eax
	movb	%al, -4(%rdi)
	cmpq	%rbx, %r13
	jne	.L1732
	movq	192(%rsp), %rbx
.L1731:
	movq	216(%rsp), %rax
	movq	%rdi, 8(%r12)
	movq	%rax, 24(%r12)
	movl	224(%rsp), %eax
	movl	%eax, 32(%r12)
	movzbl	228(%rsp), %eax
	movb	%al, 36(%r12)
	addq	$40, 8(%r14)
.L1733:
	movq	96(%rsp), %rax
	cmpq	104(%rsp), %rax
	je	.L1740
	movq	%rax, 104(%rsp)
.L1740:
	movq	200(%rsp), %rdi
	cmpq	%rdi, %rbx
	je	.L1741
	.p2align 4,,10
.L1742:
	movq	%rbx, %rcx
	addq	$40, %rbx
	call	_ZNSt6vectorI7token_tSaIS0_EED1Ev
	cmpq	%rbx, %rdi
	jne	.L1742
	movq	192(%rsp), %rdi
.L1741:
	testq	%rdi, %rdi
	je	.L1743
	movq	%rdi, %rcx
	call	_ZdlPv
.L1743:
	xorl	%r12d, %r12d
.L1723:
	movq	136(%rsp), %rdx
	cmpq	144(%rsp), %rdx
	je	.L1744
	movq	88(%rsp), %rax
	addq	$8, %rdx
	movq	%rax, -8(%rdx)
	movq	%rdx, 136(%rsp)
.L1745:
	movq	88(%rsp), %rcx
	leaq	192(%rsp), %r15
	movq	$0, 192(%rsp)
	movq	%r15, %rdx
	movq	$0, 200(%rsp)
	movq	$0, 208(%rsp)
	movq	$0, 216(%rsp)
	movl	$0, 224(%rsp)
	movb	$0, 228(%rsp)
.LEHB112:
	call	_ZNSt6vectorI7token_tSaIS0_EE12emplace_backIJS0_EEEvDpOT_
.LEHE112:
	movq	200(%rsp), %rbx
	movq	192(%rsp), %rdi
	cmpq	%rdi, %rbx
	je	.L1746
	.p2align 4,,10
.L1747:
	movq	%rdi, %rcx
	addq	$40, %rdi
	call	_ZNSt6vectorI7token_tSaIS0_EED1Ev
	cmpq	%rdi, %rbx
	jne	.L1747
	movq	192(%rsp), %rdi
.L1746:
	testq	%rdi, %rdi
	je	.L1748
	movq	%rdi, %rcx
	call	_ZdlPv
.L1748:
	movq	88(%rsp), %rax
	movq	8(%rax), %rax
	subq	$40, %rax
	movq	%rax, 88(%rsp)
	jmp	.L1676
	.p2align 4,,10
.L2039:
	movq	96(%rsp), %rax
	cmpq	%rax, 104(%rsp)
	je	.L1750
	leaq	192(%rsp), %r15
	movb	$0, 192(%rsp)
	leaq	96(%rsp), %rcx
	movq	%r15, %rdx
.LEHB113:
	call	_ZNSt6vectorIcSaIcEE12emplace_backIJcEEEvDpOT_
.LEHE113:
	movq	104(%rsp), %rbx
	movq	$0, 192(%rsp)
	subq	96(%rsp), %rbx
	movq	$0, 200(%rsp)
	movq	$0, 208(%rsp)
	movq	$0, 216(%rsp)
	movl	$0, 224(%rsp)
	movb	$0, 228(%rsp)
	movq	$0, 160(%rsp)
	movq	$0, 168(%rsp)
	movq	$0, 176(%rsp)
	je	.L1751
	movq	%rbx, %rcx
.LEHB114:
	call	_Znwy
.LEHE114:
	addq	%rax, %rbx
	movq	96(%rsp), %rdx
	movq	%rax, %r9
	movq	%rax, 160(%rsp)
	movq	%rbx, 176(%rsp)
	movq	104(%rsp), %rbx
	movq	%rax, 168(%rsp)
	subq	%rdx, %rbx
	je	.L1752
	movq	%rbx, %r8
	movq	%rax, %rcx
	call	memmove
	movq	%rax, %r9
	jmp	.L1752
	.p2align 4,,10
.L1751:
	xorl	%ebx, %ebx
	xorl	%r9d, %r9d
.L1752:
	leaq	160(%rsp), %rcx
	addq	%r9, %rbx
	movq	%rbx, 168(%rsp)
.LEHB115:
	call	_Z12createStringSt6vectorIcSaIcEE
.LEHE115:
	movq	160(%rsp), %rcx
	movq	%rax, 216(%rsp)
	testq	%rcx, %rcx
	je	.L1753
	call	_ZdlPv
.L1753:
	movq	88(%rsp), %r14
	movb	%r12b, 228(%rsp)
	movl	544(%rsp), %eax
	movq	8(%r14), %r12
	cmpq	16(%r14), %r12
	movl	%eax, 224(%rsp)
	je	.L1754
	movq	200(%rsp), %rbx
	movabsq	$-3689348814741910323, %rdx
	subq	192(%rsp), %rbx
	movq	$0, (%r12)
	movq	$0, 8(%r12)
	movq	$0, 16(%r12)
	movq	%rbx, %rax
	sarq	$3, %rax
	imulq	%rdx, %rax
	testq	%rax, %rax
	je	.L2045
	movabsq	$461168601842738790, %rdx
	cmpq	%rdx, %rax
	ja	.L2046
	movq	%rbx, %rcx
.LEHB116:
	call	_Znwy
.LEHE116:
	movq	%rax, 56(%rsp)
.L1756:
	movq	56(%rsp), %rdi
	addq	%rdi, %rbx
	movq	%rdi, (%r12)
	movq	%rdi, 8(%r12)
	movq	%rbx, 16(%r12)
	movq	200(%rsp), %r13
	movq	192(%rsp), %rbx
	cmpq	%rbx, %r13
	je	.L1850
	.p2align 4,,10
.L1759:
	movq	%rbx, %rdx
	movq	%rdi, %rcx
.LEHB117:
	call	_ZNSt6vectorI7token_tSaIS0_EEC1ERKS2_
.LEHE117:
	movq	24(%rbx), %rax
	addq	$40, %rbx
	addq	$40, %rdi
	movq	%rax, -16(%rdi)
	movl	-8(%rbx), %eax
	movl	%eax, -8(%rdi)
	movzbl	-4(%rbx), %eax
	movb	%al, -4(%rdi)
	cmpq	%rbx, %r13
	jne	.L1759
	movq	192(%rsp), %rbx
.L1758:
	movq	216(%rsp), %rax
	movq	%rdi, 8(%r12)
	movq	%rax, 24(%r12)
	movl	224(%rsp), %eax
	movl	%eax, 32(%r12)
	movzbl	228(%rsp), %eax
	movb	%al, 36(%r12)
	addq	$40, 8(%r14)
.L1760:
	movq	96(%rsp), %rax
	cmpq	104(%rsp), %rax
	je	.L1767
	movq	%rax, 104(%rsp)
.L1767:
	movq	200(%rsp), %rdi
	cmpq	%rbx, %rdi
	je	.L1768
	.p2align 4,,10
.L1769:
	movq	%rbx, %rcx
	addq	$40, %rbx
	call	_ZNSt6vectorI7token_tSaIS0_EED1Ev
	cmpq	%rbx, %rdi
	jne	.L1769
	movq	192(%rsp), %rbx
.L1768:
	testq	%rbx, %rbx
	je	.L1770
	movq	%rbx, %rcx
	call	_ZdlPv
.L1770:
	xorl	%r12d, %r12d
.L1750:
	movq	136(%rsp), %rax
	cmpq	128(%rsp), %rax
	je	.L2047
.L1771:
	movq	-8(%rax), %rdx
	subq	$8, %rax
	movq	%rax, 136(%rsp)
	movq	%rdx, 88(%rsp)
	jmp	.L1676
	.p2align 4,,10
.L2034:
	leaq	96(%rsp), %rax
	movb	$34, 192(%rsp)
	leaq	192(%rsp), %r15
	movq	%rax, %rcx
	movq	%rax, %rdi
	movq	%r15, %rdx
.LEHB118:
	call	_ZNSt6vectorIcSaIcEE12emplace_backIJcEEEvDpOT_
	movq	%r15, %rdx
	movq	%rdi, %rcx
	movb	$0, 192(%rsp)
	call	_ZNSt6vectorIcSaIcEE12emplace_backIJcEEEvDpOT_
.LEHE118:
	movq	104(%rsp), %rbx
	movq	$0, 192(%rsp)
	subq	96(%rsp), %rbx
	movq	$0, 200(%rsp)
	movq	$0, 208(%rsp)
	movq	$0, 216(%rsp)
	movl	$0, 224(%rsp)
	movb	$0, 228(%rsp)
	movq	$0, 160(%rsp)
	movq	$0, 168(%rsp)
	movq	$0, 176(%rsp)
	je	.L1679
	movq	%rbx, %rcx
.LEHB119:
	call	_Znwy
.LEHE119:
	addq	%rax, %rbx
	movq	96(%rsp), %rdx
	movq	%rax, %r9
	movq	%rax, 160(%rsp)
	movq	%rbx, 176(%rsp)
	movq	104(%rsp), %rbx
	movq	%rax, 168(%rsp)
	subq	%rdx, %rbx
	je	.L1680
	movq	%rbx, %r8
	movq	%rax, %rcx
	call	memmove
	movq	%rax, %r9
.L1680:
	leaq	160(%rsp), %rcx
	addq	%r9, %rbx
	movq	%rbx, 168(%rsp)
.LEHB120:
	call	_Z12createStringSt6vectorIcSaIcEE
.LEHE120:
	movq	160(%rsp), %rcx
	movq	%rax, 216(%rsp)
	testq	%rcx, %rcx
	je	.L1681
	call	_ZdlPv
.L1681:
	movq	88(%rsp), %r14
	movb	$7, 228(%rsp)
	movl	544(%rsp), %eax
	movq	8(%r14), %rbp
	cmpq	16(%r14), %rbp
	movl	%eax, 224(%rsp)
	je	.L1682
	movq	200(%rsp), %rbx
	movabsq	$-3689348814741910323, %rdx
	subq	192(%rsp), %rbx
	movq	$0, 0(%rbp)
	movq	$0, 8(%rbp)
	movq	$0, 16(%rbp)
	movq	%rbx, %rax
	sarq	$3, %rax
	imulq	%rdx, %rax
	testq	%rax, %rax
	je	.L2048
	movabsq	$461168601842738790, %rdx
	cmpq	%rdx, %rax
	ja	.L2049
	movq	%rbx, %rcx
.LEHB121:
	call	_Znwy
.LEHE121:
	movq	%rax, 56(%rsp)
.L1684:
	movq	56(%rsp), %rdi
	addq	%rdi, %rbx
	movq	%rdi, 0(%rbp)
	movq	%rdi, 8(%rbp)
	movq	%rbx, 16(%rbp)
	movq	200(%rsp), %r13
	movq	192(%rsp), %rbx
	cmpq	%rbx, %r13
	je	.L1847
	.p2align 4,,10
.L1687:
	movq	%rbx, %rdx
	movq	%rdi, %rcx
.LEHB122:
	call	_ZNSt6vectorI7token_tSaIS0_EEC1ERKS2_
.LEHE122:
	movq	24(%rbx), %rax
	addq	$40, %rbx
	addq	$40, %rdi
	movq	%rax, -16(%rdi)
	movl	-8(%rbx), %eax
	movl	%eax, -8(%rdi)
	movzbl	-4(%rbx), %eax
	movb	%al, -4(%rdi)
	cmpq	%rbx, %r13
	jne	.L1687
	movq	192(%rsp), %rbx
.L1686:
	movq	216(%rsp), %rax
	movq	%rdi, 8(%rbp)
	movq	%rax, 24(%rbp)
	movl	224(%rsp), %eax
	movl	%eax, 32(%rbp)
	movzbl	228(%rsp), %eax
	movb	%al, 36(%rbp)
	addq	$40, 8(%r14)
.L1688:
	movq	96(%rsp), %rax
	cmpq	104(%rsp), %rax
	je	.L1695
	movq	%rax, 104(%rsp)
.L1695:
	movq	200(%rsp), %rdi
	cmpq	%rdi, %rbx
	je	.L1696
	.p2align 4,,10
.L1697:
	movq	%rbx, %rcx
	addq	$40, %rbx
	call	_ZNSt6vectorI7token_tSaIS0_EED1Ev
	cmpq	%rbx, %rdi
	jne	.L1697
	movq	192(%rsp), %rdi
.L1696:
	testq	%rdi, %rdi
	je	.L1698
	movq	%rdi, %rcx
	call	_ZdlPv
.L1698:
	xorl	%ebp, %ebp
	jmp	.L1676
	.p2align 4,,10
.L2033:
	leaq	192(%rsp), %r15
	movb	$92, 192(%rsp)
	leaq	96(%rsp), %rcx
	movq	%r15, %rdx
.LEHB123:
	call	_ZNSt6vectorIcSaIcEE12emplace_backIJcEEEvDpOT_
	movb	%bpl, 55(%rsp)
	jmp	.L1676
	.p2align 4,,10
.L2040:
	movq	56+errorMessage(%rip), %rdx
	movsbl	%r8b, %r8d
	leaq	192(%rsp), %r15
	movl	%r8d, %r9d
	movq	%r15, %rcx
	call	_Z7sprintfPcPKcz
	movl	544(%rsp), %eax
	leaq	glerr(%rip), %rcx
	movq	%r15, 16+glerr(%rip)
	movl	%eax, 12+glerr(%rip)
	call	_Z5raiseR7error_t
.LEHE123:
	testb	%r12b, %r12b
	jne	.L1778
.L1773:
	movq	104(%rsp), %rdx
	cmpq	112(%rsp), %rdx
	je	.L2050
	movzbl	87(%rsp), %eax
	movl	%r13d, %r12d
	movb	%al, (%rdx)
	addq	$1, 104(%rsp)
	jmp	.L1676
	.p2align 4,,10
.L1807:
	xorl	%ebx, %ebx
	xorl	%r9d, %r9d
.L1808:
	leaq	160(%rsp), %rcx
	addq	%rbx, %r9
	movq	%r9, 168(%rsp)
.LEHB124:
	call	_Z12createStringSt6vectorIcSaIcEE
.LEHE124:
	movq	160(%rsp), %rcx
	movq	%rax, 216(%rsp)
	testq	%rcx, %rcx
	je	.L1809
	call	_ZdlPv
.L1809:
	movq	88(%rsp), %r13
	movb	%r12b, 228(%rsp)
	movl	544(%rsp), %eax
	movq	8(%r13), %rdi
	cmpq	16(%r13), %rdi
	movl	%eax, 224(%rsp)
	je	.L1810
	movq	200(%rsp), %rbx
	xorl	%r14d, %r14d
	movabsq	$-3689348814741910323, %rdx
	subq	192(%rsp), %rbx
	movq	$0, (%rdi)
	movq	$0, 8(%rdi)
	movq	$0, 16(%rdi)
	movq	%rbx, %rax
	sarq	$3, %rax
	imulq	%rdx, %rax
	testq	%rax, %rax
	je	.L1812
	movabsq	$461168601842738790, %rdx
	cmpq	%rdx, %rax
	ja	.L2051
	movq	%rbx, %rcx
.LEHB125:
	call	_Znwy
.LEHE125:
	movq	%rax, %r14
.L1812:
	addq	%r14, %rbx
	movq	%r14, (%rdi)
	movq	%r14, %rsi
	movq	%r14, 8(%rdi)
	movq	%rbx, 16(%rdi)
	movq	200(%rsp), %r12
	movq	192(%rsp), %rbx
	cmpq	%rbx, %r12
	je	.L1814
	.p2align 4,,10
.L1815:
	movq	%rbx, %rdx
	movq	%rsi, %rcx
.LEHB126:
	call	_ZNSt6vectorI7token_tSaIS0_EEC1ERKS2_
.LEHE126:
	movq	24(%rbx), %rax
	addq	$40, %rbx
	addq	$40, %rsi
	movq	%rax, -16(%rsi)
	movl	-8(%rbx), %eax
	movl	%eax, -8(%rsi)
	movzbl	-4(%rbx), %eax
	movb	%al, -4(%rsi)
	cmpq	%rbx, %r12
	jne	.L1815
	movq	192(%rsp), %rbx
.L1814:
	movq	216(%rsp), %rax
	movq	%rsi, 8(%rdi)
	movq	%rax, 24(%rdi)
	movl	224(%rsp), %eax
	movl	%eax, 32(%rdi)
	movzbl	228(%rsp), %eax
	movb	%al, 36(%rdi)
	addq	$40, 8(%r13)
.L1816:
	movq	200(%rsp), %rsi
	cmpq	%rbx, %rsi
	je	.L1823
	.p2align 4,,10
.L1824:
	movq	%rbx, %rcx
	addq	$40, %rbx
	call	_ZNSt6vectorI7token_tSaIS0_EED1Ev
	cmpq	%rbx, %rsi
	jne	.L1824
	movq	192(%rsp), %rbx
.L1823:
	testq	%rbx, %rbx
	je	.L1806
	movq	%rbx, %rcx
	call	_ZdlPv
.L1806:
	testb	%bpl, %bpl
	jne	.L2052
.L1826:
	movq	136(%rsp), %rcx
	cmpq	%rcx, 128(%rsp)
	je	.L1827
	movq	96+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	544(%rsp), %eax
	movl	%eax, 12+glerr(%rip)
.LEHB127:
	call	_Z5raiseR7error_t
	movq	128(%rsp), %rcx
.L1827:
	movq	528(%rsp), %rax
	testq	%rcx, %rcx
	movl	544(%rsp), %esi
	movl	%esi, 32(%rax)
	je	.L1805
	call	_ZdlPv
.L1805:
	movq	96(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L1671
	call	_ZdlPv
.L1671:
	movq	528(%rsp), %rax
	addq	$456, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
.L2037:
	leaq	96(%rsp), %rax
	movb	$0, 192(%rsp)
	leaq	192(%rsp), %r15
	movq	%rax, %rcx
	movq	%rax, 56(%rsp)
	movq	%r15, %rdx
	call	_ZNSt6vectorIcSaIcEE12emplace_backIJcEEEvDpOT_
.LEHE127:
	movq	104(%rsp), %rbx
	movq	$0, 192(%rsp)
	subq	96(%rsp), %rbx
	movq	$0, 200(%rsp)
	movq	$0, 208(%rsp)
	movq	$0, 216(%rsp)
	movl	$0, 224(%rsp)
	movb	$0, 228(%rsp)
	movq	$0, 160(%rsp)
	movq	$0, 168(%rsp)
	movq	$0, 176(%rsp)
	je	.L1702
	movq	%rbx, %rcx
.LEHB128:
	call	_Znwy
.LEHE128:
	addq	%rax, %rbx
	movq	96(%rsp), %rdx
	movq	%rax, %r9
	movq	%rax, 160(%rsp)
	movq	%rbx, 176(%rsp)
	movq	104(%rsp), %rbx
	movq	%rax, 168(%rsp)
	subq	%rdx, %rbx
	je	.L1703
	movq	%rbx, %r8
	movq	%rax, %rcx
	call	memmove
	movq	%rax, %r9
.L1703:
	leaq	160(%rsp), %rax
	addq	%r9, %rbx
	movq	%rax, %rcx
	movq	%rbx, 168(%rsp)
	movq	%rax, 64(%rsp)
.LEHB129:
	call	_Z12createStringSt6vectorIcSaIcEE
.LEHE129:
	movq	160(%rsp), %rcx
	movq	%rax, 216(%rsp)
	testq	%rcx, %rcx
	je	.L1704
	call	_ZdlPv
.L1704:
	movq	88(%rsp), %r14
	movb	%r12b, 228(%rsp)
	movl	544(%rsp), %eax
	movq	8(%r14), %rbp
	cmpq	16(%r14), %rbp
	movl	%eax, 224(%rsp)
	je	.L1705
	movq	200(%rsp), %rbx
	movabsq	$-3689348814741910323, %rdx
	subq	192(%rsp), %rbx
	movq	$0, 0(%rbp)
	movq	$0, 8(%rbp)
	movq	$0, 16(%rbp)
	movq	%rbx, %rax
	sarq	$3, %rax
	imulq	%rdx, %rax
	testq	%rax, %rax
	je	.L2053
	movabsq	$461168601842738790, %rdx
	cmpq	%rdx, %rax
	ja	.L2054
	movq	%rbx, %rcx
.LEHB130:
	call	_Znwy
.LEHE130:
	movq	%rax, 72(%rsp)
.L1707:
	movq	72(%rsp), %rdi
	addq	%rdi, %rbx
	movq	%rdi, 0(%rbp)
	movq	%rdi, 8(%rbp)
	movq	%rbx, 16(%rbp)
	movq	200(%rsp), %r13
	movq	192(%rsp), %rbx
	cmpq	%rbx, %r13
	je	.L1848
	.p2align 4,,10
.L1710:
	movq	%rbx, %rdx
	movq	%rdi, %rcx
.LEHB131:
	call	_ZNSt6vectorI7token_tSaIS0_EEC1ERKS2_
.LEHE131:
	movq	24(%rbx), %rax
	addq	$40, %rbx
	addq	$40, %rdi
	movq	%rax, -16(%rdi)
	movl	-8(%rbx), %eax
	movl	%eax, -8(%rdi)
	movzbl	-4(%rbx), %eax
	movb	%al, -4(%rdi)
	cmpq	%rbx, %r13
	jne	.L1710
.L1709:
	movq	216(%rsp), %rax
	movq	%rdi, 8(%rbp)
	movq	%rax, 24(%rbp)
	movl	224(%rsp), %eax
	movl	%eax, 32(%rbp)
	movzbl	228(%rsp), %eax
	movb	%al, 36(%rbp)
	addq	$40, 8(%r14)
.L1711:
	movq	96(%rsp), %rax
	cmpq	104(%rsp), %rax
	je	.L1718
	movq	%rax, 104(%rsp)
.L1718:
	movq	64(%rsp), %rdx
	movb	$34, 160(%rsp)
	movq	56(%rsp), %rcx
.LEHB132:
	call	_ZNSt6vectorIcSaIcEE12emplace_backIJcEEEvDpOT_
.LEHE132:
	movq	200(%rsp), %rbx
	movq	192(%rsp), %rdi
	cmpq	%rdi, %rbx
	je	.L1719
	.p2align 4,,10
.L1720:
	movq	%rdi, %rcx
	addq	$40, %rdi
	call	_ZNSt6vectorI7token_tSaIS0_EED1Ev
	cmpq	%rdi, %rbx
	jne	.L1720
	movq	192(%rsp), %rdi
.L1719:
	testq	%rdi, %rdi
	je	.L1721
	movq	%rdi, %rcx
	call	_ZdlPv
.L1721:
	movl	$1, %ebp
	jmp	.L1676
	.p2align 4,,10
.L1724:
	xorl	%ebx, %ebx
	xorl	%r9d, %r9d
	jmp	.L1725
	.p2align 4,,10
.L2052:
	movq	88+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	544(%rsp), %eax
	movl	%eax, 12+glerr(%rip)
.LEHB133:
	call	_Z5raiseR7error_t
	jmp	.L1826
	.p2align 4,,10
.L1702:
	xorl	%ebx, %ebx
	xorl	%r9d, %r9d
	jmp	.L1703
	.p2align 4,,10
.L1679:
	xorl	%ebx, %ebx
	xorl	%r9d, %r9d
	jmp	.L1680
	.p2align 4,,10
.L1802:
	leaq	96(%rsp), %rcx
	leaq	87(%rsp), %r8
	call	_ZNSt6vectorIcSaIcEE17_M_realloc_insertIJRKcEEEvN9__gnu_cxx17__normal_iteratorIPcS1_EEDpOT_
.LEHE133:
	jmp	.L1676
	.p2align 4,,10
.L1780:
	xorl	%ebx, %ebx
	xorl	%r9d, %r9d
	jmp	.L1781
	.p2align 4,,10
.L1727:
	movq	%r15, %r8
	movq	%r12, %rdx
	movq	%r14, %rcx
.LEHB134:
	call	_ZNSt6vectorI7token_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
.LEHE134:
	movq	192(%rsp), %rbx
	jmp	.L1733
	.p2align 4,,10
.L1675:
	leaq	96(%rsp), %rcx
	leaq	87(%rsp), %r8
.LEHB135:
	call	_ZNSt6vectorIcSaIcEE17_M_realloc_insertIJRKcEEEvN9__gnu_cxx17__normal_iteratorIPcS1_EEDpOT_
.LEHE135:
	movzbl	55(%rsp), %ebp
	movb	$0, 55(%rsp)
	jmp	.L1676
	.p2align 4,,10
.L1700:
	movq	96(%rsp), %rax
	cmpq	%rax, 104(%rsp)
	jne	.L1845
	jmp	.L1826
	.p2align 4,,10
.L1682:
	movq	%r15, %r8
	movq	%rbp, %rdx
	movq	%r14, %rcx
.LEHB136:
	call	_ZNSt6vectorI7token_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
.LEHE136:
	movq	192(%rsp), %rbx
	jmp	.L1688
	.p2align 4,,10
.L1744:
	leaq	128(%rsp), %rcx
	leaq	88(%rsp), %r8
.LEHB137:
	call	_ZNSt6vectorIPS_I7token_tSaIS0_EESaIS3_EE17_M_realloc_insertIJRKS3_EEEvN9__gnu_cxx17__normal_iteratorIPS3_S5_EEDpOT_
.LEHE137:
	jmp	.L1745
	.p2align 4,,10
.L1783:
	movq	64(%rsp), %rcx
	movq	%r15, %r8
	movq	%r12, %rdx
.LEHB138:
	call	_ZNSt6vectorI7token_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
.LEHE138:
	jmp	.L1789
	.p2align 4,,10
.L2043:
	movq	$0, 56(%rsp)
	jmp	.L1729
	.p2align 4,,10
.L2048:
	movq	$0, 56(%rsp)
	jmp	.L1684
	.p2align 4,,10
.L2041:
	movq	$0, 72(%rsp)
	jmp	.L1785
	.p2align 4,,10
.L2047:
	movq	72+errorMessage(%rip), %rax
	leaq	glerr(%rip), %rcx
	movq	%rax, 16+glerr(%rip)
	movl	544(%rsp), %eax
	movl	%eax, 12+glerr(%rip)
.LEHB139:
	call	_Z5raiseR7error_t
.LEHE139:
	movq	136(%rsp), %rax
	jmp	.L1771
	.p2align 4,,10
.L1705:
	movq	%r15, %r8
	movq	%rbp, %rdx
	movq	%r14, %rcx
.LEHB140:
	call	_ZNSt6vectorI7token_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
.LEHE140:
	jmp	.L1711
	.p2align 4,,10
.L1754:
	movq	%r15, %r8
	movq	%r12, %rdx
	movq	%r14, %rcx
.LEHB141:
	call	_ZNSt6vectorI7token_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
.LEHE141:
	movq	192(%rsp), %rbx
	jmp	.L1760
	.p2align 4,,10
.L1797:
	movq	56(%rsp), %rcx
	leaq	87(%rsp), %r8
.LEHB142:
	call	_ZNSt6vectorIcSaIcEE17_M_realloc_insertIJRKcEEEvN9__gnu_cxx17__normal_iteratorIPcS1_EEDpOT_
.LEHE142:
	jmp	.L1798
	.p2align 4,,10
.L1810:
	movq	%r15, %r8
	movq	%rdi, %rdx
	movq	%r13, %rcx
.LEHB143:
	call	_ZNSt6vectorI7token_tSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
.LEHE143:
	movq	192(%rsp), %rbx
	jmp	.L1816
	.p2align 4,,10
.L2053:
	movq	$0, 72(%rsp)
	jmp	.L1707
.L2050:
	leaq	96(%rsp), %rcx
	leaq	87(%rsp), %r8
.LEHB144:
	call	_ZNSt6vectorIcSaIcEE17_M_realloc_insertIJRKcEEEvN9__gnu_cxx17__normal_iteratorIPcS1_EEDpOT_
.LEHE144:
	jmp	.L2013
.L2045:
	movq	$0, 56(%rsp)
	jmp	.L1756
.L1849:
	movq	56(%rsp), %rdi
	jmp	.L1731
.L1847:
	movq	56(%rsp), %rdi
	jmp	.L1686
.L1852:
	movq	72(%rsp), %rdi
	jmp	.L1787
.L1672:
	movq	528(%rsp), %rax
	movl	544(%rsp), %esi
	movl	%esi, 32(%rax)
	jmp	.L1805
.L1848:
	movq	72(%rsp), %rdi
	jmp	.L1709
.L1850:
	movq	56(%rsp), %rdi
	jmp	.L1758
.L2051:
.LEHB145:
	call	_ZSt17__throw_bad_allocv
.LEHE145:
.L2042:
.LEHB146:
	call	_ZSt17__throw_bad_allocv
.LEHE146:
.L2054:
.LEHB147:
	call	_ZSt17__throw_bad_allocv
.LEHE147:
.L2049:
.LEHB148:
	call	_ZSt17__throw_bad_allocv
.LEHE148:
.L2044:
.LEHB149:
	call	_ZSt17__throw_bad_allocv
.LEHE149:
.L2046:
.LEHB150:
	call	_ZSt17__throw_bad_allocv
.LEHE150:
.L1859:
.L2027:
	movq	160(%rsp), %rcx
	movq	%rax, %rbx
	testq	%rcx, %rcx
	jne	.L2023
.L1822:
	movq	%r15, %rcx
	call	_ZNSt6vectorI7token_tSaIS0_EED1Ev
.L1831:
	movq	128(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L1843
	call	_ZdlPv
.L1843:
	movq	96(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L1844
	call	_ZdlPv
.L1844:
	movq	528(%rsp), %rcx
	call	_ZNSt6vectorI7token_tSaIS0_EED1Ev
	movq	%rbx, %rcx
.LEHB151:
	call	_Unwind_Resume
.LEHE151:
.L1864:
	jmp	.L2027
.L1863:
.L2024:
	movq	%rax, %rbx
	jmp	.L1822
.L1858:
	jmp	.L2024
.L1878:
	movq	%rax, %rbx
	call	__cxa_end_catch
	movq	(%rdi), %rcx
	testq	%rcx, %rcx
	je	.L1822
.L2023:
	call	_ZdlPv
	jmp	.L1822
.L1873:
	movq	%rax, %rcx
	call	__cxa_begin_catch
	movq	56(%rsp), %rbx
.L1736:
	cmpq	%rdi, %rbx
	jne	.L2055
.LEHB152:
	call	__cxa_rethrow
.LEHE152:
.L1855:
	jmp	.L2027
.L1860:
	jmp	.L2024
.L1875:
	movq	%rax, %rcx
	call	__cxa_begin_catch
	movq	56(%rsp), %rbx
.L1763:
	cmpq	%rbx, %rdi
	jne	.L2056
.LEHB153:
	call	__cxa_rethrow
.LEHE153:
.L2055:
	movq	%rbx, %rcx
	addq	$40, %rbx
	call	_ZNSt6vectorI7token_tSaIS0_EED1Ev
	jmp	.L1736
.L1872:
	movq	%rax, %rbx
	call	__cxa_end_catch
	movq	(%r12), %rcx
	testq	%rcx, %rcx
	jne	.L2023
	jmp	.L1822
.L2056:
	movq	%rbx, %rcx
	addq	$40, %rbx
	call	_ZNSt6vectorI7token_tSaIS0_EED1Ev
	jmp	.L1763
.L1879:
	movq	%rax, %rcx
	call	__cxa_begin_catch
.L1819:
	cmpq	%r14, %rsi
	jne	.L2057
.LEHB154:
	call	__cxa_rethrow
.LEHE154:
.L1857:
	jmp	.L2027
.L1877:
	movq	%rax, %rcx
	call	__cxa_begin_catch
	movq	72(%rsp), %rbx
.L1792:
	cmpq	%rbx, %rdi
	jne	.L2058
.LEHB155:
	call	__cxa_rethrow
.LEHE155:
.L1856:
	jmp	.L2024
.L2057:
	movq	%r14, %rcx
	addq	$40, %r14
	call	_ZNSt6vectorI7token_tSaIS0_EED1Ev
	jmp	.L1819
.L1874:
	movq	%rax, %rbx
	call	__cxa_end_catch
	movq	(%r12), %rcx
	testq	%rcx, %rcx
	jne	.L2023
	jmp	.L1822
.L2058:
	movq	%rbx, %rcx
	addq	$40, %rbx
	call	_ZNSt6vectorI7token_tSaIS0_EED1Ev
	jmp	.L1792
.L1862:
	jmp	.L2027
.L1867:
	jmp	.L2027
.L1854:
	jmp	.L2024
.L1865:
	movq	%rax, %rbx
	jmp	.L1831
.L1869:
	movq	%rax, %rcx
	call	__cxa_begin_catch
	movq	56(%rsp), %rbx
.L1691:
	cmpq	%rdi, %rbx
	jne	.L2059
.LEHB156:
	call	__cxa_rethrow
.LEHE156:
.L1861:
	jmp	.L2024
.L1871:
	movq	%rax, %rcx
	call	__cxa_begin_catch
	movq	72(%rsp), %rbx
.L1714:
	cmpq	%rdi, %rbx
	jne	.L2060
.LEHB157:
	call	__cxa_rethrow
.LEHE157:
.L1876:
	movq	%rax, %rbx
	call	__cxa_end_catch
	movq	(%r12), %rcx
	testq	%rcx, %rcx
	jne	.L2023
	jmp	.L1822
.L1866:
	jmp	.L2024
.L2060:
	movq	%rbx, %rcx
	addq	$40, %rbx
	call	_ZNSt6vectorI7token_tSaIS0_EED1Ev
	jmp	.L1714
.L2059:
	movq	%rbx, %rcx
	addq	$40, %rbx
	call	_ZNSt6vectorI7token_tSaIS0_EED1Ev
	jmp	.L1691
.L1870:
	movq	%rax, %rbx
	call	__cxa_end_catch
	movq	0(%rbp), %rcx
	testq	%rcx, %rcx
	jne	.L2023
	jmp	.L1822
.L1868:
	movq	%rax, %rbx
	call	__cxa_end_catch
	movq	0(%rbp), %rcx
	testq	%rcx, %rcx
	jne	.L2023
	jmp	.L1822
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
	.align 4
.LLSDA1000:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT1000-.LLSDATTD1000
.LLSDATTD1000:
	.byte	0x1
	.uleb128 .LLSDACSE1000-.LLSDACSB1000
.LLSDACSB1000:
	.uleb128 .LEHB100-.LFB1000
	.uleb128 .LEHE100-.LEHB100
	.uleb128 .L1865-.LFB1000
	.uleb128 0
	.uleb128 .LEHB101-.LFB1000
	.uleb128 .LEHE101-.LEHB101
	.uleb128 .L1863-.LFB1000
	.uleb128 0
	.uleb128 .LEHB102-.LFB1000
	.uleb128 .LEHE102-.LEHB102
	.uleb128 .L1864-.LFB1000
	.uleb128 0
	.uleb128 .LEHB103-.LFB1000
	.uleb128 .LEHE103-.LEHB103
	.uleb128 .L1863-.LFB1000
	.uleb128 0
	.uleb128 .LEHB104-.LFB1000
	.uleb128 .LEHE104-.LEHB104
	.uleb128 .L1877-.LFB1000
	.uleb128 0x1
	.uleb128 .LEHB105-.LFB1000
	.uleb128 .LEHE105-.LEHB105
	.uleb128 .L1865-.LFB1000
	.uleb128 0
	.uleb128 .LEHB106-.LFB1000
	.uleb128 .LEHE106-.LEHB106
	.uleb128 .L1866-.LFB1000
	.uleb128 0
	.uleb128 .LEHB107-.LFB1000
	.uleb128 .LEHE107-.LEHB107
	.uleb128 .L1865-.LFB1000
	.uleb128 0
	.uleb128 .LEHB108-.LFB1000
	.uleb128 .LEHE108-.LEHB108
	.uleb128 .L1858-.LFB1000
	.uleb128 0
	.uleb128 .LEHB109-.LFB1000
	.uleb128 .LEHE109-.LEHB109
	.uleb128 .L1859-.LFB1000
	.uleb128 0
	.uleb128 .LEHB110-.LFB1000
	.uleb128 .LEHE110-.LEHB110
	.uleb128 .L1858-.LFB1000
	.uleb128 0
	.uleb128 .LEHB111-.LFB1000
	.uleb128 .LEHE111-.LEHB111
	.uleb128 .L1873-.LFB1000
	.uleb128 0x1
	.uleb128 .LEHB112-.LFB1000
	.uleb128 .LEHE112-.LEHB112
	.uleb128 .L1860-.LFB1000
	.uleb128 0
	.uleb128 .LEHB113-.LFB1000
	.uleb128 .LEHE113-.LEHB113
	.uleb128 .L1865-.LFB1000
	.uleb128 0
	.uleb128 .LEHB114-.LFB1000
	.uleb128 .LEHE114-.LEHB114
	.uleb128 .L1861-.LFB1000
	.uleb128 0
	.uleb128 .LEHB115-.LFB1000
	.uleb128 .LEHE115-.LEHB115
	.uleb128 .L1862-.LFB1000
	.uleb128 0
	.uleb128 .LEHB116-.LFB1000
	.uleb128 .LEHE116-.LEHB116
	.uleb128 .L1861-.LFB1000
	.uleb128 0
	.uleb128 .LEHB117-.LFB1000
	.uleb128 .LEHE117-.LEHB117
	.uleb128 .L1875-.LFB1000
	.uleb128 0x1
	.uleb128 .LEHB118-.LFB1000
	.uleb128 .LEHE118-.LEHB118
	.uleb128 .L1865-.LFB1000
	.uleb128 0
	.uleb128 .LEHB119-.LFB1000
	.uleb128 .LEHE119-.LEHB119
	.uleb128 .L1854-.LFB1000
	.uleb128 0
	.uleb128 .LEHB120-.LFB1000
	.uleb128 .LEHE120-.LEHB120
	.uleb128 .L1855-.LFB1000
	.uleb128 0
	.uleb128 .LEHB121-.LFB1000
	.uleb128 .LEHE121-.LEHB121
	.uleb128 .L1854-.LFB1000
	.uleb128 0
	.uleb128 .LEHB122-.LFB1000
	.uleb128 .LEHE122-.LEHB122
	.uleb128 .L1869-.LFB1000
	.uleb128 0x1
	.uleb128 .LEHB123-.LFB1000
	.uleb128 .LEHE123-.LEHB123
	.uleb128 .L1865-.LFB1000
	.uleb128 0
	.uleb128 .LEHB124-.LFB1000
	.uleb128 .LEHE124-.LEHB124
	.uleb128 .L1867-.LFB1000
	.uleb128 0
	.uleb128 .LEHB125-.LFB1000
	.uleb128 .LEHE125-.LEHB125
	.uleb128 .L1866-.LFB1000
	.uleb128 0
	.uleb128 .LEHB126-.LFB1000
	.uleb128 .LEHE126-.LEHB126
	.uleb128 .L1879-.LFB1000
	.uleb128 0x1
	.uleb128 .LEHB127-.LFB1000
	.uleb128 .LEHE127-.LEHB127
	.uleb128 .L1865-.LFB1000
	.uleb128 0
	.uleb128 .LEHB128-.LFB1000
	.uleb128 .LEHE128-.LEHB128
	.uleb128 .L1856-.LFB1000
	.uleb128 0
	.uleb128 .LEHB129-.LFB1000
	.uleb128 .LEHE129-.LEHB129
	.uleb128 .L1857-.LFB1000
	.uleb128 0
	.uleb128 .LEHB130-.LFB1000
	.uleb128 .LEHE130-.LEHB130
	.uleb128 .L1856-.LFB1000
	.uleb128 0
	.uleb128 .LEHB131-.LFB1000
	.uleb128 .LEHE131-.LEHB131
	.uleb128 .L1871-.LFB1000
	.uleb128 0x1
	.uleb128 .LEHB132-.LFB1000
	.uleb128 .LEHE132-.LEHB132
	.uleb128 .L1856-.LFB1000
	.uleb128 0
	.uleb128 .LEHB133-.LFB1000
	.uleb128 .LEHE133-.LEHB133
	.uleb128 .L1865-.LFB1000
	.uleb128 0
	.uleb128 .LEHB134-.LFB1000
	.uleb128 .LEHE134-.LEHB134
	.uleb128 .L1858-.LFB1000
	.uleb128 0
	.uleb128 .LEHB135-.LFB1000
	.uleb128 .LEHE135-.LEHB135
	.uleb128 .L1865-.LFB1000
	.uleb128 0
	.uleb128 .LEHB136-.LFB1000
	.uleb128 .LEHE136-.LEHB136
	.uleb128 .L1854-.LFB1000
	.uleb128 0
	.uleb128 .LEHB137-.LFB1000
	.uleb128 .LEHE137-.LEHB137
	.uleb128 .L1865-.LFB1000
	.uleb128 0
	.uleb128 .LEHB138-.LFB1000
	.uleb128 .LEHE138-.LEHB138
	.uleb128 .L1863-.LFB1000
	.uleb128 0
	.uleb128 .LEHB139-.LFB1000
	.uleb128 .LEHE139-.LEHB139
	.uleb128 .L1865-.LFB1000
	.uleb128 0
	.uleb128 .LEHB140-.LFB1000
	.uleb128 .LEHE140-.LEHB140
	.uleb128 .L1856-.LFB1000
	.uleb128 0
	.uleb128 .LEHB141-.LFB1000
	.uleb128 .LEHE141-.LEHB141
	.uleb128 .L1861-.LFB1000
	.uleb128 0
	.uleb128 .LEHB142-.LFB1000
	.uleb128 .LEHE142-.LEHB142
	.uleb128 .L1863-.LFB1000
	.uleb128 0
	.uleb128 .LEHB143-.LFB1000
	.uleb128 .LEHE143-.LEHB143
	.uleb128 .L1866-.LFB1000
	.uleb128 0
	.uleb128 .LEHB144-.LFB1000
	.uleb128 .LEHE144-.LEHB144
	.uleb128 .L1865-.LFB1000
	.uleb128 0
	.uleb128 .LEHB145-.LFB1000
	.uleb128 .LEHE145-.LEHB145
	.uleb128 .L1866-.LFB1000
	.uleb128 0
	.uleb128 .LEHB146-.LFB1000
	.uleb128 .LEHE146-.LEHB146
	.uleb128 .L1863-.LFB1000
	.uleb128 0
	.uleb128 .LEHB147-.LFB1000
	.uleb128 .LEHE147-.LEHB147
	.uleb128 .L1856-.LFB1000
	.uleb128 0
	.uleb128 .LEHB148-.LFB1000
	.uleb128 .LEHE148-.LEHB148
	.uleb128 .L1854-.LFB1000
	.uleb128 0
	.uleb128 .LEHB149-.LFB1000
	.uleb128 .LEHE149-.LEHB149
	.uleb128 .L1858-.LFB1000
	.uleb128 0
	.uleb128 .LEHB150-.LFB1000
	.uleb128 .LEHE150-.LEHB150
	.uleb128 .L1861-.LFB1000
	.uleb128 0
	.uleb128 .LEHB151-.LFB1000
	.uleb128 .LEHE151-.LEHB151
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB152-.LFB1000
	.uleb128 .LEHE152-.LEHB152
	.uleb128 .L1872-.LFB1000
	.uleb128 0
	.uleb128 .LEHB153-.LFB1000
	.uleb128 .LEHE153-.LEHB153
	.uleb128 .L1874-.LFB1000
	.uleb128 0
	.uleb128 .LEHB154-.LFB1000
	.uleb128 .LEHE154-.LEHB154
	.uleb128 .L1878-.LFB1000
	.uleb128 0
	.uleb128 .LEHB155-.LFB1000
	.uleb128 .LEHE155-.LEHB155
	.uleb128 .L1876-.LFB1000
	.uleb128 0
	.uleb128 .LEHB156-.LFB1000
	.uleb128 .LEHE156-.LEHB156
	.uleb128 .L1868-.LFB1000
	.uleb128 0
	.uleb128 .LEHB157-.LFB1000
	.uleb128 .LEHE157-.LEHB157
	.uleb128 .L1870-.LFB1000
	.uleb128 0
.LLSDACSE1000:
	.byte	0x1
	.byte	0
	.align 4
	.long	0

.LLSDATT1000:
	.text
	.seh_endproc
	.p2align 4,,15
	.globl	_Z12tokenizeFileR6file_t
	.def	_Z12tokenizeFileR6file_t;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z12tokenizeFileR6file_t
_Z12tokenizeFileR6file_t:
.LFB1007:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$152, %rsp
	.seh_stackalloc	152
	.seh_endprologue
	movl	$1, %r12d
	movb	$0, 36(%rcx)
	movq	8(%rdx), %rdi
	movq	%rcx, %rbp
	movq	(%rdx), %rbx
	movq	$0, (%rcx)
	movq	$0, 8(%rcx)
	movq	$0, 16(%rcx)
	movq	$0, 24(%rcx)
	cmpq	%rdi, %rbx
	movl	$0, 32(%rcx)
	movq	$0, 64(%rsp)
	movq	$0, 72(%rsp)
	movq	$0, 80(%rsp)
	je	.L2061
	leaq	63(%rsp), %rax
	movq	%rax, 40(%rsp)
	leaq	64(%rsp), %r14
	leaq	96(%rsp), %r13
	jmp	.L2074
	.p2align 4,,10
.L2064:
	addq	$1, %rbx
	cmpq	%rbx, %rdi
	je	.L2096
.L2074:
	movzbl	(%rbx), %eax
	leal	-32(%rax), %edx
	movb	%al, 63(%rsp)
	cmpb	$94, %dl
	jbe	.L2080
	leal	-9(%rax), %edx
	cmpb	$1, %dl
	ja	.L2064
.L2080:
	cmpb	$10, %al
	movq	72(%rsp), %rdx
	jne	.L2066
	cmpq	%rdx, 64(%rsp)
	je	.L2068
	movl	%r12d, %r8d
	movq	%r14, %rdx
	movq	%r13, %rcx
.LEHB158:
	call	_Z12tokenizeLineRSt6vectorIcSaIcEEj
.LEHE158:
	movq	%r13, %rdx
	movq	%rbp, %rcx
.LEHB159:
	call	_ZNSt6vectorI7token_tSaIS0_EE12emplace_backIJS0_EEEvDpOT_
.LEHE159:
	movq	104(%rsp), %rsi
	movq	96(%rsp), %r15
	cmpq	%r15, %rsi
	je	.L2069
	.p2align 4,,10
.L2070:
	movq	%r15, %rcx
	addq	$40, %r15
	call	_ZNSt6vectorI7token_tSaIS0_EED1Ev
	cmpq	%r15, %rsi
	jne	.L2070
	movq	96(%rsp), %r15
.L2069:
	testq	%r15, %r15
	je	.L2071
	movq	%r15, %rcx
	call	_ZdlPv
.L2071:
	movq	64(%rsp), %rax
	cmpq	72(%rsp), %rax
	je	.L2068
	movq	%rax, 72(%rsp)
.L2068:
	addq	$1, %rbx
	addl	$1, %r12d
	cmpq	%rbx, %rdi
	jne	.L2074
.L2096:
	movq	64(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L2061
	call	_ZdlPv
.L2061:
	movq	%rbp, %rax
	addq	$152, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
.L2066:
	cmpq	%rdx, 80(%rsp)
	je	.L2073
	movb	%al, (%rdx)
	addq	$1, 72(%rsp)
	jmp	.L2064
	.p2align 4,,10
.L2073:
	movq	40(%rsp), %r8
	movq	%r14, %rcx
.LEHB160:
	call	_ZNSt6vectorIcSaIcEE17_M_realloc_insertIJRKcEEEvN9__gnu_cxx17__normal_iteratorIPcS1_EEDpOT_
.LEHE160:
	jmp	.L2064
.L2079:
	movq	%r13, %rcx
	movq	%rax, %rbx
	call	_ZNSt6vectorI7token_tSaIS0_EED1Ev
.L2076:
	movq	64(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L2077
	call	_ZdlPv
.L2077:
	movq	%rbp, %rcx
	call	_ZNSt6vectorI7token_tSaIS0_EED1Ev
	movq	%rbx, %rcx
.LEHB161:
	call	_Unwind_Resume
.LEHE161:
.L2078:
	movq	%rax, %rbx
	jmp	.L2076
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA1007:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1007-.LLSDACSB1007
.LLSDACSB1007:
	.uleb128 .LEHB158-.LFB1007
	.uleb128 .LEHE158-.LEHB158
	.uleb128 .L2078-.LFB1007
	.uleb128 0
	.uleb128 .LEHB159-.LFB1007
	.uleb128 .LEHE159-.LEHB159
	.uleb128 .L2079-.LFB1007
	.uleb128 0
	.uleb128 .LEHB160-.LFB1007
	.uleb128 .LEHE160-.LEHB160
	.uleb128 .L2078-.LFB1007
	.uleb128 0
	.uleb128 .LEHB161-.LFB1007
	.uleb128 .LEHE161-.LEHB161
	.uleb128 0
	.uleb128 0
.LLSDACSE1007:
	.text
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC10:
	.ascii "color\0"
	.section	.text.startup,"x"
	.p2align 4,,15
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB1048:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$360, %rsp
	.seh_stackalloc	360
	.seh_endprologue
	movq	%rdx, %rsi
	movl	%ecx, %ebx
	call	__main
	leaq	.LC10(%rip), %rcx
.LEHB162:
	call	system
	leaq	208(%rsp), %rcx
	movq	%rsi, %r8
	movl	%ebx, %edx
	call	_Z11parseParamsiPPKc
.LEHE162:
	movq	248(%rsp), %rdx
	leaq	64(%rsp), %rsi
	movq	%rsi, %rcx
.LEHB163:
	call	_Z8fileReadPKc
.LEHE163:
	leaq	112(%rsp), %rbx
	movq	%rsi, %rdx
	movq	%rsi, glerr(%rip)
	movq	%rbx, %rcx
.LEHB164:
	call	_Z12tokenizeFileR6file_t
.LEHE164:
	leaq	32(%rsp), %rsi
	movq	%rbx, %rdx
	movq	$0, 32(%rsp)
	movq	$0, 40(%rsp)
	movq	%rsi, %rcx
	movq	$0, 48(%rsp)
.LEHB165:
	call	_Z14translateTokenRSt6vectorI5asm_tSaIS0_EER7token_t
	leaq	256(%rsp), %rdi
	movq	%rsi, %rdx
	movq	%rdi, %rcx
	call	_Z12assembleListRSt6vectorI5asm_tSaIS0_EE
.LEHE165:
	movq	240(%rsp), %r8
	leaq	160(%rsp), %rbp
	movq	%rdi, %rdx
	movq	%rbp, %rcx
.LEHB166:
	call	_Z12assembleFileR5crt_tPKc
.LEHE166:
	cmpb	$0, 184(%rsp)
	jne	.L2098
.L2101:
	movq	160(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L2100
	call	_ZdlPv
.L2100:
	movq	%rdi, %rcx
	call	_ZN5crt_tD1Ev
	movq	%rsi, %rcx
	call	_ZNSt6vectorI5asm_tSaIS0_EED1Ev
	movq	%rbx, %rcx
	call	_ZNSt6vectorI7token_tSaIS0_EED1Ev
	movq	64(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L2102
	call	_ZdlPv
.L2102:
	movq	216(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L2122
	call	_ZdlPv
.L2122:
	xorl	%eax, %eax
	addq	$360, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L2098:
	movq	%rbp, %rcx
.LEHB167:
	call	_Z9fileWriteR6file_t.part.24
.LEHE167:
	jmp	.L2101
.L2116:
	movq	160(%rsp), %rcx
	movq	%rax, %rbp
	testq	%rcx, %rcx
	je	.L2106
	call	_ZdlPv
.L2106:
	movq	%rdi, %rcx
	call	_ZN5crt_tD1Ev
.L2107:
	movq	%rsi, %rcx
	call	_ZNSt6vectorI5asm_tSaIS0_EED1Ev
	movq	%rbx, %rcx
	movq	%rbp, %rbx
	call	_ZNSt6vectorI7token_tSaIS0_EED1Ev
.L2108:
	movq	64(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L2110
	call	_ZdlPv
.L2110:
	movq	216(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L2111
	call	_ZdlPv
.L2111:
	movq	%rbx, %rcx
.LEHB168:
	call	_Unwind_Resume
.LEHE168:
.L2115:
	movq	%rax, %rbp
	jmp	.L2106
.L2114:
	movq	%rax, %rbp
	jmp	.L2107
.L2113:
	movq	%rax, %rbx
	jmp	.L2108
.L2112:
	movq	%rax, %rbx
	jmp	.L2110
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA1048:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1048-.LLSDACSB1048
.LLSDACSB1048:
	.uleb128 .LEHB162-.LFB1048
	.uleb128 .LEHE162-.LEHB162
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB163-.LFB1048
	.uleb128 .LEHE163-.LEHB163
	.uleb128 .L2112-.LFB1048
	.uleb128 0
	.uleb128 .LEHB164-.LFB1048
	.uleb128 .LEHE164-.LEHB164
	.uleb128 .L2113-.LFB1048
	.uleb128 0
	.uleb128 .LEHB165-.LFB1048
	.uleb128 .LEHE165-.LEHB165
	.uleb128 .L2114-.LFB1048
	.uleb128 0
	.uleb128 .LEHB166-.LFB1048
	.uleb128 .LEHE166-.LEHB166
	.uleb128 .L2115-.LFB1048
	.uleb128 0
	.uleb128 .LEHB167-.LFB1048
	.uleb128 .LEHE167-.LEHB167
	.uleb128 .L2116-.LFB1048
	.uleb128 0
	.uleb128 .LEHB168-.LFB1048
	.uleb128 .LEHE168-.LEHB168
	.uleb128 0
	.uleb128 0
.LLSDACSE1048:
	.section	.text.startup,"x"
	.seh_endproc
	.p2align 4,,15
	.def	_GLOBAL__sub_I_operatorName;	.scl	3;	.type	32;	.endef
	.seh_proc	_GLOBAL__sub_I_operatorName
_GLOBAL__sub_I_operatorName:
.LFB2396:
	.seh_endprologue
	movb	$1, 8+glerr(%rip)
	movq	$0, glerr(%rip)
	movq	$0, 16+glerr(%rip)
	ret
	.seh_endproc
	.section	.ctors,"w"
	.align 8
	.quad	_GLOBAL__sub_I_operatorName
	.section .rdata,"dr"
	.align 32
CSWTCH.272:
	.byte	34
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	39
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	92
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	7
	.byte	8
	.byte	0
	.byte	0
	.byte	27
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	13
	.byte	0
	.byte	9
	.byte	0
	.byte	11
	.globl	dataName
.LC11:
	.ascii "name\0"
.LC12:
	.ascii "byte\0"
.LC13:
	.ascii "word\0"
.LC14:
	.ascii "str\0"
.LC15:
	.ascii "reg A\0"
.LC16:
	.ascii "reg B\0"
.LC17:
	.ascii "reg X\0"
.LC18:
	.ascii "reg Y\0"
	.data
	.align 32
dataName:
	.quad	.LC11
	.quad	.LC12
	.quad	.LC13
	.quad	.LC14
	.quad	.LC9
	.quad	.LC15
	.quad	.LC16
	.quad	.LC17
	.quad	.LC18
	.globl	typeName
	.section .rdata,"dr"
.LC19:
	.ascii "array\0"
.LC20:
	.ascii "whitespace\0"
.LC21:
	.ascii "number type\0"
.LC22:
	.ascii "operator\0"
.LC23:
	.ascii "branch\0"
.LC24:
	.ascii "constant\0"
.LC25:
	.ascii "string\0"
.LC26:
	.ascii "assignment\0"
	.data
	.align 32
typeName:
	.quad	.LC19
	.quad	.LC20
	.quad	.LC21
	.quad	.LC22
	.quad	.LC11
	.quad	.LC23
	.quad	.LC24
	.quad	.LC25
	.quad	.LC26
	.globl	characterType
	.align 32
characterType:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	6
	.byte	2
	.byte	2
	.byte	3
	.byte	0
	.byte	0
	.byte	0
	.byte	3
	.byte	3
	.byte	1
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	5
	.byte	0
	.byte	3
	.byte	8
	.byte	3
	.byte	0
	.byte	0
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	0
	.byte	0
	.byte	0
	.byte	3
	.byte	4
	.byte	0
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	0
	.byte	3
	.byte	0
	.byte	0
	.byte	0
	.section .rdata,"dr"
	.align 32
_ZL12opcodeMatrix:
	.byte	0
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	24
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	8
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	72
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	88
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	104
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	120
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-120
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-104
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-88
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-72
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-56
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-40
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-24
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-8
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	15
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	31
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	47
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	63
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	79
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	95
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	111
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	127
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-113
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-97
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-81
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-65
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	7
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	23
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	39
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	55
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	71
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	87
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-128
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	66
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	82
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	40
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	98
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	114
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	56
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	20
	.byte	20
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	12
	.byte	28
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	52
	.byte	52
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	36
	.byte	44
	.byte	60
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	84
	.byte	84
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	68
	.byte	76
	.byte	92
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	116
	.byte	116
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	100
	.byte	108
	.byte	124
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-46
	.byte	3
	.byte	-46
	.byte	3
	.byte	-108
	.byte	3
	.byte	-124
	.byte	-116
	.byte	-100
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-30
	.byte	3
	.byte	-30
	.byte	3
	.byte	-76
	.byte	3
	.byte	-92
	.byte	3
	.byte	-68
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-14
	.byte	3
	.byte	-14
	.byte	3
	.byte	-44
	.byte	3
	.byte	-60
	.byte	-52
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-12
	.byte	3
	.byte	3
	.byte	-28
	.byte	-20
	.byte	-4
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-94
	.byte	3
	.byte	-94
	.byte	17
	.byte	1
	.byte	3
	.byte	5
	.byte	9
	.byte	13
	.byte	21
	.byte	25
	.byte	29
	.byte	3
	.byte	-78
	.byte	3
	.byte	-78
	.byte	49
	.byte	33
	.byte	3
	.byte	37
	.byte	41
	.byte	45
	.byte	53
	.byte	57
	.byte	61
	.byte	3
	.byte	-62
	.byte	3
	.byte	-62
	.byte	81
	.byte	65
	.byte	3
	.byte	69
	.byte	73
	.byte	77
	.byte	85
	.byte	89
	.byte	93
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	113
	.byte	97
	.byte	3
	.byte	101
	.byte	105
	.byte	109
	.byte	117
	.byte	121
	.byte	125
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-111
	.byte	-127
	.byte	3
	.byte	-123
	.byte	-119
	.byte	-115
	.byte	-107
	.byte	-103
	.byte	-99
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-79
	.byte	-95
	.byte	3
	.byte	-91
	.byte	-87
	.byte	-83
	.byte	-75
	.byte	-71
	.byte	-67
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-47
	.byte	-63
	.byte	3
	.byte	-59
	.byte	-55
	.byte	-51
	.byte	-43
	.byte	-39
	.byte	-35
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-15
	.byte	3
	.byte	3
	.byte	-27
	.byte	-23
	.byte	-19
	.byte	-11
	.byte	-7
	.byte	-3
	.byte	3
	.byte	-126
	.byte	3
	.byte	-126
	.byte	18
	.byte	2
	.byte	3
	.byte	6
	.byte	10
	.byte	14
	.byte	22
	.byte	26
	.byte	30
	.byte	3
	.byte	-110
	.byte	3
	.byte	-110
	.byte	50
	.byte	34
	.byte	3
	.byte	38
	.byte	42
	.byte	46
	.byte	54
	.byte	58
	.byte	62
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	70
	.byte	74
	.byte	78
	.byte	86
	.byte	90
	.byte	94
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	102
	.byte	106
	.byte	110
	.byte	118
	.byte	122
	.byte	126
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-122
	.byte	-118
	.byte	-114
	.byte	-106
	.byte	-102
	.byte	-98
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-90
	.byte	3
	.byte	-82
	.byte	-74
	.byte	3
	.byte	-66
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-58
	.byte	-54
	.byte	3
	.byte	-42
	.byte	-38
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-26
	.byte	-22
	.byte	-18
	.byte	-10
	.byte	-6
	.byte	-2
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	16
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	48
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	80
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	112
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-112
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-80
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-48
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-16
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-49
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	103
	.byte	103
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-86
	.byte	3
	.byte	3
	.byte	-70
	.byte	3
	.byte	3
	.byte	3
	.byte	119
	.byte	119
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-50
	.byte	3
	.byte	3
	.byte	-34
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-36
	.byte	-84
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-96
	.byte	3
	.byte	-96
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-64
	.byte	3
	.byte	-64
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-32
	.byte	3
	.byte	-32
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-31
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-33
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-17
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	32
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	-1
	.byte	96
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	64
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.globl	instructionNames
.LC27:
	.ascii "nop\0"
.LC28:
	.ascii "wai\0"
.LC29:
	.ascii "jam\0"
.LC30:
	.ascii "php\0"
.LC31:
	.ascii "plp\0"
.LC32:
	.ascii "pha\0"
.LC33:
	.ascii "pla\0"
.LC34:
	.ascii "phb\0"
.LC35:
	.ascii "plb\0"
.LC36:
	.ascii "phx\0"
.LC37:
	.ascii "plx\0"
.LC38:
	.ascii "phy\0"
.LC39:
	.ascii "ply\0"
.LC40:
	.ascii "phd\0"
.LC41:
	.ascii "pld\0"
.LC42:
	.ascii "tab\0"
.LC43:
	.ascii "tax\0"
.LC44:
	.ascii "tay\0"
.LC45:
	.ascii "tba\0"
.LC46:
	.ascii "txa\0"
.LC47:
	.ascii "txy\0"
.LC48:
	.ascii "tya\0"
.LC49:
	.ascii "tyx\0"
.LC50:
	.ascii "txs\0"
.LC51:
	.ascii "tsx\0"
.LC52:
	.ascii "thd\0"
.LC53:
	.ascii "tdh\0"
.LC54:
	.ascii "clc\0"
.LC55:
	.ascii "sec\0"
.LC56:
	.ascii "cli\0"
.LC57:
	.ascii "sei\0"
.LC58:
	.ascii "clf\0"
.LC59:
	.ascii "sef\0"
.LC60:
	.ascii "clv\0"
.LC61:
	.ascii "inx\0"
.LC62:
	.ascii "iny\0"
.LC63:
	.ascii "ins\0"
.LC64:
	.ascii "dex\0"
.LC65:
	.ascii "dey\0"
.LC66:
	.ascii "des\0"
.LC67:
	.ascii "asl\0"
.LC68:
	.ascii "lsr\0"
.LC69:
	.ascii "rol\0"
.LC70:
	.ascii "ror\0"
.LC71:
	.ascii "cmp\0"
.LC72:
	.ascii "cpx\0"
.LC73:
	.ascii "cpy\0"
.LC74:
	.ascii "cmd\0"
.LC75:
	.ascii "and\0"
.LC76:
	.ascii "ora\0"
.LC77:
	.ascii "xor\0"
.LC78:
	.ascii "lta\0"
.LC79:
	.ascii "ltb\0"
.LC80:
	.ascii "ltx\0"
.LC81:
	.ascii "lty\0"
.LC82:
	.ascii "ltd\0"
.LC83:
	.ascii "adc\0"
.LC84:
	.ascii "sbc\0"
.LC85:
	.ascii "stz\0"
.LC86:
	.ascii "sta\0"
.LC87:
	.ascii "stb\0"
.LC88:
	.ascii "stx\0"
.LC89:
	.ascii "sty\0"
.LC90:
	.ascii "std\0"
.LC91:
	.ascii "bpl\0"
.LC92:
	.ascii "bmi\0"
.LC93:
	.ascii "bvc\0"
.LC94:
	.ascii "bvs\0"
.LC95:
	.ascii "bcc\0"
.LC96:
	.ascii "bcs\0"
.LC97:
	.ascii "bne\0"
.LC98:
	.ascii "beq\0"
.LC99:
	.ascii "bra\0"
.LC100:
	.ascii "inc\0"
.LC101:
	.ascii "dec\0"
.LC102:
	.ascii "bit\0"
.LC103:
	.ascii "mul\0"
.LC104:
	.ascii "div\0"
.LC105:
	.ascii "mod\0"
.LC106:
	.ascii "ltv\0"
.LC107:
	.ascii "jmp\0"
.LC108:
	.ascii "jsr\0"
.LC109:
	.ascii "rts\0"
.LC110:
	.ascii "rti\0"
.LC111:
	.ascii ".byte\0"
.LC112:
	.ascii ".word\0"
.LC113:
	.ascii ".fill\0"
.LC114:
	.ascii ".align\0"
.LC115:
	.ascii ".set\0"
.LC116:
	.ascii ".def\0"
.LC117:
	.ascii ".del\0"
.LC118:
	.ascii ".spos\0"
.LC119:
	.ascii ".fpos\0"
.LC120:
	.ascii ".vpos\0"
.LC121:
	.ascii ".file\0"
.LC122:
	.ascii ".lib\0"
.LC123:
	.ascii ".size\0"
.LC124:
	.ascii "???\0"
	.data
	.align 32
instructionNames:
	.quad	.LC27
	.quad	.LC28
	.quad	.LC29
	.quad	.LC30
	.quad	.LC31
	.quad	.LC32
	.quad	.LC33
	.quad	.LC34
	.quad	.LC35
	.quad	.LC36
	.quad	.LC37
	.quad	.LC38
	.quad	.LC39
	.quad	.LC40
	.quad	.LC41
	.quad	.LC42
	.quad	.LC43
	.quad	.LC44
	.quad	.LC45
	.quad	.LC46
	.quad	.LC47
	.quad	.LC48
	.quad	.LC49
	.quad	.LC50
	.quad	.LC51
	.quad	.LC52
	.quad	.LC53
	.quad	.LC54
	.quad	.LC55
	.quad	.LC56
	.quad	.LC57
	.quad	.LC58
	.quad	.LC59
	.quad	.LC60
	.quad	.LC61
	.quad	.LC62
	.quad	.LC63
	.quad	.LC64
	.quad	.LC65
	.quad	.LC66
	.quad	.LC67
	.quad	.LC68
	.quad	.LC69
	.quad	.LC70
	.quad	.LC71
	.quad	.LC72
	.quad	.LC73
	.quad	.LC74
	.quad	.LC75
	.quad	.LC76
	.quad	.LC77
	.quad	.LC78
	.quad	.LC79
	.quad	.LC80
	.quad	.LC81
	.quad	.LC82
	.quad	.LC83
	.quad	.LC84
	.quad	.LC85
	.quad	.LC86
	.quad	.LC87
	.quad	.LC88
	.quad	.LC89
	.quad	.LC90
	.quad	.LC91
	.quad	.LC92
	.quad	.LC93
	.quad	.LC94
	.quad	.LC95
	.quad	.LC96
	.quad	.LC97
	.quad	.LC98
	.quad	.LC99
	.quad	.LC100
	.quad	.LC101
	.quad	.LC102
	.quad	.LC103
	.quad	.LC104
	.quad	.LC105
	.quad	.LC106
	.quad	.LC107
	.quad	.LC108
	.quad	.LC109
	.quad	.LC110
	.quad	0
	.quad	.LC111
	.quad	.LC112
	.quad	.LC113
	.quad	.LC114
	.quad	.LC115
	.quad	.LC116
	.quad	.LC117
	.quad	.LC118
	.quad	.LC119
	.quad	.LC120
	.quad	.LC121
	.quad	.LC122
	.quad	.LC123
	.quad	.LC124
	.globl	registerNames
	.section .rdata,"dr"
.LC125:
	.ascii "None\0"
.LC126:
	.ascii "A\0"
.LC127:
	.ascii "B\0"
.LC128:
	.ascii "X\0"
.LC129:
	.ascii "Y\0"
	.data
	.align 32
registerNames:
	.quad	.LC125
	.quad	.LC126
	.quad	.LC127
	.quad	.LC128
	.quad	.LC129
	.globl	addrModeNames
	.section .rdata,"dr"
.LC130:
	.ascii "Implied\0"
.LC131:
	.ascii "Accumulator\0"
.LC132:
	.ascii "Buffer\0"
.LC133:
	.ascii "Immediate Byte\0"
.LC134:
	.ascii "Immediate Word\0"
.LC135:
	.ascii "Relative\0"
.LC136:
	.ascii "Direct\0"
.LC137:
	.ascii "Direct X\0"
.LC138:
	.ascii "Direct Y\0"
.LC139:
	.ascii "Zeropage\0"
.LC140:
	.ascii "Zeropage X\0"
.LC141:
	.ascii "Zeropage Y\0"
.LC142:
	.ascii "Indirect\0"
.LC143:
	.ascii "Invalid\0"
	.data
	.align 32
addrModeNames:
	.quad	.LC130
	.quad	.LC131
	.quad	.LC132
	.quad	.LC133
	.quad	.LC134
	.quad	.LC135
	.quad	.LC136
	.quad	.LC137
	.quad	.LC138
	.quad	.LC139
	.quad	.LC140
	.quad	.LC141
	.quad	.LC142
	.quad	.LC143
	.globl	glerr
	.bss
	.align 16
glerr:
	.space 24
	.globl	colored
colored:
	.space 1
	.globl	errorMessage
	.section .rdata,"dr"
.LC144:
	.ascii "no input\0"
.LC145:
	.ascii "flag -%c requires a string\0"
	.align 8
.LC146:
	.ascii "flag must be only 1 character long\0"
.LC147:
	.ascii "empty flag\0"
.LC148:
	.ascii "invalid flag -%c\0"
.LC149:
	.ascii "input file is not specified\0"
.LC150:
	.ascii "failed to open file <%s>\0"
.LC151:
	.ascii "invalid character '%c' (%02X)\0"
.LC152:
	.ascii "invalid opening parenthesis\0"
.LC153:
	.ascii "invalid closing parenthesis\0"
.LC154:
	.ascii "empty parentheses\0"
.LC155:
	.ascii "not closed string\0"
.LC156:
	.ascii "not closed parentheses\0"
.LC157:
	.ascii "expected <%s>, but got <%s>\0"
.LC158:
	.ascii "too much arguments\0"
.LC159:
	.ascii "repeated label sign ':'\0"
.LC160:
	.ascii "repeated equal sign '='\0"
.LC161:
	.ascii "invalid label operator \"%s\"\0"
.LC162:
	.ascii "argument cannot be <%s>\0"
.LC163:
	.ascii "invalid hex number \"%s\"\0"
.LC164:
	.ascii "invalid bin number \"%s\"\0"
.LC165:
	.ascii "invalid dec number \"%s\"\0"
.LC166:
	.ascii "number 0x%X is too big\0"
.LC167:
	.ascii "conflicting number types\0"
.LC168:
	.ascii "term is already constant\0"
.LC169:
	.ascii "invalid operand type <%s>\0"
.LC170:
	.ascii "left operand is missing\0"
.LC171:
	.ascii "right operand is missing\0"
.LC172:
	.ascii "invalid operator \"%s\"\0"
.LC173:
	.ascii "assertion error 0x%02X\0"
.LC174:
	.ascii "redundant <number type>\0"
.LC175:
	.ascii "<%s> cannot be constant\0"
.LC176:
	.ascii "unused <number type>\0"
.LC177:
	.ascii "unused constant\0"
.LC178:
	.ascii "invalid escape character \\%c\0"
	.align 8
.LC179:
	.ascii "branch offset is one directional\0"
.LC180:
	.ascii "invalid branch character \"%c\"\0"
	.align 8
.LC181:
	.ascii "branch offset is too long (+%d)\0"
	.align 8
.LC182:
	.ascii "branch offset is too long (%d)\0"
.LC183:
	.ascii "zero-offset anonymous branch\0"
.LC184:
	.ascii "<%s> is unsupported\0"
.LC185:
	.ascii "variable name must be <name>\0"
	.align 8
.LC186:
	.ascii "argument must be <numeric type>\0"
.LC187:
	.ascii "addressing mode is already %s\0"
.LC188:
	.ascii "%s mode cannot be indexed\0"
.LC189:
	.ascii "\"%s\" does not support %s mode\0"
	.align 8
.LC190:
	.ascii "instruction does not support names\0"
	.align 8
.LC191:
	.ascii "instruction requires arguments\0"
	.align 8
.LC192:
	.ascii "anonymous branch was not found\0"
.LC193:
	.ascii "<%s> is not requestable\0"
.LC194:
	.ascii "variable \"%s\" is not defined\0"
	.data
	.align 32
errorMessage:
	.quad	.LC144
	.quad	.LC145
	.quad	.LC146
	.quad	.LC147
	.quad	.LC148
	.quad	.LC149
	.quad	.LC150
	.quad	.LC151
	.quad	.LC152
	.quad	.LC153
	.quad	.LC154
	.quad	.LC155
	.quad	.LC156
	.quad	.LC157
	.quad	.LC158
	.quad	.LC159
	.quad	.LC160
	.quad	.LC161
	.quad	.LC162
	.quad	.LC163
	.quad	.LC164
	.quad	.LC165
	.quad	.LC166
	.quad	.LC167
	.quad	.LC168
	.quad	.LC169
	.quad	.LC170
	.quad	.LC171
	.quad	.LC172
	.quad	.LC173
	.quad	.LC174
	.quad	.LC175
	.quad	.LC176
	.quad	.LC177
	.quad	.LC178
	.quad	.LC179
	.quad	.LC180
	.quad	.LC181
	.quad	.LC182
	.quad	.LC183
	.quad	.LC184
	.quad	.LC185
	.quad	.LC186
	.quad	.LC187
	.quad	.LC188
	.quad	.LC189
	.quad	.LC190
	.quad	.LC191
	.quad	.LC192
	.quad	.LC193
	.quad	.LC194
	.globl	errorNameColor
	.section .rdata,"dr"
.LC195:
	.ascii "\33[38;5;220mWarning\33[0m\0"
.LC196:
	.ascii "\33[38;5;196mError\33[0m\0"
	.data
	.align 16
errorNameColor:
	.quad	.LC195
	.quad	.LC196
	.globl	errorName
	.section .rdata,"dr"
.LC197:
	.ascii "Warning\0"
.LC198:
	.ascii "Error\0"
	.data
	.align 16
errorName:
	.quad	.LC197
	.quad	.LC198
	.globl	operatorName
	.section .rdata,"dr"
.LC199:
	.ascii "?\0"
.LC200:
	.ascii "&\0"
.LC201:
	.ascii "|\0"
.LC202:
	.ascii "^\0"
.LC203:
	.ascii "+\0"
.LC204:
	.ascii "-\0"
.LC205:
	.ascii "*\0"
.LC206:
	.ascii "/\0"
.LC207:
	.ascii "<<\0"
.LC208:
	.ascii ">>\0"
	.data
	.align 32
operatorName:
	.quad	.LC199
	.quad	.LC200
	.quad	.LC201
	.quad	.LC202
	.quad	.LC203
	.quad	.LC204
	.quad	.LC205
	.quad	.LC206
	.quad	.LC207
	.quad	.LC208
	.quad	0
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
	.def	__mingw_vsprintf;	.scl	2;	.type	32;	.endef
	.def	putchar;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	_Znay;	.scl	2;	.type	32;	.endef
	.def	strcmpi;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	_ZdlPv;	.scl	2;	.type	32;	.endef
	.def	_Znwy;	.scl	2;	.type	32;	.endef
	.def	_ZSt17__throw_bad_allocv;	.scl	2;	.type	32;	.endef
	.def	memmove;	.scl	2;	.type	32;	.endef
	.def	memcpy;	.scl	2;	.type	32;	.endef
	.def	_ZSt20__throw_length_errorPKc;	.scl	2;	.type	32;	.endef
	.def	_Unwind_Resume;	.scl	2;	.type	32;	.endef
	.def	fgetc;	.scl	2;	.type	32;	.endef
	.def	feof;	.scl	2;	.type	32;	.endef
	.def	__cxa_begin_catch;	.scl	2;	.type	32;	.endef
	.def	__cxa_rethrow;	.scl	2;	.type	32;	.endef
	.def	__cxa_end_catch;	.scl	2;	.type	32;	.endef
	.def	system;	.scl	2;	.type	32;	.endef
