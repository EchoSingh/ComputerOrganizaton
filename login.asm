section .data
    username_prompt db 'Enter username: ', 0
    password_prompt db 'Enter password: ', 0
    login_success db 'Login successful!', 0
    login_fail db 'Login failed. Incorrect username or password.', 0
    hardcoded_username db 'user', 0
    hardcoded_password db 'pass', 0

section .bss
    entered_username resb 10
    entered_password resb 10

section .text
    global _start

_start:
    ; Prompt for username
    mov eax, 4            ; sys_write
    mov ebx, 1            ; file descriptor (stdout)
    mov ecx, username_prompt
    mov edx, 15           ; message length
    int 0x80

    ; Read username
    mov eax, 3            ; sys_read
    mov ebx, 0            ; file descriptor (stdin)
    mov ecx, entered_username
    mov edx, 10           ; max bytes to read
    int 0x80

    ; Prompt for password
    mov eax, 4            ; sys_write
    mov ebx, 1            ; file descriptor (stdout)
    mov ecx, password_prompt
    mov edx, 15           ; message length
    int 0x80

    ; Read password
    mov eax, 3            ; sys_read
    mov ebx, 0            ; file descriptor (stdin)
    mov ecx, entered_password
    mov edx, 10           ; max bytes to read
    int 0x80

    ; Null-terminate the entered strings
    mov byte [entered_username + eax - 1], 0
    mov byte [entered_password + eax - 1], 0

    ; Validate username
    mov esi, hardcoded_username
    mov edi, entered_username
    call compare_strings
    cmp eax, 0
    jne login_failed

    ; Validate password
    mov esi, hardcoded_password
    mov edi, entered_password
    call compare_strings
    cmp eax, 0
    jne login_failed

    ; Login successful
    mov eax, 4            ; sys_write
    mov ebx, 1            ; file descriptor (stdout)
    mov ecx, login_success
    mov edx, 17           ; message length
    int 0x80
    jmp exit

login_failed:
    ; Login failed
    mov eax, 4            ; sys_write
    mov ebx, 1            ; file descriptor (stdout)
    mov ecx, login_fail
    mov edx, 41           ; message length
    int 0x80

exit:
    ; Exit the program
    mov eax, 1            ; sys_exit
    xor ebx, ebx          ; status 0
    int 0x80

; Compare two null-terminated strings
compare_strings:
    push esi
    push edi
    xor eax, eax
    cld
.compare_loop:
    lodsb
    scasb
    jne .not_equal
    test al, al
    jnz .compare_loop
    xor eax, eax
    inc eax
    jmp .done
.not_equal:
    xor eax, eax
.done:
    pop edi
    pop esi
    ret
