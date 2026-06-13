# DSA — Advanced

## Heaps and Priority Queues

```python
import heapq

# Min heap (Python default)
h = []
heapq.heappush(h, val)
heapq.heappop(h)    # Remove and return smallest
h[0]                # Peek min

# Max heap (negate values)
heapq.heappush(h, -val)
-heapq.heappop(h)

# K largest elements
def k_largest(nums, k):
    return heapq.nlargest(k, nums)

# Merge k sorted lists
def merge_k_sorted(lists):
    heap = []
    for i, lst in enumerate(lists):
        if lst: heapq.heappush(heap, (lst[0], i, 0))
    result = []
    while heap:
        val, i, j = heapq.heappop(heap)
        result.append(val)
        if j+1 < len(lists[i]):
            heapq.heappush(heap, (lists[i][j+1], i, j+1))
    return result

# Find median from data stream
class MedianFinder:
    def __init__(self):
        self.small = []  # max heap (negated)
        self.large = []  # min heap
    
    def add(self, num):
        heapq.heappush(self.small, -num)
        heapq.heappush(self.large, -heapq.heappop(self.small))
        if len(self.large) > len(self.small):
            heapq.heappush(self.small, -heapq.heappop(self.large))
    
    def find_median(self):
        if len(self.small) > len(self.large):
            return -self.small[0]
        return (-self.small[0] + self.large[0]) / 2
```

## Union-Find (Disjoint Set)

```python
class UnionFind:
    def __init__(self, n):
        self.parent = list(range(n))
        self.rank = [0] * n
        self.components = n
    
    def find(self, x):
        if self.parent[x] != x:
            self.parent[x] = self.find(self.parent[x])  # path compression
        return self.parent[x]
    
    def union(self, x, y):
        px, py = self.find(x), self.find(y)
        if px == py: return False
        # union by rank
        if self.rank[px] < self.rank[py]: px, py = py, px
        self.parent[py] = px
        if self.rank[px] == self.rank[py]: self.rank[px] += 1
        self.components -= 1
        return True
```
