# Java — Portfolio Projects

Build these to actually practice Java, not just read about it — and to have something concrete to show in a placement interview or on a resume.

## Project 1: Console-Based Student Management System (Beginner)

**Time:** 2-3 days

A command-line program that manages a list of students — add, search, update, delete, and display — using core Java (classes, `ArrayList`, no framework needed yet).

### Steps

1. Design a `Student` class (name, roll number, marks, etc.)
2. Store students in an `ArrayList<Student>`
3. Implement add, search-by-roll-number, update, and delete operations
4. Add input validation — what happens if someone searches for a roll number that doesn't exist?
5. Write a simple menu-driven console interface (`Scanner` for input)

### Skills Demonstrated
- Classes, objects, and encapsulation
- Collections (`ArrayList`)
- Basic input handling and validation

### Repository Name
`java-student-management-cli`

---

## Project 2: Library Management System With File Persistence (Intermediate)

**Time:** 4-5 days

Extend the beginner-level idea with real OOP design (inheritance, interfaces) and file-based persistence, so data survives between program runs.

### Steps

1. Design a class hierarchy — e.g., an abstract `LibraryItem` base class, with `Book` and `Magazine` as subclasses
2. Implement borrowing/returning logic with proper state tracking (available vs. borrowed)
3. Persist data to a file (simple text/CSV format, or Java's built-in serialization) so state isn't lost when the program exits
4. Handle exceptions properly — what happens if the data file is missing or corrupted?
5. Write JUnit tests for your core logic (this course's Labs section covers JUnit basics)

### Skills Demonstrated
- Inheritance and abstract classes
- File I/O and basic persistence
- Exception handling
- Unit testing with JUnit

---

## Project 3: A Small Spring Boot REST API (Advanced)

**Time:** 1-2 weeks

Build a basic REST API — a to-do list, a simple inventory tracker, or similar — using Spring Boot, backed by an in-memory or simple database, demonstrating the framework most Java backend jobs actually use.

### Steps

1. Set up a Spring Boot project (via Spring Initializr)
2. Design 2-3 REST endpoints (e.g., GET/POST/PUT/DELETE for a single resource)
3. Add basic validation and proper HTTP status codes for error cases
4. Connect to a real (even if simple) data store — H2 in-memory database is a reasonable starting point
5. Write a clear README explaining what the API does and how to run it locally
6. Test your endpoints with a tool like Postman or curl, and document example requests

### Skills Demonstrated
- Spring Boot fundamentals
- REST API design
- Working with a real (if simple) data layer

### Repository Name
`java-spring-boot-todo-api`

---

## Tips for Great Projects

**Solve something concrete, even if small.** A to-do API that actually works end-to-end is more impressive in an interview than an ambitious project that's half-finished.

**Write a real README.** What it does, how to run it, and one paragraph on a design decision you made and why — interviewers regularly ask "why did you structure it this way," and having already thought about the answer helps.

**Commit incrementally, not all at once.** A commit history showing the project built up over several sessions is a stronger signal than a single "initial commit" with everything already done.

**For placement interviews specifically:** be ready to explain your `ArrayList` vs. array choice, why you used an interface vs. an abstract class, and what your exception-handling strategy was — these are exactly the kind of design-reasoning questions Java interviews ask.

## Project Checklist
- [ ] 2-3 projects with clear, working READMEs
- [ ] At least one project demonstrating inheritance/interfaces meaningfully, not just for the sake of using them
- [ ] At least one project with basic automated tests (JUnit)
- [ ] Comfortable explaining every design decision out loud
- [ ] Projects pinned/organized so they're easy to find on your profile
