# Mathematics Intermediate

## Advanced Algebra

### Polynomials and Rational Functions
```
Long division: divide polynomial by divisor step by step
Synthetic division: shortcut for (x-r) divisor
Partial fractions: 
  1/((x-a)(x-b)) = A/(x-a) + B/(x-b)
  Find A, B by cover-up or substitution
Vieta's formulas (quadratic ax²+bx+c):
  α+β = -b/a;  αβ = c/a
```

### Complex Numbers
- z = a+bi; |z| = √(a²+b²); arg(z) = arctan(b/a)
- Polar form: z = r(cosθ+i sinθ) = re^(iθ)
- De Moivre: (cosθ+i sinθ)^n = cos(nθ)+i sin(nθ)
- Euler's formula: e^(iπ)+1 = 0 (most beautiful equation)

## Calculus

### Applications of Derivatives
- Maxima/minima: f'(c) = 0; second derivative test: f''(c)>0 (min), f''(c)<0 (max)
- Increasing: f'(x)>0; Decreasing: f'(x)<0
- Concave up: f''(x)>0; Concave down: f''(x)<0
- Inflection point: f'' changes sign

### Integration Techniques
```
Substitution: u = g(x), du = g'(x)dx
Parts: ∫u dv = uv - ∫v du  (ILATE rule for u)
Partial fractions: split rational functions
Trigonometric substitution:
  √(a²-x²): x = a sinθ
  √(a²+x²): x = a tanθ
  √(x²-a²): x = a secθ
```

### Differential Equations
- Separable: dy/dx = f(x)g(y) → ∫dy/g(y) = ∫f(x)dx
- Linear: dy/dx + P(x)y = Q(x); IF = e^∫P(x)dx
- Solution: y × IF = ∫Q(x) × IF dx + C
- Homogeneous: dy/dx = f(y/x); y = vx substitution

## Vectors

### 3D Vectors
```
Vector: a = (a₁, a₂, a₃); |a| = √(a₁²+a₂²+a₃²)
Dot product: a·b = a₁b₁+a₂b₂+a₃b₃ = |a||b|cosθ
Cross product: a×b = (a₂b₃-a₃b₂, a₃b₁-a₁b₃, a₁b₂-a₂b₁)
|a×b| = |a||b|sinθ = area of parallelogram
Scalar triple: [a,b,c] = a·(b×c) = volume of parallelepiped
```

## Probability and Statistics

### Probability Rules
```
P(A∪B) = P(A)+P(B)-P(A∩B)
P(A∩B) = P(A)×P(B|A)
P(A|B) = P(B|A)×P(A)/P(B)  [Bayes]
Independent: P(A∩B) = P(A)×P(B)
```

### Distributions
- **Binomial**: n trials, p success; P(X=k) = nCk pᵏ(1-p)^(n-k); μ=np, σ²=np(1-p)
- **Poisson**: rare events; P(X=k) = e^(-λ)λᵏ/k!; μ=σ²=λ
- **Normal**: bell curve; 68-95-99.7% within 1-2-3σ; z = (x-μ)/σ
