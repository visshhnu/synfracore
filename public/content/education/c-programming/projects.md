# C Programming — Portfolio Projects

Build these to actually internalize memory management and pointers — the part of C that separates "read the syntax" from "can actually use the language."

## Project 1: Student Record System With Arrays (Beginner)

**Time:** 2-3 days

A console program managing student records using structures and arrays — no dynamic memory yet, just solid fundamentals.

### Steps

1. Define a `struct Student` (name, roll number, marks array for multiple subjects)
2. Store records in a fixed-size array of structs
3. Implement add, search-by-roll-number, and display-all operations
4. Calculate and display each student's average and grade
5. Handle the case where the array is full — what should your program do?

### Skills Demonstrated
- Structures and arrays of structures
- Basic input validation
- Working within a fixed-size data structure's real limitations

### Repository Name
`c-student-records`

---

## Project 2: Dynamic Linked List — Contact Book (Intermediate)

**Time:** 4-5 days

A contact book implemented as a singly linked list, using dynamic memory allocation — this is the project that actually makes pointers click for most learners, because you're managing memory yourself, node by node.

### Steps

1. Define a `struct Contact` node with a `next` pointer
2. Implement insert (at head, at tail, and at a specific position), delete, and search
3. Use `malloc`/`free` correctly — every `malloc` needs a matching `free`, and you should be able to explain where each one happens
4. Test deliberately for memory leaks — add contacts, delete them, add more, and verify nothing is silently leaking (Valgrind, if available, makes this concrete rather than theoretical)
5. Handle edge cases: deleting from an empty list, deleting the only node, deleting the head

### Skills Demonstrated
- Dynamic memory allocation and manual memory management
- Linked list operations (a near-universal DSA/interview topic)
- Debugging memory issues, not just avoiding them by luck

---

## Project 3: A Simple File-Based Database (Advanced)

**Time:** 1-2 weeks

A command-line tool that stores and queries structured records in a binary file — combining structs, file I/O, and dynamic memory into one real system.

### Steps

1. Design a fixed-size record structure that can be written to and read from a binary file directly
2. Implement add, search, update, and delete operations that read/write the file correctly (not just in memory)
3. Handle the file-doesn't-exist-yet case and the corrupted-file case explicitly
4. Add an index or simple search optimization once basic linear search works (optional, but a genuine step up)
5. Write a clear README explaining the file format you designed and why

### Skills Demonstrated
- Binary file I/O
- Combining structs, pointers, and file operations into a coherent system
- Designing and documenting your own data format

### Repository Name
`c-file-based-db`

---

## Tips for Great Projects

**Draw your memory, don't just trust it.** For the linked-list project especially, sketch the pointers on paper before coding — most pointer bugs come from a wrong mental model, not a syntax mistake.

**Check every `malloc` return value.** In real code, `malloc` can fail and return `NULL` — checking for this (even if you never actually hit it in testing) shows you understand C doesn't protect you from anything by default.

**Use `valgrind` or a similar tool if you can.** Seeing an actual memory leak reported, with the exact line that allocated it, teaches you far more than reading about memory leaks in the abstract.

**For GATE/placement interviews specifically:** pointer arithmetic, linked-list manipulation, and explaining exactly what `malloc`/`free` do at the memory level are extremely common interview topics — these three projects directly build that fluency.

## Project Checklist
- [ ] 2-3 projects with clear READMEs explaining your design choices
- [ ] At least one project using dynamic memory allocation correctly (matched `malloc`/`free`)
- [ ] Comfortable explaining pointer arithmetic and linked-list operations without notes
- [ ] Tested for memory leaks on at least one project, even informally
- [ ] Projects organized so they're easy to walk through in an interview
