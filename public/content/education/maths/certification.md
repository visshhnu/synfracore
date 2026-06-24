# Engineering Mathematics Certification Guide

## Certifications Available

| Cert | Provider | Cost | Format |
|------|----------|------|--------|
| **GATE MA (Mathematics)** | IIT/IISc | Rs.1,800 | MCQ + NAT, 3 hrs |
| **GATE CS (Engg Maths section)** | IIT/IISc | Rs.1,800 | MCQ + NAT |
| **NPTEL Engineering Mathematics** | NPTEL | Free | Proctored exam |
| **MIT OCW 18.06 Linear Algebra** | MIT | Free | Self-paced |

---

## GATE Mathematics Syllabus

```
LINEAR ALGEBRA (15-20% of GATE CS Maths):
  Matrices: types, operations, transpose, determinant
  System of linear equations: Gauss elimination, consistent/inconsistent
  Rank: definition, methods to find, rank-nullity theorem
  Eigenvalues and eigenvectors: characteristic equation, properties
  Cayley-Hamilton theorem: every matrix satisfies its characteristic equation
  
  KEY THEOREMS:
    Rank (A) + Nullity (A) = number of columns
    For square matrix n×n: rank ≤ n
    AX = B consistent iff rank(A) = rank([A|B])

CALCULUS (10-15%):
  Limits: L'Hopital rule (0/0 or ∞/∞), squeeze theorem
  Continuity: everywhere differentiable → continuous (not converse)
  Derivatives: chain rule, product rule, quotient rule, implicit differentiation
  Mean Value Theorem: there exists c in (a,b) where f'(c) = [f(b)-f(a)]/(b-a)
  Integration: by substitution, by parts (ILATE rule), definite integrals
  
DISCRETE MATHEMATICS (30-35% of GATE CS):
  Sets: union, intersection, complement, power set (2^n elements), Cartesian product
  Relations: reflexive, symmetric, antisymmetric, transitive, equivalence
  Functions: injective (one-one), surjective (onto), bijective, inverse
  Propositional Logic: AND, OR, NOT, implication, biconditional
    Truth tables | Tautology (always true) | Contradiction (always false)
    De Morgan: NOT(A AND B) = (NOT A) OR (NOT B)
  Predicate Logic: quantifiers (∀ for all, ∃ there exists)
  
PROBABILITY AND STATISTICS (15-20%):
  Sample space, events, probability axioms
  Conditional: P(A|B) = P(A∩B)/P(B)
  Bayes: P(Aᵢ|B) = P(B|Aᵢ)P(Aᵢ)/ΣP(B|Aⱼ)P(Aⱼ)
  Independence: P(A∩B) = P(A)×P(B)
  Distributions: Binomial B(n,p) | Poisson P(λ) | Normal N(μ,σ²)
  
GRAPH THEORY (10-15%):
  Basic terms: vertex, edge, degree, path, cycle, connectivity
  Types: directed, undirected, weighted, bipartite, planar, complete
  Tree: connected acyclic graph | n nodes → n-1 edges
  Spanning tree: Kruskal and Prim algorithms
  Graph coloring: chromatic number
  Euler path (all edges once) vs Hamiltonian path (all vertices once)
```

## Revision Notes
```
GATE CS MATHS: ~15% weightage — approximately 13-15 marks
HIGH PRIORITY: Discrete Maths (logic, sets, graph theory) > Probability > Linear Algebra > Calculus

LINEAR ALGEBRA: rank, eigenvalues, Gaussian elimination — standard question types
PROBABILITY: Bayes theorem application appears almost every year
DISCRETE: logic gates, graph algorithms — highly practical and testable
```
