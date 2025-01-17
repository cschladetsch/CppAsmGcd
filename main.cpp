#include <iostream>
#include <cstdint> // Ensure uint64_t is defined

extern "C" uint64_t gcd(uint64_t a, uint64_t b); // Declare the NASM function

uint64_t lcm(uint64_t a, uint64_t b) {
    if (a == 0 || b == 0) {
        return 0;
    }
    return (a / gcd(a, b)) * b; // Call the NASM gcd function
}

int main() {
    uint64_t a, b;

    std::cout << "Enter two 64-bit integers: ";
    std::cin >> a >> b;

    uint64_t result = lcm(a, b);
    std::cout << "The LCM of " << a << " and " << b << " is: " << result << std::endl;

    return 0;
}

