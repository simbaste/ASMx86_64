[BITS 64]
		global strncmp:function
		section .text
strncmp:
		push rbp
		mov rbp, rsp
		xor r8, r8
		xor rax, rax
		xor rbx, rbx
loop:
		cmp r8, rdx
		je equal
		mov al, byte [rdi + r8]
		mov bl, byte [rsi + r8]
		cmp al, bl
		jg end_func
		cmp al, bl
		jl end_func
		cmp al, 0
		je equal
		inc r8
		jmp loop
end_func:
		xor r8, r8
		mov r8, rax
		sub r8, rbx
		jmp end
equal:
		xor r8, r8
		jmp end
end:
		mov rax, r8
		mov rsp, rbp
		pop rbp
		ret
