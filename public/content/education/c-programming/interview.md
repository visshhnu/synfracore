# C Programming — Interview Questions

**What is the difference between `++i` and `i++`?**
Both increment `i` by 1, but they differ in what value they return. `++i` (pre-increment) increments first then returns the new value. `i++` (post-increment) returns the current value then increments. In `int x = 5; int y = x++;` — y gets 5, then x becomes 6. In `int x = 5; int y = ++x;` — x becomes 6, then y gets 6. In loops like `for (int i = 0; i < n; i++)` there's no difference since the return value is unused.

**What is the difference between `struct` and `union`?**
Both group variables together. `struct` allocates memory for ALL members — each has its own memory location. Size = sum of all member sizes (plus padding). `union` allocates memory for only the LARGEST member — all members share the same memory location. Size = size of largest member. Union is used when you only need one of several types at a time (saves memory). Example: storing either an int or a float, but never both at once.

**Explain `static` keyword in C.**
For local variables: `static int count = 0` inside a function — retains its value between function calls (stored in data segment, not stack). For global variables/functions: `static int x = 5` at file scope — restricts visibility to that file only (not accessible from other .c files via `extern`). For functions: `static void helper()` — function is only callable from within that file. This is C's way of creating "private" functions.

**What is a pointer to a function?**
A variable that stores the address of a function. `int (*funcPtr)(int, int) = &add;` declares a pointer to a function taking two ints and returning int, then assigns it to the `add` function. Call with `int result = funcPtr(3, 4);`. Used for callbacks (passing functions as arguments), function tables (switch on function type without if-else), and implementing polymorphism in C.

**What is the difference between `#define` and `const`?**
`#define MAX 100` is a preprocessor macro — purely text substitution before compilation, no type, no scope. `const int MAX = 100` is a typed constant variable — has type checking, has scope, can be used with pointers. Prefer `const` in modern C — it's safer and debuggable (appears in debugger, unlike macros). Use `#define` for conditional compilation (`#ifdef DEBUG`) and include guards (`#ifndef HEADER_H`).
