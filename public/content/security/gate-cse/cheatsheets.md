# GATE CSE Cheatsheet

## Complexity Quick Reference
| Problem | Complexity |
|---------|-----------|
| Sorting (comparison-based) | O(n log n) |
| Binary Search | O(log n) |
| BFS/DFS | O(V+E) |
| Dijkstra (heap) | O((V+E) log V) |
| Floyd-Warshall | O(V^3) |
| Matrix multiply | O(n^3) |
| LCS | O(mn) |
| Knapsack 0/1 | O(nW) |
| Heap build | O(n) |
| Quick sort average | O(n log n) |

## Master Theorem
T(n) = aT(n/b) + f(n), where a≥1, b>1
- Case 1: f(n) = O(n^(log_b(a)-ε)) → T(n) = Θ(n^log_b(a))
- Case 2: f(n) = Θ(n^log_b(a)) → T(n) = Θ(n^log_b(a) log n)
- Case 3: f(n) = Ω(n^(log_b(a)+ε)) and regularity → T(n) = Θ(f(n))

## Key Automata and Language Properties
| Language Type | Automaton | Closed Under |
|---------------|-----------|-------------|
| Regular | DFA/NFA | Union, ∩, complement, concat, * |
| CFL | PDA | Union, concat, * (NOT ∩, complement) |
| Recursive | TM (accept+reject) | Union, ∩, complement |
| RE | TM (accept only) | Union, concat |

## Normal Forms
- **CNF** (Chomsky): A → BC or A → a (terminal)
- **GNF** (Greibach): A → aα (RHS starts with terminal)
- **2NF**: No partial dependencies on candidate key
- **3NF**: No transitive dependencies
- **BCNF**: Every determinant is a candidate key

## SQL Aggregate & Window Functions
```sql
-- Aggregates
SELECT dept, COUNT(*), AVG(salary), MAX(salary)
FROM employees GROUP BY dept HAVING COUNT(*) > 5;

-- Window
SELECT name, salary,
  RANK() OVER (PARTITION BY dept ORDER BY salary DESC) AS rnk
FROM employees;
```

## OSI Layers (All People Seem To Need Data Processing)
7-Application | 6-Presentation | 5-Session | 4-Transport | 3-Network | 2-Data Link | 1-Physical

## Process Scheduling
| Algorithm | Preemptive | Starvation | Best For |
|-----------|-----------|-----------|---------|
| FCFS | No | No | Simple batch |
| SJF | No | Yes | Minimize avg wait |
| SRTF | Yes | Yes | Minimize avg wait |
| Priority | Optional | Yes | Priority tasks |
| Round Robin | Yes | No | Time sharing |

## Key Theorems
- Rice's theorem: All non-trivial semantic properties of RE languages are undecidable
- Halting problem: Undecidable
- PCP (Post Correspondence Problem): Undecidable
- CFL ∩ Regular = CFL (closed)
- CFL ∩ CFL ≠ necessarily CFL (not closed under intersection)
