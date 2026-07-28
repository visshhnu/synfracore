# Data Structures & Algorithms — Advanced

## Dynamic Programming

Dynamic programming (DP) is recursion plus one addition: **memoization** — caching the result of each subproblem the first time it's computed, so if the same subproblem comes up again, you look up the cached answer instead of recomputing it. This matters because naive recursion often recomputes the exact same subproblem an exponential number of times.

**Fibonacci is the clearest illustration.** Naive recursive Fibonacci recalculates `fib(2)` dozens of times while computing `fib(10)`, because `fib(10)` calls `fib(9)` and `fib(8)`, both of which independently call down through `fib(2)` again. Memoization fixes this directly:

```python
from functools import lru_cache

@lru_cache(maxsize=None)   # this decorator IS memoization -- caches every
                            # (n -> return value) pair automatically
def fib(n):
    if n <= 1: return n
    return fib(n-1) + fib(n-2)
```

Without `@lru_cache`, this function is O(2ⁿ) — exponential, because of all the repeated recomputation. With it, each value of `n` is only ever actually computed once, making it O(n).

**1D DP — Climbing Stairs**: how many distinct ways to climb `n` stairs, taking 1 or 2 steps at a time? The recurrence: the number of ways to reach step `n` is the ways to reach step `n-1` plus the ways to reach step `n-2` (your last move was either a 1-step or a 2-step). This is structurally identical to Fibonacci.

```python
def climb_stairs(n):
    a, b = 1, 1
    for _ in range(n-1): a, b = b, a+b
    return b
```

**2D DP — 0/1 Knapsack**: given items with weights and values, and a weight capacity, maximize total value without exceeding capacity, where each item can be used at most once ("0/1" — you either take it or you don't). The state you're caching is "best value achievable with the first `i` items and capacity `w`":

```python
def knapsack(weights, values, capacity):
    n = len(weights)
    dp = [0] * (capacity + 1)
    for i in range(n):
        for w in range(capacity, weights[i]-1, -1):   # iterate backward -- keeps each item "0/1" (used once)
            dp[w] = max(dp[w], dp[w-weights[i]] + values[i])
    return dp[capacity]
```

**2D DP — Longest Common Subsequence (LCS)**: the longest sequence of characters (not necessarily contiguous) that appears in the same relative order in both strings. `dp[i][j]` stores the LCS length using the first `i` characters of one string and the first `j` of the other:

```python
def lcs(text1, text2):
    m, n = len(text1), len(text2)
    dp = [[0] * (n + 1) for _ in range(m + 1)]
    for i in range(1, m + 1):
        for j in range(1, n + 1):
            if text1[i-1] == text2[j-1]:
                dp[i][j] = dp[i-1][j-1] + 1        # characters match -- extend the subsequence
            else:
                dp[i][j] = max(dp[i-1][j], dp[i][j-1])  # take the better of skipping either character
    return dp[m][n]
```

**Coin change (fewest coins to make an amount)** — a classic "unbounded" DP problem (each coin denomination can be used any number of times, unlike knapsack's "use once"):

```python
def coin_change(coins, amount):
    dp = [float('inf')] * (amount + 1)
    dp[0] = 0
    for i in range(1, amount+1):
        for c in coins:
            if c <= i: dp[i] = min(dp[i], dp[i-c]+1)
    return dp[amount] if dp[amount] != float('inf') else -1
```

**The general pattern for approaching any DP problem**: define what state you're caching (usually "the answer for a smaller version of the input, parameterized by 1-2 variables"), write the recurrence relating a state to smaller states, identify the base case(s), then decide whether to implement it top-down (recursion + `@lru_cache`, as in Fibonacci above) or bottom-up (building up a table iteratively, as in the other three examples) — both compute the same thing, bottom-up usually avoids recursion's call-stack overhead.

## Sorting Algorithms — Trade-offs

All of these sort correctly; they differ in speed, memory use, and one property worth defining explicitly: **stability**. A sort is **stable** if two elements with equal sort keys keep their original relative order after sorting — this matters when you're sorting by one field but want ties broken by "whichever came first in the original data," e.g., sorting a table of student records by grade, where students with the same grade should stay in their original (say, alphabetical) order.

```
Algorithm     Time (avg)    Space    Stable    Use when
──────────────────────────────────────────────────────────
Bubble Sort   O(n²)         O(1)     Yes       Teaching tool only -- never in real code
Selection     O(n²)         O(1)     No        Teaching tool only -- never in real code
Insertion     O(n²)         O(1)     Yes       Small arrays (<50), or nearly-sorted data
Merge Sort    O(n log n)    O(n)     Yes       Need a guaranteed stable sort
Quick Sort    O(n log n)    O(log n) No        General purpose -- fastest in practice, most of the time
Heap Sort     O(n log n)    O(1)     No        Memory-constrained situations
Counting      O(n+k)        O(k)     Yes       Small, known integer range
Radix         O(nk)         O(n+k)   Yes       Fixed-length integers
```

**Practical default**: Python's built-in `sorted()` uses Timsort, a hybrid that's stable and fast in practice on real-world data. When asked in an interview which sort you'd choose: "merge sort if I specifically need a stability guarantee, quicksort if I just need fast general-purpose sorting and don't care about stability" is a reasonable, defensible default answer.

## Heaps and Priority Queues

```python
import heapq

# Min heap (Python's heapq is min-heap by default)
h = []
heapq.heappush(h, val)
heapq.heappop(h)    # Remove and return smallest
h[0]                # Peek min

# Max heap (negate values -- a common trick since Python has no max-heap built in)
heapq.heappush(h, -val)
-heapq.heappop(h)

# K largest elements
def k_largest(nums, k):
    return heapq.nlargest(k, nums)

# Merge k sorted lists -- keep the smallest unprocessed element from each
# list in the heap, always pop the overall smallest next
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

# Find median from a data stream -- maintain two heaps: a max-heap for
# the smaller half of numbers seen so far, a min-heap for the larger half,
# kept balanced so the median is always at the top of one (or both)
class MedianFinder:
    def __init__(self):
        self.small = []  # max heap (negated), holds the smaller half
        self.large = []  # min heap, holds the larger half

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

Union-Find tracks a collection of elements split into groups ("sets"), efficiently answering two questions: "are these two elements in the same group?" and "merge these two groups into one." It's the standard tool for problems about connectivity/grouping — e.g., detecting cycles in a graph, or counting connected components without doing a full DFS/BFS.

```python
class UnionFind:
    def __init__(self, n):
        self.parent = list(range(n))   # each element starts as its own group's representative
        self.rank = [0] * n
        self.components = n

    def find(self, x):
        if self.parent[x] != x:
            self.parent[x] = self.find(self.parent[x])  # path compression -- flattens the tree for future lookups
        return self.parent[x]

    def union(self, x, y):
        px, py = self.find(x), self.find(y)
        if px == py: return False   # already in the same group
        # union by rank -- attach the smaller tree under the larger one's root, keeping things shallow
        if self.rank[px] < self.rank[py]: px, py = py, px
        self.parent[py] = px
        if self.rank[px] == self.rank[py]: self.rank[px] += 1
        self.components -= 1
        return True
```

Path compression and union by rank together are what make Union-Find's operations nearly O(1) in practice (technically O(α(n)), where α is the inverse Ackermann function — grows so slowly it's effectively constant for any input size you'd realistically encounter).
