# Linked Lists

## Why This Chapter Matters
Linked lists appear in GATE CSE every year — 4-6 marks. Operations, reversal, cycle detection, and complexity analysis are all tested.

## Core Concepts

### 1. Types
**Singly Linked List:** Node = (data | next pointer). Last node next = NULL.
**Doubly Linked List:** Node = (prev | data | next). Bidirectional traversal.
**Circular Linked List:** Last node points back to first. No NULL pointer.

### 2. Operations and Complexity

| Operation | Singly LL | Array |
|---|---|---|
| Access by index | O(n) | O(1) |
| Search | O(n) | O(n) |
| Insert at beginning | O(1) | O(n) |
| Insert at end | O(n) or O(1) with tail ptr | O(1) amortized |
| Insert at position | O(n) | O(n) |
| Delete at beginning | O(1) | O(n) |
| Delete at end | O(n) | O(1) |

### 3. Reversal of Linked List

**Iterative (3 pointers):**
prev = NULL, curr = head, next = NULL
while curr != NULL:
    next = curr.next
    curr.next = prev
    prev = curr
    curr = next
head = prev

Time: O(n), Space: O(1)

**Recursive:** reverse(head) -> returns new head, flips pointers during backtracking.

### 4. Cycle Detection (Floyd's Algorithm)

**Tortoise and Hare:**
slow moves 1 step, fast moves 2 steps per iteration.
If they meet: cycle exists.
If fast reaches NULL: no cycle.

**Finding cycle start:** When they meet, reset slow to head. Move both 1 step at a time. They meet at cycle start.

### 5. Common GATE Questions

**Merge two sorted lists:** O(m+n) — compare heads, link smaller, recurse.
**Find middle:** slow/fast pointer — when fast reaches end, slow is at middle.
**Nth from end:** Two pointers n apart — when front reaches end, back is at Nth from end.

## PYQs
**GATE 2024:** Time complexity of reversing a singly linked list of n elements?
O(n) — visit each node exactly once.

**GATE 2023:** A linked list has a cycle. The length of cycle is k. If slow and fast pointers start together, after how many steps do they meet?
They meet after k steps (one full cycle traversal by the slow pointer once fast enters the cycle).

**GATE 2022:** In doubly linked list, deleting a node requires changing how many pointers?
4 pointer updates: prev.next = node.next, node.next.prev = node.prev (2 to remove node), plus update the two pointers in the deleted node (optional). Minimum: 2 pointer updates.

## Revision Notes
```
SINGLY LL: insert/delete at head O(1), at tail O(n) without tail pointer
DOUBLY LL: insert/delete anywhere O(1) with pointer to node, O(n) to find node
CIRCULAR LL: no null terminator, useful for round-robin scheduling

REVERSAL: 3 pointer iterative O(n) O(1) — MOST COMMON GATE QUESTION
CYCLE DETECTION: Floyd's tortoise-hare algorithm O(n) O(1)

ADVANTAGE over array: Dynamic size, O(1) insert/delete at head
DISADVANTAGE: No random access, extra memory for pointers
```
