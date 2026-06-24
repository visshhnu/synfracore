# Engineering Mathematics Advanced Topics

## Linear Algebra Advanced

```
EIGENVALUES AND EIGENVECTORS:
  Definition: Av = λv (v is eigenvector, λ is eigenvalue)
  Characteristic equation: det(A - λI) = 0
  
  Properties:
    Sum of eigenvalues = trace(A) (sum of diagonal elements)
    Product of eigenvalues = det(A)
    If A is triangular, eigenvalues are diagonal elements
    Symmetric matrix: real eigenvalues | Orthogonal eigenvectors

  CAYLEY-HAMILTON THEOREM:
    Every matrix satisfies its own characteristic equation
    If p(λ) = 0 is characteristic equation, then p(A) = 0
    Used to find inverse: express A^(-1) in terms of lower powers of A

MATRIX DECOMPOSITIONS:
  LU decomposition: A = LU (lower × upper triangular)
    Used for: solving Ax=b, computing det, inverse
  Diagonalization: A = PDP^(-1) where D = diagonal matrix of eigenvalues
    P = matrix of eigenvectors (columns)
    Requires: n linearly independent eigenvectors (holds for symmetric matrices)

QUADRATIC FORMS:
  xᵀAx where A is symmetric matrix
  Positive definite: all eigenvalues > 0 (bowl-shaped surface)
  Negative definite: all eigenvalues < 0
  Indefinite: mixed sign eigenvalues (saddle point)
```

## Complex Numbers and Transform Theory

```
COMPLEX NUMBERS:
  z = x + iy | |z| = √(x²+y²) | arg(z) = tan⁻¹(y/x)
  Euler's formula: e^(iθ) = cos θ + i sin θ (most important!)
  De Moivre: (cos θ + i sin θ)ⁿ = cos(nθ) + i sin(nθ)
  
LAPLACE TRANSFORM (for differential equations):
  L{f(t)} = F(s) = ∫[0 to ∞] f(t)e^(-st)dt
  
  Key pairs (must memorise):
    L{1} = 1/s | L{t} = 1/s² | L{tⁿ} = n!/s^(n+1)
    L{e^(at)} = 1/(s-a) | L{sin(at)} = a/(s²+a²) | L{cos(at)} = s/(s²+a²)
  
  Properties:
    Linearity | Time shift: L{f(t-a)u(t-a)} = e^(-as)F(s)
    Convolution: L{f*g} = F(s)·G(s)
  
  Solving ODE: take Laplace → algebraic equation → solve for Y(s) → inverse Laplace

Z-TRANSFORM (discrete-time systems):
  Z{x[n]} = Σ x[n]z^(-n)
  Useful for: difference equations, digital signal processing, GATE CS
  Key pairs: Z{δ[n]} = 1 | Z{u[n]} = z/(z-1) | Z{aⁿu[n]} = z/(z-a)
```

## Study Resources
- **Kreyszig Advanced Engineering Mathematics** — comprehensive reference
- **GATE Mathematics Previous Year Solutions** — pattern analysis essential
- **3Blue1Brown Essence of Linear Algebra** (YouTube) — free, best visual intuition
- **MIT OCW 18.03 Differential Equations** — free, complete course
