# Java — Learning Roadmap

## Estimated Time to Placement-Ready
**8-12 weeks** of consistent learning (2-3 hours/day) — Java's syntax is learnable quickly, but real fluency with OOP design, collections, and the standard library (what placement interviews actually probe) takes sustained practice, not just reading through the language reference.

## Phase 1: Foundation (Week 1-3)

- Java program structure, compilation model (`javac`/`java`), and data types
- Control flow, methods, and basic OOP (classes, objects, encapsulation)
- Complete the Fundamentals section in this course
- Run through the beginner-level Labs exercises

**Checkpoint:** can you write a class with private fields, a constructor, getters/setters, and one instance method — from scratch, without looking anything up?

## Phase 2: Core Language Depth (Week 3-6)

- Inheritance, polymorphism, interfaces, and abstract classes — and specifically when to use an interface vs. an abstract class
- Exception handling (checked vs. unchecked exceptions, try-with-resources)
- The Collections Framework (`ArrayList`, `HashMap`, `HashSet`) — these show up constantly in both real code and DSA-style interview questions
- Complete Project 1 (student management CLI) from this course's Projects section

**Checkpoint:** can you explain, concretely, why you'd choose a `HashMap` over an `ArrayList` for a given problem — not just that they're different?

## Phase 3: Applied Practice (Week 6-9)

- Multithreading basics and where the JVM's thread model matters practically
- Spring Boot fundamentals — most Java backend job postings assume some Spring familiarity
- Complete Project 2 (library management system) from this course's Projects section
- Start solving DSA problems in Java specifically — array/string manipulation, recursion, basic tree/graph problems

**Checkpoint:** can you build a small Spring Boot REST endpoint from scratch, including basic error handling, without a tutorial open next to you?

## Phase 4: Interview and Placement Readiness (Week 9-12)

- JVM tuning basics and common design patterns (Singleton, Factory, Builder) — frequently asked at the intermediate-to-advanced interview level
- Complete Project 3 (Spring Boot REST API) and review this course's Interview Q&A section
- Do 3+ mock technical interviews, including at least one live-coding round

## Skills You'll Build

| Skill Area | What You'll Learn |
|---|---|
| Core Language | Syntax, OOP, and Java-specific idioms |
| Collections & Data Structures | Choosing the right collection type for a problem |
| Exception Handling | Robust error handling, not just avoiding crashes |
| Frameworks | Spring Boot fundamentals for backend roles |
| Interview Prep | DSA-in-Java fluency and system-design basics |

## Weekly Study Plan

```
Monday:    New concept — fundamentals/intermediate section + examples
Tuesday:   Hands-on labs applying that concept
Wednesday: Build or extend a small project using it
Thursday:  Solve 3-5 DSA problems in Java on the same general topic
Friday:    Review interview questions on the week's material out loud
Weekend:   Work on a portfolio project, or a longer DSA practice session
```

## Red Flags to Avoid

- ❌ Learning syntax without ever building anything — tutorial-following without independent practice
- ❌ Skipping the Collections Framework because "arrays work fine" — most real code and most interviews expect collections fluency
- ❌ Not understanding *why* `virtual`-equivalent behavior (Java's default method overriding) works the way it does — memorizing OOP vocabulary without the underlying mechanism
- ❌ Ignoring exception handling until "later" — it's tested directly in interviews and matters immediately in any real project
- ❌ Studying in isolation with no way to check whether your code is actually idiomatic Java, not just working Java

## Resources

- **This course**: Overview → Fundamentals → Intermediate → Advanced → Labs → Projects
- **Official Java documentation (docs.oracle.com)**: the most accurate source for standard library behavior
- **LeetCode/HackerRank (Java track)**: DSA practice specifically in Java syntax
- **Spring Boot's own guides (spring.io/guides)**: short, focused, and current

## Getting Placement-Ready

1. **Portfolio**: 2-3 solid projects from this course's Projects section, each with a clear README and a design decision you can defend
2. **DSA fluency in Java specifically**: knowing an algorithm conceptually isn't the same as writing correct, idiomatic Java under time pressure — practice in the actual language you'll interview in
3. **Resume**: be specific and honest — "implemented a REST API with 4 endpoints and JUnit test coverage for core logic" is stronger than a vague "worked with Java"
4. **Mock interviews**: at least 3, including live coding — DSA fluency and OOP-design reasoning are both commonly tested, often in the same interview
5. **Know your own projects cold**: be ready to explain every design choice in anything you list on your resume — this is one of the most common places candidates get caught off guard
