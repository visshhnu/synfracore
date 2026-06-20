# Coordinate Geometry

## Why This Chapter Matters

Coordinate Geometry questions appear in every board exam — typically 5-7 marks. The three formulas (distance, section, area) are straightforward once memorised. Word problems involving these formulas are very common in the 3-mark section.

## Prerequisites

- Plotting points on a coordinate plane (Class 8-9)
- Basic algebra — solving equations
- Pythagorean theorem from Chapter 6

---

## Core Concepts

### 1. Distance Formula

The distance between two points A(x₁, y₁) and B(x₂, y₂):

$$AB = \sqrt{(x_2 - x_1)^2 + (y_2 - y_1)^2}$$

**Derivation:** Draw a right triangle with AB as hypotenuse. Horizontal leg = |x₂−x₁|, Vertical leg = |y₂−y₁|. Apply Pythagoras.

**Distance from origin O(0,0) to point P(x, y):** OP = √(x² + y²)

---

### 2. Section Formula

If point P divides the line segment joining A(x₁, y₁) and B(x₂, y₂) in the ratio m:n **internally**:

$$P = \left(\frac{mx_2 + nx_1}{m+n}, \frac{my_2 + ny_1}{m+n}\right)$$

**Special case — Midpoint Formula** (m:n = 1:1):
$$M = \left(\frac{x_1 + x_2}{2}, \frac{y_1 + y_2}{2}\right)$$

**Memory tip for section formula:** "m times far point + n times near point, divided by (m+n)"

---

### 3. Area of a Triangle

For a triangle with vertices A(x₁, y₁), B(x₂, y₂), C(x₃, y₃):

$$\text{Area} = \frac{1}{2} |x_1(y_2 - y_3) + x_2(y_3 - y_1) + x_3(y_1 - y_2)|$$

**Key points:**
- If area = 0, the three points are **collinear** (on the same line)
- Always take the **absolute value** — area is never negative

---

## Solved Examples

### Example 1 — Distance Formula
**Q:** Find the distance between A(2, 3) and B(4, 1).
AB = √[(4−2)² + (1−3)²] = √[4 + 4] = √8 = **2√2 units**

### Example 2 — Proving Triangle Type
**Q:** Show that A(1, 7), B(4, 2), C(−1, −1) form an isosceles triangle.

AB = √[(4−1)² + (2−7)²] = √[9+25] = √34
BC = √[(−1−4)² + (−1−2)²] = √[25+9] = √34
CA = √[(1−(−1))² + (7−(−1))²] = √[4+64] = √68

AB = BC = √34 → **Isosceles triangle** (two sides equal)

### Example 3 — Section Formula
**Q:** Find the coordinates of the point which divides the line segment joining (4, −3) and (8, 5) in ratio 3:1.

P = [(3×8 + 1×4)/(3+1), (3×5 + 1×(−3))/(3+1)]
P = [(24+4)/4, (15−3)/4]
**P = (7, 3)**

### Example 4 — Collinearity
**Q:** Are points (7, −2), (5, 1), (3, 4) collinear?

Area = (1/2)|7(1−4) + 5(4−(−2)) + 3(−2−1)|
= (1/2)|7(−3) + 5(6) + 3(−3)|
= (1/2)|−21 + 30 − 9|
= (1/2)|0| = **0**

Area = 0 → Points are **collinear** ✓

---

## PYQs

### 2023
**Q:** Find ratio in which point (−3, k) divides the join of (−5, −4) and (−2, 3).
Let ratio = m:n. x-coordinate: (−2m + (−5)n)/(m+n) = −3
−2m − 5n = −3m − 3n → m = 2n → m:n = **2:1**
y-coordinate: k = (2×3 + 1×(−4))/(2+1) = 2/3

### 2022
**Q:** If A(3, √3) is equidistant from B(0, y) and C(0, y+1), find y.
AB = AC → solve for y. *This tests combining distance formula with algebra.*

### 2021
**Q:** Find area of △ABC where A(4, 0), B(0, −4), C(0, 0).
Area = (1/2)|4(−4−0) + 0(0−0) + 0(0−(−4))| = (1/2)|−16| = **8 sq. units**

### 2020
**Q:** Show that the points (1, 7), (4, 2), (−1, −1), (−4, 4) are vertices of a square.
*Check all four sides equal AND both diagonals equal*

---

## MCQ Practice

**Q1.** Distance of point (3, 4) from origin: (A) 1 (B) 5 ✓ (C) 7 (D) 25

**Q2.** Midpoint of (2a, 4b) and (−2a, 4b) is: (A) (2a, 4b) (B) (0, 4b) ✓ (C) (0, 0) (D) (4a, 8b)

**Q3 (Hard).** The point P on x-axis equidistant from A(−1, 0) and B(5, 0) is at x =
*P is on x-axis so P = (x, 0). PA = PB → (x+1)² = (x−5)² → 2x = −1+5+1+5... → x = 2 → P = (2, 0)*

---

## Revision Notes

```
Distance Formula: d = √[(x₂−x₁)² + (y₂−y₁)²]

Section Formula (m:n internally):
  x = (mx₂ + nx₁)/(m+n)
  y = (my₂ + ny₁)/(m+n)

Midpoint: [(x₁+x₂)/2, (y₁+y₂)/2]

Area of Triangle:
  = (1/2)|x₁(y₂−y₃) + x₂(y₃−y₁) + x₃(y₁−y₂)|
  = 0 → Points are collinear

Quadrilateral checks:
  Rectangle: All sides equal? No → just parallelogram
             Diagonals also equal? Yes → Rectangle (or Square if sides also equal)
```

**Common Mistakes:**
❌ Forgetting the square root in distance formula
❌ Applying section formula in wrong order (m times B + n times A, where B is near the m part of m:n from A)
❌ Forgetting absolute value in area formula — can get negative answer

## Related Topics
- Chapter 6 — Triangles (Pythagoras used in distance)
- Chapter 8 — Trigonometry (slope and angle concepts)
- JEE: Straight lines, conic sections
