# Mathematics — Class 10 to 12 Complete Guide

Mathematics is the foundation of every technical field. This guide covers the complete CBSE/ICSE school mathematics curriculum from Class 10 through Class 12, with concepts explained clearly, solved examples, and exam tips.

---

## Class 10 Mathematics

### Real Numbers
```
Natural numbers: 1, 2, 3, 4, ...
Whole numbers: 0, 1, 2, 3, ...
Integers: ..., -2, -1, 0, 1, 2, ...
Rational: p/q where p, q are integers, q ≠ 0  (e.g. 2/3, -5/4, 0.75)
Irrational: Cannot be expressed as p/q  (e.g. √2, π, e)
Real numbers: All rational + irrational

Euclid's Division Lemma: a = bq + r  where 0 ≤ r < b
  Used to find HCF

HCF using prime factorisation:
  HCF(12, 18): 12 = 2² × 3, 18 = 2 × 3²
  HCF = 2¹ × 3¹ = 6  (take LOWEST powers of common factors)

LCM using prime factorisation:
  LCM = 2² × 3² = 36  (take HIGHEST powers of ALL factors)

HCF × LCM = Product of two numbers (only for exactly 2 numbers)

Decimal expansion:
  Terminating: Denominator has only 2 and/or 5 as prime factors (e.g. 7/20 = 0.35)
  Non-terminating recurring: All other denominators (e.g. 1/3 = 0.333...)
  Non-terminating non-recurring: Irrational numbers (√2 = 1.41421356...)
```

### Polynomials
```
Degree of polynomial: Highest power of variable
  Linear: degree 1 (ax + b) — 1 zero
  Quadratic: degree 2 (ax² + bx + c) — at most 2 zeroes
  Cubic: degree 3 — at most 3 zeroes

Zeroes of a polynomial: Values of x where p(x) = 0

For quadratic ax² + bx + c:
  Sum of zeroes (α + β) = -b/a
  Product of zeroes (αβ) = c/a
  
  Example: x² - 5x + 6 = 0
  α + β = 5/1 = 5, αβ = 6/1 = 6
  Zeroes: 2 and 3 ✓ (2+3=5, 2×3=6)

For cubic ax³ + bx² + cx + d with zeroes α, β, γ:
  α + β + γ = -b/a
  αβ + βγ + γα = c/a
  αβγ = -d/a
```

### Quadratic Equations
```
Standard form: ax² + bx + c = 0 (a ≠ 0)

Methods to solve:
1. Factorisation:  x² - 5x + 6 = 0 → (x-2)(x-3) = 0 → x = 2 or x = 3

2. Quadratic formula: x = [-b ± √(b² - 4ac)] / 2a

3. Completing the square:
   x² - 4x - 5 = 0
   x² - 4x = 5
   x² - 4x + 4 = 5 + 4
   (x - 2)² = 9
   x - 2 = ±3
   x = 5 or x = -1

Discriminant D = b² - 4ac:
  D > 0: Two distinct real roots
  D = 0: Two equal real roots (x = -b/2a)
  D < 0: No real roots (complex roots)

Word problems — common types:
  Speed: If speed increased by 5 km/h, 3 hours less for 120 km...
    Let speed = x: 120/x - 120/(x+5) = 3
  Consecutive integers: Product is 156... n(n+1) = 156
  Area problems: Rectangle length exceeds breadth by 4, area 96...
```

### Arithmetic Progressions (AP)
```
AP: Sequence with constant difference between consecutive terms
  General form: a, a+d, a+2d, a+3d, ...
  a = first term, d = common difference

nth term: aₙ = a + (n-1)d

Sum of n terms: Sₙ = n/2 [2a + (n-1)d]  or  Sₙ = n/2 [a + l]  (l = last term)

Three numbers in AP: Let them be (a-d), a, (a+d)
Four numbers in AP: Let them be (a-3d), (a-d), (a+d), (a+3d)

Example: Find the 20th term of 3, 7, 11, 15...
  a=3, d=4, n=20
  a₂₀ = 3 + (20-1) × 4 = 3 + 76 = 79

Example: Sum of first 25 terms of 2, 7, 12, ...
  a=2, d=5, S₂₅ = 25/2 [2(2) + (24)(5)] = 25/2 × 124 = 1550
```

### Triangles — Similar Triangles
```
Similar triangles: Same shape, different size
  All angles equal AND corresponding sides in proportion

Basic Proportionality Theorem (Thales): 
  If a line is parallel to one side of a triangle and intersects the other two sides,
  it divides them in the same ratio
  DE ∥ BC → AD/DB = AE/EC

Criteria for similarity:
  AA (Angle-Angle): Two pairs of equal angles
  SSS: Three sides in proportion
  SAS: Two sides in proportion and included angle equal

If triangles are similar with ratio k:
  Ratio of areas = k² (square of ratio of sides)
  Ratio of perimeters = k (same as side ratio)
  Ratio of medians = k
```

### Coordinate Geometry
```
Distance formula: d = √[(x₂-x₁)² + (y₂-y₁)²]

Section formula (internal division):
  Point dividing (x₁,y₁) to (x₂,y₂) in ratio m:n
  P = [(mx₂ + nx₁)/(m+n), (my₂ + ny₁)/(m+n)]

Midpoint formula: M = [(x₁+x₂)/2, (y₁+y₂)/2]

Area of triangle with vertices (x₁,y₁), (x₂,y₂), (x₃,y₃):
  Area = ½ |x₁(y₂-y₃) + x₂(y₃-y₁) + x₃(y₁-y₂)|
  Area = 0 → Points are collinear
```

### Trigonometry
```
Basic ratios (SOH-CAH-TOA):
  sin θ = Opposite/Hypotenuse
  cos θ = Adjacent/Hypotenuse
  tan θ = Opposite/Adjacent = sin θ/cos θ
  
  cosec θ = 1/sin θ
  sec θ = 1/cos θ
  cot θ = 1/tan θ

Standard values (MUST MEMORISE):
         0°    30°    45°     60°    90°
  sin:   0    1/2   1/√2   √3/2    1
  cos:   1   √3/2  1/√2    1/2    0
  tan:   0   1/√3    1      √3    undefined

Trigonometric identities:
  sin²θ + cos²θ = 1
  1 + tan²θ = sec²θ
  1 + cot²θ = cosec²θ

Heights and distances:
  Angle of elevation: Looking UP at an object
  Angle of depression: Looking DOWN at an object
  
  Tower of height h, base distance d: tan θ = h/d
```

---

## Class 11 Mathematics

### Sets, Relations, Functions
```
Set notation: A = {1, 2, 3, 4, 5}
  n(A) = number of elements in A
  Empty set: φ or {}
  
Union: A∪B = all elements in A or B or both
Intersection: A∩B = elements common to A and B
Complement: A' = elements in universal set but not A

Useful formula: n(A∪B) = n(A) + n(B) - n(A∩B)

Relations and Functions:
  Relation: Set of ordered pairs from A to B
  Function: Every element of A has exactly ONE image in B
  
  Domain: All valid inputs (x values)
  Range: All outputs (y values)
  
Types of functions:
  One-one (Injective): Different inputs → different outputs
  Onto (Surjective): Every element of range is an image
  Bijective: Both one-one and onto
```

### Trigonometry — Class 11
```
Angles: Degree to Radian: θ (rad) = θ° × π/180

Allied angles:
  sin(90°+θ) = cos θ
  cos(90°+θ) = -sin θ
  sin(180°-θ) = sin θ
  cos(180°-θ) = -cos θ

Compound angles:
  sin(A+B) = sin A cos B + cos A sin B
  cos(A+B) = cos A cos B - sin A sin B
  tan(A+B) = (tan A + tan B)/(1 - tan A tan B)

Double angle:
  sin 2A = 2 sin A cos A
  cos 2A = cos²A - sin²A = 1 - 2sin²A = 2cos²A - 1
  tan 2A = 2 tan A/(1 - tan²A)

Product to sum:
  2 sin A cos B = sin(A+B) + sin(A-B)
  2 cos A cos B = cos(A-B) + cos(A+B)
```

### Permutations and Combinations
```
Fundamental principle of counting:
  If one thing can happen in m ways and another in n ways → m × n ways total

Factorial: n! = n × (n-1) × (n-2) × ... × 2 × 1
  0! = 1 (by definition), 5! = 120

Permutation (order matters): 
  nPr = n!/(n-r)!
  Arrange r items from n: P(10, 3) = 10×9×8 = 720

Combination (order does NOT matter):
  nCr = n!/[r!(n-r)!]
  Select r from n: C(10, 3) = 120
  
  nCr = nC(n-r)
  nC0 = nCn = 1
  nC1 = n

Common problem types:
  Arrange n people in a line: n!
  Arrange n people in a circle: (n-1)!
  Select committee of r from n: nCr
  Words from MATHEMATICS (repeated letters): 11!/(2!×2!×2!) → divide by factorial of repetitions
```

---

## Class 12 Mathematics

### Matrices and Determinants
```
Matrix: Rectangular array of numbers in rows and columns
  Order m×n: m rows, n columns

Matrix addition: Same order, add corresponding elements
Matrix multiplication: A(m×n) × B(n×p) = C(m×p)
  (rows of first) × (columns of second) must match

Transpose: A^T — rows become columns

Determinant (2×2): |a b| = ad - bc
                   |c d|

Determinant (3×3): Expand along any row/column
  |A| = a(ei - fh) - b(di - fg) + c(dh - eg)

Properties:
  Interchange two rows/columns → sign changes
  Two identical rows → |A| = 0
  |AB| = |A| × |B|
  |kA| = k^n |A| for n×n matrix

Inverse: A⁻¹ = adj(A)/|A| (only if |A| ≠ 0)

Cramer's Rule for Ax = b:
  x = D₁/D, y = D₂/D, z = D₃/D
  (Replace column with b to get D₁, D₂, D₃)
```

### Calculus — Limits and Derivatives
```
Limits:
  lim(x→a) f(x) = L means f(x) approaches L as x approaches a
  
  Standard limits:
  lim(x→0) sin x/x = 1
  lim(x→0) (1-cos x)/x² = 1/2
  lim(x→0) (eˣ-1)/x = 1
  lim(x→0) (aˣ-1)/x = ln a
  lim(x→∞) (1+1/x)^x = e

Derivatives (first principles):
  f'(x) = lim(h→0) [f(x+h) - f(x)] / h

Rules:
  d/dx[xⁿ] = nxⁿ⁻¹
  d/dx[eˣ] = eˣ
  d/dx[ln x] = 1/x
  d/dx[sin x] = cos x,  d/dx[cos x] = -sin x
  d/dx[tan x] = sec²x
  
  Product rule: d/dx[uv] = u'v + uv'
  Quotient rule: d/dx[u/v] = (u'v - uv')/v²
  Chain rule: d/dx[f(g(x))] = f'(g(x)) × g'(x)

Applications:
  Increasing function: f'(x) > 0
  Decreasing function: f'(x) < 0
  Maximum/Minimum: f'(x) = 0
    If f''(x) < 0 → local maximum
    If f''(x) > 0 → local minimum
```

### Integration
```
Integration is anti-differentiation: ∫f'(x)dx = f(x) + C

Standard integrals:
  ∫xⁿ dx = xⁿ⁺¹/(n+1) + C  (n ≠ -1)
  ∫1/x dx = ln|x| + C
  ∫eˣ dx = eˣ + C
  ∫sin x dx = -cos x + C
  ∫cos x dx = sin x + C
  ∫sec²x dx = tan x + C
  ∫1/√(1-x²) dx = sin⁻¹x + C
  ∫1/(1+x²) dx = tan⁻¹x + C

Substitution method:
  ∫2x·eˣ² dx → let u = x², du = 2x dx
  = ∫eᵘ du = eᵘ + C = eˣ² + C

Integration by parts: ∫u dv = uv - ∫v du
  Rule ILATE: Choose u as: Inverse trig > Log > Algebraic > Trig > Exponential

Definite integral: ∫ₐᵇf(x)dx = F(b) - F(a)

Area under curve: A = |∫ₐᵇf(x)dx|
Area between curves: A = ∫ₐᵇ[f(x) - g(x)]dx  (f(x) is upper curve)
```

### Probability — Class 12
```
Addition theorem: P(A∪B) = P(A) + P(B) - P(A∩B)
Mutually exclusive: P(A∪B) = P(A) + P(B)

Multiplication theorem:
  P(A∩B) = P(A) × P(B|A)
  Independent events: P(A∩B) = P(A) × P(B)

Conditional probability: P(B|A) = P(A∩B)/P(A)

Bayes' Theorem:
  P(Aᵢ|B) = P(B|Aᵢ)P(Aᵢ) / ΣP(B|Aⱼ)P(Aⱼ)

Random Variables and Distributions:
  Mean: μ = Σ xᵢ P(xᵢ)
  Variance: σ² = Σ(xᵢ - μ)² P(xᵢ) = Σxᵢ²P(xᵢ) - μ²

Binomial Distribution:
  n independent trials, p = success probability
  P(X = r) = ⁿCᵣ × pʳ × (1-p)ⁿ⁻ʳ
  Mean = np, Variance = np(1-p)
```

## Board Exam Strategy

```
CBSE Class 10:
  70% questions are from previous years with different numbers
  Practice NCERT examples and exercises thoroughly
  Last 5 years board papers are mandatory

CBSE Class 12:
  Section A: 20 MCQ (1 mark each) — basics and formulas
  Section B: 5 short answer (2 marks each)
  Section C: 6 questions (3 marks each)
  Section D: 4 long answer (5 marks each)
  Section E: 3 case-based questions (4 marks each)
  
  Marks distribution: Calculus ~35 marks, Algebra ~25, Probability ~10, Vectors+3D ~17

Must-do: NCERT examples + exercises + past 10 years papers
Time management: 3 hours for 80 marks → roughly 2 min per mark
  Leave 20 min for revision at end
  Attempt all questions — no negative marking
```
