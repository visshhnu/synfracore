# JEE Mathematics — Previous Year Pattern Questions

## Calculus — High-Yield Patterns

**Q1.** If f(x) = x³ - 6x² + 9x + 2, find the intervals where f(x) is increasing.

**Solution:**
f'(x) = 3x² - 12x + 9 = 3(x² - 4x + 3) = 3(x-1)(x-3)

f'(x) > 0 when x < 1 or x > 3

**f(x) is increasing on (-∞, 1) ∪ (3, ∞)**

---

**Q2.** Evaluate: ∫₀^π x sin(x) dx

**Solution (Integration by Parts):**
Let u = x, dv = sin(x)dx
du = dx, v = -cos(x)

= [-x cos(x)]₀^π + ∫₀^π cos(x) dx
= [-π cos(π) + 0] + [sin(x)]₀^π
= π + (sin π - sin 0)
= **π**

---

**Q3.** The area enclosed by y = x² and y = x is:

**Solution:**
Intersection: x² = x → x = 0, 1

Area = ∫₀¹ (x - x²) dx = [x²/2 - x³/3]₀¹ = 1/2 - 1/3 = **1/6 sq. units**

---

## Algebra — Matrix & Determinant Patterns

**Q4.** If A = [[1, 2], [3, 4]], find A⁻¹.

**Solution:**
det(A) = 1(4) - 2(3) = -2

A⁻¹ = (1/det) × adjoint = (1/-2) × [[4, -2], [-3, 1]] = [[-2, 1], [3/2, -1/2]]

---

**Q5.** The number of solutions of |2x - 1| + |x - 2| = 3:

**Solution:** Critical points: x = 1/2, x = 2

Case 1: x < 1/2: -(2x-1) + -(x-2) = 3 → -3x + 3 = 3 → x = 0 ✓
Case 2: 1/2 ≤ x < 2: (2x-1) + -(x-2) = 3 → x + 1 = 3 → x = 2 (boundary, check)
Case 3: x ≥ 2: (2x-1) + (x-2) = 3 → 3x - 3 = 3 → x = 2 ✓

**Two solutions: x = 0 and x = 2**

---

## Coordinate Geometry

**Q6.** Find the equation of circle passing through (1,2), (3,-4), (5,-6).

**Method:** Use general equation x² + y² + Dx + Ey + F = 0
Substitute all three points → system of 3 equations → solve for D, E, F

This is a standard method — practice the substitution approach.

---

## Probability & Statistics

**Q7.** Two dice thrown. Probability that sum is prime?

**Solution:**
Total outcomes = 36
Prime sums possible: 2, 3, 5, 7, 11

Sum = 2: (1,1) → 1 way
Sum = 3: (1,2),(2,1) → 2 ways
Sum = 5: (1,4),(4,1),(2,3),(3,2) → 4 ways
Sum = 7: (1,6),(6,1),(2,5),(5,2),(3,4),(4,3) → 6 ways
Sum = 11: (5,6),(6,5) → 2 ways

Total = 15/36 = **5/12**

---

## JEE Marks Distribution (Maths)

| Chapter | Marks (approx) |
|---------|---------------|
| Calculus (Limits, Derivatives, Integrals, Applications) | 28–36 |
| Algebra (Matrices, Determinants, Complex Numbers, Sequences) | 24–32 |
| Coordinate Geometry (Lines, Circles, Parabola, Ellipse) | 16–24 |
| Trigonometry | 8–12 |
| Probability & Statistics | 8–12 |
| Vectors & 3D | 8–12 |
| **Total** | **100** |
