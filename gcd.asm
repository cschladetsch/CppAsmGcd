section .text
global gcd

gcd:
    ; Function signature: gcd(uint64_t a, uint64_t b)
    ; Input: rdi = a, rsi = b
    ; Output: rax = gcd(a, b)

    mov rax, rdi          ; rax = a
    mov rbx, rsi          ; rbx = b

    test rax, rax         ; Check if a == 0
    jz gcd_done_b         ; If a == 0, return b
    test rbx, rbx         ; Check if b == 0
    jz gcd_done_a         ; If b == 0, return a

    ; Remove common factors of 2
    mov rcx, rax          ; rcx = a
    or rcx, rbx           ; rcx = a | b
    test rcx, 1           ; Check if both a and b are even
    jz gcd_even_common

gcd_loop:
    test rax, 1           ; Check if a is even
    jnz gcd_a_odd
    shr rax, 1            ; a = a / 2
    jmp gcd_loop

gcd_a_odd:
    test rbx, 1           ; Check if b is even
    jnz gcd_both_odd
    shr rbx, 1            ; b = b / 2
    jmp gcd_loop

gcd_both_odd:
    cmp rax, rbx          ; Compare a and b
    je gcd_done_a         ; If a == b, return a
    ja gcd_a_greater
    sub rbx, rax          ; b = b - a
    shr rbx, 1            ; Reduce b by 2 (maintaining oddness)
    jmp gcd_loop

gcd_a_greater:
    sub rax, rbx          ; a = a - b
    shr rax, 1            ; Reduce a by 2 (maintaining oddness)
    jmp gcd_loop

gcd_even_common:
    shr rax, 1            ; Remove common factor of 2
    shr rbx, 1
    jmp gcd_loop

gcd_done_a:
    ret                   ; Return rax (GCD is in a)

gcd_done_b:
    mov rax, rbx          ; Return b as the GCD
    ret

