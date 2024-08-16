section .data
    fmt db "%d ", 0                  ; Format string for printf to print integer
    prompt_msg db "Enter plaintext to encrypt: ", 0
    cipher_msg db "The cipher text is: ", 0
    scanf_fmt db "%4s", 0            ; Format string for scanf to read 4 characters

section .bss
    plaintext resb 5                 ; Reserve 5 bytes for the plaintext input (4 + 1 for null terminator)
    cipher resd 4                    ; Reserve space for the cipher text (4 integers)

section .text
    global encrypt_and_print

extern printf
extern scanf

; Function to print a single integer from the rax register using printf
print_char_32:
    mov rsi, rax                     ; Move integer to rsi
    mov rdi, fmt                     ; Format string in rdi
    xor rax, rax                     ; Clear rax for printf
    call printf                      ; Call printf
    ret

encrypt_and_print:
    ; Step 1: Display "Enter plaintext to encrypt: "
    mov rdi, prompt_msg              ; Load the address of the prompt message
    xor rax, rax                     ; Clear rax for printf
    call printf                      ; Display the message

    ; Step 2: Read 4 bytes of plaintext input
    mov rdi, plaintext               ; Load the address of the plaintext buffer
    mov rsi, scanf_fmt               ; Format string to read 4 characters
    xor rax, rax                     ; Clear rax for scanf
    call scanf                       ; Read the input from the user

    ; Step 3: Display "The cipher text is: "
    mov rdi, cipher_msg              ; Load the address of the cipher message
    xor rax, rax                     ; Clear rax for printf
    call printf                      ; Display the message

    ; Step 4: Encrypt each character and print the result
    mov rcx, 4                       ; Set loop counter to 4 (for 4 characters)
    lea rsi, [plaintext]             ; Load address of plaintext into rsi
    lea rdi, [cipher]                ; Load address of cipher into rdi

encrypt_loop:
    ; Load a character from plaintext
    mov al, byte [rsi]
    ; Convert to integer (ASCII value)
    movzx eax, al
    ; Store the result in the cipher array
    mov [rdi], eax
    ; Print the encrypted integer using the provided function
    call print_char_32

    ; Increment rsi to point to the next character
    inc rsi
    ; Increment rdi to point to the next integer in cipher
    add rdi, 4
    ; Decrement rcx, and loop back if not zero
    loop encrypt_loop

    ; Return from the function
    xor rax, rax                     ; Return value 0
    ret
