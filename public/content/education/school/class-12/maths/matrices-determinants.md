# Matrices and Determinants

## Why This Chapter Matters
Matrices and Determinants together give 10-15 marks in CBSE Class 12 boards. Properties of determinants, inverse of matrix, and solving system of equations using matrices are all tested in both 3-mark and 5-mark questions.

## Core Concepts

### 1. Matrix Basics
Matrix: rectangular array of numbers in rows and columns. Order = m × n (m rows, n columns).

**Types:**
Square matrix: m = n. | Row matrix: 1 row. | Column matrix: 1 column.
Zero matrix: all elements 0. | Identity matrix (I): diagonal elements 1, rest 0.
Symmetric: Aᵀ = A. | Skew-symmetric: Aᵀ = -A (diagonal elements = 0).

**Operations:**
Addition: same order only. Cᵢⱼ = Aᵢⱼ + Bᵢⱼ.
Multiplication: A(m×n) × B(n×p) = C(m×p). Number of columns in first = rows in second.
NOT commutative (AB ≠ BA generally). IS associative: A(BC) = (AB)C.

**Transpose:** Aᵀ: interchange rows and columns. (Aᵀ)ᵀ = A. (AB)ᵀ = BᵀAᵀ.

### 2. Determinant
|A| or det(A) — a scalar value for square matrices.

**2×2:** |a b; c d| = ad - bc.

**3×3 (expansion along row 1):**
|a₁ b₁ c₁|
|a₂ b₂ c₂| = a₁(b₂c₃-b₃c₂) - b₁(a₂c₃-a₃c₂) + c₁(a₂b₃-a₃b₂)
|a₃ b₃ c₃|

**Properties:**
|Aᵀ| = |A|. |AB| = |A||B|. |kA| = kⁿ|A| (n = order).
If two rows (or columns) are identical → |A| = 0.
If any row = 0 → |A| = 0.
Interchanging two rows → sign of det changes.
If row = linear combination of other rows → |A| = 0 (rows linearly dependent).

### 3. Cofactors and Adjugate
Cofactor Cᵢⱼ = (-1)^(i+j) × Mᵢⱼ where Mᵢⱼ = minor (det of matrix after deleting row i, col j).

Adjugate (adj A) = transpose of cofactor matrix.
Inverse: A⁻¹ = adj(A)/|A| — exists only if |A| ≠ 0.

Properties: A(adj A) = (adj A)A = |A|·I.
|adj A| = |A|^(n-1) for n×n matrix.

### 4. Solving Linear Equations (Matrix Method)
System AX = B.
If |A| ≠ 0: unique solution X = A⁻¹B.
If |A| = 0:
  - consistent (infinite solutions) if adj(A)·B = 0
  - inconsistent (no solution) if adj(A)·B ≠ 0

**Cramer's Rule:**
x = D₁/D, y = D₂/D, z = D₃/D
D = |A|, D₁ = replace column 1 with constants, etc.

## Board Examples

**Q1:** If A = [2 3; 4 5], find A⁻¹.
|A| = 10-12 = -2. adj(A) = [5 -3; -4 2].
A⁻¹ = (1/-2)[5 -3; -4 2] = [-5/2 3/2; 2 -1].

**Q2:** Solve using matrix method: x+y=3, 2x-y=3.
A = [1 1; 2 -1], B = [3;3]. |A| = -1-2 = -3.
A⁻¹ = (1/-3)[-1 -1; -2 1] = [1/3 1/3; 2/3 -1/3].
X = A⁻¹B = [1/3×3+1/3×3; 2/3×3-1/3×3] = [2;1]. x=2, y=1.

## PYQs (CBSE)

**CBSE 2023:** If A = [2 -1; 3 4] and A² - 6A + kI = 0, find k.
A² = [1 -6; 18 13]. A²-6A = [1-12 -6+6; 18-18 13-24] = [-11 0; 0 -11] = -11I.
So -11I + kI = 0 → k = 11.

**CBSE 2022:** Show that the matrix A = [0 1 -1; -1 0 1; 1 -1 0] is skew-symmetric.
Aᵀ = [0 -1 1; 1 0 -1; -1 1 0] = -A. Hence skew-symmetric.

## Revision Notes
```
MATRIX MULTIPLICATION: (m×n)(n×p) = (m×p). Columns of 1st = rows of 2nd.
NOT commutative. IS associative.
TRANSPOSE: (AB)ᵀ = BᵀAᵀ

DETERMINANT:
2×2: ad-bc
3×3: expand along row/column (signs: + - + / - + - / + - +)
Properties: |Aᵀ|=|A| | |AB|=|A||B| | identical rows/col → det=0

INVERSE: A⁻¹ = adj(A)/|A| (only if |A|≠0)
adj(A) = transpose of cofactor matrix

SYSTEM AX=B:
|A|≠0 → unique solution X=A⁻¹B
|A|=0, adj(A)B=0 → infinite solutions
|A|=0, adj(A)B≠0 → no solution
```
