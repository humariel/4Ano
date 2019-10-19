	.file	"bo.c"
	.intel_syntax noprefix
	.section	.rodata
.LC0:
	.string	"%s"
	.text
	.globl	foo
	.type	foo, @function
foo:
	push	ebp
	mov	ebp, esp
	push	ebx
	sub	esp, 20
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	sub	esp, 8
	lea	edx, -12[ebp]
	push	edx
	lea	edx, .LC0@GOTOFF[eax]
	push	edx
	mov	ebx, eax
	call	__isoc99_scanf@PLT
	add	esp, 16
	nop
	mov	ebx, DWORD PTR -4[ebp]
	leave
	ret
	.size	foo, .-foo
	.globl	main
	.type	main, @function
main:
	lea	ecx, 4[esp]
	and	esp, -16
	push	DWORD PTR -4[ecx]
	push	ebp
	mov	ebp, esp
	push	ecx
	sub	esp, 4
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, ecx
	sub	esp, 12
	push	DWORD PTR [eax]
	call	foo
	add	esp, 16
	mov	eax, 0
	mov	ecx, DWORD PTR -4[ebp]
	leave
	lea	esp, -4[ecx]
	ret
	.size	main, .-main
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
	mov	eax, DWORD PTR [esp]
	ret
	.ident	"GCC: (Debian 6.3.0-18) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
