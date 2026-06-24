# Engineering Mathematics Fundamentals

## Sets and Basic Algebra

```
SET OPERATIONS:
  Union A∪B: elements in A or B or both
  Intersection A∩B: elements in both A and B
  Complement A': elements not in A (with respect to universal set U)
  Difference A-B: elements in A but not in B
  Symmetric Difference A⊕B: (A-B)∪(B-A) = (A∪B)-(A∩B)
  
  Power Set P(A): set of all subsets including empty set and A itself
  If |A| = n, then |P(A)| = 2^n
  
  Cartesian Product A×B: set of all ordered pairs (a,b) where a∈A, b∈B
  |A×B| = |A| × |B|

DE MORGAN'S LAWS:
  (A∪B)' = A' ∩ B' (complement of union = intersection of complements)
  (A∩B)' = A' ∪ B' (complement of intersection = union of complements)

COUNTING PRINCIPLES:
  Addition: if A and B disjoint, |A∪B| = |A| + |B|
  Multiplication: if step 1 has m ways, step 2 has n ways → m×n total
  Inclusion-Exclusion: |A∪B| = |A| + |B| - |A∩B|
  
  Permutations: nPr = n!/(n-r)! — ordered selection
  Combinations: nCr = n!/[r!(n-r)!] — unordered selection
  nCr = nC(n-r) | nC0 = nCn = 1 | nC1 = n
```

## Propositional Logic Basics

```
CONNECTIVES:
  AND (∧): both true | OR (∨): at least one true
  NOT (¬): opposite | Implication (→): false only when T→F
  Biconditional (↔): same truth value

TRUTH TABLE — IMPLICATION (p → q):
  T,T → T | T,F → F | F,T → T | F,F → T
  "False implies anything" is considered true

LOGICAL EQUIVALENCES:
  Double negation: ¬(¬p) ≡ p
  De Morgan: ¬(p∧q) ≡ ¬p∨¬q | ¬(p∨q) ≡ ¬p∧¬q
  Contrapositive: p→q ≡ ¬q→¬p (useful for proofs)
  Implication: p→q ≡ ¬p∨q

TAUTOLOGIES:
  Law of excluded middle: p ∨ ¬p
  Law of non-contradiction: ¬(p ∧ ¬p)
  Hypothetical syllogism: (p→q) ∧ (q→r) → (p→r)
```

## Calculus Essentials

```
LIMITS:
  L'Hopital: if f(a)/g(a) = 0/0 or ∞/∞, then lim f(x)/g(x) = lim f'(x)/g'(x)
  
DERIVATIVE RULES:
  d/dx(xⁿ) = nxⁿ⁻¹ | d/dx(eˣ) = eˣ | d/dx(ln x) = 1/x
  d/dx(sin x) = cos x | d/dx(cos x) = -sin x
  Chain: d/dx[f(g(x))] = f'(g(x)) × g'(x)
  Product: (uv)' = u'v + uv'

INTEGRATION:
  ∫xⁿdx = xⁿ⁺¹/(n+1) + C (n ≠ -1)
  ∫(1/x)dx = ln|x| + C
  ∫eˣdx = eˣ + C
  Fundamental theorem: ∫[a to b] f(x)dx = F(b) - F(a) where F' = f
```

## Study Resources
- **NPTEL Engineering Mathematics** — free IIT video lectures, all topics
- **Kenneth Rosen Discrete Mathematics** — gold standard for discrete maths
- **Gilbert Strang Linear Algebra** — MIT OCW free video series (best LA resource)
- **GFG Mathematics for GATE** — free, exam-oriented notes and practice
