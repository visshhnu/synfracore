# C Programming — Overview

## What is C?

C is a general-purpose, procedural programming language developed by Dennis Ritchie at Bell Labs, released in 1972. It's the foundation much of modern computing is built on: the Linux kernel, the CPython interpreter, MySQL's core, and most operating systems are written in C, directly or through languages that were themselves influenced by it.

## What Actually Happens When You Compile a C Program

This is worth understanding early, since C's compilation model is a common source of confusion (and a common interview question):

```
Source code (.c)
   → Preprocessor    (expands #include, #define, macros — produces
                       expanded source, no syntax checking yet)
   → Compiler         (translates to assembly language for your CPU)
   → Assembler         (translates assembly to machine code -> object file, .o)
   → Linker            (combines your object file(s) with library code,
                        resolves function calls like printf, produces
                        the final executable)
```

Running `gcc hello.c -o hello` does all four steps in one command — but each is a distinct, separately-inspectable stage (you can stop after any stage with the right compiler flag, which matters once you start debugging build issues rather than just syntax errors).

## Why Learn C?

- **Understand how computers actually work** — memory layout, pointers, and hardware interaction are taught explicitly in C in a way most higher-level languages hide from you
- **Foundation for C++, Rust, and Go** — all three languages were directly influenced by C's design, and understanding C makes learning them faster
- **Embedded systems and IoT** — microcontroller programming (Arduino and similar platforms) is predominantly C
- **GATE and core CS curricula** — C is a foundational subject across nearly every Indian CS/IT curriculum and a recurring GATE topic (data structures, memory management, pointer-based questions)
- **Operating systems and systems programming** — understanding C is close to a prerequisite for meaningfully reading kernel source or doing any low-level systems work

## C vs. C++ vs. Python — Where C Sits

| Feature | C | C++ | Python |
|---|---|---|---|
| Paradigm | Procedural | Multi-paradigm (OOP + procedural) | Multi-paradigm |
| Speed | Fastest (no runtime overhead) | Very fast (some OOP overhead) | Slower (interpreted) |
| Memory management | Manual (`malloc`/`free`) | Manual + RAII / smart pointers | Automatic (garbage collected) |
| Typical use case | OS kernels, embedded systems, systems programming | Games, system software, high-performance computing | Scripting, ML, web backends |
| Learning curve | Moderate — small language, but memory management is unforgiving | Steep — large language surface | Easy — memory management hidden from you |

The practical implication: C gives you the least "help" from the language itself (no automatic memory management, no exceptions, no classes) — which is exactly why it's taught first in many curricula. Once you understand what C makes you do manually, you understand what higher-level languages are actually doing for you.

## Install a C Compiler

```bash
# Ubuntu/Debian
sudo apt update && sudo apt install gcc build-essential
gcc --version

# macOS
xcode-select --install      # Installs Clang (Apple's C compiler)
gcc --version                # Points to Clang on macOS

# Windows: MinGW-w64, or WSL (Windows Subsystem for Linux) for a native
# Linux toolchain

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

    return 0;  // 0 means success to the calling shell/OS
}
```

```bash
# Compile and run
gcc hello.c -o hello    # Compile to executable
./hello                 # Run
# With debugging info and warnings enabled:
gcc -g -Wall hello.c -o hello  # -g = debug info, -Wall = enable all warnings
```

**Always compile with `-Wall`.** C is permissive by default — it will happily compile code with real bugs (using an uninitialized variable, mismatched `printf` format specifiers) without `-Wall` catching and flagging them for you.

## Where C Shows Up Beyond the Classroom

- **Operating system kernels** — Linux, and large parts of Windows and macOS's lower layers
- **Systems and embedded programming** — device drivers, firmware, microcontroller code
- **Performance-critical libraries** — many libraries other languages call into (Python's C extensions, for example) are written in C for speed
- **Understanding memory bugs in any language** — even if you never write production C, understanding how C manages memory manually makes memory-related bugs in other languages (memory leaks, use-after-free-style issues) far easier to reason about

## Course Sections
- **Fundamentals** — syntax, data types, control flow, functions, pointers
- **Intermediate** — arrays, strings, structures, dynamic memory basics
- **Advanced** — dynamic memory management in depth, file I/O, linked lists, system calls
- **Labs** — coding exercises with automated testing
- **Interview** — pointer questions, memory management, common patterns asked in interviews and GATE-style questions
