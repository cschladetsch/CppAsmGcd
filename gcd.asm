section .text
global gcd

gcd:
    ; Function signature: gcd(uint64_t a, uint64_t b)
    ; Input: rdi = a, rsi = b
    ; Output: rax = gcd(a, b)

    mov rax, rdi          ; rax = a
    mov rbx, rsi          ; rbx = b

gcd_loop:
    cmp rax, rbx          ; Compare a and b
    je gcd_done_a         ; If a == b, return a
    ja gcd_a_greater      ; If a > b, subtract b from a
    sub rbx, rax          ; b = b - a
    jmp gcd_loop          ; Repeat

gcd_a_greater:
    sub rax, rbx          ; a = a - b
    jmp gcd_loop          ; Repeat

gcd_done_a:
    ret                   ; Return rax (GCD is in a)

