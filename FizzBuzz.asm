; Name: Nandor Magyar
;
; Application:  FizzBuzz
;
; Spefication:
; ~~~~~~~~~~~~
; Write a program that prints the numbers from 1 to 100. But for multiples of
; three print "Fizz" instead of the number and for the multiples of five print
; "Buzz". For numbers which are multiples of both three and five print 
; "FizzBuzz".
;
;
; Usage:
; ~~~~~~
; Compile & Run (MASM, Irvince32 library required)
; 
n = 100


Include Irvine32.inc

.data
fizz_text BYTE "Fizz",0
buzz_text BYTE "Buzz",0
touched BYTE ?

.code
main PROC
	mov ecx,1
	loop_1:
	; looking for fizz
	mov [touched], 0
	mov edx,0
	mov eax,ecx
	mov ebx,3
	idiv ebx
	cmp edx,0
	jne not_fizz
		mov edx, offset fizz_text
		Call WriteString
		mov [touched], 1
	not_fizz:
	; looking for buzz
	mov edx,0
	mov eax,ecx
	mov ebx,5
	idiv ebx
	cmp edx,0
	jne not_buzz
		mov edx,offset buzz_text
		Call WriteString
		mov [touched], 1
	not_buzz:
	cmp [touched], 0
	jne no_print
	mov eax, ecx
	Call WriteDec
	no_print:
	Call CrLf
	inc ecx
	cmp ecx,n
	jle loop_1
    
	exit
main ENDP
END main
