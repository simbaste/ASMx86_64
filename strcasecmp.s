[BITS 64]
		global strcasecmp:function
		section .text
strcasecmp:
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
suite1:		cmp al, 90
		jle lower1
suite2:		cmp bl, 90
		jle lower2
suite3:		cmp al, bl
		jne end
		inc r8
		jmp loop
lower1:
		cmp al, 65
		jge lo1
		jmp suite2
lo1:		add al, 32
		jmp suite2
lower2:
		cmp bl, 65
		jge lo2
		jmp suite3
lo2:		add bl, 32
		jmp suite3
end:
		sub rax, rbx
		mov rsp, rbp
		pop rbp
		ret
