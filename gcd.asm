section .text
global gcd

gcd:
    ; Function signature: gcd(uint64_t a, uint64_t b)
    ; Input: rdi = a, rsi = b
    ; Output: rax = gcd(a, b)
    
    mov rax, rdi          ; rax = a
    mov rbx, rsi          ; rbx = b
    
.gcd_loop:
    test rbx, rbx         ; Check if b == 0
    jz .done              ; If b == 0, GCD is in rax
    xor rdx, rdx          ; Clear rdx (needed for div instruction)
    div rbx               ; rax = rax / rbx, rdx = rax % rbx
    mov rax, rbx          ; a = b
    mov rbx, rdx          ; b = a % b
    jmp .gcd_loop         ; Repeat
    
.done:
    ret                   ; Return rax (GCD)

