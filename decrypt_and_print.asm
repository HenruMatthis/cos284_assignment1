; ; ==========================
; ;Henru_Matthis_u23526158; Group member 01: Name_Surname_student-nr
; ; Group member 02: Name_Surname_student-nr
; ; Group member 03: Name_Surname_student-nr
; ; ==========================

; section .data
;     fmt db "%c", 0
;     ; Do not modify anything above this line unless you know what you are doing
;     ; ==========================
;     ; Your data goes here
;     ; ==========================
;     xor_key dd 0x73113777 ;xor key

; section .text
; global decrypt_and_print

; extern printf

; ;When using the below function, be sure to place whatever you want to print in the rax register first
; print_char_32:
;     mov rsi, rax
;     mov rdi, fmt
;     xor rax, rax
;     call printf
;     ret

; decrypt_and_print:
;     ; Assuming integers passed in edi, esi, edx, ecx

;     ; Decrypt first integer
;     mov eax, edi
;     xor eax, dword [xor_key]
;     ror al, 4
;     mov rsi, rax
;     mov rdi, fmt
;     xor rax, rax
;     call printf

;     ; Decrypt second integer
;     mov eax, esi
;     xor eax, dword [xor_key]
;     ror al, 4
;     mov rsi, rax
;     mov rdi, fmt
;     xor rax, rax
;     call printf

;     ; Decrypt third integer
;     mov eax, edx
;     xor eax, dword [xor_key]
;     ror al, 4
;     mov rsi, rax
;     mov rdi, fmt
;     xor rax, rax
;     call printf

;     ; Decrypt fourth integer
;     mov eax, ecx
;     xor eax, dword [xor_key]
;     ror al, 4
;     mov rsi, rax
;     mov rdi, fmt
;     xor rax, rax
;     call printf

;     ret
; ==========================
; Group member 01: Name_Surname_student-nr
; Group member 02: Name_Surname_student-nr
; Group member 03: Name_Surname_student-nr
; ==========================

section .data
    fmt db "%c", 0
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    ; Your data goes here
    ; ==========================

section .text
global decrypt_and_print

extern printf

;When using the below function, be sure to place whatever you want to print in the rax register first
print_char_32:
    mov rsi, rax
    mov rdi, fmt
    xor rax, rax
    call printf
    ret

decrypt_and_print:
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    ; Your code goes here
    ; ==========================
    ; Do not modify anything below this line unless you know what you are doing

    ret