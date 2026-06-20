# Arrays and Strings

## Why This Chapter Matters
Arrays and strings appear in GATE CSE every year — 4-8 marks. Array operations, sorting algorithms, string pattern matching, and time complexity analysis are all tested. This is also foundational for all other DSA topics.

## Prerequisites
- Basic programming (C/C++/Java/Python)
- Big-O notation basics
- Mathematical induction (for proofs)

---

## Core Concepts

### 1. Arrays

**Array:** Fixed-size collection of elements of the same type stored in contiguous memory.

**Access:** O(1) — direct address calculation: address = base + index x element_size
**Search:** O(n) linear scan, O(log n) binary search (sorted array)
**Insert/Delete:** O(n) — need to shift elements

**2D Arrays (Row-major vs Column-major):**
Row-major (C/C++): A[i][j] stored at base + (i x cols + j) x element_size
Column-major (Fortran, MATLAB): A[i][j] stored at base + (j x rows + i) x element_size

**GATE-type question:**
Q: Array A[1..10][1..8] stored in row-major order. Base = 100, element size = 4 bytes. Address of A[5][3]?
Address = 100 + [(5-1) x 8 + (3-1)] x 4 = 100 + [32 + 2] x 4 = 100 + 136 = **236**

### 2. Searching Algorithms

**Linear Search:** O(n) worst case, O(1) best case
Simple iteration through array.

**Binary Search:** O(log n) — ONLY for sorted arrays
```
low = 0, high = n-1
while low <= high:
    mid = (low + high) / 2
    if A[mid] == key: return mid
    if A[mid] < key: low = mid + 1
    else: high = mid - 1
return -1  # not found
```

**Number of comparisons in binary search:** ceil(log2(n+1)) in worst case.

### 3. Sorting Algorithms

**Comparison-based sorting lower bound:** O(n log n) — cannot do better with comparisons.

| Algorithm | Best | Average | Worst | Space | Stable? |
|---|---|---|---|---|---|
| Bubble Sort | O(n) | O(n^2) | O(n^2) | O(1) | Yes |
| Selection Sort | O(n^2) | O(n^2) | O(n^2) | O(1) | No |
| Insertion Sort | O(n) | O(n^2) | O(n^2) | O(1) | Yes |
| Merge Sort | O(n log n) | O(n log n) | O(n log n) | O(n) | Yes |
| Quick Sort | O(n log n) | O(n log n) | O(n^2) | O(log n) | No |
| Heap Sort | O(n log n) | O(n log n) | O(n log n) | O(1) | No |

**GATE focus:**
- Stable sorts: Bubble, Insertion, Merge (relative order of equal elements preserved)
- In-place sorts (O(1) extra space): Bubble, Selection, Insertion, Heap, Quick
- Merge sort: always O(n log n) — preferred for linked lists

**Quick sort worst case:** O(n^2) when pivot is always smallest or largest element (already sorted array with last element as pivot).

### 4. Strings

**String:** Array of characters terminated by null (in C).

**String matching:**
- Naive: O(nm) where n = text length, m = pattern length
- KMP (Knuth-Morris-Pratt): O(n + m) using failure function
- Rabin-Karp: O(nm) worst, O(n+m) average using hashing

**KMP Algorithm (GATE favourite):**

Failure function (partial match table):
- Compute longest proper prefix which is also suffix (LPPS) for each position in pattern
- Use to skip comparisons after mismatch

Example: Pattern = "ABCABCABC"
Position:   0 1 2 3 4 5 6 7 8
Pattern:    A B C A B C A B C
Failure:    0 0 0 1 2 3 4 5 6

**Boyer-Moore:** O(nm) worst, sub-linear average — scans right-to-left.

---

## Solved Examples (GATE-style)

### Example 1 — Sorting
**Q:** What is the minimum number of comparisons needed to sort 4 elements?
Using decision tree: minimum comparisons = ceil(log2(4!)) = ceil(log2(24)) = ceil(4.58) = **5**

### Example 2 — Binary Search
**Q:** Binary search on sorted array of 100 elements. Maximum comparisons needed?
Max comparisons = ceil(log2(101)) = **7**

### Example 3 — Quick Sort Partition
**Q:** After one partition of [5, 3, 8, 1, 9, 2, 7] with pivot = 5 (first element):
After partition: [3, 1, 2, 5, 9, 8, 7] — pivot 5 is now in correct position.
Elements left of 5 (< 5): [3, 1, 2] | Elements right of 5 (> 5): [9, 8, 7]

### Example 4 — Merge Sort
**Q:** Total number of comparisons in merge sort for n elements in worst case?
T(n) = n*log2(n) - n + 1 ≈ **O(n log n)**

---

## PYQs (GATE CSE)

**GATE 2024:** Consider sorting 10 elements using merge sort. Minimum number of comparisons in worst case:
Merge sort comparisons in worst case: n*log2(n) for merging = 10*log2(10) ≈ 33.

**GATE 2023:** Array contains n elements. Binary search for an element not in array:
Number of comparisons = floor(log2(n)) + 1

**GATE 2022:** Quick sort on already sorted array of n elements with last element as pivot:
This is the WORST case scenario.
T(n) = T(n-1) + T(0) + n-1 = O(n^2)

**GATE 2021:** Stable sorting algorithms from the list: bubble, selection, quick, merge?
Stable: **bubble and merge** (selection and quick are not stable in standard form)

---

## MCQ Practice

**Q1.** Which sorting algorithm has O(n) best case time?
(A) Selection sort (B) Merge sort (C) Insertion sort (D) Both B and C
Answer: C [Insertion sort is O(n) for already sorted array]

**Q2.** KMP algorithm complexity:
(A) O(nm) (B) O(n+m) (C) O(n log m) (D) O(m log n)
Answer: B

**Q3 (Hard).** Number of times Fibonacci(n) is called by recursive Fibonacci for n=10 (without memoization):
This is 2^10 ≈ 1024, but actual = 177. (Follows Fibonacci sequence of calls)
For general n: O(2^n) calls. For n=10, answer is **177** (count them).

---

## Revision Notes

```
ARRAY TIME COMPLEXITY:
Access: O(1)
Search (unsorted): O(n)
Search (sorted): O(log n) with binary search
Insert/Delete: O(n) [need to shift elements]

SORTING SUMMARY:
O(n^2): Bubble, Insertion, Selection
O(n log n): Merge, Heap, Quick (average)
O(n^2) worst case: Quick sort (when sorted, bad pivot)

STABLE SORTS (preserve relative order of equal elements):
Bubble Sort, Insertion Sort, Merge Sort

IN-PLACE SORTS (O(1) extra space):
Bubble, Selection, Insertion, Heap, Quick

STRING MATCHING:
Naive: O(nm)
KMP: O(n+m) using failure function
Rabin-Karp: O(n+m) average using hashing

BINARY SEARCH:
Requires SORTED array
Time: O(log n)
Max comparisons: ceil(log2(n+1))
```

## Related Topics
- Trees (sorting using BST), Graphs (adjacency matrix = 2D array)
- Dynamic Programming (2D DP arrays)
- GATE: Algorithm design, recurrences, time complexity analysis
