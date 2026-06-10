# Data Structures & Algorithms — Complete Guide

DSA is the foundation of software engineering interviews. Every FAANG, product company, and startup screens engineers on DSA. Master this and you unlock any tech role.

## Why DSA Matters

```
Without DSA:                     With DSA:
❌ Brute force every problem      ✅ Choose optimal approach instantly
❌ O(n²) solutions that TLE       ✅ O(n log n) or O(n) solutions
❌ Struggle in interviews         ✅ Crack Google, Amazon, Microsoft
❌ Write slow production code     ✅ Build systems that scale
```

## Big O Notation — Complexity Analysis

```
Time Complexity — how runtime grows with input size n:

O(1)      → Constant    Array access, HashMap lookup
O(log n)  → Logarithmic Binary search, Heap operations
O(n)      → Linear      Linear search, single loop
O(n log n)→ Linearithmic Merge sort, Heap sort
O(n²)     → Quadratic   Bubble sort, nested loops
O(2ⁿ)     → Exponential Subsets, recursive fibonacci
O(n!)     → Factorial   Permutations (very slow)

Growth rate: O(1) < O(log n) < O(n) < O(n log n) < O(n²) < O(2ⁿ) < O(n!)

Space Complexity — extra memory used:
O(1)    → constant extra space (in-place algorithms)
O(n)    → linear extra space (creating a copy of array)
O(log n)→ recursion stack in binary search
```

## Arrays & Strings

```python
# Array is the most fundamental DS
# Time: access O(1), search O(n), insert/delete O(n)

# Two Pointer Technique — O(n) instead of O(n²)
def two_sum_sorted(arr, target):
    """Find pair with given sum in sorted array."""
    left, right = 0, len(arr) - 1
    while left < right:
        curr = arr[left] + arr[right]
        if curr == target:
            return [left, right]
        elif curr < target:
            left += 1
        else:
            right -= 1
    return []

# Sliding Window — for subarray/substring problems
def max_sum_subarray(arr, k):
    """Max sum of subarray of size k. O(n)"""
    window_sum = sum(arr[:k])
    max_sum = window_sum
    for i in range(k, len(arr)):
        window_sum += arr[i] - arr[i - k]
        max_sum = max(max_sum, window_sum)
    return max_sum

# Prefix Sum — range sum queries in O(1)
def build_prefix(arr):
    n = len(arr)
    prefix = [0] * (n + 1)
    for i in range(n):
        prefix[i + 1] = prefix[i] + arr[i]
    return prefix

def range_sum(prefix, l, r):
    return prefix[r + 1] - prefix[l]

# Kadane's Algorithm — Maximum subarray sum O(n)
def max_subarray(nums):
    max_sum = curr_sum = nums[0]
    for num in nums[1:]:
        curr_sum = max(num, curr_sum + num)
        max_sum = max(max_sum, curr_sum)
    return max_sum
```

## Linked Lists

```python
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

# Reverse Linked List — O(n) time, O(1) space
def reverse_list(head):
    prev, curr = None, head
    while curr:
        next_node = curr.next
        curr.next = prev
        prev = curr
        curr = next_node
    return prev

# Floyd's Cycle Detection — detect cycle O(n) O(1)
def has_cycle(head):
    slow = fast = head
    while fast and fast.next:
        slow = slow.next
        fast = fast.next.next
        if slow == fast:
            return True
    return False

# Find middle of linked list
def find_middle(head):
    slow = fast = head
    while fast and fast.next:
        slow = slow.next
        fast = fast.next.next
    return slow
```

## Stacks & Queues

```python
from collections import deque

# Stack: LIFO — use list
stack = []
stack.append(1)      # push
stack.pop()          # pop O(1)
stack[-1]            # peek

# Queue: FIFO — use deque
queue = deque()
queue.append(1)      # enqueue O(1)
queue.popleft()      # dequeue O(1) — list.pop(0) is O(n)!

# Monotonic Stack — Next Greater Element O(n)
def next_greater(nums):
    result = [-1] * len(nums)
    stack = []  # stores indices
    for i, num in enumerate(nums):
        while stack and nums[stack[-1]] < num:
            idx = stack.pop()
            result[idx] = num
        stack.append(i)
    return result

# Valid Parentheses
def is_valid(s):
    stack = []
    mapping = {')': '(', '}': '{', ']': '['}
    for char in s:
        if char in mapping:
            if not stack or stack[-1] != mapping[char]:
                return False
            stack.pop()
        else:
            stack.append(char)
    return not stack
```

## Binary Search

```python
# Template — works for almost all binary search problems
def binary_search(nums, target):
    left, right = 0, len(nums) - 1
    while left <= right:
        mid = left + (right - left) // 2  # Avoid overflow
        if nums[mid] == target:
            return mid
        elif nums[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
    return -1

# Search in rotated sorted array — O(log n)
def search_rotated(nums, target):
    left, right = 0, len(nums) - 1
    while left <= right:
        mid = (left + right) // 2
        if nums[mid] == target:
            return mid
        # Left half is sorted
        if nums[left] <= nums[mid]:
            if nums[left] <= target < nums[mid]:
                right = mid - 1
            else:
                left = mid + 1
        # Right half is sorted
        else:
            if nums[mid] < target <= nums[right]:
                left = mid + 1
            else:
                right = mid - 1
    return -1

# Binary search on answer — find minimum value satisfying condition
def min_days_to_make_bouquets(bloomDay, m, k):
    """Classic: search on the answer, not the array"""
    def can_make(day):
        bouquets = flowers = 0
        for d in bloomDay:
            flowers = flowers + 1 if d <= day else 0
            if flowers == k:
                bouquets += 1
                flowers = 0
        return bouquets >= m

    left, right = min(bloomDay), max(bloomDay)
    result = -1
    while left <= right:
        mid = (left + right) // 2
        if can_make(mid):
            result = mid
            right = mid - 1
        else:
            left = mid + 1
    return result
```

## Trees & BST

```python
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

# DFS Traversals
def inorder(root):    # Left → Root → Right (sorted order for BST)
    return inorder(root.left) + [root.val] + inorder(root.right) if root else []

def preorder(root):   # Root → Left → Right (serialize tree)
    return [root.val] + preorder(root.left) + preorder(root.right) if root else []

def postorder(root):  # Left → Right → Root (delete tree)
    return postorder(root.left) + postorder(root.right) + [root.val] if root else []

# BFS Level Order
from collections import deque
def level_order(root):
    if not root: return []
    result, queue = [], deque([root])
    while queue:
        level = []
        for _ in range(len(queue)):
            node = queue.popleft()
            level.append(node.val)
            if node.left:  queue.append(node.left)
            if node.right: queue.append(node.right)
        result.append(level)
    return result

# Maximum Depth
def max_depth(root):
    if not root: return 0
    return 1 + max(max_depth(root.left), max_depth(root.right))

# Lowest Common Ancestor
def lca(root, p, q):
    if not root or root == p or root == q:
        return root
    left  = lca(root.left, p, q)
    right = lca(root.right, p, q)
    return root if left and right else left or right
```

## Graph Algorithms

```python
from collections import deque

# BFS — shortest path, level traversal
def bfs(graph, start):
    visited = {start}
    queue = deque([start])
    while queue:
        node = queue.popleft()
        for neighbor in graph[node]:
            if neighbor not in visited:
                visited.add(neighbor)
                queue.append(neighbor)

# DFS — cycle detection, topological sort, connected components
def dfs(graph, node, visited):
    visited.add(node)
    for neighbor in graph[node]:
        if neighbor not in visited:
            dfs(graph, neighbor, visited)

# Number of Islands — O(m×n)
def num_islands(grid):
    if not grid: return 0
    rows, cols = len(grid), len(grid[0])
    count = 0

    def dfs(r, c):
        if r < 0 or r >= rows or c < 0 or c >= cols or grid[r][c] != '1':
            return
        grid[r][c] = '0'  # Mark visited
        for dr, dc in [(0,1),(0,-1),(1,0),(-1,0)]:
            dfs(r + dr, c + dc)

    for r in range(rows):
        for c in range(cols):
            if grid[r][c] == '1':
                dfs(r, c)
                count += 1
    return count
```

## Dynamic Programming

```python
# DP pattern: define state, recurrence, base case

# Fibonacci (memoization top-down)
from functools import lru_cache

@lru_cache(maxsize=None)
def fib(n):
    if n <= 1: return n
    return fib(n-1) + fib(n-2)

# 0/1 Knapsack
def knapsack(weights, values, capacity):
    n = len(weights)
    dp = [[0] * (capacity + 1) for _ in range(n + 1)]
    for i in range(1, n + 1):
        for w in range(capacity + 1):
            dp[i][w] = dp[i-1][w]
            if weights[i-1] <= w:
                dp[i][w] = max(dp[i][w], dp[i-1][w-weights[i-1]] + values[i-1])
    return dp[n][capacity]

# Longest Common Subsequence
def lcs(text1, text2):
    m, n = len(text1), len(text2)
    dp = [[0] * (n + 1) for _ in range(m + 1)]
    for i in range(1, m + 1):
        for j in range(1, n + 1):
            if text1[i-1] == text2[j-1]:
                dp[i][j] = dp[i-1][j-1] + 1
            else:
                dp[i][j] = max(dp[i-1][j], dp[i][j-1])
    return dp[m][n]
```

## Sorting Algorithms

```
Algorithm     Time (avg)    Space    Stable    Use when
──────────────────────────────────────────────────────────
Bubble Sort   O(n²)         O(1)     Yes       Never in prod
Selection     O(n²)         O(1)     No        Never in prod
Insertion     O(n²)         O(1)     Yes       Small arrays (<50)
Merge Sort    O(n log n)    O(n)     Yes       Need stable sort
Quick Sort    O(n log n)    O(log n) No        General purpose
Heap Sort     O(n log n)    O(1)     No        Memory constrained
Counting      O(n+k)        O(k)     Yes       Small integer range
Radix         O(nk)         O(n+k)   Yes       Fixed-length integers
```

## Interview Strategy

```
Step 1: Understand (2-3 min)
  → Clarify constraints: input size? sorted? duplicates?
  → Ask for examples, edge cases

Step 2: Think out loud (3-5 min)
  → Start with brute force, state complexity
  → Identify the bottleneck
  → Think of patterns: two pointers? sliding window? DP?

Step 3: Code (15-20 min)
  → Clean, readable code
  → Handle edge cases

Step 4: Test (3-5 min)
  → Trace through examples
  → Test edge cases: empty, single element, duplicates
```
