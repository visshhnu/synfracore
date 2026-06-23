# C++ Interview Questions

## Core Concepts

**Q: Object-Oriented Programming in C++ — the four pillars.**

**Encapsulation**: Bundle data (attributes) + methods that operate on data. Control access with public/private/protected.

```cpp
class BankAccount {
private:
    double balance;  // Cannot be accessed directly from outside
    string accountNo;
    
public:
    BankAccount(string no, double initial) 
        : accountNo(no), balance(initial) {}  // Constructor (initialiser list)
    
    void deposit(double amount) {
        if (amount > 0) balance += amount;
    }
    
    bool withdraw(double amount) {
        if (amount <= balance) { balance -= amount; return true; }
        return false;
    }
    
    double getBalance() const { return balance; }  // const: doesn't modify object
};
```

**Inheritance**: Derive class from existing class. "is-a" relationship.

```cpp
class Animal {
public:
    string name;
    virtual void speak() { cout << "..."; }  // Virtual: runtime polymorphism
    virtual ~Animal() {}  // Virtual destructor (always in base class)
};

class Dog : public Animal {
public:
    void speak() override { cout << "Woof!"; }  // override: compile-time check
};

class Cat : public Animal {
public:
    void speak() override { cout << "Meow!"; }
};
```

**Polymorphism**: Same interface, different behaviour. Runtime (virtual) or compile-time (templates/overloading).

```cpp
Animal* animals[] = { new Dog(), new Cat() };
for (auto a : animals) {
    a->speak();  // Calls correct version at runtime (dynamic dispatch)
}
// Always delete[] or use smart pointers
```

**Abstraction**: Hide implementation details. Pure virtual functions create abstract classes.

```cpp
class Shape {
public:
    virtual double area() const = 0;  // Pure virtual = must implement in subclass
    virtual ~Shape() {}
};

class Circle : public Shape {
    double radius;
public:
    Circle(double r) : radius(r) {}
    double area() const override { return 3.14159 * radius * radius; }
};
```

---

**Q: Memory management — RAII and smart pointers.**

```cpp
// Raw pointers: manual, error-prone
int* raw = new int(42);
// ... must remember to delete!
delete raw;

// Smart pointers (C++11): automatic memory management
#include <memory>

// unique_ptr: sole owner. Auto-deleted when out of scope.
auto up = std::make_unique<int>(42);
// *up = 42, no manual delete needed

// shared_ptr: shared ownership. Reference counted.
auto sp1 = std::make_shared<Dog>();
auto sp2 = sp1;  // Both point to same Dog, refcount=2
// sp1 and sp2 go out of scope → refcount=0 → Dog deleted

// weak_ptr: non-owning reference to shared_ptr (breaks circular refs)
std::weak_ptr<Dog> wp = sp1;

// RAII (Resource Acquisition Is Initialisation):
// Acquire resource in constructor, release in destructor
// Smart pointers, file streams, locks all follow RAII
```

---

**Q: STL containers — which to use when.**

```cpp
#include <vector>
#include <map>
#include <unordered_map>
#include <set>
#include <queue>
#include <stack>

// vector: dynamic array. Random access O(1). Push_back amortised O(1).
std::vector<int> v = {1, 2, 3};
v.push_back(4);
v[2] = 10;

// map: sorted key-value. O(log n) all ops. Use when ordered needed.
std::map<string, int> scores = {{"Alice", 95}, {"Bob", 87}};

// unordered_map: hash table. O(1) average. Use for most lookups.
std::unordered_map<string, int> fast_scores;
fast_scores["Alice"] = 95;

// set: unique sorted elements. multiset for duplicates.
std::set<int> unique_vals = {3, 1, 4, 1, 5}; // {1, 3, 4, 5}

// queue (FIFO) and stack (LIFO)
std::queue<int> q; q.push(1); q.front(); q.pop();
std::stack<int> s; s.push(1); s.top(); s.pop();
```

---

**Q: Move semantics and rvalue references (C++11).**

```cpp
// Copying is expensive (deep copy). Moving transfers ownership (fast).
std::vector<int> create_large_vector() {
    std::vector<int> v(1000000);
    return v;  // Move semantics: no copy made (NRVO + move)
}

// std::move: explicitly cast to rvalue (enable move)
std::vector<int> a = {1,2,3,4,5};
std::vector<int> b = std::move(a);  // b takes a's memory. a is now empty.
// After move: a is valid but unspecified state (usually empty)

// Move constructor and assignment operator
class Resource {
    int* data;
    size_t size;
public:
    // Move constructor: steal the data
    Resource(Resource&& other) : data(other.data), size(other.size) {
        other.data = nullptr;  // Prevent double-free
        other.size = 0;
    }
};
```

## Revision Notes
```
OOP PILLARS:
Encapsulation: private data + public interface
Inheritance: is-a relationship, virtual functions
Polymorphism: same interface, different behaviour (runtime: virtual, compile: templates)
Abstraction: pure virtual = abstract class (cannot instantiate)

VIRTUAL: enables runtime polymorphism (dynamic dispatch)
override keyword: compile-time check | virtual destructor: always in base class

SMART POINTERS (RAII):
unique_ptr: sole owner, auto-delete | shared_ptr: ref-counted | weak_ptr: non-owning
NEVER raw new/delete in modern C++

STL CONTAINERS:
vector: dynamic array O(1) random access
unordered_map: O(1) hash lookup (default choice)
map: O(log n) sorted | set: unique sorted elements
queue: FIFO | stack: LIFO

MOVE SEMANTICS:
rvalue reference: T&& | std::move: cast to rvalue
Move = transfer ownership (no copy). Critical for performance.
```
