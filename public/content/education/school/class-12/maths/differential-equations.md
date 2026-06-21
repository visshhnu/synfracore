# Differential Equations

## Why This Chapter Matters
Differential Equations give 5-7 marks in CBSE Class 12. Order, degree, variable separable method, and linear differential equations (integrating factor) are the standard board question types.

## Core Concepts

### 1. Definitions
**Differential equation:** Equation involving derivatives of a function.
**Order:** Order of the highest derivative present.
**Degree:** Power of the highest order derivative (when DE is polynomial in derivatives).
Note: degree is NOT defined if sin(y'), eʸ', etc. appear.

Examples:
dy/dx + 2y = 0 → Order 1, Degree 1.
d²y/dx² + (dy/dx)³ = 0 → Order 2, Degree 1.
(d²y/dx²)³ + dy/dx = x → Order 2, Degree 3.

### 2. Variable Separable Method
If dy/dx = f(x)·g(y), separate variables:
dy/g(y) = f(x)dx, then integrate both sides.

Example: dy/dx = x²y
dy/y = x²dx → ln|y| = x³/3 + C → y = Ae^(x³/3).

### 3. Homogeneous Differential Equations
dy/dx = F(y/x) — degree of x and y same on both sides.
Substitution: y = vx → dy/dx = v + x(dv/dx).
Then separate variables in x and v.

Example: (x²+y²)dx - 2xydy = 0 → dy/dx = (x²+y²)/2xy.
Put v=y/x: v+x(dv/dx) = (1+v²)/2v.
x(dv/dx) = (1+v²)/2v - v = (1-v²)/2v.
2v dv/(1-v²) = dx/x → -ln|1-v²| = ln|x| + C → x(1-v²) = k → x-y²/x = k.

### 4. Linear Differential Equations (Most Important for Boards)
**Form:** dy/dx + P(x)y = Q(x)
**Integrating Factor (IF):** μ = e^(∫P dx)
**Solution:** y·μ = ∫Q·μ dx + C

Steps:
1. Write in standard form (dy/dx + Py = Q).
2. Find P and Q.
3. Calculate IF = e^(∫P dx).
4. Multiply both sides by IF.
5. Left side becomes d/dx(y·IF).
6. Integrate both sides.

Example: dy/dx + y/x = x²
P=1/x, Q=x². IF = e^(∫1/x dx) = e^(ln x) = x.
Multiply: x(dy/dx) + y = x³ → d/dx(xy) = x³.
Integrate: xy = x⁴/4 + C → y = x³/4 + C/x.

### 5. Applications
**Growth and Decay:** dN/dt = kN → N = N₀eᵏᵗ.
Radioactive decay: k < 0.
Population growth: k > 0.

**Newton's Law of Cooling:** dT/dt = k(T-T₀) where T₀ = ambient temperature.
Solution: T-T₀ = (T₀₀-T₀)eᵏᵗ.

## Board Examples

**Q1:** Solve: (x+1)dy/dx = 2xy.
Separate: dy/y = 2x/(x+1)dx = 2[1 - 1/(x+1)]dx.
Integrate: ln|y| = 2x - 2ln|x+1| + C.
y = A·e^(2x)/(x+1)².

**Q2 (Linear):** dy/dx - y/(x+1) = (x+1)².
P = -1/(x+1), Q = (x+1)². IF = e^(-∫dx/(x+1)) = e^(-ln(x+1)) = 1/(x+1).
d/dx[y/(x+1)] = (x+1). y/(x+1) = (x+1)²/2 + C. y = (x+1)³/2 + C(x+1).

## PYQs (CBSE)

**CBSE 2023:** Find order and degree of: x²(d²y/dx²)³ + y(dy/dx)⁴ = 0.
Highest derivative: d²y/dx² (order 2). Its power = 3 (degree 3). Order=2, Degree=3.

**CBSE 2022:** Solve the DE: dy/dx = (y/x) + tan(y/x).
Homogeneous. y=vx → v+x(dv/dx) = v + tanv → x(dv/dx) = tanv.
dv/tanv = dx/x → cosv/sinv dv = dx/x → ln|sinv| = ln|x| + C.
sinv = kx → sin(y/x) = kx.

## Revision Notes
```
ORDER: highest derivative's order
DEGREE: power of highest order derivative (if polynomial)
Degree undefined if: sin(y'), eʸ', log(y'') etc.

VARIABLE SEPARABLE: dy/dx=f(x)g(y) → dy/g(y)=f(x)dx → integrate

HOMOGENEOUS: degree same → put y=vx, dy/dx=v+x(dv/dx)

LINEAR: dy/dx + Py = Q
IF = e^(∫P dx)
Solution: y·IF = ∫Q·IF dx + C

APPLICATIONS:
Growth/Decay: N=N₀eᵏᵗ
Newton cooling: T-T₀=(Ti-T₀)eᵏᵗ
```
