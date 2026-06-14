# C Programming — Overview

## What is C?

C is a general-purpose, procedural programming language developed by Dennis Ritchie at Bell Labs in 1972. It is the foundation of modern computing: the Linux kernel, Python interpreter, MySQL database, and most operating systems are written in C.

## Why Learn C?

- **Understand how computers actually work** — memory, pointers, hardware interaction
- **Foundation for C++, Rust, Go** — all are influenced by C
- **Embedded systems and IoT** — microcontrollers (Arduino) use C
- **GATE/Competitive exams** — C is a core subject in all CS curricula
- **Operating systems** — understanding C is essential for kernel development

## C vs C++ vs Python

| Feature | C | C++ | Python |
|---|---|---|---|
| Paradigm | Procedural | Multi-paradigm (OOP + procedural) | Multi-paradigm |
| Speed | Fastest | Very fast | Slower (interpreted) |
| Memory management | Manual (malloc/free) | Manual + RAII | Automatic (GC) |
| Use case | OS, embedded, systems | Games, system software, HPC | Scripting, ML, web |
| Learning curve | Moderate | Steep | Easy |

## Install a C Compiler

```bash
# Ubuntu/Debian
sudo apt update && sudo apt install gcc build-essential
gcc --version

# macOS
xcode-select --install      # Installs Clang (Apple's C compiler)
gcc --version               # Points to Clang

# Windows: MinGW-w64 or WSL (Windows Subsystem for Linux)

# Verify
echo '#include<stdio.h>
int main(){printf("Hello\n");return 0;}' > test.c && gcc test.c -o test && ./test
```

## Hello World

```c
#include <stdio.h>    // Standard Input/Output header

int main() {
    // Print to stdout
    printf("Hello, World!\n");

    // Variables
    int age = 25;
    float price = 99.99;
    char initial = 'A';
    char name[] = "Alice";

    printf("Name: %s, Age: %d, Price: %.2f\n", name, age, price);

    return 0;  // 0 means success
}
```

```bash
# Compile and run
gcc hello.c -o hello    # Compile to executable
./hello                 # Run
# With debugging:
gcc -g -Wall hello.c -o hello  # -g=debug info, -Wall=all warnings
```

## Why C is in DevOps

- **Understanding memory** — helps diagnose memory leaks in any language
- **Reading system source code** — Linux kernel patches, libc
- **Writing kernel modules** — custom drivers, BPF programs
- **Debugging** — understanding how C programs crash helps with any language

## Course Sections
- **Fundamentals** — syntax, data types, control flow, functions
- **Intermediate** — arrays, strings, pointers, structures
- **Advanced** — dynamic memory, file I/O, linked lists, system calls
- **Labs** — coding exercises with automated testing
- **Interview** — pointer questions, memory management, common patterns
