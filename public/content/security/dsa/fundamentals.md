# Data Structures & Algorithms — Fundamentals

## Why DSA?
DSA forms the foundation of software engineering. Every coding interview at top companies (Google, Microsoft, Amazon, Meta) focuses heavily on DSA. Efficient algorithms reduce computational cost from O(n^2) to O(n log n), which at scale means seconds vs. hours.

## Big O Notation

```
O(1)       — Constant: array index access
O(log n)   — Logarithmic: binary search
O(n)       — Linear: linear search, single loop
O(n log n) — Log-linear: merge sort, heap sort
O(n^2)     — Quadratic: bubble sort, nested loops
O(2^n)     — Exponential: recursive fibonacci
O(n!)      — Factorial: permutations
```

**Space Complexity:** additional memory used by algorithm
**Time Complexity:** number of operations as function of input size

## Arrays
```python
# Python list (dynamic array)
arr = [1, 2, 3, 4, 5]
arr.append(6)       # O(1) amortized
arr.insert(2, 10)   # O(n) — shifts elements
arr.pop()           # O(1)
arr.pop(0)          # O(n) — shifts all elements

# Two-pointer technique
def two_sum_sorted(arr, target):
    left, right = 0, len(arr) - 1
    while left < right:
        s = arr[left] + arr[right]
        if s == target: return [left, right]
        elif s < target: left += 1
        else: right -= 1
    return []
```

## Linked Lists
```python
class ListNode:
    def __init__(self, val=0):
        self.val = val
        self.next = None

# Reverse linked list — O(n) time, O(1) space
def reverse(head):
    prev, curr = None, head
    while curr:
        nxt = curr.next
        curr.next = prev
        prev = curr
        curr = nxt
    return prev

# Detect cycle — Floyd's algorithm
def has_cycle(head):
    slow = fast = head
    while fast and fast.next:
        slow = slow.next
        fast = fast.next.next
        if slow == fast: return True
    return False
```

## Stacks and Queues
```python
from collections import deque

# Stack (LIFO)
stack = []
stack.append(1)  # push
stack.pop()      # pop

# Queue (FIFO)
q = deque()
q.append(1)      # enqueue
q.popleft()      # dequeue

# Monotonic Stack — next greater element
def next_greater(arr):
    result = [-1] * len(arr)
    stack = []
    for i, val in enumerate(arr):
        while stack and arr[stack[-1]] < val:
            result[stack.pop()] = val
        stack.append(i)
    return result
```

## Binary Search
```python
# Classic binary search — O(log n)
def binary_search(arr, target):
    left, right = 0, len(arr) - 1
    while left <= right:
        mid = left + (right - left) // 2
        if arr[mid] == target: return mid
        elif arr[mid] < target: left = mid + 1
        else: right = mid - 1
    return -1

# Find leftmost occurrence
def left_bound(arr, target):
    left, right = 0, len(arr)
    while left < right:
        mid = left + (right - left) // 2
        if arr[mid] >= target: right = mid
        else: left = mid + 1
    return left
```

## Sorting Algorithms

| Algorithm | Best | Average | Worst | Space | Stable |
|-----------|------|---------|-------|-------|--------|
| Bubble | O(n) | O(n^2) | O(n^2) | O(1) | Yes |
| Selection | O(n^2) | O(n^2) | O(n^2) | O(1) | No |
| Insertion | O(n) | O(n^2) | O(n^2) | O(1) | Yes |
| Merge | O(n log n) | O(n log n) | O(n log n) | O(n) | Yes |
| Quick | O(n log n) | O(n log n) | O(n^2) | O(log n) | No |
| Heap | O(n log n) | O(n log n) | O(n log n) | O(1) | No |

## Hashing
```python
# Frequency count
from collections import Counter
counts = Counter([1,2,2,3,3,3])  # {3:3, 2:2, 1:1}

# Two sum — O(n) using hashmap
def two_sum(nums, target):
    seen = {}
    for i, n in enumerate(nums):
        if target - n in seen:
            return [seen[target-n], i]
        seen[n] = i
    return []
```
