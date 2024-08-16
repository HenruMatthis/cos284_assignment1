; ==========================
;Henru_Matthis_u23526158 ; Group member 01: Name_Surname_student-nr
; Group member 02: Name_Surname_student-nr
; Group member 03: Name_Surname_student-nr
; ==========================

section .data
    ; ==========================
    fmt db "Welcome agent. What do you want to do, Encrypt [1] or Decrypt [2]? ",10  
    fmt_len equ $-fmt   ; Your data goes here

    ; ==========================

section .text
    global greeting

greeting:
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    ; Your code goes here
    ; ==========================
    ; Do not modify anything below this line unless you know what you are doing
        ; Print the welcome message
    mov rax, 1              ; sys_write
    mov rdi, 1              ; stdout
    mov rsi, fmt    ; address of the message
    mov rdx, fmt_len        ; length of the message

    syscall
   ; mov rdx , 69
     mov rax, 1                     ; sys_exit syscall number
    xor rdi, rdi                    ; exit code 0
              

    ret                         ; return from function