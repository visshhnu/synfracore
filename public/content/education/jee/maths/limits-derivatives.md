# Limits and Derivatives

## Why This Chapter Matters
Limits and derivatives are tested every year in JEE — 8-12 marks. Standard limits, L'Hopital's rule, and differentiation rules form the backbone of calculus. Speed in derivative computation is essential.

## Core Concepts

### 1. Limits

**Limit:** lim(x->a) f(x) = L means f(x) approaches L as x approaches a.
Left-hand limit (LHL): lim(x->a-) | Right-hand limit (RHL): lim(x->a+)
Limit exists iff LHL = RHL.

**Standard Limits (Must Memorize):**
- lim(x->0) sin(x)/x = 1
- lim(x->0) tan(x)/x = 1
- lim(x->0) (e^x - 1)/x = 1
- lim(x->0) (a^x - 1)/x = ln(a)
- lim(x->0) ln(1+x)/x = 1
- lim(x->0) (1+x)^(1/x) = e
- lim(x->inf) (1 + 1/x)^x = e
- lim(x->a) (x^n - a^n)/(x-a) = n x a^(n-1)

**L'Hopital's Rule** (for 0/0 or inf/inf forms):
lim f(x)/g(x) = lim f'(x)/g'(x) if LHS is 0/0 or inf/inf.

### 2. Continuity
f is continuous at x=a if: lim(x->a) f(x) = f(a)
(Both LHL and RHL must equal f(a))

### 3. Differentiation — Key Rules

**Basic derivatives:**
d/dx (x^n) = n x^(n-1)
d/dx (e^x) = e^x
d/dx (a^x) = a^x ln(a)
d/dx (ln x) = 1/x
d/dx (sin x) = cos x
d/dx (cos x) = -sin x
d/dx (tan x) = sec^2 x
d/dx (cot x) = -cosec^2 x
d/dx (sec x) = sec x tan x
d/dx (cosec x) = -cosec x cot x
d/dx (sin^-1 x) = 1/sqrt(1-x^2)
d/dx (cos^-1 x) = -1/sqrt(1-x^2)
d/dx (tan^-1 x) = 1/(1+x^2)

**Rules:**
Product rule: d/dx[f.g] = f'g + fg'
Quotient rule: d/dx[f/g] = (f'g - fg')/g^2
Chain rule: d/dx[f(g(x))] = f'(g(x)) x g'(x)

**Implicit differentiation:** Differentiate both sides w.r.t. x, treat y as function of x (dy/dx appears).

## PYQs
**2024:** lim(x->0) (sin 3x + sin 5x)/(sin 4x + sin 2x)
= lim x->0 of [(sin3x/x + sin5x/x)/(sin4x/x + sin2x/x)]
= (3+5)/(4+2) = 8/6 = 4/3

**2023:** If y = x^x, find dy/dx.
Take log: ln y = x ln x. Differentiate: (1/y)dy/dx = ln x + 1.
dy/dx = y(ln x + 1) = x^x(1 + ln x)

**2022:** lim(x->0) (e^(sin x) - 1)/x
= lim(x->0) (e^(sin x) - 1)/sin x x sin x/x = 1 x 1 = 1

## MCQ Practice
Q1. lim(x->0) (1 - cos x)/x^2 =
(A) 0 (B) 1/2 (C) 1 (D) 2
Answer: B [use L'Hopital twice: sin x/2x -> cos x/2 -> 1/2]

Q2. Derivative of sin^2 x:
(A) 2sin x (B) 2cos x (C) sin 2x (D) cos 2x
Answer: C [2sin x cos x = sin 2x by chain rule]

Q3 (Hard). If f(x) = |x|, is f differentiable at x=0?
LHD: lim(h->0-) (|h|-0)/h = lim(-h/h) = -1
RHD: lim(h->0+) (h/h) = 1
LHD != RHD => NOT differentiable at x=0.

## Revision Notes
```
STANDARD LIMITS (memorize):
sin x/x -> 1, tan x/x -> 1, (e^x-1)/x -> 1 as x->0
(1+x)^(1/x) -> e as x->0

L'HOPITAL: use for 0/0, inf/inf forms only

KEY DERIVATIVES:
x^n -> nx^(n-1) | e^x -> e^x | ln x -> 1/x
sin x -> cos x | cos x -> -sin x | tan x -> sec^2 x
sin^-1 x -> 1/sqrt(1-x^2) | tan^-1 x -> 1/(1+x^2)

RULES:
Product: (fg)' = f'g + fg'
Quotient: (f/g)' = (f'g - fg')/g^2
Chain: f(g(x))' = f'(g) x g'
```
