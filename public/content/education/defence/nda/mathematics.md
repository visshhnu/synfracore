# NDA Mathematics

## Why This Chapter Matters
Mathematics is worth 300 marks in NDA exam (Paper I is entirely Mathematics). Algebra, calculus, matrices, statistics, and trigonometry are all tested. This is where most marks are won or lost.

## Core Concepts

### 1. Algebra

**Complex Numbers:**
z = a + ib | |z| = sqrt(a^2+b^2) | arg(z) = arctan(b/a)
De Moivre: (cos theta + i sin theta)^n = cos(n.theta) + i sin(n.theta)
Cube roots of unity: 1, omega, omega^2 where 1+omega+omega^2=0

**Quadratic Equations:** ax^2+bx+c=0
Discriminant D=b^2-4ac | Roots: x = (-b +/- sqrt(D))/2a
Sum of roots = -b/a | Product of roots = c/a

**Permutations and Combinations:**
nPr = n!/(n-r)! | nCr = n!/[r!(n-r)!]
nCr + nC(r-1) = (n+1)Cr (Pascal's identity)

**Binomial Theorem:**
(a+b)^n = sum nCr . a^(n-r) . b^r
General term: T(r+1) = nCr . a^(n-r) . b^r

**Sequence and Series:**
AP: a, a+d, a+2d... | S_n = n/2[2a+(n-1)d]
GP: a, ar, ar^2... | S_n = a(r^n-1)/(r-1) | S_inf = a/(1-r) for |r|<1

### 2. Matrices and Determinants

**Matrix operations:** Addition, Subtraction, Multiplication (row x column)
**Determinant of 2x2:** |a b; c d| = ad - bc
**Properties:** |AB|=|A||B| | |kA|=k^n|A| | |A^T|=|A|
**Inverse:** A^-1 = adj(A)/|A| | A is invertible iff |A| != 0
**System AX=B:** Unique solution if |A| != 0

### 3. Trigonometry

**Identities:**
sin^2 x + cos^2 x = 1 | 1 + tan^2 x = sec^2 x | 1 + cot^2 x = cosec^2 x
sin(A+B) = sinA cosB + cosA sinB
cos(A+B) = cosA cosB - sinA sinB
tan(A+B) = (tanA + tanB)/(1 - tanA tanB)
sin 2A = 2 sinA cosA | cos 2A = cos^2A - sin^2A = 1 - 2sin^2A
sin C + sin D = 2 sin((C+D)/2) cos((C-D)/2)

**Inverse trig:** Domain and range of sin^-1, cos^-1, tan^-1

**Properties of triangles:**
Sine rule: a/sinA = b/sinB = c/sinC = 2R
Cosine rule: a^2 = b^2 + c^2 - 2bc cosA
Area = (1/2)ab sinC = sqrt(s(s-a)(s-b)(s-c)) [Heron's formula]

### 4. Calculus

**Limits:** Standard limits (sin x/x -> 1, (e^x-1)/x -> 1 as x->0)
**Derivatives:** d/dx(x^n)=nx^(n-1), d/dx(sin x)=cos x, d/dx(e^x)=e^x, d/dx(ln x)=1/x
Chain rule, product rule, quotient rule
**Applications:** Tangent/normal, maxima/minima, rate of change

**Integration:**
Indefinite: integral x^n dx = x^(n+1)/(n+1) + C
By substitution, by parts (ILATE)
Definite: integral_a^b f(x)dx = F(b)-F(a)
Properties: integral_0^a f(x)dx = integral_0^a f(a-x)dx

**Area:** integral_a^b |f(x)| dx

**Differential equations:** Order and degree, variable separable, linear first order

### 5. Statistics and Probability

**Mean, Median, Mode** for grouped and ungrouped data
**Variance:** sigma^2 = sum(x-mean)^2/n = sum(x^2)/n - mean^2
**Standard Deviation:** sigma = sqrt(variance)

**Probability:** P(A) = n(A)/n(S) | 0 <= P(A) <= 1
P(A union B) = P(A) + P(B) - P(A intersection B)
Conditional: P(A|B) = P(A intersection B)/P(B)
Bayes' theorem

**Distributions:**
Binomial: P(X=r) = nCr p^r q^(n-r) | Mean=np | Variance=npq

### 6. Analytical Geometry

**Straight lines:** Slope m = (y2-y1)/(x2-x1) | y-y1 = m(x-x1)
Distance from point to line: |ax1+by1+c|/sqrt(a^2+b^2)

**Circles:** (x-h)^2 + (y-k)^2 = r^2 | General: x^2+y^2+2gx+2fy+c=0
Centre (-g,-f), r = sqrt(g^2+f^2-c)

**Conic sections:** Parabola (y^2=4ax), Ellipse (x^2/a^2+y^2/b^2=1), Hyperbola

**3D Geometry:** Direction cosines/ratios | Equations of line and plane in 3D

**Vectors:** Dot product a.b = |a||b|cos(theta) | Cross product |axb| = |a||b|sin(theta)

## NDA Previous Year Questions

**NDA 2023:** The value of sum from r=0 to 15 of nCr when n=15?
= 2^15 = 32768 (sum of all binomial coefficients)

**NDA 2022:** A matrix A is such that A^2 = A. What is A called?
Idempotent matrix. A^2 = A means A(A-I)=0.

**NDA 2021:** If sinA = 3/5 (A in first quadrant), find cos2A?
cosA = 4/5. cos2A = 1 - 2sin^2A = 1 - 2(9/25) = 1 - 18/25 = 7/25.

**NDA 2020:** The area bounded by y = x^2 and y = 4 (using integration)?
Intersection: x^2=4 -> x=+/-2.
Area = integral_{-2}^{2} (4 - x^2)dx = [4x - x^3/3]_{-2}^{2} = (8-8/3) - (-8+8/3) = 32/3.

## MCQ Practice

**Q1.** If nC12 = nC8, then n =
(A) 4 (B) 12 (C) 20 (D) 16
Answer: C [nCr = nC(n-r) -> 12 = n-8 -> n=20]

**Q2.** The derivative of sin(3x+2) with respect to x:
(A) 3cos(3x+2) (B) cos(3x+2) (C) -3cos(3x+2) (D) 3sin(3x+2)
Answer: A [chain rule: cos(3x+2) x 3]

**Q3.** Sum of the infinite GP 1, 1/3, 1/9, ...?
S = a/(1-r) = 1/(1-1/3) = 1/(2/3) = 3/2. Answer: 3/2

**Q4 (Hard).** A bag has 5 red and 3 blue balls. Two drawn without replacement. P(both same colour)?
P(both red) = (5/8)(4/7) = 20/56. P(both blue) = (3/8)(2/7) = 6/56. Total = 26/56 = 13/28.

## Revision Notes

```
NDA MATHS HIGH-PRIORITY TOPICS:
1. Algebra: AP/GP, binomial theorem, complex numbers, quadratic
2. Matrices: operations, determinants, inverse, system of equations
3. Trigonometry: identities, sine/cosine rule, inverse trig
4. Calculus: derivatives, integration (by parts, substitution), area
5. Coordinate Geometry: line, circle, parabola
6. Statistics: mean, variance, SD, basic probability
7. Vectors and 3D geometry

KEY FORMULAS:
AP: Sn = n/2[2a+(n-1)d]
GP: Sn = a(r^n-1)/(r-1) | S_inf = a/(1-r)
Binomial: T(r+1) = nCr a^(n-r) b^r
sin2A = 2sinAcosA | cos2A = 1-2sin^2A
Probability: P(A|B) = P(AnB)/P(B)
Bayes: P(Bi|A) = P(A|Bi)P(Bi)/P(A)
```
