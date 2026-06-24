# GATE Computer Science — Fundamentals

## GATE CSE Fundamentals

### Key Formulas and Concepts

```
ASYMPTOTIC NOTATION:
  O(f(n)): upper bound | Omega(f(n)): lower bound | Theta(f(n)): tight bound
  Common complexities (increasing order):
    O(1) < O(log n) < O(n) < O(n log n) < O(n^2) < O(n^3) < O(2^n) < O(n!)

RECURRENCE RELATIONS — MASTER THEOREM:
  T(n) = aT(n/b) + f(n)
  Case 1: f(n) = O(n^(log_b(a) - ε)) → T(n) = Θ(n^log_b(a))
  Case 2: f(n) = Θ(n^log_b(a)) → T(n) = Θ(n^log_b(a) × log n)
  Case 3: f(n) = Ω(n^(log_b(a) + ε)) → T(n) = Θ(f(n))

SORTING COMPARISON:
  Algorithm   Best      Average    Worst     Space   Stable
  Bubble      O(n)      O(n^2)     O(n^2)    O(1)    Yes
  Selection   O(n^2)    O(n^2)     O(n^2)    O(1)    No
  Insertion   O(n)      O(n^2)     O(n^2)    O(1)    Yes
  Merge       O(nlogn)  O(nlogn)   O(nlogn)  O(n)    Yes
  Quick       O(nlogn)  O(nlogn)   O(n^2)    O(logn) No
  Heap        O(nlogn)  O(nlogn)   O(nlogn)  O(1)    No
  Counting    O(n+k)    O(n+k)     O(n+k)    O(k)    Yes

GRAPH ALGORITHMS:
  BFS: shortest path (unweighted) | level-order | connected components
  DFS: cycle detection | topological sort | SCC (Kosaraju)
  Dijkstra: O((V+E)logV) | non-negative weights | SSSP
  Bellman-Ford: O(VE) | handles negative weights | detects negative cycle
  Floyd-Warshall: O(V^3) | all-pairs shortest path
  Prim/Kruskal: O(ElogV) | Minimum Spanning Tree

PROCESS SCHEDULING:
  FCFS: average wait = (sum of all wait times) / n
  SJF: minimum average wait (non-preemptive optimal)
  Round Robin: average = depends on quantum and burst times
  
  Example: P1(24ms) P2(3ms) P3(3ms) arrive at 0
  FCFS: wait = 0, 24, 27 → avg = 17ms
  SJF:  wait = 6, 0, 3 → avg = 3ms

MEMORY — PAGE FAULT CALCULATION:
  3 frames, reference string: 7,0,1,2,0,3,0,4,2,3,0,3,2
  FIFO: count page faults step by step
  LRU: evict least recently used
  Optimal: evict page used furthest in future
```

## Revision Notes
```
MASTER THEOREM: memorise 3 cases | applies when T(n)=aT(n/b)+f(n)
SORTING: merge sort only O(nlogn) stable | quick sort worst O(n^2) | heap in-place
DIJKSTRA: non-negative weights only | Bellman-Ford: handles negatives
GATE PATTERN: 2-mark questions carry double penalty (-0.67) | prioritise accuracy
PAGE REPLACEMENT: Optimal (best) > LRU > FIFO | Belady's anomaly in FIFO
```
