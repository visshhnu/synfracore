# Engineering Mathematics Intermediate Topics

## Probability and Statistics

```
PROBABILITY THEORY:
  Sample space S: set of all possible outcomes
  Event A ⊆ S: subset of outcomes | P(A) ∈ [0,1] | P(S) = 1
  
  Mutually exclusive: A∩B = ∅ → P(A∪B) = P(A) + P(B)
  Independent: P(A∩B) = P(A)×P(B) (occurrence of one doesn't affect other)
  Mutually exclusive ≠ independent (very common confusion!)
  
  Conditional probability: P(A|B) = P(A∩B)/P(B)
  Bayes' theorem: P(A|B) = P(B|A)×P(A) / P(B)
    P(B) = P(B|A₁)P(A₁) + P(B|A₂)P(A₂) + ... (total probability theorem)

RANDOM VARIABLES:
  Discrete: probability mass function (PMF) P(X=x)
  Continuous: probability density function (PDF) f(x)
  CDF: F(x) = P(X ≤ x)
  
  Expected Value: E(X) = Σ xᵢP(xᵢ) [discrete] | ∫x f(x)dx [continuous]
  Variance: Var(X) = E(X²) - [E(X)]²
  Standard deviation: σ = √Var(X)

KEY DISTRIBUTIONS:
  Binomial B(n,p): P(X=r) = ⁿCᵣ pʳ(1-p)ⁿ⁻ʳ | E(X)=np | Var=np(1-p)
  Poisson P(λ): P(X=k) = e^(-λ)λᵏ/k! | E(X)=Var=λ
  Normal N(μ,σ²): bell curve | E(X)=μ | Var=σ² | standardize: Z=(X-μ)/σ
    P(μ-σ < X < μ+σ) ≈ 0.68 | P(μ-2σ < X < μ+2σ) ≈ 0.95
    P(μ-3σ < X < μ+3σ) ≈ 0.997
```

## Graph Theory

```
TERMINOLOGY:
  Graph G = (V, E) | |V| = vertices | |E| = edges
  Degree: deg(v) = number of edges incident to v
  Handshaking: Σdeg(v) = 2|E| (always even sum)
  
  Path: sequence of distinct vertices connected by edges
  Cycle: path that starts and ends at same vertex
  Connected: path exists between every pair of vertices
  
TYPES OF GRAPHS:
  Complete Kₙ: every vertex connected to every other | |E| = n(n-1)/2
  Bipartite: vertices partitioned into two sets, edges only between sets
  Tree: connected and acyclic | n vertices, exactly n-1 edges
  Planar: can be drawn without edge crossings | Euler's formula: V-E+F=2

GRAPH REPRESENTATIONS:
  Adjacency matrix: n×n | entry (i,j)=1 if edge exists | symmetric for undirected
  Adjacency list: list of neighbors for each vertex
  Space: matrix O(n²) | list O(n+e) — list better for sparse graphs
  
ALGORITHMS:
  BFS: O(V+E), shortest path (unweighted), level-order
  DFS: O(V+E), cycle detection, topological sort, connected components
  Dijkstra: O((V+E)log V), shortest path (non-negative weights)
  Prim/Kruskal: O(E log E), minimum spanning tree
  Topological sort: only for DAG (directed acyclic graph)
```

## Study Resources
- **GATE 2010-2024 Mathematics Papers** — solve all previous questions topic-wise
- **Made Easy Engineering Maths** — well-organized for GATE preparation
- **MIT OCW 6.042J Mathematics for Computer Science** — excellent, free, comprehensive
- **GateOverflow** (gateoverflow.in) — community solutions and explanations
