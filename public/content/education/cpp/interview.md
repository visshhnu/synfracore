# C++ — Interview Questions

**What is the difference between C and C++?**
C is a procedural language — it has functions but no classes, objects, or built-in OOP support. C++ is a superset of C that adds: object-oriented programming (classes, inheritance, polymorphism), templates (generic programming), the STL (Standard Template Library with containers and algorithms), exceptions, references, and modern memory management via smart pointers. C is used for OS kernels, embedded systems, and anywhere minimal overhead matters. C++ is used for game engines, competitive programming, system software requiring OOP, and high-performance applications.

**What is the difference between `new`/`delete` and `malloc`/`free`?**
`malloc`/`free` are C functions — they allocate/free raw memory but don't call constructors or destructors. `new`/`delete` are C++ operators — `new` allocates memory AND calls the constructor; `delete` calls the destructor AND frees memory. Always use `new`/`delete` with classes in C++ (not malloc). In modern C++, prefer smart pointers (`make_unique`, `make_shared`) over raw `new`/`delete` to avoid memory leaks.

**What is a reference vs a pointer?**
A reference is an alias for another variable — it always refers to the same object and can't be null. `int& ref = x` — ref IS x. A pointer holds a memory address and can be reassigned or set to null. `int* ptr = &x` — ptr holds the address of x. References must be initialized when declared; pointers don't. References are safer (no null dereference); pointers are more flexible (can point to different things). Use references for function parameters when you want to modify the caller's variable without pointer syntax.

**What is the STL and name key containers?**
STL (Standard Template Library) provides generic, reusable data structures and algorithms. Key containers: `vector` (dynamic array, O(1) amortized push_back), `list` (doubly-linked list), `deque` (double-ended queue), `map` (sorted key-value, O(log n)), `unordered_map` (hash map, O(1) average), `set` (sorted unique elements), `priority_queue` (heap, O(log n) push/pop, O(1) top). Key algorithms: `sort`, `find`, `binary_search`, `lower_bound`, `upper_bound`, `accumulate`, `max_element`, `next_permutation`.

**What is function overloading vs operator overloading?**
Function overloading: multiple functions with the same name but different parameter types or counts. Compiler picks the right one. `add(int,int)` and `add(double,double)`. Operator overloading: redefine what an operator does for a class. `operator+` makes `obj1 + obj2` work naturally. `operator<<` makes `cout << obj` work. Overloading makes code more readable but can be misused — only overload when it makes semantic sense (adding two Vectors, comparing two Dates).
