# C Programming — Learning Roadmap

## Estimated Time to Exam/Placement-Ready
**8-10 weeks** of consistent learning (2-3 hours/day) — C's syntax is small and learnable quickly, but genuine fluency with pointers and manual memory management is the part that takes real, deliberate practice; most learners who "know" C syntax still aren't comfortable with pointers until they've built something that forced them to use pointers correctly.

## Phase 1: Foundation (Week 1-2)

- Program structure, the compile-then-run cycle (preprocessor → compiler → assembler → linker), and basic data types
- Operators and control flow (if-else, loops, switch)
- Complete the Fundamentals section in this course
- Run the beginner-level Labs exercises

**Checkpoint:** can you explain what `gcc` actually does in each of its stages, not just that it "compiles the program"?

## Phase 2: Pointers and Functions (Week 2-4)

- Pointers: address-of (`&`), dereference (`*`), pointer arithmetic, and pass-by-reference via pointers
- Functions, recursion, and scope
- Complete Project 1 (student record system) from this course's Projects section

**Checkpoint:** can you write a `swap` function using pointers, and explain exactly why passing by value wouldn't work for it?

## Phase 3: Dynamic Memory and Data Structures (Week 4-7)

- Arrays, strings (as char arrays), and structures — this course's Intermediate section
- Dynamic memory allocation (`malloc`/`free`) and building a linked list from scratch
- Complete Project 2 (dynamic linked list) from this course's Projects section — this is the project most learners point to as the moment pointers actually clicked

**Checkpoint:** can you insert and delete a node from a linked list, on paper or at a whiteboard, without making a pointer mistake?

## Phase 4: File I/O, Systems Concepts, and Interview Readiness (Week 7-10)

- File I/O, more advanced linked-list variants, and an introduction to system calls
- Complete Project 3 (file-based database) and review this course's Interview Q&A section
- Practice explaining memory concepts (stack vs. heap, memory leaks, dangling pointers) out loud — these come up constantly in interviews regardless of the actual question asked

## Skills You'll Build

| Skill Area | What You'll Learn |
|---|---|
| Core Language | Syntax, control flow, and functions |
| Memory Management | Pointers, dynamic allocation, and avoiding leaks |
| Data Structures | Arrays, structs, and linked structures built from scratch |
| Systems Understanding | What's actually happening at the memory/hardware level |
| Interview Prep | Pointer questions and memory-management reasoning |

## Weekly Study Plan

```
Monday:    New concept — fundamentals/intermediate section + examples
Tuesday:   Hands-on labs applying that concept
Wednesday: Build or extend a project using it
Thursday:  Pointer/memory practice problems specifically — this is the
           area that needs the most repetition
Friday:    Review interview-style questions on the week's material
Weekend:   Work on a portfolio project, or GATE-style practice problems
```

## Red Flags to Avoid

- ❌ Treating pointers as "the hard part to memorize" instead of building the mental model with diagrams and practice
- ❌ Never checking `malloc`'s return value, even in practice code — build the habit early
- ❌ Skipping manual memory management practice because "modern languages have garbage collection" — the whole point of learning C is understanding what garbage collection is actually doing for you elsewhere
- ❌ Not testing for memory leaks on any project, even informally
- ❌ Copying pointer-heavy code without tracing through what each line actually does to memory

## Resources

- **This course**: Overview → Fundamentals → Intermediate → Advanced → Labs → Projects
- **K&R ("The C Programming Language" by Kernighan and Ritchie)**: still the canonical reference, written by the language's creators
- **GATE previous-year papers**: C-specific pointer and memory-management questions are a recurring GATE pattern
- **Valgrind** (or a similar memory-checking tool): makes memory leaks concrete and debuggable rather than theoretical

## Getting Exam/Placement-Ready

1. **Portfolio**: 2-3 projects from this course's Projects section, with the linked-list project specifically demonstrated live if possible — it's the strongest single signal of real pointer fluency
2. **Pointer fluency**: be able to draw memory diagrams for pointer operations on a whiteboard — this is one of the most common ways C knowledge gets tested in interviews
3. **GATE preparation**: if pursuing GATE, prioritize previous-year pointer/memory-management questions — they recur across years with high consistency
4. **Resume/interview honesty**: be specific about what you actually built — "implemented a linked-list-based contact manager with tested insert/delete operations" is stronger and more defensible than a vague "learned C"
5. **Know the stack vs. heap distinction cold**: this single concept underlies a large fraction of both interview questions and real debugging you'll do in C and in languages built on similar memory models
