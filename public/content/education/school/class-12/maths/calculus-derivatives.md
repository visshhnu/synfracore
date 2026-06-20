# Continuity, Differentiability and Applications of Derivatives

## Why This Chapter Matters
Derivatives account for 15-20 marks in CBSE Class 12 — the single largest topic. Continuity, differentiability, chain rule, implicit differentiation, tangent/normal, and maxima/minima are all tested.

## Core Concepts

### 1. Continuity
f(x) is continuous at x = a if:
1. f(a) is defined
2. lim(x→a) f(x) exists (left limit = right limit)
3. lim(x→a) f(x) = f(a)

Every polynomial, rational (where defined), and trigonometric function is continuous.

### 2. Differentiability
f is differentiable at x=a if f'(a) = lim(h→0) [f(a+h)-f(a)]/h exists.
Differentiable → Continuous. Continuous does NOT imply differentiable.
|x| is continuous at x=0 but NOT differentiable (sharp corner).

### 3. Standard Derivatives
d/dx(xⁿ) = nxⁿ⁻¹ | d/dx(eˣ) = eˣ | d/dx(aˣ) = aˣ ln a
d/dx(ln x) = 1/x | d/dx(log_a x) = 1/(x ln a)
d/dx(sin x) = cos x | d/dx(cos x) = -sin x | d/dx(tan x) = sec²x
d/dx(sin⁻¹ x) = 1/√(1-x²) | d/dx(cos⁻¹ x) = -1/√(1-x²)
d/dx(tan⁻¹ x) = 1/(1+x²) | d/dx(cot⁻¹ x) = -1/(1+x²)

### 4. Rules of Differentiation
**Product rule:** (uv)' = u'v + uv'
**Quotient rule:** (u/v)' = (u'v - uv')/v²
**Chain rule:** d/dx[f(g(x))] = f'(g(x)) × g'(x)

**Logarithmic differentiation:** For y = f(x)^g(x) or complex products.
Take ln both sides → differentiate → multiply back by y.

**Implicit differentiation:** When y is not explicitly isolated.
Differentiate both sides with respect to x, treat y as function of x.
d/dx(y²) = 2y·dy/dx.

**Parametric:** x=f(t), y=g(t). dy/dx = (dy/dt)/(dx/dt).

### 5. Second Derivative
y'' or d²y/dx² = d/dx(dy/dx).

**Second derivative test for extrema:**
If f'(a)=0 and f''(a) < 0 → local maximum.
If f'(a)=0 and f''(a) > 0 → local minimum.
If f'(a)=0 and f''(a) = 0 → inconclusive.

### 6. Applications of Derivatives

**Tangent and Normal:**
Slope of tangent at (x₀,y₀) = f'(x₀).
Equation of tangent: y - y₀ = f'(x₀)(x - x₀).
Slope of normal = -1/f'(x₀).

**Rate of change:** dy/dt = (dy/dx)·(dx/dt).

**Increasing/Decreasing:**
f'(x) > 0 on (a,b) → f increasing on (a,b).
f'(x) < 0 on (a,b) → f decreasing.

**Maxima/Minima (First Derivative Test):**
f'(x) changes + to - at x=a → local max.
f'(x) changes - to + at x=a → local min.

**Approximation:** f(x+Δx) ≈ f(x) + f'(x)·Δx. (Using differentials: Δy ≈ dy = f'(x)dx)

## Board Examples

**Q1:** Find dy/dx if y = sin(x²).
Chain rule: dy/dx = cos(x²) × 2x = 2x cos(x²).

**Q2:** Find the equation of tangent to y = x³ - 3x + 2 at (1, 0).
dy/dx = 3x²-3. At x=1: slope = 0. Horizontal tangent: y-0=0(x-1) → y=0.

**Q3:** A ladder 10m long leans against a wall. Top slides down at 2 m/s. How fast is foot moving out when top is 6m above ground?
x²+y²=100. 2x(dx/dt)+2y(dy/dt)=0. At y=6: x=8.
dx/dt = -y(dy/dt)/x = -6(-2)/8 = 1.5 m/s.

## PYQs (CBSE)

**CBSE 2023:** Find local maxima and minima of f(x)=x³-6x²+9x+15.
f'(x)=3x²-12x+9=3(x²-4x+3)=3(x-1)(x-3). Critical points: x=1,3.
f''(x)=6x-12. f''(1)=-6<0 → local max at x=1. f''(3)=6>0 → local min at x=3.
f(1)=1-6+9+15=19 (local max). f(3)=27-54+27+15=15 (local min).

**CBSE 2022:** Differentiate sin⁻¹(2x√(1-x²)) with respect to x.
Let x=sinθ → 2x√(1-x²)=2sinθcosθ=sin2θ.
y=sin⁻¹(sin2θ)=2θ=2sin⁻¹x. dy/dx=2/√(1-x²).

## Revision Notes
```
CONTINUITY: defined + limit exists + limit = f(a)
DIFFERENTIABLE → CONTINUOUS (not vice versa)

STANDARD DERIVATIVES (must memorise):
xⁿ→nxⁿ⁻¹ | eˣ→eˣ | ln x→1/x | sin x→cos x | cos x→-sin x
sin⁻¹x→1/√(1-x²) | tan⁻¹x→1/(1+x²)

RULES: Product(uv)'=u'v+uv' | Quotient: (u/v)'=(u'v-uv')/v²
Chain: d/dx[f(g(x))]=f'(g(x))·g'(x)
Implicit: differentiate term by term, d/dx(y²)=2y·dy/dx

APPLICATIONS:
Tangent slope = f'(x₀) | Normal slope = -1/f'(x₀)
Increasing: f'>0 | Decreasing: f'<0
Max: f'=0 and f''<0 | Min: f'=0 and f''>0
```
