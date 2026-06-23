# C++ Programming Certification Guide

## Certifications Available

| Cert | Provider | Cost | Format |
|------|----------|------|--------|
| **C++ Institute PCPP** | C++ Institute | $295 | MCQ |
| **ISO C++ Foundation** | Various | Varies | MCQ |
| **GATE CS** | IIT/IISc | Rs.1,800 | MCQ + NAT, 3 hrs |
| **NPTEL C++ MOOC** | NPTEL/IIT | Free | Proctored exam |

---

## Core Topics

```cpp
// OOP FUNDAMENTALS
class Animal {
protected:
    std::string name;
public:
    Animal(std::string n) : name(n) {}    // initializer list
    virtual std::string sound() = 0;      // pure virtual = abstract
    virtual ~Animal() {}                   // virtual destructor (always!)
};

class Dog : public Animal {
public:
    Dog(std::string n) : Animal(n) {}
    std::string sound() override { return "Woof"; }
};

// TEMPLATES
template<typename T>
T maxVal(T a, T b) { return a > b ? a : b; }

template<typename T>
class Stack {
    std::vector<T> data;
public:
    void push(T val) { data.push_back(val); }
    T pop() { T v = data.back(); data.pop_back(); return v; }
    bool empty() const { return data.empty(); }
};

// STL CONTAINERS
std::vector<int> v = {3,1,4,1,5};
std::sort(v.begin(), v.end());

std::map<std::string,int> freq;
for (auto& s : words) freq[s]++;

std::priority_queue<int> maxHeap;
std::priority_queue<int, std::vector<int>, std::greater<int>> minHeap;

// SMART POINTERS (C++11+)
auto d = std::make_unique<Dog>("Rex");    // sole owner, auto-freed
auto s1 = std::make_shared<Dog>("Rex");  // reference counted
auto s2 = s1;  // ref count = 2

// MOVE SEMANTICS
std::vector<int> a = {1,2,3};
std::vector<int> b = std::move(a);  // a is now empty, no copy made

// LAMBDA
auto square = [](int x) { return x * x; };
std::sort(v.begin(), v.end(), [](int a, int b){ return a > b; });

// RANGE-BASED FOR
for (const auto& item : container) { /* use item */ }
```

---

## GATE CS Important C++ Topics

```
INHERITANCE: public/protected/private | virtual base class (diamond problem)
POLYMORPHISM: virtual functions + vtable | override keyword | final
TEMPLATES: function templates | class templates | specialisation
STL: vector/list/deque | map/set/unordered_map | stack/queue/priority_queue
MEMORY: stack (auto) | heap (new/delete, malloc/free) | smart pointers
OPERATOR OVERLOADING: +, -, <<, >>, [], (), =
EXCEPTION HANDLING: try/catch/throw/noexcept
CONCURRENCY (C++11): std::thread | std::mutex | std::async | std::future
```

---

## Study Resources

- **cppreference.com** — definitive C++ language and library reference
- **The C++ Programming Language** (Bjarne Stroustrup) — authoritative
- **LearnCpp.com** — free comprehensive tutorial with examples
- **CppCoreGuidelines** (github.com/isocpp) — modern C++ best practices

## Revision Notes
```
OOP: encapsulation | inheritance | polymorphism | abstraction
VIRTUAL: virtual fn = runtime dispatch via vtable | pure virtual = abstract class
RULE OF FIVE: destructor | copy ctor | copy assign | move ctor | move assign
SMART POINTERS: unique_ptr (sole) | shared_ptr (counted) | weak_ptr (no ownership)
STL ALGORITHMS: sort/find/count/transform/accumulate — prefer over raw loops
```
