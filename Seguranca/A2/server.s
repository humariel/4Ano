	.file	"server.c"
	.intel_syntax noprefix
	.text
	.comm	sock,4,4
	.globl	confSendTime
	.bss
	.align 4
	.type	confSendTime, @object
	.size	confSendTime, 4
confSendTime:
	.zero	4
	.comm	client,16,4
	.globl	clientAddressLen
	.data
	.align 4
	.type	clientAddressLen, @object
	.size	clientAddressLen, 4
clientAddressLen:
	.long	16
	.globl	messageNumber
	.bss
	.align 4
	.type	messageNumber, @object
	.size	messageNumber, 4
messageNumber:
	.zero	4
	.section	.rodata
.LC0:
	.string	"QUIT: %s\n"
	.text
	.globl	die
	.type	die, @function
die:
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	sub	esp, 8
	push	DWORD PTR [ebp+8]
	push	OFFSET FLAT:.LC0
	call	printf
	add	esp, 16
	sub	esp, 12
	push	0
	call	exit
	.size	die, .-die
	.section	.rodata
.LC1:
	.string	"Sending Current Time: %s\n"
	.text
	.globl	sendCurrentTime
	.type	sendCurrentTime, @function
sendCurrentTime:
	push	ebp
	mov	ebp, esp
	sub	esp, 24
	sub	esp, 12
	push	0
	call	time
	add	esp, 16
	mov	DWORD PTR [ebp-16], eax
	sub	esp, 12
	lea	eax, [ebp-16]
	push	eax
	call	ctime
	add	esp, 16
	mov	DWORD PTR [ebp-12], eax
	sub	esp, 8
	push	DWORD PTR [ebp-12]
	push	OFFSET FLAT:.LC1
	call	printf
	add	esp, 16
	sub	esp, 12
	push	DWORD PTR [ebp-12]
	call	strlen
	add	esp, 16
	mov	edx, eax
	mov	eax, DWORD PTR sock
	sub	esp, 8
	push	16
	push	OFFSET FLAT:client
	push	0
	push	edx
	push	DWORD PTR [ebp-12]
	push	eax
	call	sendto
	add	esp, 32
	nop
	leave
	ret
	.size	sendCurrentTime, .-sendCurrentTime
	.section	.rodata
.LC2:
	.string	"ECHO:%2u: %s"
.LC3:
	.string	"sendTime: %08x\n"
	.text
	.globl	sendEcho
	.type	sendEcho, @function
sendEcho:
	push	ebp
	mov	ebp, esp
	sub	esp, 40
	mov	eax, DWORD PTR messageNumber
	add	eax, 1
	mov	DWORD PTR messageNumber, eax
	mov	eax, DWORD PTR messageNumber
	mov	DWORD PTR [ebp-12], eax
	mov	eax, DWORD PTR confSendTime
	mov	DWORD PTR [ebp-16], eax
	push	DWORD PTR [ebp+8]
	push	DWORD PTR [ebp-12]
	push	OFFSET FLAT:.LC2
	lea	eax, [ebp-32]
	push	eax
	call	sprintf
	add	esp, 16
	sub	esp, 8
	push	DWORD PTR [ebp-16]
	push	OFFSET FLAT:.LC3
	call	printf
	add	esp, 16
	cmp	DWORD PTR [ebp-16], 1
	jne	.L4
	call	sendCurrentTime
.L4:
	sub	esp, 12
	lea	eax, [ebp-32]
	push	eax
	call	strlen
	add	esp, 16
	mov	edx, eax
	mov	eax, DWORD PTR sock
	sub	esp, 8
	push	16
	push	OFFSET FLAT:client
	push	0
	push	edx
	lea	edx, [ebp-32]
	push	edx
	push	eax
	call	sendto
	add	esp, 32
	nop
	leave
	ret
	.size	sendEcho, .-sendEcho
	.section	.rodata
.LC4:
	.string	"Unable to create socket"
.LC5:
	.string	"Unable to bind socket"
.LC6:
	.string	"Address: %p \n"
.LC7:
	.string	"Waiting for packet"
.LC8:
	.string	"Received packet from %s:%d\n"
.LC9:
	.string	"Data: %s\n"
.LC10:
	.string	"Done."
	.text
	.globl	main
	.type	main, @function
main:
	lea	ecx, [esp+4]
	and	esp, -16
	push	DWORD PTR [ecx-4]
	push	ebp
	mov	ebp, esp
	push	ebx
	push	ecx
	sub	esp, 2080
	sub	esp, 4
	push	17
	push	2
	push	2
	call	socket
	add	esp, 16
	mov	DWORD PTR sock, eax
	mov	eax, DWORD PTR sock
	cmp	eax, -1
	jne	.L6
	sub	esp, 12
	push	OFFSET FLAT:.LC4
	call	die
	add	esp, 16
.L6:
	sub	esp, 4
	push	16
	push	0
	lea	eax, [ebp-28]
	push	eax
	call	memset
	add	esp, 16
	mov	WORD PTR [ebp-28], 2
	sub	esp, 12
	push	12345
	call	htons
	add	esp, 16
	mov	WORD PTR [ebp-26], ax
	sub	esp, 12
	push	0
	call	htonl
	add	esp, 16
	mov	DWORD PTR [ebp-24], eax
	mov	eax, DWORD PTR sock
	sub	esp, 4
	push	16
	lea	edx, [ebp-28]
	push	edx
	push	eax
	call	bind
	add	esp, 16
	cmp	eax, -1
	jne	.L7
	sub	esp, 12
	push	OFFSET FLAT:.LC5
	call	die
	add	esp, 16
.L7:
	sub	esp, 12
	push	DWORD PTR [ebp-16]
	push	DWORD PTR [ebp-20]
	push	DWORD PTR [ebp-24]
	push	DWORD PTR [ebp-28]
	push	OFFSET FLAT:.LC6
	call	printf
	add	esp, 32
.L10:
	sub	esp, 4
	push	2048
	push	0
	lea	eax, [ebp-2076]
	push	eax
	call	memset
	add	esp, 16
	sub	esp, 12
	push	OFFSET FLAT:.LC7
	call	puts
	add	esp, 16
	mov	eax, DWORD PTR sock
	sub	esp, 8
	push	OFFSET FLAT:clientAddressLen
	push	OFFSET FLAT:client
	push	0
	push	2048
	lea	edx, [ebp-2076]
	push	edx
	push	eax
	call	recvfrom
	add	esp, 32
	mov	DWORD PTR [ebp-12], eax
	cmp	DWORD PTR [ebp-12], 0
	jle	.L11
	movzx	eax, WORD PTR client+2
	movzx	eax, ax
	sub	esp, 12
	push	eax
	call	ntohs
	add	esp, 16
	movzx	ebx, ax
	sub	esp, 12
	push	DWORD PTR client+4
	call	inet_ntoa
	add	esp, 16
	sub	esp, 4
	push	ebx
	push	eax
	push	OFFSET FLAT:.LC8
	call	printf
	add	esp, 16
	sub	esp, 8
	lea	eax, [ebp-2076]
	push	eax
	push	OFFSET FLAT:.LC9
	call	printf
	add	esp, 16
	sub	esp, 12
	lea	eax, [ebp-2076]
	push	eax
	call	sendEcho
	add	esp, 16
	sub	esp, 12
	push	OFFSET FLAT:.LC10
	call	puts
	add	esp, 16
	jmp	.L10
.L11:
	nop
	jmp	.L10
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
