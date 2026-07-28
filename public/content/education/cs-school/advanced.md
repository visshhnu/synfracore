# Computer Science Basics — Advanced

This section covers the topics that separate a working knowledge of Python from genuine CS fundamentals: a real data structure (the stack), organizing code across files with modules, and the searching/sorting algorithms that come up constantly in board exams and practicals.

## The Stack — LIFO in Practice

A stack is a data structure where the last item added is the first one removed — **LIFO: Last In, First Out** (think of a stack of plates: you add to the top, and you take from the top, never the bottom). Python doesn't have a dedicated stack type, but a list implements one directly:

```python
stack = []

# Push -- add to the top
stack.append(10)
stack.append(20)
stack.append(30)
print(stack)          # [10, 20, 30]

# Peek -- look at the top without removing it
print(stack[-1])      # 30

# Pop -- remove and return the top item
top = stack.pop()
print(top)            # 30
print(stack)          # [10, 20]  -- 30 is gone

# Check if empty before popping -- popping an empty stack crashes
if stack:
    print(stack.pop())
else:
    print("Stack is empty")
```

**Where a stack actually matters**: undo functionality (each action pushed, undo pops the most recent one), matching brackets in an expression, and reversing the order of a sequence are all naturally stack problems. A CBSE Class 12 practical often asks you to implement a stack-based menu (push, pop, peek, display) using a list exactly like this.

```python
# A complete, menu-driven stack example (typical practical-exam style)
def push(stack, item):
    stack.append(item)

def pop(stack):
    if not stack:
        print("Stack is empty -- cannot pop")
        return None
    return stack.pop()

def peek(stack):
    if not stack:
        print("Stack is empty")
        return None
    return stack[-1]

my_stack = []
push(my_stack, "A")
push(my_stack, "B")
push(my_stack, "C")
print("Top:", peek(my_stack))     # C
print("Popped:", pop(my_stack))   # C
print("Stack now:", my_stack)     # ['A', 'B']
```

## Modules — Splitting Code Across Files

As programs grow, keeping everything in one file becomes unmanageable. A module is just a `.py` file whose functions/variables you can reuse from another file:

```python
# File: calculator.py
def add(a, b):
    return a + b

def subtract(a, b):
    return a - b

PI = 3.14159
```

```python
# File: main.py -- in the same folder as calculator.py
import calculator

print(calculator.add(5, 3))        # 8
print(calculator.subtract(10, 4))  # 6
print(calculator.PI)               # 3.14159

# Alternative import styles
from calculator import add          # import just one function
print(add(2, 2))                    # 4 -- no need to write calculator.add now

from calculator import add as plus  # import with a different name
print(plus(1, 1))                   # 2
```

Python's own standard library works exactly this way — `import math`, `import random`, `import csv` (which you've already used in this course's file-handling examples) are all modules someone else wrote, imported the same way you'd import your own.

## Linear Search and Binary Search

Two ways to find a value in a list, with very different performance characteristics:

```python
# Linear search -- check every element in order until found
def linear_search(items, target):
    for i in range(len(items)):
        if items[i] == target:
            return i          # found -- return its position
    return -1                  # not found

numbers = [45, 12, 78, 3, 90, 21]
print(linear_search(numbers, 78))   # 2
print(linear_search(numbers, 100))  # -1

# Binary search -- MUCH faster, but requires the list to be SORTED first
def binary_search(items, target):
    low, high = 0, len(items) - 1
    while low <= high:
        mid = (low + high) // 2
        if items[mid] == target:
            return mid
        elif items[mid] < target:
            low = mid + 1      # target must be in the right half
        else:
            high = mid - 1     # target must be in the left half
    return -1

sorted_numbers = [3, 12, 21, 45, 78, 90]
print(binary_search(sorted_numbers, 45))   # 3
```

**Why binary search is faster**: linear search may check every single element in the worst case. Binary search eliminates half the remaining possibilities at every step — for 1000 sorted items, linear search could take 1000 checks, binary search takes at most 10. The trade-off: binary search only works on data that's already sorted.

## A Sorting Algorithm — Bubble Sort

```python
def bubble_sort(items):
    n = len(items)
    for i in range(n):
        for j in range(0, n - i - 1):
            if items[j] > items[j + 1]:
                items[j], items[j + 1] = items[j + 1], items[j]  # swap
    return items

numbers = [64, 34, 25, 12, 22, 11, 90]
print(bubble_sort(numbers))   # [11, 12, 22, 25, 34, 64, 90]
```

Bubble sort repeatedly compares neighboring pairs and swaps them if they're in the wrong order — after each full pass, the largest remaining unsorted value "bubbles up" to its correct position. It's not the fastest sorting algorithm (Python's built-in `sorted()` uses a much faster one internally), but it's the standard first sorting algorithm taught precisely because tracing through it by hand builds real intuition for what "sorting" actually involves step by step.

## Next Steps

You've now covered the full progression from this course's Overview through Advanced. From here: work through the Projects section (a report-card generator, a quiz game, and a file-based student-records system — all using what you've learned) and the Interview/Practice Q&A section for board-exam-style questions on everything covered across these four sections.
