# GATE CSE — Core Subjects

## Engineering Mathematics

```
Discrete Mathematics:
  Set theory: unions, intersections, power sets
  Relations: reflexive, symmetric, transitive, equivalence
  Functions: one-to-one, onto, bijection
  Graph theory: Eulerian/Hamiltonian paths, spanning trees
  Combinatorics: permutations, combinations, pigeonhole principle
  Logic: propositional logic, predicate logic, resolution

Linear Algebra:
  Matrix operations, determinants, rank
  Eigenvalues and eigenvectors
  Systems of linear equations (Gaussian elimination)

Calculus:
  Limits, derivatives, integration
  Taylor series, L'Hopital's rule

Probability & Statistics:
  Conditional probability, Bayes' theorem
  Random variables, distributions (Binomial, Poisson, Normal)
  Mean, variance, standard deviation
```

## Algorithms — Key Concepts

```python
# Time complexities to memorize:
# Sorting: O(n log n) for merge/heap/quick (average)
# BFS/DFS: O(V + E)
# Dijkstra: O((V + E) log V) with binary heap
# Prim's/Kruskal's MST: O(E log V)
# Floyd-Warshall: O(V³)
# Bellman-Ford: O(VE)

# Recurrence relations (Master Theorem):
# T(n) = aT(n/b) + f(n)
# Compare f(n) with n^(log_b(a)):
#   f(n) < n^(log_b a):  T(n) = Θ(n^log_b(a))
#   f(n) = n^(log_b a):  T(n) = Θ(n^log_b(a) × log n)
#   f(n) > n^(log_b a):  T(n) = Θ(f(n))

# Examples:
# MergeSort: T(n) = 2T(n/2) + n → Θ(n log n)
# BinarySearch: T(n) = T(n/2) + 1 → Θ(log n)
```
