.586
.model flat, stdcall
.stack 2096
includelib libcmt.lib
includelib legacy_stdio_definitions.lib

ExitProcess PROTO, dwExitCode: DWORD
extern scanf:NEAR
extern malloc:NEAR
extern printf:NEAR

.data
	format_s BYTE "%s", 0
	format_sn BYTE "%s", 0Ah, 0
	msg BYTE "Enter a word: ", 0
	; Do not declare any other variables here

.code

	caesar_cipher:
		push ebp
		mov ebp,esp
		sub esp,4
		mov edx,0
		mov [ebp-4],edx
		push 20
		call malloc
		add esp,4
		mov ebx,[ebp+8]
		mov ecx,0

		beginwhile:
			push edx
			mov edx,[ebp-4]
			mov ecx,0
			mov cl, BYTE PTR [ebx+edx]
			pop edx
			cmp ecx,edx
			je endwhile
			push edx

			add ecx,3
			mov edx,[ebp-4]
			mov [eax+edx],ecx

			mov edx,[ebp-4]
			add edx,1
			mov [ebp-4],edx
			pop edx
			jmp beginwhile
		
		endwhile:

			mov ecx,[ebp-4]
			mov [eax+ecx],edx
			add esp,4
			pop ebp
			ret
	


	main PROC c
		push ebp
		mov ebp, esp
		sub esp, 20

		;printf("Enter a word: ")
		push offset msg
		call printf
		add esp, 4

		;scanf("%s", plaintext)
		lea eax, [ebp-20]
		push eax
		push offset format_s 
		call scanf
		add esp, 8

		;caesar_cipher(plaintext)		
		lea eax, [ebp-20]
		push eax
		call caesar_cipher
		add esp, 4

		push eax
		push offset format_sn
		call printf  
		add esp, 8

		add esp, 20
		pop ebp
		INVOKE ExitProcess, 0
	main endp

end