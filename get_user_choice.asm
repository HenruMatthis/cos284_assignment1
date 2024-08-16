; ==========================
;Henru_Matthis_u23526158 ; Group member 01: Name_Surname_student-nr
; Group member 02: Name_Surname_student-nr
; Group member 03: Name_Surname_student-nr
; ==========================

section .bss
    choice resb 1          ; Reserve 1 byte for the user's choice

section .data
    msg db "Choice: ", 0   ; Message to display

section .text
    global get_user_choice

extern greeting

get_user_choice:
  ; Call the greeting function to print the welcome message
    call greeting
    
    mov rax, 1             ; sys_write syscall number
    mov rdi, 1             ; file descriptor 1 (stdout)
    mov rsi, msg           ; pointer to the message
    mov rdx, 8             ; length of the message (7 characters + 1 null terminator)
    syscall

    ; Step 2: Read 1 byte of user input
    mov rax, 0             ; sys_read syscall number
    mov rdi, 0             ; file descriptor 0 (stdin)
    mov rsi, choice        ; buffer to store input
    mov rdx, 1             ; number of bytes to read
    syscall

    ; Step 3: Convert ASCII digit to integer
    movzx rax, byte [choice]  ; Load the byte from choice and zero-extend it
    sub rax, '0'              ; Convert ASCII character to integer ('1' -> 1, '2' -> 2)

    ; Step 4: Print the input value (optional, only if you want to echo it back)
    mov rdi, rax           ; Move the integer value to rdi
    add rdi, '0'           ; Convert the integer back to ASCII for printing

    mov rax, 1             ; sys_write syscall number
    mov rdi, 1             ; file descriptor 1 (stdout)
    mov rsi, choice        ; address of the character to print
    mov rdx, 1             ; length (1 byte)
    syscall

    ; ==========================
    ; Your data goes here
    ; ==========================
    ; Do not modify anything below this line unless you know what you are doing 
    ret