# C++ — Overview

## What is C++?

C++ is a general-purpose programming language created by Bjarne Stroustrup, first released in 1985 as an extension of C with object-oriented features (its original name was literally "C with Classes"). C++ is used across game development (Unreal Engine), system software, browser engines (Chrome's V8 has significant C++ components), databases (MySQL's core), high-frequency trading systems, and competitive programming.

## C++ Is a Superset of C, With Real Consequences

Almost all valid C code is also valid C++ code, but C++ adds an entire layer on top: classes, references, function overloading, templates, exceptions, and a large standard library (the STL) that C doesn't have. This matters practically in two ways:

1. **You can write C-style C++** — using `malloc`/`free`, raw arrays, and `printf` — and it will compile. It's just not idiomatic, and you lose the safety and convenience C++ actually offers.
2. **Mixing styles carelessly causes real bugs** — e.g., mixing `malloc`/`free` with `new`/`delete` for the same object is undefined behavior, not just bad style.

The practical guidance: learn C++'s own idioms (RAII, smart pointers, `std::string`, STL containers) rather than writing C with `class` keywords sprinkled in.

## C++ Standards

| Standard | Year | Key Addition |
|---|---|---|
| C++11 | 2011 | Lambda expressions, `auto`, move semantics, smart pointers, threads |
| C++14 | 2014 | Generic lambdas, improved `constexpr` |
| C++17 | 2017 | Structured bindings, `if constexpr`, `<filesystem>` |
| C++20 | 2020 | Concepts, coroutines, ranges, modules |

**Use C++17 or C++20** for new projects. Most competitive programming judges (Codeforces, CodeChef) default to C++17, so that's the practical standard to learn against if competitive programming is your goal.

## Install C++

```bash
# Ubuntu/Debian — GCC (GNU Compiler Collection)
sudo apt update && sudo apt install g++ build-essential
g++ --version

# macOS — Clang (via Xcode Command Line Tools)
xcode-select --install
c++ --version

# Compile a C++ file
g++ -std=c++17 -Wall -o program program.cpp
./program

# With debugging
g++ -std=c++17 -g -Wall -o program program.cpp
gdb ./program
```

## Hello World

```cpp
#include <iostream>       // cin, cout
#include <string>
#include <vector>

using namespace std;      // Avoid writing std:: everywhere (fine for
                           // learning; avoided in real header files)

int main() {
    cout << "Hello, World!" << endl;

    // Variables
    int age = 25;
    double price = 99.99;
    string name = "Alice";

    cout << "Name: " << name << ", Age: " << age << endl;

    // Vector (dynamic array — grows automatically, unlike a raw C array)
    vector<int> numbers = {1, 2, 3, 4, 5};
    for (int n : numbers) {      // Range-based for loop (C++11)
        cout << n << " ";
    }
    cout << endl;

    return 0;
}
```

## C vs. C++ — Key Practical Differences

```cpp
// C uses malloc/free for manual memory management
// C++ uses new/delete, or (much better) smart pointers

// Raw pointers (error-prone — easy to forget delete, or delete twice)
int* p = new int(42);
delete p;

// Smart pointers (C++11 onward, preferred in real C++ code)
#include <memory>
auto p = make_unique<int>(42);  // Automatically deleted when it goes
                                 // out of scope -- no manual delete needed
auto sp = make_shared<int>(42); // Reference-counted -- deleted when the
                                 // last owner goes out of scope

// OOP: C++ classes vs. C structs
class Animal {
private:
    string name;
public:
    Animal(string n) : name(n) {}
    virtual void speak() { cout << name << " makes a sound"; }
};

class Dog : public Animal {
public:
    Dog(string n) : Animal(n) {}
    void speak() override { cout << "Woof!"; }
};
```

The `virtual`/`override` pair above is worth flagging even at overview level: `virtual` on the base class enables **runtime polymorphism** — calling `speak()` through a base-class pointer or reference correctly calls `Dog::speak()`, not `Animal::speak()`, decided at runtime rather than compile time. This is covered properly in the Fundamentals/Intermediate sections, but it's the mechanism that makes inheritance actually useful rather than just a way to reuse field declarations.

## C++ in Competitive Programming

```cpp
// A standard competitive programming template
#include <bits/stdc++.h>     // Includes the entire standard library
                              // (fine for contests; never do this in
                              // real production code -- slows compilation)
using namespace std;

int main() {
    ios_base::sync_with_stdio(false);  // Speeds up cin/cout significantly
    cin.tie(NULL);                      // by decoupling from C's stdio

    int n;
    cin >> n;

    vector<int> a(n);
    for (int i = 0; i < n; i++) cin >> a[i];

    sort(a.begin(), a.end());

    for (int x : a) cout << x << " ";
    return 0;
}
```

The `sync_with_stdio(false)` / `cin.tie(NULL)` pair above is a genuinely common competitive-programming pattern worth understanding, not just copy-pasting: by default, C++'s `cin`/`cout` stay synchronized with C's `stdio` (so you can safely mix `printf` and `cout` in the same program), and that synchronization has real overhead. Disabling it speeds up I/O-heavy competitive programs meaningfully, at the cost of no longer being able to safely mix C and C++ I/O in the same program — a tradeoff that's fine for a contest, not something you'd do by default in production code.

## Course Sections
- **Fundamentals** — syntax, control flow, OOP basics, classes, inheritance
- **Intermediate** — STL (vectors, maps, sets), templates, exception handling
- **Advanced** — smart pointers, move semantics, multithreading, design patterns
- **Labs** — competitive programming exercises and DSA implementations
- **Interview** — the most commonly asked C++ interview questions for product-company interviews
