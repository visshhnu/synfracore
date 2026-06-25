# Data Structures & Algorithms — Intermediate

## Trees

### Binary Tree Traversals
```python
class TreeNode:
    def __init__(self, val=0):
        self.val = val
        self.left = self.right = None

# Inorder: Left-Root-Right (gives sorted order for BST)
def inorder(root):
    if not root: return []
    return inorder(root.left) + [root.val] + inorder(root.right)

# Level-order (BFS)
from collections import deque
def level_order(root):
    if not root: return []
    result, q = [], deque([root])
    while q:
        level = []
        for _ in range(len(q)):
            node = q.popleft()
            level.append(node.val)
            if node.left: q.append(node.left)
            if node.right: q.append(node.right)
        result.append(level)
    return result

# Max depth
def max_depth(root):
    if not root: return 0
    return 1 + max(max_depth(root.left), max_depth(root.right))
```

### Binary Search Tree (BST)
```python
# Insert
def insert(root, val):
    if not root: return TreeNode(val)
    if val < root.val: root.left = insert(root.left, val)
    else: root.right = insert(root.right, val)
    return root

# Validate BST
def is_valid_bst(root, lo=float('-inf'), hi=float('inf')):
    if not root: return True
    if not (lo < root.val < hi): return False
    return (is_valid_bst(root.left, lo, root.val) and
            is_valid_bst(root.right, root.val, hi))
```

## Graphs

```python
from collections import defaultdict, deque

# Adjacency list
graph = defaultdict(list)
graph[0].append(1); graph[1].append(2)

# BFS — shortest path in unweighted graph
def bfs(graph, start):
    visited = {start}
    q = deque([start])
    while q:
        node = q.popleft()
        for nei in graph[node]:
            if nei not in visited:
                visited.add(nei)
                q.append(nei)

# DFS
def dfs(graph, node, visited=None):
    if visited is None: visited = set()
    visited.add(node)
    for nei in graph[node]:
        if nei not in visited:
            dfs(graph, nei, visited)
    return visited

# Detect cycle in directed graph (DFS)
def has_cycle(graph, n):
    WHITE, GRAY, BLACK = 0, 1, 2
    color = [WHITE] * n
    def dfs(u):
        color[u] = GRAY
        for v in graph[u]:
            if color[v] == GRAY: return True
            if color[v] == WHITE and dfs(v): return True
        color[u] = BLACK
        return False
    return any(dfs(i) for i in range(n) if color[i] == WHITE)
```

## Dynamic Programming

### Framework
1. Define subproblem
2. Recurrence relation
3. Base cases
4. Order of computation (top-down or bottom-up)

```python
# Fibonacci — O(n) time, O(1) space
def fib(n):
    a, b = 0, 1
    for _ in range(n): a, b = b, a+b
    return a

# Longest Common Subsequence
def lcs(s1, s2):
    m, n = len(s1), len(s2)
    dp = [[0]*(n+1) for _ in range(m+1)]
    for i in range(1, m+1):
        for j in range(1, n+1):
            if s1[i-1] == s2[j-1]: dp[i][j] = 1 + dp[i-1][j-1]
            else: dp[i][j] = max(dp[i-1][j], dp[i][j-1])
    return dp[m][n]

# 0/1 Knapsack
def knapsack(weights, values, capacity):
    n = len(weights)
    dp = [[0]*(capacity+1) for _ in range(n+1)]
    for i in range(1, n+1):
        for w in range(capacity+1):
            dp[i][w] = dp[i-1][w]
            if weights[i-1] <= w:
                dp[i][w] = max(dp[i][w], values[i-1] + dp[i-1][w-weights[i-1]])
    return dp[n][capacity]
```

## Heap / Priority Queue
```python
import heapq

# Min-heap (default in Python)
heap = [3,1,4,1,5]
heapq.heapify(heap)      # O(n)
heapq.heappush(heap, 2)  # O(log n)
heapq.heappop(heap)      # O(log n) — returns minimum

# K largest elements
def k_largest(arr, k):
    return heapq.nlargest(k, arr)  # O(n log k)

# Merge k sorted lists
def merge_k_sorted(lists):
    heap = [(lst[0], i, 0) for i, lst in enumerate(lists) if lst]
    heapq.heapify(heap)
    result = []
    while heap:
        val, i, j = heapq.heappop(heap)
        result.append(val)
        if j+1 < len(lists[i]):
            heapq.heappush(heap, (lists[i][j+1], i, j+1))
    return result
```
