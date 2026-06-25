# Data Structures & Algorithms — Advanced

## Advanced Graph Algorithms

### Dijkstra's Algorithm — Shortest Path (weighted, non-negative)
```python
import heapq
from collections import defaultdict

def dijkstra(graph, src, n):
    dist = [float('inf')] * n
    dist[src] = 0
    heap = [(0, src)]
    while heap:
        d, u = heapq.heappop(heap)
        if d > dist[u]: continue
        for v, w in graph[u]:
            if dist[u] + w < dist[v]:
                dist[v] = dist[u] + w
                heapq.heappush(heap, (dist[v], v))
    return dist

# Time: O((V+E) log V)
```

### Topological Sort (Kahn's Algorithm — BFS)
```python
def topo_sort(n, edges):
    graph = defaultdict(list)
    indegree = [0] * n
    for u, v in edges:
        graph[u].append(v)
        indegree[v] += 1
    q = deque(i for i in range(n) if indegree[i] == 0)
    order = []
    while q:
        u = q.popleft()
        order.append(u)
        for v in graph[u]:
            indegree[v] -= 1
            if indegree[v] == 0: q.append(v)
    return order if len(order) == n else []  # empty = cycle exists
```

### Union-Find (Disjoint Set Union)
```python
class UnionFind:
    def __init__(self, n):
        self.parent = list(range(n))
        self.rank = [0] * n

    def find(self, x):
        if self.parent[x] != x:
            self.parent[x] = self.find(self.parent[x])  # path compression
        return self.parent[x]

    def union(self, x, y):
        px, py = self.find(x), self.find(y)
        if px == py: return False
        if self.rank[px] < self.rank[py]: px, py = py, px
        self.parent[py] = px
        if self.rank[px] == self.rank[py]: self.rank[px] += 1
        return True
```

## Segment Tree
```python
class SegTree:
    def __init__(self, arr):
        n = len(arr)
        self.tree = [0] * (4*n)
        self.build(arr, 0, 0, n-1)

    def build(self, arr, node, start, end):
        if start == end: self.tree[node] = arr[start]
        else:
            mid = (start + end) // 2
            self.build(arr, 2*node+1, start, mid)
            self.build(arr, 2*node+2, mid+1, end)
            self.tree[node] = self.tree[2*node+1] + self.tree[2*node+2]

    def query(self, node, start, end, l, r):
        if r < start or end < l: return 0
        if l <= start and end <= r: return self.tree[node]
        mid = (start + end) // 2
        return (self.query(2*node+1, start, mid, l, r) +
                self.query(2*node+2, mid+1, end, l, r))
```

## String Algorithms

### KMP — Pattern Matching O(n+m)
```python
def kmp_search(text, pattern):
    def build_lps(p):
        lps, length, i = [0]*len(p), 0, 1
        while i < len(p):
            if p[i] == p[length]: length += 1; lps[i] = length; i += 1
            elif length: length = lps[length-1]
            else: lps[i] = 0; i += 1
        return lps

    lps = build_lps(pattern)
    i = j = 0
    result = []
    while i < len(text):
        if text[i] == pattern[j]: i += 1; j += 1
        if j == len(pattern): result.append(i-j); j = lps[j-1]
        elif i < len(text) and text[i] != pattern[j]:
            if j: j = lps[j-1]
            else: i += 1
    return result
```

### Trie (Prefix Tree)
```python
class Trie:
    def __init__(self): self.root = {}

    def insert(self, word):
        node = self.root
        for c in word: node = node.setdefault(c, {})
        node['#'] = True  # end marker

    def search(self, word):
        node = self.root
        for c in word:
            if c not in node: return False
            node = node[c]
        return '#' in node

    def starts_with(self, prefix):
        node = self.root
        for c in prefix:
            if c not in node: return False
            node = node[c]
        return True
```

## Competitive Programming Patterns

### Sliding Window
```python
# Maximum sum subarray of size k — O(n)
def max_window_sum(arr, k):
    window = sum(arr[:k])
    best = window
    for i in range(k, len(arr)):
        window += arr[i] - arr[i-k]
        best = max(best, window)
    return best
```

### Bit Manipulation
```python
n & (n-1)     # clear lowest set bit; n & (n-1) == 0 iff n is power of 2
n & (-n)      # isolate lowest set bit
n ^ n         # 0 (XOR with self)
a ^ b ^ b     # = a (find single element among pairs)
bin(n).count('1')  # popcount
```
