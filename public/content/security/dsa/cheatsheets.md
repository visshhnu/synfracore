# DSA Cheatsheet

## Big O Quick Reference
```
O(1)      array[i], hash lookup, stack push/pop
O(log n)  binary search, BST ops (balanced)
O(n)      linear scan, BFS, DFS, single loop
O(n log n) merge sort, heapsort, heap operations x n
O(n^2)    bubble/selection/insertion sort, nested loop
O(2^n)    subsets, backtracking without pruning
O(n!)     permutations
```

## Python Collections
```python
from collections import deque, defaultdict, Counter, OrderedDict
from heapq import heappush, heappop, heapify, nlargest, nsmallest
from bisect import bisect_left, bisect_right, insort
from functools import lru_cache

# LRU Cache for memoization
@lru_cache(maxsize=None)
def dp(i, j): ...

# Counter
c = Counter("abracadabra")  # {'a':5, 'b':2, 'r':2, 'c':1, 'd':1}
c.most_common(3)

# DefaultDict
graph = defaultdict(list)
```

## Common Patterns
```
Two Pointers:      sorted arrays, palindromes, pair problems
Sliding Window:    subarray/substring, fixed/variable size
Binary Search:     sorted data, "find minimum/maximum" problems
BFS:               shortest path, level-order, word ladder
DFS:               paths, backtracking, connected components
DP:                optimization, counting, feasibility
Heap:              k-th element, merge sorted, scheduling
Union-Find:        connectivity, cycle detection in undirected
Trie:              prefix matching, autocomplete
Monotonic Stack:   next greater/smaller element
```

## Graph Algorithms Summary
```
BFS:         O(V+E) — unweighted shortest path
DFS:         O(V+E) — connectivity, cycle detection, topo sort
Dijkstra:    O((V+E)logV) — weighted shortest path (positive weights)
Bellman-Ford: O(VE) — negative weights, detect negative cycle
Floyd-Warshall: O(V^3) — all-pairs shortest path
Kruskal:     O(E log E) — MST (sort edges + Union-Find)
Prim:        O(E log V) — MST (heap-based)
Kahn:        O(V+E) — topological sort
```

## DP Patterns
```
1D DP:     Fibonacci, climb stairs, house robber
2D DP:     LCS, edit distance, knapsack, grid paths
Interval:  burst balloons, matrix chain multiplication
Tree DP:   diameter, max path sum, house robber III
Bitmask:   traveling salesman, counting subsets
```

## String Algorithms
```
KMP:           O(n+m) pattern matching with failure function
Rabin-Karp:    O(n+m) avg, rolling hash
Z-Algorithm:   O(n+m) prefix matching
Manacher:      O(n) longest palindromic substring
Suffix Array:  O(n log n) construction, many string problems
Aho-Corasick:  O(n+m+k) multiple pattern search
```

## Interview Problem Tags
```
Array:         two sum, max subarray, rotate, spiral order
String:        palindrome, anagram, longest substring
Linked List:   reverse, cycle, merge, nth from end
Tree:          LCA, path sum, serialize/deserialize
Graph:         islands, course schedule, word ladder
DP:            coin change, edit distance, LIS
Heap:          kth largest, top k frequent, median stream
Backtracking:  subsets, permutations, N-queens, sudoku
Binary Search: search rotated, find in matrix, capacity
Bit:           single number, count bits, power of two
```
