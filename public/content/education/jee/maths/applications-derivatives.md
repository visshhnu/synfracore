# Applications of Derivatives

## Why This Chapter Matters
Applications of Derivatives is a high-value JEE topic — 8-12 marks. Maxima/minima, rate of change, tangent/normal equations, and Rolle's/LMVT theorems appear every year.

## Core Concepts

### 1. Rate of Change
If y = f(x), dy/dx = rate of change of y with respect to x.
If x and y both depend on time t: dy/dt = (dy/dx)(dx/dt)

### 2. Increasing and Decreasing Functions
f is increasing on (a,b) if f'(x) > 0 for all x in (a,b)
f is decreasing on (a,b) if f'(x) < 0 for all x in (a,b)
f'(x) = 0 at critical points (local max/min candidates)

### 3. Tangent and Normal
For curve y = f(x) at point P(x1, y1):
Slope of tangent = f'(x1)
Equation of tangent: y - y1 = f'(x1)(x - x1)
Equation of normal: y - y1 = -1/f'(x1) x (x - x1)

Tangent parallel to x-axis: f'(x1) = 0
Tangent parallel to y-axis: f'(x1) is undefined

### 4. Maxima and Minima

**First Derivative Test:**
At critical point c where f'(c) = 0:
f'(x) changes + to -: local maximum at c
f'(x) changes - to +: local minimum at c
No change: inflection point

**Second Derivative Test:**
f'(c) = 0 and f''(c) < 0: local maximum
f'(c) = 0 and f''(c) > 0: local minimum
f'(c) = 0 and f''(c) = 0: inconclusive (use first derivative test)

### 5. Mean Value Theorems

**Rolle's Theorem:** If f is continuous on [a,b], differentiable on (a,b), and f(a) = f(b),
then there exists c in (a,b) such that f'(c) = 0.

**Lagrange's Mean Value Theorem (LMVT):**
If f is continuous on [a,b] and differentiable on (a,b),
then there exists c in (a,b) such that f'(c) = [f(b) - f(a)]/(b-a).
(The derivative equals the slope of the secant line at some interior point.)

### 6. Optimization Problems

**Strategy:**
1. Define variable to optimize (perimeter, area, volume, cost)
2. Express as function of one variable using constraints
3. Find critical points (set derivative = 0)
4. Check second derivative or endpoints

**Classic results:**
- Of all rectangles with fixed perimeter P, the square has maximum area: side = P/4
- Of all cylinders with fixed surface area, h = 2r for max volume
- Minimum material for box of given volume: cube

## PYQs
**2024:** Find the point on curve y = x^2 nearest to (0, 5).
Distance^2 = x^2 + (x^2-5)^2. Let u = x^2.
D^2 = u + (u-5)^2 = u^2 - 9u + 25.
d(D^2)/du = 2u - 9 = 0 => u = 9/2 => x^2 = 9/2.
Point: (3/sqrt(2), 9/2).

**2023:** A particle moves s = t^3 - 3t. Find velocity and acceleration at t=2.
v = ds/dt = 3t^2 - 3 = 3(4)-3 = 9 m/s.
a = dv/dt = 6t = 12 m/s^2.

**2022:** Find local maxima of f(x) = 2x^3 - 3x^2 - 12x + 4.
f'(x) = 6x^2 - 6x - 12 = 6(x^2-x-2) = 6(x-2)(x+1) = 0 => x = 2 or x = -1.
f''(x) = 12x - 6. f''(-1) = -18 < 0 => local max at x = -1.
f(-1) = -2 - 3 + 12 + 4 = 11.

## MCQ Practice
Q1. If f(x) = x^3 - 3x, then f has local minimum at x =
(A) -1 (B) 0 (C) 1 (D) 3
Answer: C [f'(x) = 3x^2-3=0 => x=1 or -1; f''(1)=6>0 => min at x=1]

Q2. Rolle's theorem is applicable to f(x) = |x| on [-1,1]?
No. f is not differentiable at x=0.

Q3 (Hard). A 30m wire is cut into 2 pieces; one bent into square, one into circle. Find lengths to minimize total area.
Let square have side x, so perimeter = 4x, remaining = (30-4x) for circle of circumference 2*pi*r.
r = (30-4x)/(2*pi). Area = x^2 + pi*r^2 = x^2 + (30-4x)^2/(4*pi).
Minimize by differentiating and setting to 0.

## Revision Notes
```
TANGENT at (x1,y1): y - y1 = f'(x1)(x - x1)
NORMAL at (x1,y1): y - y1 = -1/f'(x1) x (x - x1)

CRITICAL POINTS: f'(x) = 0

SECOND DERIVATIVE TEST:
f''(c) < 0 => LOCAL MAX
f''(c) > 0 => LOCAL MIN

ROLLE'S THEOREM: f(a)=f(b) => exists c with f'(c)=0
LMVT: exists c with f'(c) = [f(b)-f(a)]/(b-a)

RATE OF CHANGE:
dy/dt = (dy/dx) x (dx/dt)
```
