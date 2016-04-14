[BITS 64]
		global strlen:function
		section .text
strlen:
		push rbp
		mov rbp, rsp
		xor r8, r8
loop:
		cmp byte [rdi + r8], 0
		je end
		inc r8
		jmp loop
end:
		mov rax, r8
		mov rsp, rbp
		pop rbp
		ret
