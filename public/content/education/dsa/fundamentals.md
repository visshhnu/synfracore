# Data Structures & Algorithms — Fundamentals

## Arrays and Strings

An array stores elements in contiguous memory, accessed by index — this is what makes array access O(1): the computer can jump directly to any position by calculating its memory address, without searching. The techniques below are the standard ways to solve array/string problems efficiently instead of falling back to nested loops (O(n²)).

**Two pointers**: use two index variables moving through the array (often from opposite ends, or one ahead of the other) instead of checking every possible pair — this turns many O(n²) "check every pair" problems into O(n).

```python
def two_sum_sorted(arr, target):
    l, r = 0, len(arr) - 1
    while l < r:
        s = arr[l] + arr[r]
        if s == target: return [l, r]
        elif s < target: l += 1
        else: r -= 1
    return []
```

**Sliding window**: for problems about a contiguous sub-range (a "window") of the array, instead of recalculating the sum/condition for every possible window from scratch, slide the window by one position and adjust incrementally — subtract what left the window, add what entered it.

```python
def max_sum_window(arr, k):
    window_sum = sum(arr[:k])
    max_sum = window_sum
    for i in range(k, len(arr)):
        window_sum += arr[i] - arr[i-k]   # add new element, remove the one that left the window
        max_sum = max(max_sum, window_sum)
    return max_sum
```

**Prefix sums**: precompute cumulative sums once, so any range-sum query afterward is O(1) instead of re-summing that range every time it's asked.

```python
def build_prefix(arr):
    prefix = [0] * (len(arr) + 1)
    for i, v in enumerate(arr):
        prefix[i+1] = prefix[i] + v
    return prefix

def range_sum(prefix, l, r):  # inclusive
    return prefix[r+1] - prefix[l]
```

## Linked Lists

Unlike an array, a linked list doesn't store elements contiguously — each node holds a value and a pointer to the next node. This means no O(1) random access by index (you have to walk from the start), but insertion/deletion at a known position doesn't require shifting every other element the way an array does.

```python
class Node:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

# Reverse a linked list -- walk through, flipping each node's pointer
# to point backward instead of forward
def reverse(head):
    prev, curr = None, head
    while curr:
        nxt = curr.next
        curr.next = prev
        prev = curr
        curr = nxt
    return prev

# Detect a cycle (Floyd's algorithm): a fast pointer moves 2 steps for
# every 1 step the slow pointer takes. If there's a cycle, the fast
# pointer will eventually lap the slow one and they'll meet. If there's
# no cycle, the fast pointer simply reaches the end first.
def has_cycle(head):
    slow = fast = head
    while fast and fast.next:
        slow = slow.next
        fast = fast.next.next
        if slow == fast: return True
    return False

# Merge two already-sorted linked lists into one sorted list
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

These are two of the simplest but most-used data structures, distinguished entirely by which end you add/remove from:

- **Stack — LIFO (Last In, First Out)**: the most recently added item is the first one removed. Think of a physical stack of plates — you add to the top, and you can only take from the top.
- **Queue — FIFO (First In, First Out)**: the earliest added item is the first one removed. Think of a line at a shop — first person in line is served first.

```python
# Stack -- LIFO
stack = []
stack.append(x)   # push (add to top)
stack.pop()       # pop (remove from top)
stack[-1]         # peek (look at top without removing)

# Queue -- FIFO
from collections import deque
q = deque()
q.append(x)       # enqueue (add to back)
q.popleft()       # dequeue (remove from front) -- O(1), unlike list.pop(0) which is O(n)
```

**Monotonic stack** — a stack kept in increasing or decreasing order by only pushing elements that maintain that order, popping off anything that violates it first. Useful for "next greater/smaller element" style problems:

```python
def next_greater(arr):
    result = [-1] * len(arr)
    stack = []  # stores indices, kept so their values are decreasing
    for i, v in enumerate(arr):
        while stack and arr[stack[-1]] < v:
            result[stack.pop()] = v
        stack.append(i)
    return result
```

**Valid parentheses** — a classic stack application: every closing bracket must match the most recently opened, unclosed bracket, which is exactly what a stack naturally tracks.

```python
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

Binary search finds a target in a **sorted** array in O(log n) by repeatedly eliminating half of the remaining possibilities — check the middle element; if the target is smaller, it must be in the left half (discard the right half entirely), and vice versa. This only works because the array is sorted; on unsorted data, there's no way to know which half to discard.

```python
def binary_search(arr, target):
    l, r = 0, len(arr) - 1
    while l <= r:
        mid = (l + r) // 2
        if arr[mid] == target: return mid
        elif arr[mid] < target: l = mid + 1
        else: r = mid - 1
    return -1

# Lower bound -- find the leftmost position where target could be inserted
# to keep the array sorted (useful even when target isn't present)
def lower_bound(arr, target):
    l, r = 0, len(arr)
    while l < r:
        mid = (l + r) // 2
        if arr[mid] < target: l = mid + 1
        else: r = mid
    return l

# "Binary search on the answer" -- a less obvious application: instead of
# searching an array, search a RANGE OF POSSIBLE ANSWERS for the smallest
# (or largest) value that satisfies some condition, using the same
# halve-the-search-space idea.
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

## Recursion — The Idea Everything After This Section Depends On

A recursive function solves a problem by calling itself on a **smaller version of the same problem**, until it reaches a version simple enough to answer directly without recursing further — that stopping condition is called the **base case**. Without a base case, a recursive function calls itself forever until Python raises a `RecursionError`.

```python
def factorial(n):
    if n <= 1:              # base case -- stops the recursion
        return 1
    return n * factorial(n - 1)   # recursive case -- smaller version of the same problem

print(factorial(5))   # 5 * 4 * 3 * 2 * 1 = 120
```

Tracing through `factorial(3)` to see what actually happens:
```
factorial(3) = 3 * factorial(2)
             = 3 * (2 * factorial(1))
             = 3 * (2 * 1)                <- factorial(1) hits the base case, returns 1 directly
             = 6
```

Each call waits for the one below it to return before it can complete — this is why recursive calls use up **call stack** space (space complexity O(n) for n levels of recursion), and why a recursive solution to a problem a loop could also solve isn't automatically "better," just often clearer to read for problems that are naturally recursive in structure.

**Why this matters going forward**: trees and graphs (this course's Intermediate section) are naturally recursive structures — a tree is, by definition, a node connected to smaller trees (its subtrees). Dynamic programming (Advanced) is built directly on top of recursion, adding one idea: caching results so the same smaller subproblem is never recomputed. Nothing past this point in the course makes sense without being comfortable with the idea of a function calling itself on a smaller version of the same problem.
