.686
.model flat 
extern _ExitProcess@4 : PROC
extern __write : PROC
public _main

.data 

tekst db 10, 'Nazywam sie Mikolaj Wirkijowski'
	  db ' Moj pierwszy 32-bitowy program'
	  db ' asemblerowy dziala juz super!', 0

.code
petelka PROC
	push ebp
	mov ebp, esp
	mov eax, [ebp+8]
	mov ebx, [ebp+12]
	mov ecx, [ebp+16]
	ptl: add eax, ebx
		 add ebx,2
		 loop ptl

	pop ebp
	ret

petelka ENDP

_main PROC
	push dword ptr 5h
	push dword ptr 3h 
	push dword ptr 0h

	call petelka
	sub esp, 12

	mov ecx,  85
	push ecx
	push dword PTR OFFSET tekst
	push dword PTR 1
	call __write
	add esp, 12
	push dword PTR 0
	call _ExitProcess@4
_main ENDP
END