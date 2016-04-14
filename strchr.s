[BITS 64]
		global strchr:function
		section .text
strchr:
		push rbp
		mov rbp, rsp
		xor r8, r8
loop:
		cmp byte [rdi + r8], 0
		je end
		cmp byte [rdi + r8], sil
		je end
		inc r8
		jmp loop
end:
		add rdi, r8
		mov rax, rdi
		mov rsp, rbp
		pop rbp
		ret
