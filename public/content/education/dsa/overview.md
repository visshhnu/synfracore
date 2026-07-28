# Data Structures & Algorithms — Overview

## What DSA Actually Is

**Data structures** are ways of organizing data in memory so it can be accessed and modified efficiently — an array, a linked list, a stack, a tree, a graph are all data structures, each with different trade-offs for different situations. **Algorithms** are step-by-step procedures for solving a problem using that data — searching, sorting, finding a shortest path. DSA is the combined study of both: which structure fits a problem, and which procedure solves it efficiently.

## Why It's Central to Software Engineering Interviews

Most large tech companies — often referred to collectively as **FAANG** (an acronym for Facebook/Meta, Amazon, Apple, Netflix, Google, now used loosely for any large, highly-selective tech employer) — screen engineering candidates heavily on DSA, regardless of what the actual job involves day to day. The reasoning: DSA problems are a reasonably fair, language-agnostic way to test problem-solving ability and whether a candidate can reason about efficiency, in a short interview window.

A solution that's *correct* isn't automatically good enough. Coding platforms and interviews both care about **efficiency** — if your solution is technically correct but too slow for the given input size, an online judge will mark it **TLE (Time Limit Exceeded)**, and an interviewer will ask you to optimize it. This is why the next concept — Big O notation — is the actual foundation everything else in this course builds on.

## Big O Notation — Describing Efficiency Without Depending on Hardware

If you time how long your code takes to run, that number depends on your specific computer, what else is running, and the exact input you happened to test with — none of which is useful for comparing two different *approaches* to a problem. Big O notation sidesteps this by describing how an algorithm's runtime (or memory use) grows **as the input size grows**, independent of hardware:

```
Time Complexity — how runtime grows with input size n:

O(1)      → Constant     — same time regardless of input size (array access by index)
O(log n)  → Logarithmic  — grows very slowly (binary search, cutting the problem in half each step)
O(n)      → Linear       — grows directly with input size (checking every element once)
O(n log n)→ Linearithmic — a bit worse than linear (efficient sorting algorithms)
O(n²)     → Quadratic    — grows fast (comparing every element to every other element)
O(2ⁿ)     → Exponential  — grows explosively (trying every possible subset)
O(n!)     → Factorial    — grows even faster (trying every possible ordering)

Growth rate, slowest-growing to fastest-growing:
O(1) < O(log n) < O(n) < O(n log n) < O(n²) < O(2ⁿ) < O(n!)
```

**Space Complexity** works the same way, but for memory instead of time — how much *extra* memory (beyond the input itself) an algorithm needs as input size grows. An algorithm that modifies data in place without creating new structures is O(1) space; one that builds a full copy of the input is O(n) space.

The practical payoff: given two approaches to the same problem, Big O lets you reason about which one will still work when the input is 10,000 items instead of 10, without having to actually run both and time them.

## How This Course Is Sequenced

This course is deliberately ordered so each section builds on real, already-taught foundations — nothing here assumes knowledge from a later section:

- **Fundamentals** covers the structures nearly everything else depends on: arrays and strings (with the two-pointer, sliding-window, and prefix-sum techniques), linked lists, stacks and queues, binary search, and recursion — the last of which is the conceptual foundation the next two sections lean on heavily.
- **Intermediate** builds on recursion specifically to cover trees and graphs — both are naturally recursive structures, which is exactly why recursion is taught first.
- **Advanced** covers dynamic programming (which extends recursion with memoization), a comparative look at sorting algorithms and their trade-offs, heaps/priority queues, and union-find — genuinely harder material that assumes comfort with everything before it.

If a term anywhere in this course is unfamiliar, it's introduced with a plain-language explanation the first time it's actually used, not just assumed.

## Approaching Interview Problems

Once you've worked through this course's sections, the same general approach applies to almost any DSA interview problem:

```
Step 1: Understand (2-3 min) — clarify constraints, input size, edge cases
Step 2: Think out loud (3-5 min) — start with a brute-force approach and
        state its complexity, then look for a pattern that improves it
Step 3: Code (15-20 min) — clean, readable code, handling edge cases
Step 4: Test (3-5 min) — trace through examples, check empty/single-element/
        duplicate cases
```

See this course's dedicated Interview section for worked Q&A on the specific topics covered here.
