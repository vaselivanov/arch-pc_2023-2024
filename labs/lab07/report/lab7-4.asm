%include 'in_out.asm'
section .data
msg1 db "Введите x:",0h
msg2 db "Введите a:",0h
msg3 db "Ответ:",0h
x resb 10
a resb 10
global _start
_start:
mov eax,msg1
call sprint
mov ecx,x
mov edx,10
call sread
mov eax,x
call atoi ; Вызов подпрограммы перевода символа в число
mov [x],eax ; запись преобразованного числа в 'x'

mov eax,msg2
call sprint
mov ecx,a
mov edx,10
call sread
; ---------- Преобразование 'a' из символа в число
mov eax,a
call atoi ; Вызов подпрограммы перевода символа в число
mov [a],eax ; запись преобразованного числа в 'a'

mov eax,[a]
cmp eax,3
jl fin
jmp fin1
fin:
mov eax, msg3
call sprint 
mov eax,[a]
mov ebx,3
mul ebx
call iprintLF 
call quit ; Выход
fin1:
mov eax,msg3
call sprint
mov eax,[x]
add eax,1
call iprintLF 
call quit ; Выход
