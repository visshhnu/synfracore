# GATE CSE Intermediate Preparation

## High-Weightage Topics

### Algorithms — Deep Dive
**Recurrences:**
```
T(n) = 2T(n/2) + n  → O(n log n)  [Master Theorem case 2]
T(n) = T(n-1) + n   → O(n^2)      [Substitution]
T(n) = 2T(n/2) + n^2 → O(n^2)    [Master Theorem case 3]
```

**DP Classic Problems:**
- Longest Common Subsequence: dp[i][j] = dp[i-1][j-1]+1 if match, else max(dp[i-1][j], dp[i][j-1])
- Matrix Chain Multiplication: dp[i][j] = min cost to multiply A_i...A_j
- Optimal BST: dp[i][j] = min expected search cost for keys i to j

**Graph Algorithms:**
- Dijkstra: O((V+E) log V) with min-heap. No negative weights.
- Bellman-Ford: O(VE). Detects negative cycles.
- Floyd-Warshall: O(V^3). All-pairs shortest paths.
- Kruskal: O(E log E). Sort edges, union-find.
- Prim: O((V+E) log V). Greedy MST.

### Theory of Computation
**DFA Minimization:**
1. Remove unreachable states
2. Merge indistinguishable states (table-filling algorithm)

**Pumping Lemma for Regular Languages:**
If L is regular, then ∃ p such that for |w| ≥ p, w = xyz where |xy| ≤ p, |y| ≥ 1, and xy^i z ∈ L for all i ≥ 0.

**CFL Properties:**
- Closed under union, concatenation, Kleene star
- NOT closed under intersection or complement

**Undecidable Problems:**
- Halting Problem
- Post Correspondence Problem
- Emptiness of CFL intersection

### Database — Advanced SQL
```sql
-- Relational Algebra
π_{name}(σ_{age>25}(Student))  -- Project name where age > 25

-- Functional Dependencies
{A,B} → C means knowing A and B determines C
-- Finding candidate keys: compute closure of attribute sets

-- Armstrong's Axioms
-- Reflexivity: if Y ⊆ X then X → Y
-- Augmentation: X → Y then XZ → YZ
-- Transitivity: X → Y, Y → Z then X → Z
```

### Computer Networks — Key Protocols
**TCP Three-Way Handshake:**
SYN → SYN-ACK → ACK

**Sliding Window:**
- Go-Back-N: Retransmit from error. Window size < 2^n.
- Selective Repeat: Retransmit only errored. Window size ≤ 2^(n-1).

**IP Subnetting:**
- CIDR notation: 192.168.1.0/24 = 256 addresses, 254 usable
- Subnet mask /26 = 255.255.255.192, 64 addresses per subnet

**Routing Protocols:**
- Distance Vector (RIP): Bellman-Ford, count-to-infinity problem
- Link State (OSPF): Dijkstra, converges faster

## Previous Year Pattern Analysis
- Algorithms: ~15-20 marks (highest)
- DS: ~10-12 marks
- TOC: ~8-10 marks
- DBMS: ~8-10 marks
- OS: ~8-10 marks
- Networks: ~8-10 marks
- CO & Architecture: ~8-10 marks
- Discrete Math: ~8-10 marks
- Programming: ~5-8 marks
