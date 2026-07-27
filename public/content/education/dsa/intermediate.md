# Data Structures & Algorithms — Intermediate

This section assumes you're comfortable with recursion from Fundamentals — trees and graphs are both naturally recursive structures, and most of the code below leans on that directly.

## Trees and Binary Search Trees

A tree is a node connected to child nodes, each of which is itself the root of a smaller tree — this is exactly the recursive structure that makes recursive traversal the natural way to process one. A **Binary Search Tree (BST)** adds one rule on top of a regular binary tree: for every node, everything in its left subtree is smaller, and everything in its right subtree is larger.

```python
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val; self.left = left; self.right = right
```

**The three depth-first traversal orders** — same recursive structure, different point at which you visit the current node relative to its children:

```python
# Inorder (Left, Root, Right) -- visits a BST's values in sorted order
def inorder(root):
    return inorder(root.left) + [root.val] + inorder(root.right) if root else []

# Preorder (Root, Left, Right) -- visit the node before its children;
# useful for copying/serializing a tree, since you record structure top-down
def preorder(root):
    return [root.val] + preorder(root.left) + preorder(root.right) if root else []

# Postorder (Left, Right, Root) -- visit children before the node itself;
# useful when you need to process children fully before the parent
# (e.g. deleting a tree bottom-up, or computing a value that depends on subtrees)
def postorder(root):
    return postorder(root.left) + postorder(root.right) + [root.val] if root else []
```

**Breadth-first (level order) traversal** — instead of going deep first (like the recursive traversals above), visit the tree level by level, left to right. This needs a queue, not recursion, because you have to finish an entire level before moving to the next one:

```python
from collections import deque
def level_order(root):
    if not root: return []
    result, q = [], deque([root])
    while q:
        level = []
        for _ in range(len(q)):     # process exactly this level's nodes
            node = q.popleft()
            level.append(node.val)
            if node.left: q.append(node.left)
            if node.right: q.append(node.right)
        result.append(level)
    return result
```

**Other common tree problems, all recursive:**

```python
# Maximum depth -- the depth of a tree is 1 (for the node itself) plus
# the deeper of its two subtrees' depths
def max_depth(root):
    if not root: return 0
    return 1 + max(max_depth(root.left), max_depth(root.right))

# Lowest Common Ancestor -- the deepest node that has both p and q as
# descendants. If p or q IS the current node, that's an answer by
# definition. Otherwise, if p and q are found in different subtrees,
# the current node is their split point -- the LCA.
def lca(root, p, q):
    if not root or root == p or root == q: return root
    left = lca(root.left, p, q)
    right = lca(root.right, p, q)
    return root if left and right else left or right
```

## Graphs

A graph generalizes a tree: nodes connected by edges, but without a tree's restriction that there's exactly one path between any two nodes — a graph can have cycles, multiple paths, and no single "root." Graphs are usually represented as an **adjacency list**: a dictionary mapping each node to a list of its neighbors.

**BFS (Breadth-First Search)** — explores level by level using a queue, which is exactly why it finds the *shortest* path in an unweighted graph: it can't reach a node at distance 3 before it's explored every node at distance 1 and 2.

```python
def bfs(graph, start):
    visited = {start}
    q = deque([start])
    while q:
        node = q.popleft()
        for neighbor in graph[node]:
            if neighbor not in visited:
                visited.add(neighbor)
                q.append(neighbor)
```

**DFS (Depth-First Search)** — explores as far as possible down one path before backtracking, using recursion (or an explicit stack). Used for cycle detection, topological sorting, and finding connected components — problems where you need to fully explore one branch before moving to the next, not the shortest-path guarantee BFS gives you.

```python
def dfs(graph, node, visited):
    visited.add(node)
    for neighbor in graph[node]:
        if neighbor not in visited:
            dfs(graph, neighbor, visited)
```

**Topological sort (Kahn's algorithm)** — for a directed graph with no cycles, this produces an ordering of nodes where every edge points from earlier to later in the ordering (useful for "task X must happen before task Y" scheduling problems). The idea: repeatedly remove nodes that have no remaining incoming edges (nothing left depends on them being done first), tracking how many incoming edges each node has left.

```python
def topo_sort(n, edges):
    from collections import defaultdict
    graph = defaultdict(list)
    indegree = [0] * n
    for u, v in edges:
        graph[u].append(v)
        indegree[v] += 1
    q = deque(i for i in range(n) if indegree[i] == 0)   # start with nodes that have no prerequisites
    result = []
    while q:
        node = q.popleft()
        result.append(node)
        for nei in graph[node]:
            indegree[nei] -= 1
            if indegree[nei] == 0: q.append(nei)   # this neighbor's last prerequisite is done
    return result if len(result) == n else []  # fewer than n results means a cycle exists
```

**A concrete graph application — counting connected regions** (e.g., "number of islands" in a grid): DFS from every unvisited land cell, marking everything reachable from it as visited, and count how many separate DFS calls that takes.

```python
def num_islands(grid):
    if not grid: return 0
    rows, cols = len(grid), len(grid[0])
    count = 0

    def dfs(r, c):
        if r < 0 or r >= rows or c < 0 or c >= cols or grid[r][c] != '1':
            return
        grid[r][c] = '0'  # mark visited
        for dr, dc in [(0,1),(0,-1),(1,0),(-1,0)]:
            dfs(r + dr, c + dc)

    for r in range(rows):
        for c in range(cols):
            if grid[r][c] == '1':
                dfs(r, c)
                count += 1   # one full DFS = one island fully explored
    return count
```

## Next Steps

Move to **Advanced** for dynamic programming (recursion plus caching to avoid recomputing the same subproblem), a comparison of sorting algorithms and their trade-offs, heaps, and union-find.
