# Arithmetic Progressions (AP)

## Why This Chapter Matters

AP is tested in every CBSE Class 10 board exam — at minimum 5 marks, often more. The nth term and sum formulas are essential tools. Word problems involving APs test practical application and are commonly seen in the Long Answer section.

## Prerequisites

- Sequences and series concept
- Basic algebra (substituting and solving linear equations)

---

## Core Concepts

### 1. What is an Arithmetic Progression?

A sequence where the **difference between consecutive terms is constant**.

This constant difference is called the **Common Difference (d)**.

**General form:** a, a+d, a+2d, a+3d, ...

**Examples:**
- 2, 5, 8, 11, 14, ... → d = 3 (increasing AP)
- 10, 7, 4, 1, −2, ... → d = −3 (decreasing AP)
- 5, 5, 5, 5, ... → d = 0 (constant AP)

**Checking if a sequence is AP:** Subtract consecutive terms — if the difference is always the same, it's an AP.

---

### 2. nth Term Formula (General Term)

$$\boxed{a_n = a + (n-1)d}$$

Where:
- aₙ = nth term
- a = first term (a₁)
- d = common difference
- n = position of the term

**Example:** Find the 15th term of AP: 7, 13, 19, 25, ...
a = 7, d = 13 − 7 = 6, n = 15
a₁₅ = 7 + (15−1) × 6 = 7 + 84 = **91**

**Example:** Which term of the AP 3, 8, 13, 18, ... is 78?
aₙ = 78 → 3 + (n−1)(5) = 78 → (n−1)(5) = 75 → n−1 = 15 → **n = 16**

---

### 3. Sum of First n Terms

$$\boxed{S_n = \frac{n}{2}[2a + (n-1)d]}$$

**Alternative form** (when last term l = aₙ is known):
$$S_n = \frac{n}{2}[a + l]$$

**Important relation:** aₙ = Sₙ − Sₙ₋₁

**Example:** Find sum of first 20 terms of AP: −5, −8, −11, ...
a = −5, d = −3, n = 20
S₂₀ = (20/2)[2(−5) + 19(−3)] = 10[−10 − 57] = 10 × (−67) = **−670**

---

### 4. Properties of AP

- If a, b, c are in AP → b − a = c − b → **2b = a + c** (b is the Arithmetic Mean of a and c)
- If a constant is added/subtracted/multiplied to each term of AP → resulting sequence is still AP
- If three terms in AP: take them as (a−d), a, (a+d) — makes calculation easier!
- If four terms in AP: take them as (a−3d), (a−d), (a+d), (a+3d)

---

## Solved Examples

### Example 1
**Q:** Find the sum of first 22 terms of AP in which d = 7 and the 22nd term is 149.

a₂₂ = a + 21d = 149 → a + 147 = 149 → a = 2
S₂₂ = (22/2)(a + a₂₂) = 11(2 + 149) = 11 × 151 = **1661**

### Example 2 — Word Problem
**Q:** The sum of 4th and 8th terms of an AP is 24, sum of 6th and 10th terms is 44. Find first three terms.

a₄ + a₈ = (a+3d) + (a+7d) = 2a + 10d = 24 → a + 5d = 12 ... (1)
a₆ + a₁₀ = (a+5d) + (a+9d) = 2a + 14d = 44 → a + 7d = 22 ... (2)

(2) − (1): 2d = 10 → d = 5
From (1): a = 12 − 25 = −13

**First three terms: −13, −8, −3**

### Example 3 — Sum of Multiples
**Q:** Find the sum of all multiples of 7 between 1 and 500.

Multiples of 7 between 1 and 500: 7, 14, 21, ..., 497
a = 7, d = 7, last term = 497
497 = 7 + (n−1)7 → n = 71
S = (71/2)(7 + 497) = (71/2)(504) = 71 × 252 = **17892**

---

## PYQs

### 2023
**Q:** How many terms of AP 9, 17, 25, ... must be taken to get a sum of 636?
a=9, d=8, Sₙ=636
636 = (n/2)[18 + 8(n−1)] = n(4n+5)
4n² + 5n − 636 = 0 → n = 12 (taking positive value)
**12 terms**

### 2022
**Q:** Find nth term of AP: 7, 13, 19, ..., 205
a=7, d=6, aₙ=205 → 7 + (n−1)6 = 205 → n = **34**

### 2021
**Q:** An AP consists of 50 terms. Third term is 12, last term is 106. Find 29th term.
a + 2d = 12 and a + 49d = 106 → 47d = 94 → d = 2, a = 8
a₂₉ = 8 + 28×2 = **64**

### 2020
**Q:** The sum of first n terms of an AP is 3n² + 4n. Find nth term and AP.
Sₙ = 3n² + 4n
S₁ = 7 = a₁ (first term = 7)
S₂ = 12 + 8 = 20 → a₂ = 20 − 7 = 13
d = 13 − 7 = 6
aₙ = Sₙ − Sₙ₋₁ = 3n² + 4n − [3(n−1)² + 4(n−1)] = **6n + 1**

---

## MCQ Practice

**Q1.** The common difference of AP: 1/3, 5/3, 9/3, 13/3 is:
(A) 2/3 (B) 4/3 ✓ (C) 3 (D) 1

**Q2.** 11th term of AP −3, −1/2, 2, ... is:
(A) 22 ✓ (B) 28 (C) −38 (D) −48
*[a=−3, d=2.5, a₁₁ = −3 + 10×2.5 = 22]*

**Q3 (Hard).** If the sum of first p terms of AP equals sum of first q terms, find sum of first (p+q) terms:
Let Sₚ = Sq → (p/2)(2a+(p−1)d) = (q/2)(2a+(q−1)d)
After simplification: 2a + (p+q−1)d = 0 → S(p+q) = **0**

---

## Revision Notes

```
AP Key Formulas:
  aₙ = a + (n−1)d         ← nth term
  Sₙ = n/2 [2a + (n−1)d]  ← sum formula 1
  Sₙ = n/2 [a + l]         ← sum formula 2 (l = last term)
  aₙ = Sₙ − Sₙ₋₁          ← nth term from sum

Three terms in AP:  take (a−d), a, (a+d) → sum = 3a
Four terms in AP:   take (a−3d), (a−d), (a+d), (a+3d) → sum = 4a
Arithmetic Mean:    AM of a and b = (a+b)/2
```

**Common Mistakes:**
❌ Using n(n−1)/2 for sum instead of n/2[2a+(n−1)d]
❌ In "find how many terms" problems, rejecting n as non-integer but not checking
❌ Forgetting that if aₙ is negative for some n in a real-life problem, it's invalid

## Related Topics
- Chapter 4 — Quadratic Equations (sum formulas lead to quadratics)
- Statistics (mean using AP property)
- JEE: Sequences and Series (GP, HP, AGP)
