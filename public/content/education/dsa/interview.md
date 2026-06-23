# Data Structures & Algorithms Interview Questions

## Core Concepts

**Q: Time and space complexity — Big O notation.**

Big O describes algorithm efficiency — how time/space grows as input size (n) increases.

| Complexity | Name | Example |
|---|---|---|
| O(1) | Constant | Array access by index |
| O(log n) | Logarithmic | Binary search, BST operations |
| O(n) | Linear | Linear search, traversal |
| O(n log n) | Linearithmic | Merge sort, heap sort |
| O(n²) | Quadratic | Bubble sort, nested loops |
| O(2ⁿ) | Exponential | Recursive Fibonacci, subsets |
| O(n!) | Factorial | Permutations, travelling salesman brute force |

**Amortised complexity**: Average cost over many operations. ArrayList append: O(1) amortised (occasional O(n) resize). 

---

**Q: Arrays vs Linked Lists — when to use each.**

| Operation | Array | Linked List |
|---|---|---|
| Access by index | O(1) ✅ | O(n) ❌ |
| Search | O(n) | O(n) |
| Insert at beginning | O(n) ❌ (shift) | O(1) ✅ |
| Insert at end | O(1) amortised ✅ | O(n) or O(1) with tail |
| Delete by index | O(n) | O(n) |
| Memory | Contiguous (cache-friendly) | Non-contiguous (pointers) |

**Use array when**: Random access needed, cache performance matters, fixed size or rarely changes.
**Use linked list when**: Frequent insertions/deletions at beginning, unknown size at compile time.

---

**Q: Essential sorting algorithms.**

```
Bubble Sort: O(n²) average/worst, O(n) best. Stable. Rarely used.
Selection Sort: O(n²) all cases. In-place. Not stable.
Insertion Sort: O(n²) worst, O(n) best. Stable. Good for small/nearly-sorted arrays.
Merge Sort: O(n log n) all cases. Stable. Extra O(n) space. Reliable.
Quick Sort: O(n log n) average, O(n²) worst. In-place. Not stable. Fast in practice.
Heap Sort: O(n log n) all cases. In-place. Not stable.
Counting Sort: O(n+k) — fastest for integers in limited range.
```

**Interview default**: Say "I'd use merge sort for stable, quicksort for in-place performance."

---

**Q: Binary search — how it works.**

```python
def binary_search(arr, target):
    left, right = 0, len(arr) - 1
    
    while left <= right:
        mid = left + (right - left) // 2  # Avoid overflow
        if arr[mid] == target:
            return mid
        elif arr[mid] < target:
            left = mid + 1    # Search right half
        else:
            right = mid - 1   # Search left half
    
    return -1  # Not found

# O(log n) time | O(1) space
# REQUIRES sorted array
```

---

**Q: Hash tables — how they work, collision handling.**

Hash table: key → hash function → bucket index → value. O(1) average access.

**Collision handling:**
1. **Chaining**: Each bucket is a linked list. All keys with same hash go in same bucket's list. Worst case O(n) if all keys hash same.
2. **Open addressing**: Find next empty slot (linear probing, quadratic probing, double hashing).

**Load factor**: filled buckets / total buckets. Rehash when load factor exceeds threshold (~0.75 in Java HashMap).

**Good hash function**: Distributes keys uniformly, avalanche effect (small input change → large output change).

---

**Q: Trees — BST, balanced trees, traversals.**

```python
class TreeNode:
    def __init__(self, val):
        self.val = val
        self.left = self.right = None

# Inorder traversal (Left-Root-Right) → sorted order for BST
def inorder(node):
    if not node: return
    inorder(node.left)
    print(node.val)
    inorder(node.right)

# Binary Search Tree: left < root < right
# Search/Insert/Delete: O(log n) balanced, O(n) unbalanced

# BFS (Level-order) using queue
from collections import deque
def bfs(root):
    queue = deque([root])
    while queue:
        node = queue.popleft()
        print(node.val)
        if node.left: queue.append(node.left)
        if node.right: queue.append(node.right)
```

**Balanced BSTs** (O(log n) guaranteed): AVL tree (strict balance), Red-Black tree (used in Java TreeMap, C++ std::map).

---

**Q: Graph algorithms — BFS, DFS, Dijkstra.**

```python
# Graph representation: adjacency list
graph = {0: [1, 2], 1: [0, 3], 2: [0, 3], 3: [1, 2, 4], 4: [3]}

# BFS: shortest path in unweighted graph
def bfs(start):
    visited, queue = {start}, deque([start])
    while queue:
        node = queue.popleft()
        for neighbour in graph[node]:
            if neighbour not in visited:
                visited.add(neighbour)
                queue.append(neighbour)

# DFS: traversal, topological sort, cycle detection
def dfs(node, visited=set()):
    visited.add(node)
    for neighbour in graph[node]:
        if neighbour not in visited:
            dfs(neighbour, visited)

# Dijkstra: shortest path in weighted graph (non-negative weights)
import heapq
def dijkstra(start, weighted_graph):
    dist = {node: float('inf') for node in weighted_graph}
    dist[start] = 0
    pq = [(0, start)]  # (distance, node)
    while pq:
        d, u = heapq.heappop(pq)
        if d > dist[u]: continue
        for v, w in weighted_graph[u]:
            if dist[u] + w < dist[v]:
                dist[v] = dist[u] + w
                heapq.heappush(pq, (dist[v], v))
    return dist
```

## Revision Notes
```
BIG O: O(1) < O(log n) < O(n) < O(n log n) < O(n²) < O(2ⁿ) < O(n!)

ARRAY: O(1) random access. Cache-friendly. LINKED LIST: O(1) front insert.

SORTING:
Merge sort: O(n log n) stable, extra space | Quick sort: O(n log n) avg, in-place
Use merge for stability | Quick for performance

BINARY SEARCH: O(log n). Requires sorted. left + (right-left)//2 to avoid overflow.

HASH TABLE: O(1) avg. Collision: chaining (linked list) or open addressing (probing)
Rehash at ~0.75 load factor

TREES: BST left<root<right. Traversals: inorder(LRR=sorted), preorder, postorder, BFS
Balanced BST: O(log n) | Unbalanced: O(n) worst

GRAPHS:
BFS: shortest path (unweighted), level-by-level using queue
DFS: traversal, cycle detection, topological sort using stack/recursion
Dijkstra: shortest path (weighted, non-negative) using min-heap
```
