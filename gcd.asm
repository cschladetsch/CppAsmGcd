section .text
global gcd

gcd:
    ; Function signature: gcd(uint64_t a, uint64_t b)
    ; Input: rdi = a, rsi = b
    ; Output: rax = gcd(a, b)
    
    mov rax, rdi        ; Keep a in rax
    mov rcx, rsi        ; Keep b in rcx
    
    ; Check for zero inputs
    test rax, rax
    jz return_b         ; if a == 0, return b
    test rcx, rcx
    jz return_a         ; if b == 0, return a
    
    ; Save registers we'll need
    push rbx
    push r8
    
    ; Find trailing zeros in both numbers
    bsf rbx, rax       ; Find trailing zeros in a
    mov r8, rcx        ; Save b
    bsf rcx, rcx       ; Find trailing zeros in b
    
    ; Take minimum of trailing zeros
    cmp rbx, rcx
    cmova rbx, rcx     ; rbx = min(trailing zeros)
    mov rcx, r8        ; Restore b
    
    ; Remove trailing zeros
    mov r8, rax        ; Save a
    mov cl, bl         ; Use cl for shift count
    shr r8, cl         ; a >>= trailing zeros
    mov rax, r8        ; Restore shifted a
    mov r8, rcx        ; Save b
    shr r8, cl         ; b >>= trailing zeros
    mov rcx, r8        ; Restore shifted b
    
    ; Save power of 2 factor
    push rbx

main_loop:
    cmp rax, rcx
    je done            ; Numbers are equal -> found GCD
    ja a_greater
    
    ; b > a
    sub rcx, rax
    shr rcx, 1         ; Divide by 2 (result is always even)
    jmp main_loop
    
a_greater:
    sub rax, rcx
    shr rax, 1         ; Divide by 2 (result is always even)
    jmp main_loop

done:
    ; Multiply result by saved power of 2
    pop rbx            ; Restore power of 2
    mov cl, bl         ; Move to cl for shift
    shl rax, cl        ; Multiply by 2^power
    
    pop r8             ; Restore saved registers
    pop rbx
    ret

return_a:
    ret               ; rax already contains a

return_b:
    mov rax, rsi      ; Return b
    ret
