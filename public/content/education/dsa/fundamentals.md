# Data Structures & Algorithms — Fundamentals

## Arrays and Strings

```python
# Array fundamentals
arr = [3, 1, 4, 1, 5, 9, 2, 6]

# Two pointers
def two_sum_sorted(arr, target):
    l, r = 0, len(arr) - 1
    while l < r:
        s = arr[l] + arr[r]
        if s == target: return [l, r]
        elif s < target: l += 1
        else: r -= 1
    return []

# Sliding window — max sum subarray of size k
def max_sum_window(arr, k):
    window_sum = sum(arr[:k])
    max_sum = window_sum
    for i in range(k, len(arr)):
        window_sum += arr[i] - arr[i-k]
        max_sum = max(max_sum, window_sum)
    return max_sum

# Prefix sums — range sum queries in O(1)
def build_prefix(arr):
    prefix = [0] * (len(arr) + 1)
    for i, v in enumerate(arr):
        prefix[i+1] = prefix[i] + v
    return prefix

def range_sum(prefix, l, r):  # inclusive
    return prefix[r+1] - prefix[l]
```

## Linked Lists

```python
class Node:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

# Reverse a linked list
def reverse(head):
    prev, curr = None, head
    while curr:
        nxt = curr.next
        curr.next = prev
        prev = curr
        curr = nxt
    return prev

# Detect cycle (Floyd's algorithm)
def has_cycle(head):
    slow = fast = head
    while fast and fast.next:
        slow = slow.next
        fast = fast.next.next
        if slow == fast: return True
    return False

# Merge two sorted lists
def merge(l1, l2):
    dummy = Node()
    cur = dummy
    while l1 and l2:
        if l1.val <= l2.val:
            cur.next = l1; l1 = l1.next
        else:
            cur.next = l2; l2 = l2.next
        cur = cur.next
    cur.next = l1 or l2
    return dummy.next
```

## Stacks and Queues

```python
# Stack — LIFO
stack = []
stack.append(x)   # push
stack.pop()       # pop
stack[-1]         # peek

# Queue — FIFO
from collections import deque
q = deque()
q.append(x)       # enqueue
q.popleft()       # dequeue

# Monotonic stack — next greater element
def next_greater(arr):
    result = [-1] * len(arr)
    stack = []  # stores indices
    for i, v in enumerate(arr):
        while stack and arr[stack[-1]] < v:
            result[stack.pop()] = v
        stack.append(i)
    return result

# Valid parentheses
def is_valid(s):
    stack = []
    pairs = {')':'(', ']':'[', '}':'{'}
    for c in s:
        if c in '([{': stack.append(c)
        elif not stack or stack[-1] != pairs[c]: return False
        else: stack.pop()
    return not stack
```

## Binary Search

```python
# Standard binary search
def binary_search(arr, target):
    l, r = 0, len(arr) - 1
    while l <= r:
        mid = (l + r) // 2
        if arr[mid] == target: return mid
        elif arr[mid] < target: l = mid + 1
        else: r = mid - 1
    return -1

# Search insert position (lower bound)
def lower_bound(arr, target):
    l, r = 0, len(arr)
    while l < r:
        mid = (l + r) // 2
        if arr[mid] < target: l = mid + 1
        else: r = mid
    return l

# Binary search on answer
def min_days_bloom(bloomDay, m, k):
    def can_bloom(days):
        bouquets = flowers = 0
        for d in bloomDay:
            if d <= days:
                flowers += 1
                if flowers == k: bouquets += 1; flowers = 0
            else: flowers = 0
        return bouquets >= m

    l, r = min(bloomDay), max(bloomDay)
    while l < r:
        mid = (l + r) // 2
        if can_bloom(mid): r = mid
        else: l = mid + 1
    return l if can_bloom(l) else -1
```
