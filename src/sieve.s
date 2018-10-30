	.file	"sieve.c"
	.section .rdata,"dr"
LC0:
	.ascii "%d\12\0"
	.text
	.globl	_sieveoferatosthenes
	.def	_sieveoferatosthenes;	.scl	2;	.type	32;	.endef
_sieveoferatosthenes:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	movl	$2, -12(%ebp)
	jmp	L2
L7:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L3
	movl	$2, -16(%ebp)
	jmp	L4
L6:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	imull	-16(%ebp), %eax
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	cmpl	12(%ebp), %eax
	jg	L11
	movl	-20(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	$0, (%eax)
	addl	$1, -16(%ebp)
L4:
	movl	-16(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L6
	jmp	L3
L11:
	nop
L3:
	addl	$1, -12(%ebp)
L2:
	movl	-12(%ebp), %eax
	imull	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jle	L7
	movl	$2, -12(%ebp)
	jmp	L8
L10:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L9
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
L9:
	addl	$1, -12(%ebp)
L8:
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jle	L10
	nop
	leave
	ret
	.ident	"GCC: (GNU) 6.4.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
