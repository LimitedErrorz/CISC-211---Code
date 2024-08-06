section .text
    global _start

_start:
    call add3     ; function that will add three variables and assign it to 'result'
    jmp exit

add3:
; move all variables into registers
    mov eax, [x]
    mov ebx, [y]
    mov ecx, [z]
    
; adding all vars together (using add instruction)
    add eax, ebx
    add eax, ecx

; storing eax (the func's sum) into 'result'
    mov [result], eax

; deallocating memory of registers (setting regs to 0)
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    ret

exit:
    mov eax, 1
    int 0x80

section .data
; 3 variables (x,y,z) should result in 10 after 'add3' func
    x dd 2
    y dd 5
    z dd 3

segment .bss
; uninitialized variable to hold the final sum/result
    result resb 4  ; 4 bytes for integer