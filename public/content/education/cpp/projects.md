# C++ — Portfolio Projects

Build these to practice both C++'s OOP side and its STL/competitive-programming side — the two halves of the language that come up most in coursework, interviews, and contests.

## Project 1: Inventory Management System With Classes (Beginner)

**Time:** 2-3 days

A console-based inventory tracker using proper class design — the project that gets you comfortable with constructors, encapsulation, and operator overloading before moving to more complex OOP.

### Steps

1. Design an `Item` class (name, quantity, price) with private members and public accessors
2. Store items in a `vector<Item>`
3. Implement add, search-by-name, update-quantity, and display-all operations
4. Overload the `<<` operator so you can `cout << item` directly instead of writing a separate print function
5. Add basic validation — what happens with a negative quantity or price?

### Skills Demonstrated
- Classes, encapsulation, and constructors
- `vector` as a dynamic container
- Operator overloading

### Repository Name
`cpp-inventory-system`

---

## Project 2: A Small Library Using Inheritance and STL Containers (Intermediate)

**Time:** 4-5 days

Extend the beginner-level idea into a proper class hierarchy (base class + derived classes) and use STL containers (`map`, `vector`) meaningfully, not just as arrays with extra steps.

### Steps

1. Design a base class (e.g. `LibraryItem`) with derived classes (`Book`, `DVD`, etc.) using virtual functions for behavior that differs per type
2. Use a `map<string, LibraryItem*>` (or smart-pointer equivalent) keyed by an ID for fast lookup
3. Implement borrowing/returning with proper state tracking
4. Use exceptions for genuinely exceptional cases (e.g., borrowing an already-borrowed item) — not for normal control flow
5. Prefer smart pointers (`unique_ptr`/`shared_ptr`) over raw `new`/`delete` for ownership

### Skills Demonstrated
- Inheritance and virtual functions (runtime polymorphism)
- STL container usage beyond `vector`
- Exception handling and smart-pointer-based memory management

---

## Project 3: Competitive-Programming Problem Set With Analysis (Advanced)

**Time:** 1-2 weeks

Solve 15-20 problems spanning arrays, STL usage, and at least one non-trivial algorithm topic (graphs, DP, or similar), then document your approach and complexity analysis for each — not just the accepted solution.

### Steps

1. Select problems from Codeforces, CodeChef, or LeetCode spanning at least 3 different topic areas
2. Solve each using idiomatic modern C++ (STL containers/algorithms, not hand-rolled data structures unless the problem specifically requires it)
3. For each solution, write a short note: time/space complexity, and the key insight that made the problem solvable
4. Revisit any problem you got wrong or needed help with, a few days later, and resolve it independently
5. Organize solutions by topic, with your complexity notes alongside each

### Skills Demonstrated
- Idiomatic STL usage under time pressure
- Complexity analysis, not just "it passed"
- Structured, reviewable problem-solving practice

### Repository Name
`cpp-competitive-programming-log`

---

## Tips for Great Projects

**Prefer STL over hand-rolled data structures**, unless a project or problem specifically asks you to implement one yourself. Using `vector`/`map`/`set` correctly and knowing their real time complexity is the actual skill being tested, both in interviews and in contests.

**Use smart pointers by default.** If you find yourself writing `new` without an immediate, clear reason to manage that memory manually, reach for `make_unique`/`make_shared` instead — this is what real modern C++ code looks like.

**Document your complexity analysis.** "This solution passed" is weaker than "this is O(n log n) because of the sort, and I considered but rejected an O(n²) brute-force approach first."

**For interviews specifically:** be ready to explain when you'd use `virtual` functions vs. templates for two different types of "generic" behavior — this distinction (runtime polymorphism vs. compile-time generics) is a genuinely common C++ interview topic.

## Project Checklist
- [ ] 2-3 projects with clear READMEs
- [ ] At least one project using inheritance/virtual functions meaningfully
- [ ] At least one project using STL containers beyond basic `vector`
- [ ] No raw `new`/`delete` without a specific, explainable reason
- [ ] Comfortable explaining complexity (Big-O) for anything in your competitive-programming log
