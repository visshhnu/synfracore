# DSA — Cheatsheet

## Complexity Reference

```
O(1):       Array access, hash map get/set
O(log n):   Binary search, BST operations, heap push/pop
O(n):       Linear scan, BFS/DFS, prefix sum
O(n log n): Merge sort, heap sort, sort + process
O(n²):      Nested loops, bubble/selection sort
O(2^n):     Subsets, recursive fibonacci (naive)
O(n!):      Permutations

Space: O(1) iterative < O(log n) recursive < O(n) extra array
```

## Pattern Recognition

```python
# ── ARRAY PATTERNS ────────────────────────────────────────
# Two pointers:    sorted array, find pair with target sum
# Sliding window:  subarray/substring with constraint
# Prefix sum:      range sum queries
# Monotonic stack: next greater/smaller element

# ── SEARCH PATTERNS ───────────────────────────────────────
# Binary search:   sorted array, search space reduction
# BFS:             shortest path, level-by-level
# DFS:             all paths, backtracking, cycle detection

# ── DP PATTERNS ───────────────────────────────────────────
# 1D DP:           fibonacci, climbing stairs, house robber
# 2D DP:           grid paths, edit distance, LCS
# Knapsack:        subset sum, 0/1 knapsack, coin change
# Interval DP:     matrix chain, balloon burst

# ── GRAPH PATTERNS ────────────────────────────────────────
# Topo sort:       dependency ordering, course schedule
# Union-Find:      connected components, Kruskal's MST
# Dijkstra:        shortest path weighted graph (no negative)
# Bellman-Ford:    shortest path with negative edges

# ── COMMON TEMPLATES ──────────────────────────────────────

# Binary search template
l, r = 0, n-1
while l <= r:
    mid = (l+r)//2
    if check(mid): r = mid-1   # or l = mid+1
    else: l = mid+1            # depending on problem

# BFS template
from collections import deque
q = deque([start])
visited = {start}
while q:
    node = q.popleft()
    for nei in graph[node]:
        if nei not in visited:
            visited.add(nei)
            q.append(nei)

# DFS/backtracking template
def dfs(state):
    if base_case: return
    for choice in choices:
        make_choice()
        dfs(new_state)
        undo_choice()

# Sliding window template
l = 0
for r in range(len(arr)):
    # expand window with arr[r]
    while window_invalid:
        # shrink from left
        l += 1
    # update answer
```
