# Binomial Theorem

## Why This Chapter Matters
Binomial Theorem is straightforward once you memorize the expansion. JEE asks for specific terms, middle terms, and coefficient problems — 4-6 marks guaranteed.

## Core Concepts

### 1. Binomial Expansion
(a + b)^n = sum from r=0 to n of: C(n,r) x a^(n-r) x b^r

For (a + b)^n, there are n+1 terms.

### 2. General Term
T(r+1) = C(n,r) x a^(n-r) x b^r

This is the (r+1)th term.

### 3. Middle Term(s)
If n is even: one middle term = T(n/2 + 1)
If n is odd: two middle terms = T((n+1)/2) and T((n+3)/2)

### 4. Key Expansions
(1+x)^n = 1 + nx + n(n-1)/2! x^2 + ... + x^n
(1-x)^n = 1 - nx + n(n-1)/2! x^2 - ...
(1+x)^n + (1-x)^n = 2[1 + C(n,2)x^2 + C(n,4)x^4 + ...]  (even terms)
(1+x)^n - (1-x)^n = 2[C(n,1)x + C(n,3)x^3 + ...]  (odd terms)

### 5. Important Identities
Sum of all coefficients: put x=1 -> 2^n
Sum of even-position coefficients = Sum of odd-position coefficients = 2^(n-1)
C(n,0) + C(n,1) + ... + C(n,n) = 2^n

## Solved Examples

**Q1:** Find the 4th term of (x + 2y)^7.
T(4) = T(3+1) = C(7,3) x x^(7-3) x (2y)^3 = 35 x x^4 x 8y^3 = 280x^4y^3

**Q2:** Find the middle term of (x - 1/x)^6.
n=6, even, middle term = T(4).
T(4) = C(6,3) x x^3 x (-1/x)^3 = 20 x x^3 x (-1/x^3) = 20 x (-1) = -20

**Q3:** Find the term independent of x in (x + 1/x^2)^9.
T(r+1) = C(9,r) x x^(9-r) x (1/x^2)^r = C(9,r) x x^(9-r-2r) = C(9,r) x x^(9-3r)
For independent of x: 9-3r = 0 => r = 3
T(4) = C(9,3) = 84

## PYQs
**2024:** Sum of coefficients of (1+x-3x^2)^20 is?
Put x=1: (1+1-3)^20 = (-1)^20 = 1

**2023:** Find coefficient of x^4 in (1+x)^n if coefficient of x^2 is 6.
C(n,2) = 6 => n(n-1)/2 = 6 => n=4.
Coefficient of x^4 = C(4,4) = 1.

**2022:** Greatest coefficient in expansion of (1+x)^10?
Coefficients are C(10,0), C(10,1),...,C(10,10). Greatest is C(10,5) = 252.

## Revision Notes
```
GENERAL TERM: T(r+1) = C(n,r) a^(n-r) b^r

MIDDLE TERM:
n even: T(n/2 + 1)  [one middle term]
n odd: T((n+1)/2) and T((n+3)/2)  [two middle terms]

TERM INDEPENDENT OF x:
Set power of x in general term = 0, solve for r.

KEY SUMS:
All coefficients (x=1): 2^n
Even-position coefficients = Odd-position = 2^(n-1)

BINOMIAL COEFFICIENT: C(n,r) = n!/[r!(n-r)!]
Largest coefficient: middle binomial coefficient
```
