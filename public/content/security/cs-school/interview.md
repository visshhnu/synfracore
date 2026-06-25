# CS for Schools — Interview Q&A

**Q: Compiler vs interpreter — key difference?**
Compiler: Translates entire source code to machine code before execution. Creates an executable file. Faster at runtime. All errors reported after full compilation. Examples: C, C++, Java (to bytecode).
Interpreter: Translates and executes line by line at runtime. No separate executable produced. Easier interactive debugging. Errors reported at the failing line. Examples: Python, JavaScript, Ruby.

**Q: What is a variable and why do data types matter?**
A variable is a named storage location in memory holding a value that can change during program execution. Data types define: what kind of data is stored (int, float, string, boolean), memory allocation, and what operations are valid. Types prevent logical errors like adding a name to a number.

**Q: RAM vs ROM — what is the difference?**
RAM (Random Access Memory): Volatile — all data lost when power off. Read-write. Stores running programs, OS, and temporary data. Fast. Examples: DDR4, DDR5.
ROM (Read-Only Memory): Non-volatile — retains data without power. Stores firmware and boot code. Cannot be easily rewritten. Examples: BIOS/UEFI chip, microcontroller firmware.

**Q: What is binary search and when can you use it?**
Divides sorted array in half each step — compare target to middle element, eliminate half, repeat. Time: O(log n). Space: O(1). STRICT REQUIREMENT: array must be SORTED. Cannot apply to unsorted data. Best for: large sorted datasets with repeated lookups.

**Q: Explain recursion with a simple example.**
A function that calls itself with a smaller version of the problem. Requires a base case to stop:
```python
def factorial(n):
    if n == 0: return 1       # base case
    return n * factorial(n-1) # recursive call
# factorial(4) = 4 × 3 × 2 × 1 × 1 = 24
```

**Q: Class vs Object?**
Class: Blueprint/template defining attributes (data fields) and methods (behaviour). No memory allocated for data yet.
Object: A specific instance of a class created in memory with actual values assigned.
Example: Dog is a class. 'Buddy the Labrador' is an object with specific values.

**Q: What is Big O notation?**
Describes how algorithm runtime or space grows as input size n increases. Ignores constants and lower-order terms. O(1) constant, O(log n) logarithmic, O(n) linear, O(n²) quadratic, O(2^n) exponential. Allows algorithm comparison independent of hardware.

**Q: Stack vs Queue — core difference?**
Stack: LIFO (Last In, First Out). push/pop operations. Uses: function call stack, undo history, DFS, expression parsing.
Queue: FIFO (First In, First Out). enqueue/dequeue operations. Uses: BFS, printer queue, CPU scheduling, task management.

**Q: Internet vs World Wide Web?**
Internet: The global physical infrastructure — billions of interconnected computers communicating via TCP/IP protocols. The network itself (cables, routers, servers).
WWW: One service running ON the internet — web pages linked by hyperlinks, accessed via HTTP/HTTPS through browsers. Email, FTP, video calls, and streaming are also internet services but are NOT the WWW.

**Q: What is object-oriented programming and why is it used?**
OOP is a programming paradigm that organises code around objects — entities that combine data (attributes) and behaviour (methods). Four pillars: Encapsulation (hide internal data, expose clean interface), Abstraction (show only relevant details), Inheritance (child classes reuse parent code), Polymorphism (same interface, different implementations). Why use it: models real-world entities naturally, reduces code duplication through inheritance, makes large codebases maintainable through encapsulation, enables flexible and extensible designs through polymorphism.

**Q: What is an algorithm and what makes a good algorithm?**
An algorithm is a finite sequence of unambiguous, step-by-step instructions that solves a problem and terminates. Properties of a good algorithm: Correctness (produces the right output for all valid inputs), Efficiency (uses minimal time and space — measured by Big O), Clarity (easy to understand and maintain), Finiteness (terminates in a finite number of steps), Generality (solves a broad class of related problems, not just one specific case). The best algorithm is one that is correct, efficient enough for the use case, and clear enough to maintain.

**Q: What is the difference between a list and an array?**
Array: Fixed size determined at creation; elements stored contiguously in memory; O(1) random access by index; O(n) insertion/deletion (requires shifting). Type: elements typically same type. Examples: arrays in C, Java arrays.
List (dynamic array/linked list): Varies by implementation. Dynamic array (Python list, ArrayList): auto-resizes; amortized O(1) append; still O(n) insertion/deletion in middle. Linked list: O(1) insertion/deletion at known position; O(n) access by index; elements stored non-contiguously. Choice depends on: access patterns, insertion/deletion frequency, memory constraints.

**Q: What is the difference between a local variable and a global variable?**
Local variable: declared inside a function or block; only accessible within that scope; created when the function is called, destroyed when it returns; each function call gets its own copy.
Global variable: declared outside all functions; accessible throughout the entire program; persists for the program's lifetime; can be modified from anywhere (making bugs harder to trace). Best practice: minimise global variables — they create hidden dependencies between functions. Use function parameters and return values instead. Constants that don't change (like PI = 3.14159) are acceptable as globals since they can't be accidentally modified.

**Q: What is a loop and what are the different types?**
A loop is a control structure that repeats a block of code multiple times. Main types: For loop: repeats a set number of times or over a collection (use when you know iterations in advance). While loop: repeats while a condition is true (use when you don't know iterations in advance). Do-While: executes the body at least once, then repeats while condition is true (use when you need at least one execution). Key concepts: counter (tracks iterations), condition (when to stop), loop body (what to repeat). Infinite loops occur when the condition never becomes false — a common bug. Break statement exits a loop early; continue skips to the next iteration.

**Q: What is debugging and what are common debugging techniques?**
Debugging: the process of finding and fixing errors (bugs) in code. Common types of bugs: syntax errors (code won't compile/run — caught by compiler or interpreter), runtime errors (code runs but crashes — e.g., division by zero, null pointer), logic errors (code runs without crashing but produces wrong output — hardest to find). Techniques: print statements (add print to trace variable values at each step), breakpoints + debugger (pause execution at a line and inspect state), rubber duck debugging (explain code step-by-step aloud — verbalising reveals wrong assumptions), binary search debugging (narrow down which section contains the bug by halving the search space), read error messages carefully (they often tell you exactly what and where the error is).
