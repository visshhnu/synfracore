# C++ — Learning Roadmap

## Estimated Time to Placement/Contest-Ready
**8-12 weeks** of consistent learning (2-3 hours/day), assuming basic C or programming fundamentals already — C++'s syntax surface is large, but the practical path (OOP fundamentals → STL fluency → applied practice) is learnable in this window with consistent daily work, especially if competitive programming is a specific goal alongside general proficiency.

## Phase 1: Foundation (Week 1-3)

- Syntax differences from C (`cin`/`cout`, `string`, references), control flow, and basic OOP (classes, encapsulation)
- Complete the Fundamentals section in this course
- Run the beginner-level Labs exercises

**Checkpoint:** can you write a class with private members, a constructor using an initializer list, and an overloaded `<<` operator — without looking up the syntax?

## Phase 2: STL and Core OOP (Week 3-6)

- STL containers (`vector`, `map`, `set`) and when to reach for each
- Templates (function and class templates) for writing type-generic code
- Exception handling
- Complete Project 1 (inventory management with classes) from this course's Projects section

**Checkpoint:** can you explain, concretely, when you'd choose a `map` over a `vector` of pairs — not just that they're different containers?

## Phase 3: Inheritance, Memory Model, and Applied Practice (Week 6-9)

- Inheritance, virtual functions, and runtime polymorphism — and why `virtual` specifically is what makes overriding work through a base-class pointer
- Smart pointers (`unique_ptr`, `shared_ptr`) and why they're preferred over raw `new`/`delete` in modern C++
- Complete Project 2 (library system with inheritance and STL) from this course's Projects section
- If pursuing competitive programming: start solving timed problems using the standard `sync_with_stdio(false)` I/O pattern

**Checkpoint:** can you explain, with a concrete example, why omitting `virtual` on a base class method would cause an override to silently not work when called through a base-class pointer?

## Phase 4: Applied Depth and Interview/Contest Readiness (Week 9-12)

- Move semantics, multithreading basics, and common design patterns (Singleton, Factory, Observer)
- Complete Project 3 (competitive-programming problem set) and review this course's Interview Q&A section
- For competitive programming specifically: focus on complexity analysis fluency, not just getting problems accepted

## Skills You'll Build

| Skill Area | What You'll Learn |
|---|---|
| Core Language | Syntax, OOP, and idiomatic modern C++ (not "C with classes") |
| STL Fluency | Choosing and correctly using the right container/algorithm |
| Memory Model | RAII, smart pointers, and why C++ manages ownership the way it does |
| Polymorphism | Runtime (virtual functions) vs. compile-time (templates) generic code |
| Interview/Contest Prep | Complexity analysis and idiomatic problem-solving under time pressure |

## Weekly Study Plan

```
Monday:    New concept — fundamentals/intermediate section + examples
Tuesday:   Hands-on labs applying that concept
Wednesday: Build or extend a project using it
Thursday:  STL/algorithm practice problems on the week's topic
Friday:    Review interview-style questions on the week's material
Weekend:   Portfolio project work, or a timed competitive-programming session
```

## Red Flags to Avoid

- ❌ Writing "C with classes" instead of learning C++'s own idioms (STL, smart pointers, RAII) — it compiles, but it's not what real modern C++ looks like
- ❌ Using raw `new`/`delete` by default instead of smart pointers, out of habit rather than a specific reason
- ❌ Forgetting `virtual` on a base class method, then being confused why polymorphism "isn't working"
- ❌ Practicing competitive programming without ever analyzing complexity — getting a problem accepted isn't the same as understanding why your solution is efficient
- ❌ Skipping STL container internals ("it's just a dynamic array") — knowing the real time complexity of container operations is what interviews and contests actually test

## Resources

- **This course**: Overview → Fundamentals → Intermediate → Advanced → Labs → Projects
- **cppreference.com**: the most reliable reference for STL and language behavior, including exact complexity guarantees
- **Codeforces/CodeChef**: for competitive-programming practice specifically, with real time pressure
- **LeetCode (C++ track)**: for interview-style DSA practice with worked solutions to compare against

## Getting Placement/Contest-Ready

1. **Portfolio**: 2-3 projects from this course's Projects section, demonstrating both OOP design and STL fluency
2. **Complexity fluency**: be able to state the time/space complexity of anything you've built or solved, and explain why — this is tested directly and often
3. **Resume**: be specific — "built a library management system using inheritance and STL `map`-based lookup, with smart-pointer memory management" is stronger than "learned C++"
4. **For competitive programming specifically**: track your contest rating/problem-solving progress over time, and revisit problems you struggled with rather than only doing new ones
5. **Interview readiness**: expect both a live-coding DSA round and OOP-design questions (when to use inheritance vs. composition, virtual functions vs. templates) — C++ interviews commonly test both halves of the language
