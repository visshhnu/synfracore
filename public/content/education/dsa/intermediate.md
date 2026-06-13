# DSA — Intermediate

## Trees and Graphs

```python
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val; self.left = left; self.right = right

# BFS (level order)
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

# DFS — inorder, preorder, postorder
def inorder(root):
    return inorder(root.left) + [root.val] + inorder(root.right) if root else []

# Lowest Common Ancestor
def lca(root, p, q):
    if not root or root == p or root == q: return root
    left = lca(root.left, p, q)
    right = lca(root.right, p, q)
    return root if left and right else left or right

# Graph BFS
def bfs(graph, start):
    visited = {start}
    q = deque([start])
    while q:
        node = q.popleft()
        for neighbor in graph[node]:
            if neighbor not in visited:
                visited.add(neighbor)
                q.append(neighbor)

# Topological sort (Kahn's algorithm)
def topo_sort(n, edges):
    from collections import defaultdict
    graph = defaultdict(list)
    indegree = [0] * n
    for u, v in edges:
        graph[u].append(v)
        indegree[v] += 1
    q = deque(i for i in range(n) if indegree[i] == 0)
    result = []
    while q:
        node = q.popleft()
        result.append(node)
        for nei in graph[node]:
            indegree[nei] -= 1
            if indegree[nei] == 0: q.append(nei)
    return result if len(result) == n else []  # empty = cycle
```

## Dynamic Programming

```python
# 1D DP — Fibonacci / Climbing Stairs
def climb_stairs(n):
    a, b = 1, 1
    for _ in range(n-1): a, b = b, a+b
    return b

# Longest Increasing Subsequence O(n log n)
import bisect
def lis(nums):
    tails = []
    for x in nums:
        pos = bisect.bisect_left(tails, x)
        if pos == len(tails): tails.append(x)
        else: tails[pos] = x
    return len(tails)

# 2D DP — Unique paths
def unique_paths(m, n):
    dp = [[1]*n for _ in range(m)]
    for i in range(1, m):
        for j in range(1, n):
            dp[i][j] = dp[i-1][j] + dp[i][j-1]
    return dp[m-1][n-1]

# Knapsack 0/1
def knapsack(weights, values, capacity):
    n = len(weights)
    dp = [0] * (capacity + 1)
    for i in range(n):
        for w in range(capacity, weights[i]-1, -1):
            dp[w] = max(dp[w], dp[w-weights[i]] + values[i])
    return dp[capacity]

# Coin change (min coins)
def coin_change(coins, amount):
    dp = [float('inf')] * (amount + 1)
    dp[0] = 0
    for i in range(1, amount+1):
        for c in coins:
            if c <= i: dp[i] = min(dp[i], dp[i-c]+1)
    return dp[amount] if dp[amount] != float('inf') else -1
```
