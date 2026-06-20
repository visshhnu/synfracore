# Quadratic Equations

## Why This Chapter Matters

Quadratic equations are one of the most-tested topics in CBSE Class 10 — questions appear in every section (MCQ, Short Answer, and Long Answer). The discriminant and nature of roots are asked almost every year. This chapter also forms the direct foundation for JEE and higher mathematics.

## Prerequisites

- Factorisation of algebraic expressions (Class 8-9)
- Square roots and basic identities
- Chapter 2 — Polynomials (zeroes of polynomials)

---

## Core Concepts

### 1. Standard Form of a Quadratic Equation

$$ax^2 + bx + c = 0 \quad \text{where } a \neq 0$$

- a, b, c are real numbers (a ≠ 0 — if a = 0, it becomes linear)
- a = coefficient of x² (called **leading coefficient**)
- b = coefficient of x
- c = constant term

**Examples:**
- 2x² − 5x + 3 = 0 ✓ (a=2, b=−5, c=3)
- x² = 3x → x² − 3x = 0 ✓ (a=1, b=−3, c=0)
- (x+1)(x−2) = 0 → x² − x − 2 = 0 ✓

**NOT quadratic:** x³ + x = 0 (degree 3), 5x + 3 = 0 (degree 1)

---

### 2. Method 1 — Factorisation (Splitting the Middle Term)

**Steps:**
1. Write equation in standard form ax² + bx + c = 0
2. Find two numbers whose **sum = b** and **product = ac**
3. Split the middle term using these two numbers
4. Group and factorise
5. Apply Zero Product Property: if pq = 0, then p = 0 or q = 0

**Example:** Solve 6x² − x − 2 = 0

Step 1: a=6, b=−1, c=−2 → ac = 6×(−2) = −12
Step 2: Find two numbers with sum = −1 and product = −12 → 3 and −4 (3 + (−4) = −1, 3×(−4) = −12)
Step 3: 6x² + 3x − 4x − 2 = 0
Step 4: 3x(2x + 1) − 2(2x + 1) = 0 → (3x − 2)(2x + 1) = 0
Step 5: x = 2/3 or x = −1/2

---

### 3. Method 2 — Completing the Square

**Steps:**
1. Make coefficient of x² equal to 1 (divide throughout by a)
2. Move constant to right side
3. Add (b/2a)² to both sides
4. Write left side as a perfect square
5. Take square root of both sides

**Example:** Solve 2x² + x − 4 = 0

```
Step 1: x² + x/2 − 2 = 0           (divide by 2)
Step 2: x² + x/2 = 2
Step 3: x² + x/2 + (1/4)² = 2 + 1/16    (add (b/2)² = (1/4)² = 1/16)
Step 4: (x + 1/4)² = 32/16 + 1/16 = 33/16
Step 5: x + 1/4 = ±√33/4
        x = (−1 ± √33)/4
```

---

### 4. Method 3 — Quadratic Formula (Most Important)

For ax² + bx + c = 0:

$$\boxed{x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}}$$

This formula ALWAYS works. Learn it by heart.

**Example:** Solve x² − 7x − 8 = 0

a=1, b=−7, c=−8

$$x = \frac{7 \pm \sqrt{49 + 32}}{2} = \frac{7 \pm \sqrt{81}}{2} = \frac{7 \pm 9}{2}$$

x = (7+9)/2 = 8 OR x = (7−9)/2 = −1

---

### 5. Discriminant and Nature of Roots (Most Tested!)

The expression **D = b² − 4ac** is called the **discriminant**.

| Discriminant (D) | Nature of Roots | How many real roots? |
|---|---|---|
| D > 0 | Two distinct real roots | 2 |
| D = 0 | Two equal real roots (repeated root) | 1 (counted twice) |
| D < 0 | No real roots (complex roots) | 0 |

**Example 1:** Find the nature of roots of 2x² − 4x + 3 = 0
D = (−4)² − 4(2)(3) = 16 − 24 = **−8 < 0**
→ No real roots exist.

**Example 2:** Find k if kx² + 4x + 1 = 0 has equal roots
For equal roots: D = 0 → 16 − 4k = 0 → **k = 4**

---

### 6. Word Problems — Setting Up the Equation

**Step 1:** Read carefully, identify the unknown — let it be x
**Step 2:** Form expressions for other quantities in terms of x
**Step 3:** Use the given condition to form an equation
**Step 4:** Solve the equation
**Step 5:** Check whether both/one answer is valid in context (lengths/ages can't be negative)

---

## Solved Examples

### Example 1 — Factorisation
**Q:** Find roots of x² − 3x − 10 = 0

Product = −10, Sum = −3 → numbers: −5 and 2
x² − 5x + 2x − 10 = 0
x(x−5) + 2(x−5) = 0
(x+2)(x−5) = 0
**x = −2 or x = 5**

---

### Example 2 — Quadratic Formula
**Q:** Solve 2x² + 7x + 3 = 0

D = 49 − 24 = 25
x = (−7 ± 5)/4
x = −2/4 = **−1/2** OR x = −12/4 = **−3**

---

### Example 3 — Word Problem (Classic)
**Q:** The product of two consecutive positive integers is 306. Find the integers.

Let smaller integer = x → larger = x + 1
x(x + 1) = 306
x² + x − 306 = 0
D = 1 + 1224 = 1225 = 35²
x = (−1 ± 35)/2 → x = 17 (positive) or x = −18 (rejected, not positive)

**Answer: The integers are 17 and 18.** Check: 17 × 18 = 306 ✓

---

### Example 4 — Speed/Distance Problem
**Q:** A train travels 360 km at a uniform speed. If speed had been 5 km/h more, it would have taken 1 hour less. Find the speed.

Let speed = x km/h
Time at speed x = 360/x hours
Time at speed (x+5) = 360/(x+5) hours
Difference = 1: 360/x − 360/(x+5) = 1

360(x+5) − 360x = x(x+5)
1800 = x² + 5x
x² + 5x − 1800 = 0
(x + 45)(x − 40) = 0
x = 40 or x = −45 (rejected)

**Speed = 40 km/h**

---

## PYQs

### 2023
**Q:** Find the discriminant of x² + 5x − 6 = 0 and state nature of roots.
D = 25 + 24 = **49 > 0** → Two distinct real roots

**Q:** Find k for which x² − kx + 9 = 0 has equal roots.
D = 0 → k² − 36 = 0 → k = ±6

### 2022
**Q:** Solve by completing the square: x² − 5x + 5 = 0
x² − 5x = −5 → (x − 5/2)² = −5 + 25/4 = 5/4
x − 5/2 = ±√5/2 → x = (5 ± √5)/2

### 2021
**Q:** Are the roots real? x² + x + 1 = 0
D = 1 − 4 = **−3 < 0** → No real roots

### 2020
**Q:** An express train takes 1 hour less than a passenger train to travel 132 km. If average speed of express is 11 km/h more, find speeds.
Let passenger speed = x → x(x+11) = x² + 11x
132/x − 132/(x+11) = 1 → 132×11 = x(x+11) → x² + 11x − 1452 = 0
(x+44)(x−33) = 0 → x = 33 km/h | Express = 44 km/h

---

## MCQ Practice

### Easy
**Q1.** Roots of x² − 5x + 6 = 0 are: (A) 2, 3 ✓ (B) −2, −3 (C) 2, −3 (D) −2, 3

**Q2.** If D = 0, the quadratic has: (A) no roots (B) one real root ✓ (C) two distinct real roots (D) three roots

### Medium
**Q3.** Value of k for which 2x² + kx + 3 = 0 has equal roots:
(A) ±2√6 ✓ (B) ±6 (C) ±√6 (D) ±2√3
*[D = k² − 24 = 0 → k = ±√24 = ±2√6]*

**Q4.** Which method ALWAYS gives roots (even when factorisation fails)?
(A) Factorisation (B) Completing the square (C) Quadratic formula ✓ (D) All of these

### Hard
**Q5.** If one root of x² − 5x + k = 0 is double the other, find k.
Let roots be α and 2α → Sum: 3α = 5 → α = 5/3
Product: 2α² = k → k = 2(25/9) = **50/9**

---

## Revision Notes

```
Quadratic Formula:  x = (−b ± √D) / 2a
Discriminant:       D = b² − 4ac

Nature of Roots:
  D > 0 → Two distinct real roots
  D = 0 → Two equal roots (each = −b/2a)
  D < 0 → No real roots

Factorisation shortcut:
  Find p, q such that p + q = b and pq = ac
  Then ax² + bx + c = ax² + px + qx + c

Word problem strategy:
  1. Let unknown = x
  2. Express everything in terms of x
  3. Form equation from given condition
  4. Solve and reject invalid answers
```

**Common Mistakes:**
❌ Forgetting that negative roots may need to be rejected in real-life problems (age, length, speed are always positive)
❌ In formula, forgetting the ± (both + and −)
❌ D = b² − 4ac, NOT b² + 4ac — the sign is MINUS

## Related Topics
- Chapter 2 — Polynomials (nature of zeroes from graph)
- Chapter 5 — Arithmetic Progressions (quadratic in some AP problems)
- JEE: Theory of Equations, location of roots
