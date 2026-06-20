# Permutations and Combinations

## Why This Chapter Matters
P&C appears in JEE every year — 4-8 marks. The problems test logical thinking, not just formula application. Carefully reading whether order matters (permutation) or not (combination) is essential.

## Core Concepts

### 1. Fundamental Counting Principle
If task 1 can be done in m ways AND task 2 in n ways: total = m x n ways.
If task 1 OR task 2: total = m + n ways.

### 2. Permutations (ORDER matters)
Arrange r items from n distinct items:
nPr = n! / (n-r)!

All n items: n! ways
With repetition: n^r ways (r positions, n choices each)

Identical objects: n! / (p! x q! x r! ...) where p,q,r = count of each identical type

Circular permutations: (n-1)! ways (fix one element, arrange rest)

### 3. Combinations (ORDER doesn't matter)
Select r items from n:
nCr = n! / (r! x (n-r)!)

Key properties:
nCr = nC(n-r)
nCr + nC(r-1) = (n+1)Cr  (Pascal's identity)
nC0 = nCn = 1
nC1 = n

### 4. Common Problem Types

**Distribution:** Distributing n identical objects into r distinct groups
- Each group >= 0: C(n+r-1, r-1)
- Each group >= 1: C(n-1, r-1)

**Words from letters:**
Total arrangements of MATHEMATICS: 11!/(2!x2!x2!) [M,A,T each appear twice]

**Handshakes/Diagonals:**
Handshakes among n people: nC2 = n(n-1)/2
Diagonals of n-gon: nC2 - n = n(n-3)/2

## PYQs
**2024:** In how many ways can 5 boys and 3 girls sit in a row so that no two girls sit together?
Boys: 5! = 120 ways. 6 gaps between/around boys.
Girls in gaps: 6P3 = 6x5x4 = 120.
Total: 120 x 120 = 14400

**2023:** Number of words from letters of ARRANGE where the two R's are never together?
Total = 7!/2! = 2520. Together: treat RR as one unit -> 6!/2! = 360 (A appears twice)... Wait: ARRANGE has A(2),R(2),N,G,E
Total arrangements = 7!/(2!x2!) = 1260
R's together (RR as one): 6!/2! = 360
R's not together = 1260 - 360 = 900

**2022:** nC12 = nC8. Find nC17.
nCr = nC(n-r) means 12 = n - 8 => n = 20.
20C17 = 20C3 = 20x19x18/(3x2x1) = 1140

## MCQ Practice
Q1. 5P3 equals:
(A) 10 (B) 20 (C) 60 (D) 120
Answer: C [5!/(5-3)! = 5x4x3 = 60]

Q2. Number of diagonals in a hexagon:
(A) 6 (B) 9 (C) 12 (D) 15
Answer: B [6C2 - 6 = 15-6 = 9]

Q3 (Hard). Number of ways to select 3 cards from 52 where at least 2 are red?
At least 2 red = exactly 2 red + exactly 3 red
= 26C2 x 26C1 + 26C3
= 325x26 + 2600 = 8450 + 2600 = 11050

## Revision Notes
```
PERMUTATION (order matters): nPr = n!/(n-r)!
COMBINATION (order doesn't matter): nCr = n!/(r!(n-r)!)

CIRCULAR: (n-1)! for n distinct items
IDENTICAL OBJECTS: n!/(p!q!r!...)

Pascal: nCr + nC(r-1) = (n+1)Cr
nCr = nC(n-r)  [KEY: if nCp = nCq then p+q=n or p=q]

HANDSHAKES: nC2 = n(n-1)/2
DIAGONALS: nC2 - n = n(n-3)/2
```
