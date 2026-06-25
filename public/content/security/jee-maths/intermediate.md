# JEE Mathematics Intermediate

## Trigonometry

### Trigonometric Identities
```
sin²θ + cos²θ = 1
1 + tan²θ = sec²θ
1 + cot²θ = csc²θ
sin(A+B) = sinA cosB + cosA sinB
sin(A-B) = sinA cosB - cosA sinB
cos(A+B) = cosA cosB - sinA sinB
cos(A-B) = cosA cosB + sinA sinB
sin 2A = 2 sinA cosA
cos 2A = cos²A - sin²A
sin A + sin B = 2 sin((A+B)/2) cos((A-B)/2)
sin A - sin B = 2 cos((A+B)/2) sin((A-B)/2)
```

### Inverse Trigonometry
- Domain: arcsin, arccos → [-1, 1]; arctan → ℝ
- Range: arcsin → [-π/2, π/2]; arccos → [0, π]; arctan → (-π/2, π/2)
- arcsin x + arccos x = π/2
- arctan x + arctan(1/x) = π/2 (x > 0)
- arctan x + arctan y = arctan((x+y)/(1-xy)) when xy < 1

## Matrices and Determinants

### Key Properties
```
det(AB) = det(A) × det(B)
det(A^T) = det(A)
det(kA) = kⁿ det(A) for n×n matrix
A⁻¹ = adj(A)/det(A)
(AB)⁻¹ = B⁻¹A⁻¹
det(A⁻¹) = 1/det(A)
```

### Solving Ax = b
- Cramer's rule: xᵢ = det(Aᵢ)/det(A) where Aᵢ replaces column i with b
- Unique solution: det(A) ≠ 0
- No/infinite solutions: det(A) = 0

## Vectors

### Operations
```
Dot product: a·b = |a||b|cosθ = a₁b₁+a₂b₂+a₃b₃
Cross product: |a×b| = |a||b|sinθ
  a×b = |i  j  k |
        |a₁ a₂ a₃|
        |b₁ b₂ b₃|
Scalar triple product: [a b c] = a·(b×c) = Volume of parallelepiped
Vector triple: a×(b×c) = b(a·c) - c(a·b)
```

## Integral Calculus

### Area and Volume
```
Area between curves: A = ∫[a to b] |f(x)-g(x)| dx
Area by parametric: A = ∫ y dx = ∫ y(t) x'(t) dt
Volume (disk): V = π ∫[a to b] [f(x)]² dx
Volume (shell): V = 2π ∫[a to b] x f(x) dx
Arc length: L = ∫[a to b] √(1+[f'(x)]²) dx
```

### Important Definite Integral Properties
- ∫[a to b] f(x)dx = -∫[b to a] f(x)dx
- ∫[0 to 2a] f(x)dx = 2∫[0 to a] f(x)dx if f(2a-x)=f(x)
- ∫[-a to a] f(x)dx = 2∫[0 to a] f(x)dx if f is even
- ∫[-a to a] f(x)dx = 0 if f is odd

## Differential Equations

### Solution Methods
- Separable: dy/dx = f(x)g(y) → ∫dy/g(y) = ∫f(x)dx
- Linear 1st order: dy/dx + P(x)y = Q(x)
  IF = e^∫P dx; solution: y×IF = ∫Q×IF dx
- Homogeneous: dy/dx = f(y/x); substitute y = vx
- Exact: M dx + N dy = 0 where ∂M/∂y = ∂N/∂x
