; ==========================
;Henru_Matthis_u23526158; Group member 01: Name_Surname_student-nr
; Group member 02: Name_Surname_student-nr
; Group member 03: Name_Surname_student-nr
; ==========================

section .data
    fmt db "%c", 0
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    ; Your data goes here
    ; ==========================
     xor_key dd 0x73113777 ;xor key
    

    

section .bss
    ; ==========================
    ; Your data goes here
    ; ==========================

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

; Kinda works
; encrypt_and_print:
;     ; Assuming RSI contains the address of the string to be encrypted
;     mov al, [rsi]           ; Load the first character
;     rol al, 4               ; Rotate the character left by 4 bits
;     xor eax, dword [xor_key] ; XOR with the key

;     ; Print the result of the XOR operation (for debugging)
;     push rax
;     mov rsi, rax
;     mov rdi, fmt
;     xor rax, rax
;     call printf
;     pop rax

;     ret
encrypt_and_print:
    mov rcx, 4               ; Assume 4 characters to encrypt
    xor rbx, rbx             ; Clear rbx, use it as an index for the string

encrypt_loop:
    mov al, [rsi + rbx]      ; Load the current character
    rol al, 4                ; Rotate the character left by 4 bits
    xor eax, dword [xor_key] ; XOR with the key

    ; Print the encrypted result (for debugging)
    mov rdi, fmt
    mov rsi, rax
    xor rax, rax             ; Clear rax before calling printf
    call printf

    add rbx, 1               ; Move to the next character
    loop encrypt_loop        ; Repeat for each character
make 
    ret