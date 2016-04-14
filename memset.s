[BITS 64]
		global memset:function
		section .text
memset:
		push rbp
		mov rbp, rsp
		xor r8, r8
loop:
		cmp r8, rdx
		jge end
		mov byte [rdi + r8], sil
		inc r8
		jmp loop
end:
		mov rax, rdi
		mov rsp, rbp
		pop rbp
		ret
