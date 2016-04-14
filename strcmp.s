[BITS 64]
		global strcmp:function
		section .text
strcmp:
		push rbp
		mov rbp, rsp
		xor r8, r8
loop:
		mov al, byte [rdi + r8]
		mov bl, byte [rsi + r8]
		cmp al, 0
		je end
		cmp bl, 0
		je end
		cmp al, bl
		jne end
		inc r8
		jmp loop
end:
		sub rax, rbx
		mov rsp, rbp
		pop rbp
		ret
