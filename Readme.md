# LCM Calculator with C++ and NASM

This project demonstrates the integration of a NASM (x86-64 Assembly) function with a modern C++23 program to compute the Least Common Multiple (LCM) of two 64-bit integers. The project is built using GCC, NASM, and CMake.

## Features
- **LCM Calculation**: Uses the Euclidean algorithm to compute the Greatest Common Divisor (GCD) in assembly, which is then used to compute the LCM in C++.
- **Efficient Assembly Code**: The GCD function is implemented in optimized x86-64 NASM assembly for high performance.
- **C++23 Integration**: The main program is written in modern C++23 for readability and performance.
- **Cross-Platform Build System**: Uses CMake to ensure seamless building on different systems.

## Performance

![Image](resources/Untititled.png)

## Requirements
- **Compiler**: GCC with C++23 support
- **Assembler**: NASM
- **Build System**: CMake

## Directory Structure
```
lcm_project/
├── CMakeLists.txt    # Build configuration
├── gcd.asm           # NASM assembly file for GCD computation
├── main.cpp          # C++ source file for LCM calculation
```

## Usage
1. Run the program:
   ```bash
   $ ./r A B
   $ # will retrurn the LCM of A and B
   ```

2. Enter two 64-bit integers when prompted. Example:
   ```
   Enter two 64-bit integers: 123123 5345345
   The LCM of 123123 and 5345345 is: 658134912435
   ```

## Technical Details
- **LCM Calculation**:
  The LCM is calculated using the formula:
  \[
  \text{LCM}(a, b) = \frac{a \cdot b}{\text{GCD}(a, b)}
  \]
- **NASM GCD Function**:
  The assembly function uses the Euclidean algorithm to efficiently compute the GCD of two numbers.
- **CMake Configuration**:
  - The `CMakeLists.txt` ensures correct compilation and linking of the NASM and C++ components.

## Contribution
Feel free to fork the repository, make improvements, and submit pull requests. All contributions are welcome!

## License
This project is open-source and distributed under the MIT License. See the `LICENSE` file for details.


