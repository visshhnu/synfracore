# C++ — Overview

## What is C++?

C++ is a general-purpose programming language created by Bjarne Stroustrup in 1979 as an extension of C with object-oriented features. C++ is used for: game development (Unreal Engine), system software, browsers (Chrome V8 engine), databases (MySQL), high-frequency trading, and competitive programming.

## C++ Standards

| Standard | Year | Key Addition |
|---|---|---|
| C++11 | 2011 | Lambda, auto, move semantics, smart pointers, threads |
| C++14 | 2014 | Generic lambdas, improved constexpr |
| C++17 | 2017 | Structured bindings, if constexpr, filesystem |
| C++20 | 2020 | Concepts, coroutines, ranges, modules |

**Use C++17 or C++20** for new projects. Most competitive programming uses C++17.

## Install C++

```bash
# Ubuntu/Debian — GCC (GNU Compiler Collection)
sudo apt update && sudo apt install g++ build-essential
g++ --version

# macOS — Clang (via Xcode Command Line Tools)
xcode-select --install
c++ --version

# Compile C++ file
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

using namespace std;      // Avoid writing std:: everywhere

int main() {
    cout << "Hello, World!" << endl;

    // Variables
    int age = 25;
    double price = 99.99;
    string name = "Alice";

    cout << "Name: " << name << ", Age: " << age << endl;

    // Vector (dynamic array)
    vector<int> numbers = {1, 2, 3, 4, 5};
    for (int n : numbers) {      // Range-based for loop (C++11)
        cout << n << " ";
    }
    cout << endl;

    return 0;
}
```

## C vs C++ — Key Differences

```cpp
// C uses malloc/free for memory management
// C++ uses new/delete OR smart pointers (better)

// Raw pointers (error-prone)
int* p = new int(42);
delete p;

// Smart pointers (C++11, preferred)
#include <memory>
auto p = make_unique<int>(42);  // Auto-deleted when out of scope
auto sp = make_shared<int>(42); // Reference counted

// OOP in C++ vs C structs
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

## C++ in Competitive Programming

```cpp
// Standard competitive programming template
#include <bits/stdc++.h>     // Include everything (competitive only)
using namespace std;

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);

    int n;
    cin >> n;

    vector<int> a(n);
    for (int i = 0; i < n; i++) cin >> a[i];

    sort(a.begin(), a.end());

    for (int x : a) cout << x << " ";
    return 0;
}
```

## Course Sections
- **Fundamentals** — syntax, OOP basics, classes, inheritance
- **Intermediate** — STL (vectors, maps, sets), templates, exceptions
- **Advanced** — smart pointers, move semantics, multithreading, design patterns
- **Labs** — competitive programming exercises + DSA implementations
- **Interview** — 50 most asked C++ interview questions for product companies
