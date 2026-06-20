# Integration and Its Applications

## Why This Chapter Matters
Integration gives 15-20 marks in Class 12 boards — one of the biggest topics. Indefinite integrals (by substitution, parts, partial fractions), definite integrals, and area under curves are all tested.

## Core Concepts

### 1. Standard Integrals (Must Memorise)
∫xⁿ dx = xⁿ⁺¹/(n+1) + C (n ≠ -1)
∫1/x dx = ln|x| + C
∫eˣ dx = eˣ + C
∫aˣ dx = aˣ/ln a + C
∫sin x dx = -cos x + C
∫cos x dx = sin x + C
∫sec²x dx = tan x + C
∫cosec²x dx = -cot x + C
∫sec x tan x dx = sec x + C
∫1/√(1-x²) dx = sin⁻¹x + C
∫1/(1+x²) dx = tan⁻¹x + C

### 2. Integration by Substitution
Replace complicated expression with substitution u = g(x), du = g'(x)dx.
∫f(g(x))g'(x)dx → ∫f(u)du.

Example: ∫2x·sin(x²)dx. Let u=x², du=2x dx. → ∫sin u du = -cos u + C = -cos(x²) + C.

### 3. Integration by Parts (ILATE rule)
∫u·v dx = u∫v dx - ∫(u'·∫v dx)dx
Choose u by ILATE priority: Inverse trig > Logarithmic > Algebraic > Trigonometric > Exponential.

Example: ∫x·eˣ dx. u=x (A), dv=eˣdx (E).
= x·eˣ - ∫eˣ dx = xeˣ - eˣ + C = eˣ(x-1) + C.

**Special pair:** ∫eˣ[f(x) + f'(x)]dx = eˣf(x) + C.

### 4. Partial Fractions
For rational functions P(x)/Q(x) where degree P < degree Q.
Factor denominator → decompose into simpler fractions → integrate each.

Types:
(px+q)/[(x-a)(x-b)] = A/(x-a) + B/(x-b)
(px+q)/[(x-a)²] = A/(x-a) + B/(x-a)²
(px²+qx+r)/[(x-a)(x²+bx+c)] = A/(x-a) + (Bx+C)/(x²+bx+c)

### 5. Definite Integrals

∫ₐᵇ f(x)dx = F(b) - F(a) where F'(x) = f(x).

**Important properties:**
∫ₐᵇ f(x)dx = -∫ᵦₐ f(x)dx
∫ₐᵃ f(x)dx = 0
∫ₐᵇ f(x)dx = ∫ₐᶜ f(x)dx + ∫ᶜᵇ f(x)dx
∫₀ₐ f(x)dx = ∫₀ₐ f(a-x)dx ← VERY USEFUL
∫₋ₐᵃ f(x)dx = 2∫₀ₐ f(x)dx if f is even | = 0 if f is odd

**King's property:** ∫ₐᵇ f(x)dx = ∫ₐᵇ f(a+b-x)dx — extremely useful in board exams.

### 6. Area Under Curves
Area between f(x) and x-axis from a to b: A = ∫ₐᵇ |f(x)|dx.
If f(x) ≥ 0: A = ∫ₐᵇ f(x)dx.
Area between two curves: A = ∫ₐᵇ [f(x)-g(x)]dx where f(x)≥g(x).

Area of circle x²+y²=r²: A = 4∫₀ʳ √(r²-x²)dx = πr² (standard result).
Area of ellipse x²/a²+y²/b²=1: πab.

## Board Examples

**Q1:** ∫(x+1)/√(x+2) dx.
Let u=x+2 → x=u-2, dx=du. ∫(u-2+1)/√u du = ∫(u-1)/√u du = ∫(u^(1/2) - u^(-1/2))du
= 2u^(3/2)/3 - 2u^(1/2) + C = (2/3)(x+2)^(3/2) - 2(x+2)^(1/2) + C.

**Q2:** ∫₀^(π/2) sin²x dx using property.
∫₀^(π/2) sin²x dx. Let I = ∫₀^(π/2) sin²x dx = ∫₀^(π/2) cos²x dx (using f(π/2-x) property).
2I = ∫₀^(π/2) (sin²x+cos²x)dx = ∫₀^(π/2) 1 dx = π/2. I = π/4.

**Q3:** Find area bounded by y = x² and y = x.
Intersection: x²=x → x=0,1. For 0≤x≤1: x≥x².
Area = ∫₀¹ (x-x²)dx = [x²/2 - x³/3]₀¹ = 1/2-1/3 = 1/6 sq units.

## PYQs (CBSE)

**CBSE 2023:** Evaluate ∫₀^π x sin x/(1+cos²x) dx.
Using King's I = ∫₀^π (π-x)sinx/(1+cos²x)dx.
2I = π∫₀^π sinx/(1+cos²x)dx. Let t=cosx, dt=-sinx dx.
2I = π∫₋₁¹ dt/(1+t²) = π[tan⁻¹t]₋₁¹ = π(π/4+π/4) = π²/2. I = π²/4.

**CBSE 2022:** ∫1/(sin x + sin 2x) dx.
= ∫1/(sinx(1+2cosx)) dx. Partial fractions after substituting t=cosx.

## Revision Notes
```
STANDARD INTEGRALS (MUST KNOW):
∫xⁿ=xⁿ⁺¹/(n+1) | ∫1/x=ln|x| | ∫eˣ=eˣ | ∫sinx=-cosx | ∫cosx=sinx
∫sec²x=tanx | ∫1/√(1-x²)=sin⁻¹x | ∫1/(1+x²)=tan⁻¹x

SUBSTITUTION: u=g(x), du=g'(x)dx
PARTS (ILATE): u first = Inverse trig, Log, Algebra, Trig, Exp
SPECIAL: ∫eˣ[f(x)+f'(x)]dx = eˣf(x)+C

PROPERTIES:
King's: ∫ₐᵇf(x)dx = ∫ₐᵇf(a+b-x)dx (most used in boards)
Even: ∫₋ₐᵃ=2∫₀ₐ | Odd: ∫₋ₐᵃ=0

AREA: ∫ₐᵇ|f(x)|dx | Between curves: ∫ₐᵇ[f(x)-g(x)]dx (upper-lower)
```
