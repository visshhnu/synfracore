# Complex Numbers and Quadratic Equations

## Why This Chapter Matters
Complex Numbers appear in JEE Main and Advanced every year — 4-8 marks. Argand plane, modulus/argument, De Moivre's theorem, and roots of unity are frequently tested. This chapter also connects to coordinate geometry and trigonometry.

## Prerequisites
- Quadratic equations (Class 10)
- Trigonometry (sin, cos, tan values)
- Coordinate geometry (distance, angle)

---

## Core Concepts

### 1. Imaginary Unit and Complex Numbers

**Imaginary unit:** i = sqrt(-1)
Therefore: i^2 = -1, i^3 = -i, i^4 = 1 (cycle repeats every 4)

**Complex number:** z = a + ib
a = Real part = Re(z), b = Imaginary part = Im(z)
a, b are real numbers.

**Examples:** 3 + 4i (a=3, b=4), -2 + 0i (purely real), 0 + 5i (purely imaginary), 0 (zero)

### 2. Algebra of Complex Numbers

Let z1 = a + ib, z2 = c + id

**Addition:** z1 + z2 = (a+c) + i(b+d)
**Subtraction:** z1 - z2 = (a-c) + i(b-d)
**Multiplication:** z1 x z2 = (ac - bd) + i(ad + bc)
**Division:** z1/z2 = z1 x (conjugate of z2) / |z2|^2

**Conjugate of z = a + ib is z_bar = a - ib**
Properties: z + z_bar = 2a (real), z x z_bar = a^2 + b^2 = |z|^2

### 3. Modulus and Argument

**Modulus |z|:** |z| = |a + ib| = sqrt(a^2 + b^2)
This is the distance from origin to point (a,b) in Argand plane.

**Argument arg(z):** Angle theta = arctan(b/a)
Note: argument depends on quadrant!

**Polar form:** z = r(cos theta + i sin theta) = r.e^(i.theta)
where r = |z| and theta = arg(z)

### 4. Argand Plane

Complex number z = a + ib represented as point (a, b) in a plane.
- x-axis = real axis
- y-axis = imaginary axis
- Distance from origin = |z|

**Geometric operations:**
|z1 - z2| = distance between z1 and z2 in Argand plane
arg(z1/z2) = arg(z1) - arg(z2) = rotation from z2 to z1

### 5. De Moivre's Theorem

(cos theta + i sin theta)^n = cos(n.theta) + i sin(n.theta)

**Applications:**
- Finding powers of complex numbers
- Finding nth roots
- Deriving trigonometric identities

**nth roots of unity:**
The n distinct nth roots of 1 are: omega^k = e^(2*pi*i*k/n) for k = 0, 1, 2, ..., n-1
omega = e^(2*pi*i/n) = cos(2*pi/n) + i sin(2*pi/n)

**Properties of cube roots of unity (1, omega, omega^2):**
1 + omega + omega^2 = 0
1 x omega x omega^2 = 1
omega^3 = 1

### 6. Quadratic Equations Review

For ax^2 + bx + c = 0:
x = (-b +/- sqrt(b^2 - 4ac)) / 2a

If b^2 - 4ac < 0: roots are complex conjugates (alpha, alpha_bar)
Sum of roots: alpha + alpha_bar = -b/a (real)
Product of roots: alpha x alpha_bar = c/a (positive real)

---

## Solved Examples

### Example 1
**Q:** Find (1+i)^8.

z = 1 + i; |z| = sqrt(2); arg(z) = pi/4
z^8 = (sqrt(2))^8 . (cos(8.pi/4) + i sin(8.pi/4))
= 16 . (cos(2*pi) + i sin(2*pi)) = 16 . (1 + 0) = **16**

### Example 2
**Q:** If z = (1 + 2i)/(1 - 3i), find real and imaginary parts.

Multiply by conjugate: z = (1+2i)(1+3i) / (1-3i)(1+3i)
= (1 + 3i + 2i + 6i^2) / (1 + 9)
= (1 + 5i - 6) / 10
= (-5 + 5i) / 10
= -1/2 + i/2
Re(z) = -1/2, Im(z) = 1/2

### Example 3 — Cube Roots of Unity
**Q:** If omega is a cube root of unity, find (1 + omega - omega^2)^3.

Since 1 + omega + omega^2 = 0, so 1 + omega = -omega^2
(1 + omega - omega^2)^3 = (-omega^2 - omega^2)^3 = (-2*omega^2)^3 = -8*omega^6 = -8 x 1 = **-8**

---

## PYQs (JEE Main)

**2024:** If |z - 2 + 2i| = 1, find the maximum value of |z|.
|z| = |z - 2 + 2i + 2 - 2i| <= |z - 2 + 2i| + |2 - 2i|
<= 1 + sqrt(4+4) = 1 + 2*sqrt(2)
Maximum |z| = **1 + 2*sqrt(2)**

**2023:** If z = x + iy and |z - 1| + |z + 1| = 4, then the locus is:
This is an ellipse with foci at (1,0) and (-1,0), sum of distances = 4.
Semi-major axis a = 2, c = 1, b = sqrt(3).
Equation: **x^2/4 + y^2/3 = 1**

**2022:** Find all values of i^(4n+1) where n is integer.
i^(4n+1) = (i^4)^n . i = 1^n . i = **i**

**2021:** If alpha, beta are complex roots of x^2 + px + q = 0 where p, q are real, then:
Since complex roots of real equation come in conjugate pairs: beta = alpha_bar
Product: alpha x alpha_bar = |alpha|^2 = q

---

## MCQ Practice

**Q1.** Modulus of (1 + i*sqrt(3)):
(A) 1 (B) sqrt(3) (C) 2 (D) sqrt(2)
Answer: C [|z| = sqrt(1 + 3) = 2]

**Q2.** Argument of -1 - i:
(A) pi/4 (B) 3*pi/4 (C) -3*pi/4 (D) 5*pi/4
Answer: C [-3*pi/4, third quadrant, arctan(1) = pi/4, but direction is -pi - pi/4]

**Q3 (Hard).** Number of solutions of z^2 + |z|^2 = 0:
Let z = x + iy. z^2 = x^2 - y^2 + 2xyi. |z|^2 = x^2 + y^2.
Real part: x^2 - y^2 + x^2 + y^2 = 0 -> 2x^2 = 0 -> x = 0
z = iy: z^2 = -y^2; |z|^2 = y^2. Sum = 0. So all z = iy satisfy!
**Infinitely many solutions** (entire imaginary axis).

---

## Revision Notes

```
IMAGINARY UNIT:
i = sqrt(-1) | i^2 = -1 | i^3 = -i | i^4 = 1 (cycle of 4)

COMPLEX NUMBER z = a + ib:
Conjugate: z_bar = a - ib
Modulus: |z| = sqrt(a^2 + b^2)
Argument: theta = arctan(b/a) [with quadrant correction]

POLAR FORM: z = r(cos theta + i sin theta)

PRODUCT: |z1.z2| = |z1||z2|; arg(z1.z2) = arg(z1) + arg(z2)
DIVISION: |z1/z2| = |z1|/|z2|; arg(z1/z2) = arg(z1) - arg(z2)

DE MOIVRE: (cos theta + i sin theta)^n = cos(n theta) + i sin(n theta)

CUBE ROOTS OF UNITY (1, omega, omega^2):
1 + omega + omega^2 = 0
Product = 1; omega^3 = 1
```

## Related Topics
- Quadratic Equations (Class 10), JEE Trigonometry, JEE Coordinate Geometry
