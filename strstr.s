[BITS 64]
		global strstr:function
		section .text
strstr:
		push rbp
		mov rbp, rsp
		xor r8, r8
loop:
		cmp byte [rdi + r8], 0
		je end
		mov bl, [rsi + 0]
		cmp byte [rdi + r8], bl
		je compare
		inc r8
		jmp loop
compare:
		xor rcx, rcx
		mov rax, r8
suite:		cmp byte [rdi + r8], 0
		je end
		mov bl, byte [rsi + rcx]
		cmp byte [rdi + rax], bl
		jne end_l
		inc rcx
		cmp byte [rsi + rcx], 0
		je end
		inc rax
		jmp suite
end_l:
		inc r8
		jmp loop
end:
		add rdi, r8
		mov rax, rdi
		mov rsp, rbp
		pop rbp
		ret
