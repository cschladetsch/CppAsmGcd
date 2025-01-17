cmake_minimum_required(VERSION 3.15)
project(LCMWithNASM LANGUAGES C CXX ASM_NASM)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(lcm main.cpp gcd.asm)

# Specify NASM as the assembler
set_property(SOURCE gcd.asm PROPERTY LANGUAGE ASM_NASM)

