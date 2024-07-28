section .text
        global _start

_start:
    mov eax, [testvar]     ; testvar into eax register
    mov ebx, 1             ; ebx register will holds result inside factorial func
    call factorial         ; call the factorial func
    mov [result], eax      ; store final product (eax) into result
    jmp exit               ; jump to exit

factorial:
    cmp eax, 1             ; compare eax with 1
    jle mov_result         ; if eax <= 1, factorial is complete
    imul ebx, eax          ; ebx = ebx * eax
    dec eax                ; eax = eax - 1
    jmp factorial          ; loop

mov_result:
    mov eax, ebx
    ret

exit:
    mov eax, 1             ; sys exit
    int 0x80

section .data
    testvar dd 5           ; 5 is test variable/pre-defined number input
    result dd 1            ; store result of factorial, this case 120
