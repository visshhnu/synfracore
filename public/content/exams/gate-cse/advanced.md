# GATE CSE — Advanced + Cheatsheet + Interview

## Previous Year Analysis (Key Topics)

```
High frequency topics in GATE CSE:
  1. Algorithms (sorting, graph, DP) — 13 marks
  2. Programming/DS (recursion, trees, heaps) — 13 marks
  3. Databases (SQL, normalization, transactions) — 9 marks
  4. OS (process sync, scheduling, memory) — 9 marks
  5. Networks (IP, routing, transport) — 9 marks

GATE-specific tricks:
  - Read all options before solving
  - Elimination method often faster
  - Check boundary conditions
  - For counting problems, list then generalize
  - Time management: 1 mark = 1-2 min, 2 mark = 3-4 min
```

## GATE Cheatsheet

```
# ── COMPLEXITY ────────────────────────────────────────────
O(1) < O(log n) < O(√n) < O(n) < O(n log n) < O(n²) < O(n³) < O(2^n) < O(n!)

Hash table: O(1) avg, O(n) worst
BST: O(log n) avg, O(n) worst (skewed)
Balanced BST (AVL/RB): O(log n) always

# ── GRAPH ALGORITHMS ─────────────────────────────────────
Dijkstra (no neg): O((V+E) log V) with heap
Bellman-Ford (neg): O(VE), detects neg cycles
Floyd-Warshall:  O(V³), all pairs
BFS/DFS:         O(V+E)
Prim's MST:      O(E log V)
Kruskal's MST:   O(E log E)
Topological sort: O(V+E)

# ── LANGUAGES ─────────────────────────────────────────────
Regular < Context-Free < Context-Sensitive < Recursive < RE
DFA/NFA → Regular languages
PDA → CFLs
TM → Recursive + RE

# ── NORMALIZATION ─────────────────────────────────────────
1NF: Atomic values
2NF: No partial dependency
3NF: No transitive dependency
BCNF: Every determinant is candidate key
BCNF ⊆ 3NF ⊆ 2NF ⊆ 1NF
```
