# JEE Mathematics Advanced Topics

## Advanced Calculus

### Mean Value Theorems
- **Rolle's theorem**: f(a)=f(b), continuous on [a,b], differentiable on (a,b) → ∃c: f'(c)=0
- **LMVT**: f'(c) = (f(b)-f(a))/(b-a) for some c ∈ (a,b)
- **Cauchy's MVT**: f'(c)/g'(c) = (f(b)-f(a))/(g(b)-g(a))

### Taylor and Maclaurin Series
```
f(x) = f(a) + f'(a)(x-a) + f''(a)(x-a)²/2! + ...
e^x = 1 + x + x²/2! + x³/3! + ...
sin x = x - x³/3! + x⁵/5! - ...
cos x = 1 - x²/2! + x⁴/4! - ...
ln(1+x) = x - x²/2 + x³/3 - ...   (|x| < 1)
(1+x)^n = 1 + nx + n(n-1)x²/2! + ...  (|x|<1)
```

### Integration Techniques
- **By Parts** (ILATE): ∫u dv = uv - ∫v du
- **Partial fractions**: split rational function into simpler fractions
- **Reduction formulas**: ∫sin^n x dx in terms of ∫sin^(n-2) x dx
- **Improper integrals**: infinite limits or discontinuous integrand

## Combinatorics

### Permutations and Combinations
```
nPr = n!/(n-r)!    (arrangements)
nCr = n!/(r!(n-r)!)  (selections)
nCr = nC(n-r)  (symmetry)
nCr + nC(r-1) = (n+1)Cr  (Pascal's identity)
Circular permutations: (n-1)!
With repetition: n^r ways to arrange r items from n types
```

### Binomial Theorem
- (a+b)^n = Σ_{r=0}^{n} nCr a^(n-r) b^r
- General term: T_{r+1} = nCr a^(n-r) b^r
- Middle term: T_{(n/2)+1} if n even; two middle terms if n odd
- Sum of all binomial coefficients: 2^n
- Sum of odd-position coefficients = Sum of even = 2^(n-1)

### Derangements
D(n) = n! × Σ_{k=0}^{n} (-1)^k / k!
= n! × (1 - 1/1! + 1/2! - 1/3! + ...)
Probability of derangement ≈ 1/e for large n

## Complex Numbers — Advanced

### Geometry with Complex Numbers
- |z - a| = r: circle with center a, radius r
- arg((z-a)/(z-b)) = θ: arc of circle through a and b
- |z-a| = |z-b|: perpendicular bisector of segment ab
- |z-a| + |z-b| = 2c: ellipse with foci a, b

### Roots of Unity
- nth roots of unity: ω^k = e^(2πik/n), k = 0,1,...,n-1
- Sum of all nth roots = 0 (for n>1)
- Product of all nth roots = (-1)^(n+1)
- 1 + ω + ω² + ... + ω^(n-1) = 0

## 3D Geometry Advanced

### Lines and Planes
```
Line through (x₁,y₁,z₁) with direction (a,b,c):
(x-x₁)/a = (y-y₁)/b = (z-z₁)/c = t

Plane: ax + by + cz + d = 0, normal = (a,b,c)

Angle between planes: cos θ = |a₁a₂+b₁b₂+c₁c₂| / (|n₁||n₂|)

Distance from point P(x₀,y₀,z₀) to plane:
d = |ax₀+by₀+cz₀+d| / √(a²+b²+c²)
```

## Probability Advanced

### Bayes' Theorem
P(A|B) = P(B|A)×P(A) / P(B)
Total probability: P(B) = Σ P(B|Aᵢ)×P(Aᵢ)

### Distributions
- **Binomial**: P(X=k) = nCk p^k(1-p)^(n-k); μ=np, σ²=np(1-p)
- **Poisson**: P(X=k) = e^{-λ}λ^k/k!; μ=σ²=λ (limit of binomial for large n, small p)
- **Normal**: symmetric bell curve; 68-95-99.7% within 1-2-3σ
