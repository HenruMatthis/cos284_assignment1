; ==========================u
;Henru_Matthis_u23526158; Group member 01: Name_Surname_student-nr
; Group member 02: Name_Surname_student-nr
; Group member 03: Name_Surname_student-nr
; ==========================

section .bss
    ; ==========================
    ; Your data goes here
    ; ==========================
    choice resb 1            ; reserve 1 byte for the user's choice

section .text
    global get_user_choice

extern greeting             

get_user_choice:
    ; Call the greeting function to print the welcome message
    call greeting

    ; ==========================
    ; Your data goes here
    ; ==========================
    ; Do not modify anything below this line unless you know what you are doing 
    ; Print a message to enter choice
    mov rax, 0              ; sys_read
    mov rdi, 0              ; stdin
    mov rsi, choice         ; buffer to store input
    mov rdx, 1              ; number of bytes to read
    syscall

    ; Convert ASCII digit to integer (0x30 is ASCII '0')
    movzx rax, byte [choice]
    sub rax, '0'
 ; Optional: Validate input
    cmp rax, 1
    je valid_choice
    cmp rax, 2
    je valid_choice

    ; If invalid, set rax to 0 (or some other error handling)
    mov rax, 0
    ret

valid_choice:
    ;return 1 or 2
    ret