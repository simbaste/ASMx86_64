[BITS 64]
		global rindex:function
		section .text
rindex:
		push rbp
		mov rbp, rsp
		xor r8, r8
loop_len:
		cmp byte [rdi + r8], 0
		je func_index
		inc r8
		jmp loop_len
func_index:
		cmp [rdi + r8], sil
		je end
		cmp r8, -1
		je end_l
		dec r8
		jmp func_index
end:
		add rdi, r8
		mov rax, rdi
		mov rsp, rbp
		pop rbp
		ret
end_l:
		mov rax, 0
		mov rsp, rbp
		pop rbp
		ret
