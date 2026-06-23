# JEE Mathematics — Important Questions & Concepts

## Calculus

**Q: Find the derivative of f(x) = x^n · sin(x)**

Using the product rule: d/dx[u·v] = u'v + uv'
```
f'(x) = nx^(n-1) · sin(x) + x^n · cos(x)
      = x^(n-1)[n·sin(x) + x·cos(x)]
```

**Q: Evaluate ∫ x·e^x dx**

Using integration by parts (ILATE rule: choose x as u, e^x as dv):
```
∫ x·e^x dx = x·e^x - ∫ e^x dx = x·e^x - e^x + C = e^x(x-1) + C
```

**Q: Find the area enclosed by y = x² and y = x**

```
Intersection points: x² = x → x = 0, x = 1
Area = ∫₀¹ (x - x²) dx = [x²/2 - x³/3]₀¹ = 1/2 - 1/3 = 1/6 sq units
```

**Q: If f(x) = sin x, find f'(x) from first principles**

```
f'(x) = lim(h→0) [sin(x+h) - sin(x)] / h
      = lim(h→0) [2cos(x + h/2)·sin(h/2)] / h
      = lim(h→0) cos(x + h/2) · [sin(h/2)/(h/2)]
      = cos(x) · 1 = cos x
```

## Algebra

**Q: If α, β are roots of ax² + bx + c = 0, find α² + β²**

```
Vieta's formulas: α + β = -b/a,  αβ = c/a
α² + β² = (α + β)² - 2αβ = b²/a² - 2c/a = (b² - 2ac)/a²
```

**Q: How many ways can MISSISSIPPI be arranged?**

```
Total letters: 11 (M=1, I=4, S=4, P=2)
Arrangements = 11! / (1! × 4! × 4! × 2!) = 39,916,800 / (24 × 24 × 2) = 34,650
```

**Q: Sum of n terms of AP: 3, 7, 11, ...**

```
a = 3, d = 4
Sₙ = n/2 [2a + (n-1)d] = n/2 [6 + 4(n-1)] = n/2 · (4n + 2) = n(2n + 1)
```

## Coordinate Geometry

**Q: Find the equation of line through (2,3) perpendicular to 3x + 4y = 5**

```
Slope of given line: m₁ = -3/4
Perpendicular slope: m₂ = 4/3
Line: y - 3 = (4/3)(x - 2) → 3y - 9 = 4x - 8 → 4x - 3y + 1 = 0
Wait: y-3 = 4/3(x-2) → 3(y-3) = 4(x-2) → 3y-9 = 4x-8 → 4x-3y-1=0
```

**Q: If the circles x²+y²=4 and x²+y²-8x+12=0 intersect, find the radical axis**

```
Subtract equations: -8x + 12 - (-4) = 0 → -8x + 16 = 0 → x = 2
Radical axis: x = 2
```

## Revision Notes
```
DIFFERENTIATION:
  Product rule: (uv)' = u'v + uv'
  Chain rule: d/dx[f(g(x))] = f'(g(x))·g'(x)
  Quotient rule: (u/v)' = (u'v - uv')/v²

INTEGRATION:
  By parts: ∫u·dv = uv - ∫v·du (ILATE order: Log, Inverse trig, Algebraic, Trig, Exponential)

SEQUENCES:
  AP: nth term = a + (n-1)d | Sum = n/2[2a+(n-1)d]
  GP: nth term = ar^(n-1) | Sum = a(r^n - 1)/(r-1)

PERMUTATION vs COMBINATION:
  nPr = n!/(n-r)!  (order matters)
  nCr = n!/[r!(n-r)!]  (order doesn't matter)
```
