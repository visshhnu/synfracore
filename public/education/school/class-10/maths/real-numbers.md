# Real Numbers

## Why This Chapter Matters

Real Numbers is Chapter 1 of Class 10 Maths for a reason — it establishes the foundation for all of mathematics. Understanding *why* numbers are classified the way they are, and how to find HCF and LCM efficiently, is tested in board exams every single year. The concepts here also appear directly in JEE and GATE.

## Prerequisites

Before starting this chapter, you should know:
- Natural numbers (1, 2, 3, ...), Whole numbers (0, 1, 2, ...), Integers (..., -2, -1, 0, 1, 2, ...)
- Factors and multiples from Class 5-7
- Basic divisibility rules (2, 3, 5, 9, 10)

---

## Core Concepts

### 1. Euclid's Division Lemma

**Statement:** For any two positive integers *a* and *b*, there exist **unique** integers *q* (quotient) and *r* (remainder) such that:

$$a = bq + r \quad \text{where } 0 \leq r < b$$

**In plain words:** When you divide any integer by another positive integer, you always get a quotient and a remainder. The remainder is always less than the divisor.

**Example:**
- Divide 17 by 5: → 17 = 5 × 3 + 2 → Here a=17, b=5, q=3, r=2 ✓
- Divide 49 by 7: → 49 = 7 × 7 + 0 → Here a=49, b=7, q=7, r=0 ✓

**Why it matters:** This lemma is the basis of the Euclidean Algorithm for finding HCF.

---

### 2. Euclid's Division Algorithm (HCF Method)

This is a step-by-step process to find the **HCF (Highest Common Factor)** of two numbers.

**Steps:**
1. Apply the division lemma: divide the larger number by the smaller
2. If remainder r = 0, the divisor is the HCF → STOP
3. If r ≠ 0, apply the lemma again with (previous divisor, remainder)
4. Repeat until remainder = 0

**Example: Find HCF(455, 42)**

```
Step 1: 455 = 42 × 10 + 35     (divide 455 by 42, get remainder 35)
Step 2: 42  = 35 × 1  + 7      (divide 42 by 35, get remainder 7)
Step 3: 35  = 7  × 5  + 0      (divide 35 by 7, remainder = 0 ✓)

HCF(455, 42) = 7
```

**Verify:** 455 = 7 × 65 ✓, 42 = 7 × 6 ✓. Both divisible by 7.

**Example: Find HCF(867, 255)**

```
Step 1: 867 = 255 × 3 + 102
Step 2: 255 = 102 × 2 + 51
Step 3: 102 = 51  × 2 + 0    → HCF = 51
```

---

### 3. Fundamental Theorem of Arithmetic

**Statement:** Every composite number can be expressed (factorised) as a product of primes in **exactly one way** (ignoring the order of factors).

This is also called **Unique Prime Factorisation**.

**Examples:**
```
12  = 2 × 2 × 3  = 2² × 3
60  = 2 × 2 × 3 × 5  = 2² × 3 × 5
100 = 2 × 2 × 5 × 5  = 2² × 5²
```

There is NO other way to write these as products of primes (order doesn't count: 2×3 = 3×2).

#### Finding HCF and LCM Using Prime Factorisation

**HCF = Product of SMALLEST power of each COMMON prime factor**

**LCM = Product of GREATEST power of each prime factor (common or not)**

**Example: Find HCF and LCM of 12 and 18**

```
12 = 2² × 3¹
18 = 2¹ × 3²

HCF = 2¹ × 3¹ = 6        (smallest powers of common primes 2 and 3)
LCM = 2² × 3² = 36        (greatest powers of all primes)
```

**Golden Relationship:**
$$\text{HCF} \times \text{LCM} = \text{Product of the two numbers}$$

Check: 6 × 36 = 216 = 12 × 18 ✓

> **Important:** This relationship holds for exactly TWO numbers only, not for three or more numbers.

---

### 4. Irrational Numbers

A number is **irrational** if it CANNOT be written in the form p/q where p and q are integers and q ≠ 0.

**Common irrational numbers:** √2, √3, √5, π, 0.10110111011110...

**Proof that √2 is irrational (by contradiction):**

Assume √2 is rational. Then √2 = p/q where p, q are integers with no common factor (in lowest terms) and q ≠ 0.

Squaring both sides: 2 = p²/q²
→ p² = 2q²
→ p² is even → p must be even (if p² is even, p is even)
→ Let p = 2m for some integer m
→ (2m)² = 2q² → 4m² = 2q² → q² = 2m²
→ q² is even → q is even

But now BOTH p and q are even, which contradicts our assumption that p/q is in lowest terms (no common factor).

**Therefore, our assumption was wrong. √2 is irrational. □**

---

### 5. Decimal Expansions of Rational Numbers

Every rational number (p/q) has a decimal expansion that either:
- **Terminates:** ends after finite digits → 1/4 = 0.25, 7/8 = 0.875
- **Repeats:** has a block that repeats forever → 1/3 = 0.333..., 1/7 = 0.142857142857...

**When does p/q terminate?**

After simplifying p/q to lowest terms, the denominator q has **only 2 and/or 5 as prime factors**.

```
1/4  = 1/2² → denominator = 2²  → terminates → 0.25
3/8  = 3/2³ → denominator = 2³  → terminates → 0.375
7/20 = 7/(4×5) = 7/(2²×5) → terminates → 0.35
1/6  = 1/(2×3) → 3 is in denominator → does NOT terminate → 0.1666...
```

---

## Solved Examples

### Example 1 (NCERT) — Euclid's Algorithm
**Q:** Show that any positive odd integer is of the form 6q+1, 6q+3, or 6q+5, where q is some integer.

**Solution:**
Let a be any positive integer. By Euclid's lemma with b = 6:
a = 6q + r, where r = 0, 1, 2, 3, 4, or 5

- r = 0 → a = 6q = 2(3q) → even
- r = 1 → a = 6q + 1 → **odd** ✓
- r = 2 → a = 6q + 2 = 2(3q+1) → even
- r = 3 → a = 6q + 3 = 3(2q+1) → **odd** ✓
- r = 4 → a = 6q + 4 = 2(3q+2) → even
- r = 5 → a = 6q + 5 → **odd** ✓

So any positive odd integer must be of the form 6q+1, 6q+3, or 6q+5. □

---

### Example 2 — HCF and LCM
**Q:** Find HCF and LCM of 96 and 404 using prime factorisation. Verify HCF × LCM = product of numbers.

**Solution:**
```
96  = 2 × 2 × 2 × 2 × 2 × 3 = 2⁵ × 3
404 = 2 × 2 × 101            = 2² × 101

HCF = 2² = 4          (only 2² is common)
LCM = 2⁵ × 3 × 101 = 9696

Verification: HCF × LCM = 4 × 9696 = 38784
Product: 96 × 404 = 38784  ✓
```

---

### Example 3 — Proving Irrationality
**Q:** Prove that 3 + 2√5 is irrational.

**Solution:**
Assume 3 + 2√5 is rational.
Then 3 + 2√5 = p/q (where p, q are integers, q ≠ 0, no common factor)

→ 2√5 = p/q − 3 = (p − 3q)/q
→ √5 = (p − 3q)/2q

Since p, q are integers, (p − 3q)/2q is rational.
But √5 is irrational.

**Rational ≠ Irrational → Contradiction!**

Therefore, our assumption is wrong. 3 + 2√5 is irrational. □

---

### Example 4 — Decimal Expansion
**Q:** Without performing division, state whether 23/(2³ × 5²) will have a terminating or non-terminating decimal expansion.

**Solution:**
Denominator = 2³ × 5² — this has only 2 and 5 as prime factors.
Therefore, 23/(2³ × 5²) has a **terminating** decimal expansion.

Actual value: 23/200 = 0.115 ✓

---

## Previous Year Questions (PYQs)

### 2023 Board
**Q1:** Use Euclid's Division Algorithm to find HCF(867, 255).
**Answer:** 
```
867 = 255 × 3 + 102
255 = 102 × 2 + 51
102 = 51  × 2 + 0
HCF = 51
```

**Q2:** Find the largest number that divides 245 and 1029 leaving remainder 5 in each case.
**Answer:**
The number divides (245 − 5) = 240 and (1029 − 5) = 1024 exactly.
So we need HCF(240, 1024).
```
1024 = 240 × 4 + 64
240  = 64  × 3 + 48
64   = 48  × 1 + 16
48   = 16  × 3 + 0
HCF = 16
```
Answer: The largest number is **16**.

### 2022 Board
**Q3:** Prove that √3 is irrational.
*(Same proof method as √2 — assume rational, reach contradiction)*

**Q4:** If the HCF of 65 and 117 is expressible in the form 65m − 117, find the value of m.
**Answer:**
HCF(117, 65): 117 = 65×1 + 52; 65 = 52×1 + 13; 52 = 13×4 + 0 → HCF = 13
65m − 117 = 13 → 65m = 130 → **m = 2**

### 2021 Board
**Q5:** The decimal expansion of 93/1500. State its type. *[Without calculation]*
1500 = 2² × 3 × 5³
Denominator has factor 3 (not 2 or 5) → **Non-terminating repeating**

### 2020 Board
**Q6:** Find LCM(306, 657). Given HCF = 9.
HCF × LCM = 306 × 657
**LCM = (306 × 657)/9 = 22338**

---

## MCQ Practice

### Easy Level

**Q1.** Euclid's division lemma states: a = bq + r, where:
- (A) 0 < r ≤ b
- (B) 0 ≤ r < b ✓
- (C) 0 < r < b
- (D) 0 ≤ r ≤ b

**Q2.** The decimal expansion of 17/8 is:
- (A) 2.125 ✓ (B) 2.145 (C) 2.215 (D) Non-terminating

**Q3.** HCF of two numbers is 23 and their LCM is 1449. If one number is 161, the other is:
- (A) 207 ✓ (B) 107 (C) 1449 (D) 23
*Solution: HCF × LCM = n1 × n2 → 23 × 1449 = 161 × n2 → n2 = 207*

### Medium Level

**Q4.** Which of the following is NOT a rational number?
- (A) √4 (B) √9 (C) √7 ✓ (D) √16

**Q5.** If HCF(a, b) = 12 and a × b = 1800, then LCM(a, b) =?
- (A) 3600 (B) 900 (C) 150 ✓ (D) 90
*Solution: LCM = (a×b)/HCF = 1800/12 = 150*

**Q6.** The number 1.0100100010000... is:
- (A) Rational (B) Irrational ✓ (C) Integer (D) Natural
*Non-terminating, non-repeating → Irrational*

### Hard Level

**Q7.** n² − 1 is divisible by 8 if n is:
- (A) an integer (B) a natural number (C) an odd integer ✓ (D) an even integer
*If n = 2k+1: n²−1 = 4k²+4k = 4k(k+1). Since k(k+1) is always even, 8 always divides n²−1*

**Q8.** If p is a prime, HCF(p, p²) = ?
- (A) p² (B) p ✓ (C) 1 (D) p³
*p = p¹, p² = p². HCF uses smallest power = p¹ = p*

---

## Revision Notes — Quick Reference

### Key Formulas
| Concept | Formula |
|---|---|
| Euclid's Lemma | a = bq + r, 0 ≤ r < b |
| HCF × LCM | = Product of two numbers |
| HCF (prime factorisation) | Smallest powers of common factors |
| LCM (prime factorisation) | Greatest powers of all factors |

### Terminating vs Non-Terminating
```
p/q terminates ↔ q = 2ᵐ × 5ⁿ (after simplification)
Otherwise → non-terminating repeating
```

### Proof Template for Irrationality
```
1. Assume the number IS rational = p/q (lowest terms)
2. Manipulate to show √prime = some fraction
3. √prime is irrational (fact)
4. Contradiction → assumption was wrong
5. Therefore irrational □
```

### Common Mistakes to Avoid

❌ **Mistake 1:** HCF × LCM = product of numbers — this only works for **two** numbers, NOT three.

❌ **Mistake 2:** If a number's decimal doesn't terminate, concluding it's irrational — it could be rational and non-terminating repeating (like 1/3 = 0.333...).

❌ **Mistake 3:** Forgetting to check if p/q is in lowest terms before applying the terminating condition.

❌ **Mistake 4:** In Euclid's Algorithm, applying lemma to wrong pair — always (previous divisor, remainder).

---

## Mind Map

```
                    REAL NUMBERS
                         │
         ┌───────────────┴───────────────┐
      Rational                       Irrational
    (p/q form)                    (√2, √3, π...)
         │
    ┌────┴────┐
Terminating  Non-Terminating
  (q=2ᵐ5ⁿ)    Repeating

Key Tools:
├── Euclid's Lemma → a = bq+r
├── Euclidean Algorithm → HCF
├── Prime Factorisation → HCF, LCM
└── Proof by Contradiction → Irrationality
```

---

## FAQs

**Q: Can I use prime factorisation for HCF instead of Euclid's Algorithm?**
Yes, both methods give the same answer. However, if the question specifically says "use Euclid's Division Algorithm", you must show the step-by-step division process. For large numbers, Euclid's algorithm is actually faster.

**Q: How many steps does Euclid's Algorithm take?**
It depends on the numbers. You stop when the remainder becomes 0. In CBSE exams, it usually takes 2-4 steps.

**Q: Is 0 rational or irrational?**
0 is rational. It can be written as 0/1 = p/q where p=0, q=1.

**Q: Is √4 irrational since it has a square root?**
No. √4 = 2, which is a natural number. Always simplify first — if the square root simplifies to an integer, it's rational.

**Q: How do I remember which is HCF and which is LCM in prime factorisation?**
HCF = **H**ighest but uses **smallest** powers. LCM = **L**owest but uses **largest** powers. The paradox helps you remember!

**Q: Does HCF × LCM = product work for three numbers?**
No! For three numbers a, b, c: LCM(a,b,c) = abc × HCF(a,b,c) / [HCF(a,b) × HCF(b,c) × HCF(a,c)]. This is beyond Class 10.

---

## Related Topics
- **Chapter 2 — Polynomials:** Uses the concept of factors and zeroes
- **Chapter 3 — Linear Equations:** HCF concept used in word problems
- **GATE CSE:** Number Theory, Modular Arithmetic
- **JEE:** Number Systems, Divisibility, Floor/Ceiling functions
