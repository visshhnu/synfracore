# Sets, Relations and Functions

## Why This Chapter Matters
Direct questions every year in JEE Main — 4-8 marks. Foundation for all of mathematics. Relations/functions and their types are quick-scoring once you know the definitions.

## Core Concepts

### Sets
Collection of well-defined objects. Notation: A = {1, 2, 3}
Empty set: {} or phi. Universal set: U.

Operations: A union B, A intersection B, A - B (difference), A' (complement)
De Morgan's Laws: (A union B)' = A' intersection B' | (A intersection B)' = A' union B'

Power set P(A): set of all subsets. If |A| = n, |P(A)| = 2^n.

Venn diagrams: n(A union B) = n(A) + n(B) - n(A intersection B)

### Relations
A relation R from set A to B is a subset of A x B.
Types: Reflexive (aRa for all a), Symmetric (aRb => bRa), Transitive (aRb and bRc => aRc)
Equivalence relation = Reflexive + Symmetric + Transitive

### Functions
f: A -> B assigns each element of A exactly one element of B.
Domain = A (input set), Codomain = B (target set), Range = f(A) (actual outputs)

Types:
- One-one (injective): distinct inputs give distinct outputs
- Onto (surjective): every element of B is mapped to
- Bijective: both one-one and onto (inverse exists)
- Many-one: two inputs can give same output

### Composition and Inverse
fog(x) = f(g(x)) — apply g first, then f
If f is bijective, f^-1 exists and f(f^-1(x)) = x

### Key Formulas
If A has m elements and B has n elements:
- Total functions from A to B: n^m
- One-one functions: n!/(n-m)! if n >= m, else 0
- Onto functions: n^m - C(n,1)(n-1)^m + C(n,2)(n-2)^m - ... (inclusion-exclusion)

## PYQs
**2024:** Let A = {1,2,3} and R = {(1,1),(2,2),(3,3),(1,2),(2,1)}. Is R equivalence relation?
Reflexive: yes. Symmetric: yes. Transitive: (1,2) and (2,1) => (1,1) yes. R is equivalence relation.

**2023:** Number of onto functions from {1,2,3,4} to {a,b,c}?
Total - not onto = 3^4 - [C(3,1)x2^4 - C(3,2)x1^4] = 81 - [48-3] = 81-45 = 36

**2022:** f(x) = x^2 from R to R. Is it one-one? Onto?
Not one-one (f(2)=f(-2)=4). Not onto (negative numbers not in range). Neither bijective.

## MCQ Practice
Q1. If A has 3 elements and B has 4 elements, number of functions from A to B?
(A) 7 (B) 12 (C) 64 (D) 81
Answer: C [4^3 = 64]

Q2. R = {(a,b): a divides b} on {1,2,3,4,5}. Is R symmetric?
No. 2|4 but 4 does not divide 2. NOT symmetric.

Q3 (Hard). f: R->R, f(x) = 2x+3. Find f^-1(x).
y = 2x+3 => x = (y-3)/2. So f^-1(x) = (x-3)/2.

## Revision Notes
```
SETS: n(AuB) = n(A)+n(B)-n(AnB)
De Morgan: (AuB)' = A'nB' | (AnB)' = A'uB'
P(A): 2^n subsets if |A|=n

RELATIONS: Equivalence = Reflexive + Symmetric + Transitive

FUNCTIONS:
One-one: f(a)=f(b) => a=b
Onto: Range = Codomain
Bijective: one-one + onto (inverse exists)

Functions A->B: n^m total (n=|B|, m=|A|)
```
