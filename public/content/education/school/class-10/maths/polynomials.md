# Polynomials

## Why This Chapter Matters

Polynomials are the building blocks of algebra. Every equation you solve in Class 10 and beyond involves polynomials. Understanding zeroes and their relationship with coefficients is a direct board exam topic — questions appear every year worth 4-6 marks.

## Prerequisites

- Algebraic expressions and their types (Class 8-9)
- Factorisation of algebraic expressions
- Graph plotting on coordinate axes
- Quadratic equations from Class 9

---

## Core Concepts

### 1. What is a Polynomial?

A polynomial in x is an expression of the form:
$$p(x) = a_n x^n + a_{n-1} x^{n-1} + ... + a_1 x + a_0$$

where all powers of x are **non-negative integers** and coefficients are **real numbers**.

**Degree** = highest power of the variable.

| Type | Degree | General Form | Example |
|---|---|---|---|
| Linear | 1 | ax + b | 3x + 2 |
| Quadratic | 2 | ax² + bx + c | 2x² − 5x + 3 |
| Cubic | 3 | ax³ + bx² + cx + d | x³ − 4x |

**What is NOT a polynomial:** 1/x, √x, x⁻², 2^x

---

### 2. Zeroes of a Polynomial

A value k is called a **zero** of polynomial p(x) if **p(k) = 0**.

**Example:** For p(x) = x² − 3x − 4:
- p(4) = 16 − 12 − 4 = 0 ✓ → 4 is a zero
- p(−1) = 1 + 3 − 4 = 0 ✓ → −1 is a zero

**Number of zeroes:** A polynomial of degree n has AT MOST n zeroes.
- Linear (degree 1) → at most 1 zero
- Quadratic (degree 2) → at most 2 zeroes
- Cubic (degree 3) → at most 3 zeroes

---

### 3. Geometrical Meaning of Zeroes

The zeroes of a polynomial p(x) are exactly the **x-coordinates of the points where the graph of y = p(x) cuts the x-axis**.

#### Graph of Linear Polynomial y = ax + b
- Always a straight line
- **Cuts x-axis at exactly 1 point** → 1 zero = −b/a

#### Graph of Quadratic Polynomial y = ax² + bx + c

A parabola. Number of zeroes depends on where it intersects the x-axis:

```
Case 1: 2 distinct zeroes    Case 2: 1 repeated zero   Case 3: No real zeroes
     ∩                              ∩                         ∩
    / \                              |                        (above x-axis)
___/   \___                     ____⌣____                _______________
   x₁  x₂                          x₁
Graph cuts x-axis twice       Touches x-axis once        Doesn't touch x-axis
```

| Discriminant (D = b²−4ac) | Nature of zeroes | Graph |
|---|---|---|
| D > 0 | 2 distinct real zeroes | Cuts x-axis at 2 points |
| D = 0 | 2 equal real zeroes | Touches x-axis at 1 point |
| D < 0 | No real zeroes | Does not intersect x-axis |

---

### 4. Relationship Between Zeroes and Coefficients

#### For Quadratic Polynomial p(x) = ax² + bx + c

If α (alpha) and β (beta) are the two zeroes:

$$\alpha + \beta = \frac{-b}{a} \quad \text{(Sum of zeroes)}$$

$$\alpha \cdot \beta = \frac{c}{a} \quad \text{(Product of zeroes)}$$

**Memory trick:** Sum = −(middle coefficient)/(leading coefficient) | Product = (constant term)/(leading coefficient)

**Example:** For p(x) = 2x² − 5x + 3:
- a = 2, b = −5, c = 3
- Sum of zeroes = −(−5)/2 = **5/2**
- Product of zeroes = 3/2

**Verification:** Zeroes are x = 3/2 and x = 1 (by factoring: (2x−3)(x−1))
- Sum: 3/2 + 1 = 5/2 ✓
- Product: 3/2 × 1 = 3/2 ✓

#### For Cubic Polynomial p(x) = ax³ + bx² + cx + d

If α, β, γ (gamma) are the three zeroes:

$$\alpha + \beta + \gamma = \frac{-b}{a}$$

$$\alpha\beta + \beta\gamma + \gamma\alpha = \frac{c}{a}$$

$$\alpha\beta\gamma = \frac{-d}{a}$$

---

### 5. Finding a Quadratic Polynomial Given Zeroes

If zeroes are α and β, the quadratic polynomial is:

$$p(x) = k[x^2 - (\alpha + \beta)x + \alpha\beta]$$

where k is any non-zero real number.

**Standard answer** (with k = 1): p(x) = x² − (Sum)x + (Product)

**Example:** Find a quadratic polynomial whose zeroes are 2 and −3.
- Sum = 2 + (−3) = −1
- Product = 2 × (−3) = −6
- Polynomial: p(x) = x² − (−1)x + (−6) = **x² + x − 6**

**Verify:** p(2) = 4 + 2 − 6 = 0 ✓ | p(−3) = 9 − 3 − 6 = 0 ✓

---

### 6. Division Algorithm for Polynomials

**Statement:** If p(x) and g(x) are polynomials where degree of g(x) > 0, then:

$$p(x) = g(x) \times q(x) + r(x)$$

where r(x) = 0 OR degree of r(x) < degree of g(x).

This is exactly like dividing numbers: **Dividend = Divisor × Quotient + Remainder**

**Example:** Divide p(x) = 3x³ + x² + 2x + 5 by g(x) = 1 + 2x + x²

**Arrange in standard form:** g(x) = x² + 2x + 1

```
         3x − 5
       ___________
x²+2x+1 | 3x³ + x² + 2x + 5
          3x³ + 6x² + 3x        ← (multiply 3x by divisor)
          ─────────────────
               −5x² − x + 5
               −5x² − 10x − 5   ← (multiply −5 by divisor)
               ───────────────
                       9x + 10   ← remainder
```

So: p(x) = (x² + 2x + 1)(3x − 5) + (9x + 10)

**Check:** degree of remainder (9x + 10) = 1 < degree of divisor (x² + 2x + 1) = 2 ✓

---

## Solved Examples

### Example 1
**Q:** Find the zeroes of the polynomial p(x) = x² − 2x − 8 and verify the relationship.

**Solution:**
Factorise: x² − 2x − 8 = x² − 4x + 2x − 8 = x(x−4) + 2(x−4) = (x+2)(x−4)

Zeroes: x + 2 = 0 → x = **−2** | x − 4 = 0 → x = **4**

**Verification:**
- Sum of zeroes: −2 + 4 = 2 = −(−2)/1 = −b/a ✓
- Product of zeroes: −2 × 4 = −8 = −8/1 = c/a ✓

---

### Example 2
**Q:** Find a quadratic polynomial each with the given numbers as sum and product of zeroes: (i) 1/4, −1 (ii) √2, 1/3

**Solution:**
**(i)** Sum = 1/4, Product = −1
p(x) = k[x² − (1/4)x + (−1)] = k[x² − x/4 − 1]
Taking k = 4: **p(x) = 4x² − x − 4**

**(ii)** Sum = √2, Product = 1/3
p(x) = k[x² − √2x + 1/3]
Taking k = 3: **p(x) = 3x² − 3√2x + 1**

---

### Example 3
**Q:** Verify that 3, −1, −1/3 are the zeroes of the cubic polynomial p(x) = 3x³ − 5x² − 11x − 3.

**Solution:**
- p(3) = 3(27) − 5(9) − 11(3) − 3 = 81 − 45 − 33 − 3 = 0 ✓
- p(−1) = 3(−1) − 5(1) − 11(−1) − 3 = −3 − 5 + 11 − 3 = 0 ✓
- p(−1/3) = 3(−1/27) − 5(1/9) − 11(−1/3) − 3 = −1/9 − 5/9 + 11/3 − 3 = 0 ✓

**Verification of relationships:** a = 3, b = −5, c = −11, d = −3
α + β + γ = 3 + (−1) + (−1/3) = 3 − 1 − 1/3 = 5/3 = −(−5)/3 = −b/a ✓
αβ + βγ + γα = (3)(−1) + (−1)(−1/3) + (−1/3)(3) = −3 + 1/3 − 1 = −11/3 = c/a ✓
αβγ = 3 × (−1) × (−1/3) = 1 = −(−3)/3 = −d/a ✓

---

## Previous Year Questions (PYQs)

### 2023
**Q:** If one zero of p(x) = 5x² + 13x + k is reciprocal of the other, find k.
**Answer:** If zeroes are α and 1/α, then product = α × (1/α) = 1 = k/5 → **k = 5**

### 2022
**Q:** Find zeroes of p(x) = 4s² − 4s + 1 and verify relationship.
**Solution:** 4s² − 4s + 1 = (2s − 1)² → zero: s = 1/2 (repeated)
Sum: 1/2 + 1/2 = 1 = 4/4 = −(−4)/4 ✓ | Product: 1/2 × 1/2 = 1/4 = 1/4 ✓

### 2021
**Q:** A quadratic polynomial whose product and sum of zeroes are −12 and 1 respectively is:
**Answer:** p(x) = x² − (sum)x + (product) = x² − x − 12

### 2020
**Q:** If α and β are zeroes of x² − 4x + 1, find the value of 1/α + 1/β.
**Solution:** 1/α + 1/β = (α + β)/αβ = 4/1 = **4**

---

## MCQ Practice

### Easy
**Q1.** Number of zeroes of a cubic polynomial:
(A) 1 (B) 2 (C) At most 3 ✓ (D) Exactly 3

**Q2.** If zeroes of x² − kx + 6 are 2 and 3, then k =
(A) 5 ✓ (B) −5 (C) 6 (D) 1 *[Sum = 2+3 = 5 = k/1 = k]*

### Medium
**Q3.** The graph of y = p(x) is given below. Number of zeroes is:
*(Graph showing parabola touching x-axis once)*
(A) 0 (B) 1 ✓ (C) 2 (D) 3

**Q4.** If one zero of 2x² + 3x + λ is 1/2, then λ =
(A) −2 ✓ (B) 2 (C) −1 (D) 1
*[p(1/2) = 2(1/4) + 3(1/2) + λ = 0 → 1/2 + 3/2 + λ = 0 → λ = −2]*

### Hard
**Q5.** If α and β are zeroes of f(x) = x² − p(x+1) − c, then (α+1)(β+1) =
(A) c−1 ✓ (B) 1−c (C) c+1 (D) 1
*[f(x) = x² − px − p − c. Product = −p−c = αβ. (α+1)(β+1) = αβ + α + β + 1 = (−p−c) + p + 1 = 1−c]*

---

## Revision Notes

```
Quadratic p(x) = ax² + bx + c with zeroes α, β:
  α + β = −b/a         (sum of zeroes)
  αβ   = c/a           (product of zeroes)

Form polynomial from zeroes:
  p(x) = x² − (sum)x + (product)

Division Algorithm:
  p(x) = g(x)·q(x) + r(x)
  degree(r) < degree(g) or r = 0
```

**Common Mistakes:**
❌ Confusing −b/a with b/a for sum — always the NEGATIVE of coefficient ratio
❌ Forgetting that zeroes of y = p(x) are where the GRAPH meets x-axis, not y-axis
❌ In cubic, forgetting the third relationship: αβγ = −d/a

## Related Topics
- Chapter 4 — Quadratic Equations (solving for zeroes)
- Chapter 1 — Real Numbers (rational and irrational zeroes)
- JEE: Theory of Equations, symmetric functions
