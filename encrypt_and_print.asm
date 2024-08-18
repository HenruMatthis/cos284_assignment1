section .data
    fmt db "%u ", 0            ; Format string for printing an unsigned integer
    xor_key dd 0x73113777      ; XOR key used for encryption

section .text
    global encrypt_and_print

extern printf

;When using the below function, be sure to place whatever you want to print in the rax register first
print_char_32:
    mov rsi, rax
    mov rdi, fmt
    xor rax, rax
    call printf
    ret

encrypt_and_print:
    mov ecx, 4                  ; Set loop counter to 4
    mov al, byte [rdi]

encrypt_loop:
    cmp ecx, 0                  ; Check if loop counter is 0
    je .end                     ; If 0, exit the loop

    cmp al, 0                   ; Check for null-terminator
    je .end                     ; If null-terminator, exit the loop

    movzx rax, al
    rol rax, 4                  ; Rotate the lower 8 bits (al) left by 4
    xor rax, [xor_key]          ; XOR the 32-bit value in eax with the xor_key
    call print_char_32

    inc rdi                     ; Move to the next character
    mov ah, [rdi]               ; Load the next character into AL

    loop encrypt_loop           ; Decrement loop counter and repeat

.end:
    ret


