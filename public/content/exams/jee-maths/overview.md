# JEE Mathematics — Complete Preparation Guide

JEE Mathematics is the deciding factor for IIT rank. Physics and Chemistry have similar scoring across students — Mathematics separates toppers. This guide covers every topic with the right depth for JEE Main and Advanced.

## Exam Pattern

```
JEE Main Mathematics:
  20 MCQ (4 marks each) + 5 Numerical (4 marks each) = 100 marks
  Negative marking: -1 for wrong MCQ, 0 for wrong numerical

JEE Advanced Mathematics (2 papers):
  Paper 1 & 2 each have ~18 questions across multiple formats:
  Single correct, Multiple correct, Paragraph, Matrix match, Numerical
  No fixed formula — pattern changes every year
```

## High Weightage Topics (Focus First)

```
Topic                    JEE Main    JEE Advanced
Calculus (total)           ~35%         ~40%
  Limits & Continuity       8%           8%
  Derivatives               8%           8%
  Integration              12%          14%
  Differential Equations    7%          10%

Algebra (total)            ~30%         ~30%
  Complex Numbers            7%          10%
  Matrices & Determinants    8%           8%
  Sequences & Series         6%           6%
  Binomial Theorem           5%           3%
  Permutations & Combinations 4%          3%

Coordinate Geometry        ~20%         ~15%
  Straight Lines             5%           4%
  Circles                    5%           5%
  Conics (Parabola, Ellipse, Hyperbola) 10% 6%

Trigonometry               ~10%          ~8%
  
Vectors & 3D Geometry       ~5%          ~7%
```

## Calculus

### Limits
```
Standard limits (must memorize):
  lim(x→0) sin(x)/x = 1
  lim(x→0) tan(x)/x = 1
  lim(x→0) (1 - cos x)/x² = 1/2
  lim(x→∞) (1 + 1/x)^x = e
  lim(x→0) (aˣ - 1)/x = ln a
  lim(x→0) (eˣ - 1)/x = 1

L'Hôpital's Rule: If f(a)/g(a) = 0/0 or ∞/∞
  lim f(x)/g(x) = lim f'(x)/g'(x)

0/0 forms to watch:
  sin(ax)/bx = a/b
  (xⁿ - aⁿ)/(x - a) = n·aⁿ⁻¹
```

### Derivatives
```
Key formulas:
  d/dx[xⁿ] = nxⁿ⁻¹
  d/dx[eˣ] = eˣ
  d/dx[ln x] = 1/x
  d/dx[sin x] = cos x
  d/dx[cos x] = -sin x
  d/dx[tan x] = sec²x
  d/dx[sin⁻¹x] = 1/√(1-x²)
  d/dx[tan⁻¹x] = 1/(1+x²)

Chain rule: d/dx[f(g(x))] = f'(g(x))·g'(x)
Product rule: (uv)' = u'v + uv'
Quotient rule: (u/v)' = (u'v - uv')/v²

Applications:
  Increasing function: f'(x) > 0
  Local max: f'(c) = 0, f''(c) < 0
  Local min:  f'(c) = 0, f''(c) > 0
  Rolle's: f(a) = f(b) → ∃c: f'(c) = 0
  LMVT: ∃c: f'(c) = [f(b)-f(a)]/(b-a)
```

### Integration
```
Standard integrals (must know all):
  ∫xⁿ dx = xⁿ⁺¹/(n+1) + C
  ∫eˣ dx = eˣ + C
  ∫(1/x) dx = ln|x| + C
  ∫sin x dx = -cos x + C
  ∫cos x dx = sin x + C
  ∫sec²x dx = tan x + C
  ∫1/√(1-x²) dx = sin⁻¹x + C
  ∫1/(1+x²) dx = tan⁻¹x + C
  ∫1/√(x²+a²) dx = ln|x + √(x²+a²)| + C

Techniques:
  Substitution: u = g(x), transforms ∫f(g(x))g'(x)dx → ∫f(u)du
  By parts: ∫udv = uv - ∫vdu  (ILATE: Inverse, Log, Algebraic, Trig, Exponential)
  Partial fractions: decompose rational functions

Definite integral properties:
  ∫ₐᵇf(x)dx = -∫ᵦₐf(x)dx
  ∫ₐᵇf(x)dx = ∫ₐᶜf(x)dx + ∫ᶜᵦf(x)dx
  ∫₋ₐᵃf(x)dx = 2∫₀ᵃf(x)dx if f is even, 0 if odd
  
Area: A = |∫ₐᵇ[f(x) - g(x)]dx|  (upper - lower curve)
```

### Differential Equations
```
Order = highest derivative, Degree = power of highest derivative

Variable separable: dy/dx = f(x)·g(y)
  Separate: dy/g(y) = f(x)dx, integrate both sides

Linear 1st order: dy/dx + P(x)y = Q(x)
  IF = e^∫P dx
  Solution: y·IF = ∫Q·IF dx + C

Homogeneous: dy/dx = f(y/x)
  Substitute v = y/x: y = vx, dy/dx = v + x·dv/dx
```

## Algebra

### Complex Numbers
```
i = √-1, i² = -1, i³ = -i, i⁴ = 1

z = a + bi, |z| = √(a²+b²), arg(z) = tan⁻¹(b/a)
Conjugate: z̄ = a - bi
Modulus-Argument: z = r(cosθ + i sinθ) = re^(iθ)

De Moivre: (cosθ + i sinθ)ⁿ = cos(nθ) + i sin(nθ)

Cube roots of unity: 1, ω, ω²
  ω = e^(2πi/3) = (-1+√3i)/2
  1 + ω + ω² = 0, ω³ = 1

Triangle inequality: |z₁+z₂| ≤ |z₁| + |z₂|
```

### Matrices & Determinants
```
For 2×2: |A| = ad - bc
For 3×3: expand along any row/column

Properties of determinants:
  Interchange 2 rows/cols → sign changes
  Two identical rows → |A| = 0
  Multiply row by k → |A| multiplied by k
  |AB| = |A||B|
  |Aᵀ| = |A|

Inverse: A⁻¹ = adj(A)/|A|  (only if |A| ≠ 0)
System AX = B:
  Unique solution if |A| ≠ 0
  Cramer's rule: x = |A₁|/|A|, y = |A₂|/|A|
```

### Sequences & Series
```
AP: a, a+d, a+2d,...
  nth term: a + (n-1)d
  Sum Sₙ = n/2[2a + (n-1)d]

GP: a, ar, ar²,...
  nth term: arⁿ⁻¹
  Sₙ = a(rⁿ-1)/(r-1) for r ≠ 1
  S∞ = a/(1-r) for |r| < 1

AM-GM inequality: AM ≥ GM ≥ HM
  (a+b)/2 ≥ √(ab) ≥ 2ab/(a+b)
  Equality when a = b

Sum of series:
  Σn = n(n+1)/2
  Σn² = n(n+1)(2n+1)/6
  Σn³ = [n(n+1)/2]²
```

## Coordinate Geometry

```
Straight Lines:
  Slope m = (y₂-y₁)/(x₂-x₁) = tan θ
  y - y₁ = m(x - x₁)  point-slope form
  Angle between lines: tan θ = |m₁-m₂|/|1+m₁m₂|
  Distance from point to line: |ax₀+by₀+c|/√(a²+b²)

Circle: (x-h)² + (y-k)² = r²
  General: x² + y² + 2gx + 2fy + c = 0
  Centre (-g,-f), radius = √(g²+f²-c)
  Tangent at (x₁,y₁): xx₁+yy₁+g(x+x₁)+f(y+y₁)+c = 0

Parabola y² = 4ax:
  Focus (a,0), Directrix x = -a
  Parametric: (at², 2at)
  Tangent: ty = x + at²

Ellipse x²/a² + y²/b² = 1 (a > b):
  c² = a² - b², e = c/a < 1
  Foci (±c, 0), Directrices x = ±a/e

Hyperbola x²/a² - y²/b² = 1:
  c² = a² + b², e = c/a > 1
  Asymptotes: y = ±(b/a)x
```

## Trigonometry

```
Compound angles:
  sin(A±B) = sinA cosB ± cosA sinB
  cos(A±B) = cosA cosB ∓ sinA sinB
  tan(A+B) = (tanA + tanB)/(1 - tanA tanB)

Double angle:
  sin 2A = 2 sinA cosA = 2tanA/(1+tan²A)
  cos 2A = cos²A - sin²A = 1-2sin²A = 2cos²A-1
  tan 2A = 2tanA/(1-tan²A)

Product to sum:
  2sinA cosB = sin(A+B) + sin(A-B)
  2cosA cosB = cos(A+B) + cos(A-B)

Inverse trig (properties UPSC-JEE both use):
  sin⁻¹x + cos⁻¹x = π/2
  tan⁻¹x + cot⁻¹x = π/2
  tan⁻¹(1/x) = cot⁻¹x for x > 0

Properties of triangles:
  Sine rule: a/sinA = b/sinB = c/sinC = 2R
  Cosine rule: a² = b² + c² - 2bc cosA
  Area = (1/2)ab sinC = √[s(s-a)(s-b)(s-c)]  (Heron's)
```

## Previous Year JEE Advanced Problems — Patterns

```
What Advanced tests differently from Main:
  1. Multiple correct answers — you need ALL correct options
  2. Integer type — no negative marking but exact answer needed
  3. Paragraph based — 2-3 questions from one scenario

Most common Advanced traps:
  → Asking for area when function has discontinuity (split integral)
  → Complex number argument in wrong quadrant
  → Counting arrangements with repetition
  → Differential equation with singular solutions
  → Integration by recognising clever substitution

Time strategy:
  JEE Main: ~3 min per question, skip → return
  JEE Advanced: ~6 min per question, attempt selectively
  Never leave integer type blank (no negative marking)
```

## 3-Month Intensive Plan

```
Month 1: Calculus + Algebra
  Week 1-2: Limits, Derivatives, applications
  Week 3-4: Integrals (definite + indefinite + area)
  Daily: 20 problems from NCERT + 15 from HC Verma equivalent (Maths)
  
Month 2: Remaining topics
  Week 5-6: Complex numbers, Matrices, Series, P&C
  Week 7-8: Coordinate geometry — Circles, Conics
  
Month 3: Advanced + Mock tests
  Week 9-10: Vectors, 3D, Differential equations, revision
  Week 11-12: Full mock tests (daily), previous year papers
  Books: SL Loney (Trigonometry), SK Goyal, Arihant for JEE
```
