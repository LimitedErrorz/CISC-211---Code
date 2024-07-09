section .text
    global _start

    ; x = (a x b) + (c x d)
_start:

    ; (a times b)
    mov eax, [a]
    mov ebx, [b]
    imul eax, ebx
    
    ;(c times d)
    mov ecx, [c]
    mov edx, [d]
    imul ecx, edx
    
    ;(add products together)
    add eax, ecx
    mov [x], eax
    
; system exit
    mov eax,1
    mov ebx,0
    int 0x80

section .data
    a DD 1
    b DD 2
    c DD 3
    d DD 4
    
segment .bss
    x resd 1