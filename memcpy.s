[BITS 64]
		section .text
		global memcpy:function
memcpy:
		push rbp
		mov rbp, rsp
		xor r8, r8
loop:
		cmp r8, rdx
		je end
		mov r9b, [rsi + r8]
		mov [rdi + r8], r9b
		cmp byte [rsi + r8], 0
		je end
		inc r8
		jmp loop
end:
		mov rax, rdi
		mov rsp, rbp
		pop rbp
		ret
