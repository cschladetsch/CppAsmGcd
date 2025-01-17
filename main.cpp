#include <iostream>
#include <cstdint>
#include <cstdlib>

extern "C" uint64_t gcd(uint64_t a, uint64_t b); // Declare the NASM function

uint64_t lcm(uint64_t a, uint64_t b) {
    return (a && b) ? (a / gcd(a, b)) * b : 0; // Calculate LCM using GCD
}

int main(int argc, char* argv[]) {
    if (argc != 3) {
        std::cerr << "Usage: " << argv[0] << " <integer1> <integer2>\n";
        return 1;
    }

    try {
        uint64_t a = std::stoull(argv[1]);
        uint64_t b = std::stoull(argv[2]);

        uint64_t result = lcm(a, b);
        std::cout << result << std::endl;
        return 0;
    } catch (const std::exception& e) {
        std::cerr << "Error: " << e.what() << "\n";
        return 1;
    }
}

