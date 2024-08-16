section .data
    fmt db "%u ", 0            ; Format string for printing an unsigned integer
    xor_key dd 0x73113777       ; XOR key used for encryption

section .text
    global encrypt_and_print

extern printf

encrypt_and_print:
    ; Input pointer is in rdi (this would be passed from the C function)
    mov rcx, 4              ; We expect 4 characters in the input string

encrypt_loop:
    ; Load and process each character
    movzx eax, byte [rdi]   ; Load a character into eax and zero-extend to 32 bits
    rol al, 4               ; Rotate the lower 8 bits (al) left by 4
    xor eax, dword [xor_key]; XOR the 32-bit value in eax with the xor_key

    ; Print the encrypted integer value
    mov rsi, rax            ; Move the 32-bit encrypted result into rsi
    mov rdi, fmt            ; Load the format string into rdi
    xor rax, rax            ; Clear rax before calling printf
    call printf             ; Call printf to print the encrypted value

    inc rdi                 ; Move to the next character in the input string
    loop encrypt_loop       ; Loop until all characters are processed

    ret                     ; Return from the function
