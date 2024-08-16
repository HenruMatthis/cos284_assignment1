; ==========================
;Henru_Matthis_u23526158 ; Group member 01: Name_Surname_student-nr
; Group member 02: Name_Surname_student-nr
; Group member 03: Name_Surname_student-nr
; ==========================

section .data
    ; ==========================
     ; ==========================
    greeting_message db "Welcome agent. What do you want to do, Encrypt [1] or Decrypt [2]?", 0
    newline db 10, 0

section .text
    global greeting

greeting:
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    ; Your code goes here
    ; ==========================

    ; Print greeting
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, greeting_message   ; message to write
    mov edx, 66         ; message length
    int 0x80            ; call kernel

    ; ==========================
    ; Do not modify anything below this line unless you know what you are doing

    ret                 ; return from function