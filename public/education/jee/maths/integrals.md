# Integrals

## Why This Chapter Matters
Integration is the biggest chapter in JEE calculus — 10-15 marks. Standard integrals, integration by parts, definite integrals, and area under curves are all tested. Practice is the only way to master this.

## Core Concepts

### 1. Standard Integrals (Must Memorize)
integral x^n dx = x^(n+1)/(n+1) + C  (n != -1)
integral 1/x dx = ln|x| + C
integral e^x dx = e^x + C
integral a^x dx = a^x/ln(a) + C
integral sin x dx = -cos x + C
integral cos x dx = sin x + C
integral tan x dx = ln|sec x| + C = -ln|cos x| + C
integral cot x dx = ln|sin x| + C
integral sec x dx = ln|sec x + tan x| + C
integral cosec x dx = ln|cosec x - cot x| + C
integral sec^2 x dx = tan x + C
integral cosec^2 x dx = -cot x + C
integral sec x tan x dx = sec x + C
integral 1/(1+x^2) dx = tan^-1 x + C
integral 1/sqrt(1-x^2) dx = sin^-1 x + C

### 2. Methods of Integration

**Substitution:** Replace u = g(x), du = g'(x)dx
integral f(g(x)) g'(x) dx = integral f(u) du

**Integration by Parts (ILATE rule):**
integral u v dx = u x integral(v dx) - integral [u' x integral(v dx)] dx
ILATE priority: Inverse, Logarithmic, Algebraic, Trigonometric, Exponential

**Partial Fractions:**
For rational functions, decompose into simpler fractions.
1/(x(x+1)) = 1/x - 1/(x+1)

### 3. Definite Integrals

integral from a to b of f(x) dx = F(b) - F(a) where F'(x) = f(x)

**Properties:**
- integral a to b of f(x)dx = -integral b to a of f(x)dx
- integral a to b of f(x)dx = integral a to c of f(x)dx + integral c to b of f(x)dx
- integral 0 to a of f(x)dx = integral 0 to a of f(a-x)dx  [KEY property]
- integral -a to a of f(x)dx = 2 x integral 0 to a of f(x)dx if f is even
- integral -a to a of f(x)dx = 0 if f is odd

### 4. Area Under Curves
Area between y=f(x) and x-axis from a to b:
A = integral from a to b of |f(x)| dx

Area between two curves y=f(x) and y=g(x):
A = integral from a to b of |f(x) - g(x)| dx

## PYQs
**2024:** integral of [sin x/(sin x + cos x)] dx from 0 to pi/2
Use property: I = integral of [cos x/(sin x + cos x)] dx (substitute pi/2-x)
2I = integral of 1 dx from 0 to pi/2 = pi/2. So I = pi/4.

**2023:** integral of x e^x dx
By parts (u=x, v=e^x): x e^x - integral e^x dx = x e^x - e^x + C = e^x(x-1) + C

**2022:** integral of 1/(x^2 + 4x + 5) dx
Complete the square: (x+2)^2 + 1. integral 1/((x+2)^2+1) dx = tan^-1(x+2) + C

## MCQ Practice
Q1. integral of e^(3x) dx:
(A) e^(3x) (B) 3e^(3x) (C) e^(3x)/3 (D) 3e^(3x)+C
Answer: C

Q2. integral from 0 to pi of sin x dx:
(A) 0 (B) 1 (C) 2 (D) -2
Answer: C [[-cos x] from 0 to pi = -cos(pi)+cos(0) = 1+1 = 2]

Q3 (Hard). Area enclosed by y=x^2 and y=sqrt(x):
Intersection: x^2 = sqrt(x) => x^4 = x => x=0 or x=1.
Area = integral 0 to 1 of (sqrt(x) - x^2) dx = [2x^(3/2)/3 - x^3/3] from 0 to 1 = 2/3 - 1/3 = 1/3

## Revision Notes
```
STANDARD: memorize all basic integrals listed above

SUBSTITUTION: replace u = inner function, find du
BY PARTS (ILATE): integral uv' = uv - integral u'v
PARTIAL FRACTIONS: decompose rational function

DEFINITE INTEGRAL PROPERTIES:
integral 0->a of f(x) = integral 0->a of f(a-x)  [USE THIS for symmetric integrals]
Even function: integral -a->a = 2 x integral 0->a
Odd function: integral -a->a = 0

AREA:
Under curve y=f(x): integral |f(x)| dx
Between curves: integral |f(x)-g(x)| dx  [from intersection to intersection]
```
