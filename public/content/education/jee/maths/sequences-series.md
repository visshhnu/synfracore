# Sequences and Series

## Why This Chapter Matters
AP, GP, HP and special series questions appear every year in JEE — 4-8 marks. Mastering the sum formulas and AM-GM-HM inequality is essential for quick solutions.

## Core Concepts

### 1. Arithmetic Progression (AP)
a, a+d, a+2d, ... (common difference d)
nth term: a_n = a + (n-1)d
Sum of n terms: S_n = n/2 [2a + (n-1)d] = n/2 [a + l]  (l = last term)
Arithmetic mean of a and b: AM = (a+b)/2

### 2. Geometric Progression (GP)
a, ar, ar^2, ... (common ratio r)
nth term: a_n = a x r^(n-1)
Sum of n terms: S_n = a(r^n - 1)/(r-1) for r != 1; S_n = na for r = 1
Sum of infinite GP (|r| < 1): S = a/(1-r)
Geometric mean of a and b: GM = sqrt(ab)

### 3. Harmonic Progression (HP)
1/a, 1/(a+d), 1/(a+2d), ... (reciprocals are in AP)
nth term of HP: 1/a_n = 1/a + (n-1)d (use AP formula on reciprocals)
Harmonic mean of a and b: HM = 2ab/(a+b)

### 4. AM-GM-HM Inequality
For positive numbers a, b:
AM >= GM >= HM
Equality when a = b.

AM x HM = GM^2  [KEY IDENTITY]

### 5. Special Sums
Sum of first n natural numbers: n(n+1)/2
Sum of squares: n(n+1)(2n+1)/6
Sum of cubes: [n(n+1)/2]^2
Sum of first n odd numbers: n^2
Sum of first n even numbers: n(n+1)

### 6. Arithmetico-Geometric Series (AGP)
Product of AP and GP: a, (a+d)r, (a+2d)r^2, ...
Sum found by multiplying by r and subtracting.

## PYQs
**2024:** Sum of infinite series 1 + 4/5 + 7/25 + 10/125 + ...
This is AGP. a=1, d=3, r=1/5.
S = a/(1-r) + dr/((1-r)^2) = (1)/(4/5) + (3)(1/5)/(16/25)
= 5/4 + (3/5)(25/16) = 5/4 + 15/16 = 20/16 + 15/16 = 35/16

**2023:** The sum of 3 numbers in AP is 15 and sum of their squares is 83. Find them.
Let numbers be a-d, a, a+d. Sum = 3a = 15 => a = 5.
(5-d)^2 + 25 + (5+d)^2 = 83 => 50 + 2d^2 = 83 => d^2 = 16.5... 
Actually: 25-10d+d^2 + 25 + 25+10d+d^2 = 83 => 75 + 2d^2 = 83 => d^2 = 4 => d = 2.
Numbers: 3, 5, 7.

**2022:** Find sum to n terms: 1.2 + 2.3 + 3.4 + ... n(n+1)
T_k = k(k+1) = k^2 + k
S_n = n(n+1)(2n+1)/6 + n(n+1)/2 = n(n+1)/6 x [2n+1+3] = n(n+1)(n+2)/3

## MCQ Practice
Q1. Sum of GP 1, 1/2, 1/4, ... to infinity:
(A) 1 (B) 2 (C) 3 (D) 4
Answer: B [S = a/(1-r) = 1/(1-1/2) = 2]

Q2. If AM between a and b is 6 and GM is 4, find HM.
AM x HM = GM^2 => 6 x HM = 16 => HM = 8/3

Q3 (Hard). Find sum: 1/(1x2) + 1/(2x3) + ... + 1/(n(n+1))
T_k = 1/(k(k+1)) = 1/k - 1/(k+1) (partial fractions)
S_n = 1 - 1/(n+1) = n/(n+1)

## Revision Notes
```
AP: a + (n-1)d | S = n/2[2a+(n-1)d]
GP: a x r^(n-1) | S = a(r^n-1)/(r-1) | S_inf = a/(1-r) for |r|<1
HP: use reciprocals which are in AP

AM >= GM >= HM (equality when all terms equal)
AM x HM = GM^2

SPECIAL SUMS:
n(n+1)/2 | n(n+1)(2n+1)/6 | [n(n+1)/2]^2

TRICK: 3 terms in AP as (a-d, a, a+d) -> sum = 3a
TRICK: 3 terms in GP as (a/r, a, ar) -> product = a^3
```
