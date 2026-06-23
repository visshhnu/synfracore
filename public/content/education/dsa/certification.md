# Data Structures & Algorithms Certification Guide

## Certifications Available

| Cert / Path | Provider | Cost | Format |
|-------------|----------|------|--------|
| **DSA Specialization** | Coursera / UCSD | $50/mo | Project-based |
| **GATE CS** | IIT/IISc | Rs.1,800 | MCQ + NAT, 3 hrs |
| **LeetCode Premium** | LeetCode | $35/mo | Guided coding |
| **GeeksForGeeks DSA Course** | GFG | Rs.3,999 | Video + practice |

---

## Core Topics

```python
# BIG-O COMPLEXITY
# O(1) constant  O(log n) binary search  O(n) linear  O(n log n) merge sort
# O(n^2) bubble sort  O(2^n) subsets  O(n!) permutations

# SORTING
def merge_sort(arr):
    if len(arr) <= 1: return arr
    mid = len(arr) // 2
    L, R = merge_sort(arr[:mid]), merge_sort(arr[mid:])
    res, i, j = [], 0, 0
    while i < len(L) and j < len(R):
        if L[i] <= R[j]: res.append(L[i]); i += 1
        else: res.append(R[j]); j += 1
    return res + L[i:] + R[j:]   # O(n log n) stable

# BINARY SEARCH
def binary_search(arr, target):
    lo, hi = 0, len(arr) - 1
    while lo <= hi:
        mid = (lo + hi) // 2
        if arr[mid] == target: return mid
        elif arr[mid] < target: lo = mid + 1
        else: hi = mid - 1
    return -1   # O(log n)

# GRAPHS — BFS and DFS
from collections import deque

def bfs(graph, start):
    visited, queue = {start}, deque([start])
    order = []
    while queue:
        node = queue.popleft()
        order.append(node)
        for nbr in graph[node]:
            if nbr not in visited:
                visited.add(nbr); queue.append(nbr)
    return order

def dfs(graph, node, visited=None):
    if visited is None: visited = set()
    visited.add(node)
    for nbr in graph[node]:
        if nbr not in visited:
            dfs(graph, nbr, visited)

# DYNAMIC PROGRAMMING — 0/1 Knapsack
def knapsack(weights, values, W):
    n = len(weights)
    dp = [[0]*(W+1) for _ in range(n+1)]
    for i in range(1, n+1):
        for w in range(W+1):
            dp[i][w] = dp[i-1][w]
            if weights[i-1] <= w:
                dp[i][w] = max(dp[i][w], dp[i-1][w-weights[i-1]] + values[i-1])
    return dp[n][W]

# HEAPS — using Python heapq (min-heap)
import heapq
heap = []
heapq.heappush(heap, 3)
heapq.heappush(heap, 1)
heapq.heappush(heap, 2)
print(heapq.heappop(heap))  # 1 (smallest)

# K largest elements
k_largest = heapq.nlargest(k, arr)
```

---

## Key Algorithms Reference

```
SORTING:     Quick O(n log n) avg | Merge O(n log n) stable | Heap O(n log n)
             Counting O(n+k) | Radix O(nk) — use for known-range integers
GRAPH:       Dijkstra O((V+E) log V) shortest path (non-negative weights)
             Bellman-Ford O(VE) — handles negative weights
             Floyd-Warshall O(V^3) — all-pairs shortest path
             Prim/Kruskal O(E log V) — minimum spanning tree
TREES:       In-order (sorted BST) | Pre-order (serialize) | Post-order (delete)
             Height: O(log n) balanced | O(n) worst | Self-balancing: AVL, Red-Black
DP PATTERNS: Fibonacci | Knapsack | LCS | LIS | Matrix Chain | Edit Distance
STRINGS:     KMP O(n+m) pattern matching | Rabin-Karp O(n+m) avg | Trie for prefix
```

---

## Study Resources

- **GeeksForGeeks** (geeksforgeeks.org) — largest free DSA resource
- **LeetCode** — best platform for coding interview practice (600+ free problems)
- **CLRS Introduction to Algorithms** — definitive textbook
- **Abdul Bari YouTube** — excellent algorithm visualizations (free)

## Revision Notes
```
COMPLEXITY: O(1)<O(log n)<O(n)<O(n log n)<O(n^2)<O(2^n)
ARRAYS: O(1) access | O(n) insert/delete | O(n log n) sort
LINKED LIST: O(1) insert/delete at head | O(n) search | no random access
HASH TABLE: O(1) avg for insert/search/delete | O(n) worst (collisions)
TREE (BST): O(log n) avg | O(n) worst (unbalanced) | O(n log n) sort
HEAP: O(log n) insert/delete | O(1) peek min/max | O(n) build
DP: memoization (top-down, recursive) | tabulation (bottom-up, iterative)
```
