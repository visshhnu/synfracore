# Matrices and Determinants

## Why This Chapter Matters
High-weightage JEE topic — 6-10 marks. Matrix operations, determinants, inverses, and system of equations appear every year. Be fast with 2x2 and 3x3 determinants.

## Core Concepts

### 1. Types of Matrices
Row matrix (1 row) | Column matrix (1 col) | Square matrix (n x n)
Diagonal matrix | Identity matrix I | Zero matrix O
Symmetric: A = A^T | Skew-symmetric: A = -A^T (diagonal elements = 0)

### 2. Matrix Operations
Addition/Subtraction: same order, element-wise
Scalar multiplication: multiply each element
Multiplication: A(mxn) x B(nxp) = C(mxp)
C[i][j] = sum over k of A[i][k] x B[k][j]

AB != BA in general (non-commutative)
(AB)^T = B^T A^T | (A^T)^T = A

### 3. Determinants
For 2x2: |a b; c d| = ad - bc
For 3x3 (expansion along first row):
|a b c; d e f; g h i| = a(ei-fh) - b(di-fg) + c(dh-eg)

Properties:
- |A^T| = |A|
- |AB| = |A||B|
- |kA| = k^n |A| (n x n matrix)
- Swap two rows/cols: sign changes
- Two identical rows/cols: determinant = 0
- |A^-1| = 1/|A|

### 4. Adjugate and Inverse
Cofactor C[ij] = (-1)^(i+j) x M[ij] (M = minor)
adj(A) = transpose of cofactor matrix
A^-1 = adj(A) / |A|   (only if |A| != 0, i.e., A is non-singular)

For 2x2: A^-1 = (1/(ad-bc)) x |d -b; -c a|

### 5. System of Equations (Cramer's Rule)
AX = B where A is coefficient matrix
If |A| != 0: unique solution X = A^-1 B
If |A| = 0 and B is consistent: infinite solutions
If |A| = 0 and inconsistent: no solution

Cramer's Rule: x = |A1|/|A|, y = |A2|/|A|, z = |A3|/|A|
Where A1, A2, A3 = A with respective column replaced by B

## Solved Examples

**Q1:** Find inverse of A = [2 1; 5 3]
|A| = 6-5 = 1
adj(A) = [3 -1; -5 2]
A^-1 = adj(A)/1 = [3 -1; -5 2]
Verify: AA^-1 = [2 1; 5 3][3 -1; -5 2] = [6-5 -2+2; 15-15 -5+6] = [1 0; 0 1] = I ✓

**Q2:** If A = [1 2; 3 4], find |3A|.
|A| = 4-6 = -2. |3A| = 3^2 x |A| = 9 x (-2) = -18

## PYQs
**2024:** If A is 3x3 matrix with |A|=5, then |adj(A)| = ?
|adj(A)| = |A|^(n-1) = 5^2 = 25

**2023:** Solve: 2x+y=5, x+3y=5 using Cramer's rule.
|A| = 6-1 = 5. |A1| = 15-5=10. |A2| = 10-5=5.
x = 10/5 = 2, y = 5/5 = 1.

**2022:** A is skew-symmetric 3x3 matrix. Show |A| = 0.
A = -A^T => |A| = |−A^T| = (-1)^3 |A^T| = -|A| => 2|A|=0 => |A|=0.

## MCQ Practice
Q1. If A = [1 2; 3 4], then A^T is:
(A) [1 3; 2 4] (B) [4 2; 3 1] (C) [1 2; 3 4] (D) [4 3; 2 1]
Answer: A

Q2. For what value of x is [x 2; 3 x] singular?
|A| = x^2 - 6 = 0 => x = +/-sqrt(6)

Q3 (Hard). If A+B = [1 0; 0 1] and A-B = [0 1; 1 0], find AB.
A = [1/2 1/2; 1/2 1/2] and B = [1/2 -1/2; -1/2 1/2]
AB = [0 0; 0 0]

## Revision Notes
```
DETERMINANT:
2x2: ad-bc
3x3: expand along any row/col using cofactors

KEY PROPERTIES:
|kA| = k^n |A|  (n=order)
|AB| = |A||B|
|A^T| = |A|
Two equal rows/cols => |A|=0

INVERSE:
A^-1 = adj(A)/|A|  (only if |A|!=0)
2x2 shortcut: swap diagonal, negate off-diagonal, divide by |A|

SYSTEM AX=B:
|A|!=0: unique solution
|A|=0, consistent: infinite solutions
|A|=0, inconsistent: no solution
```
