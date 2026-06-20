# Sorting and Searching

## Why This Chapter Matters
Sorting is tested in every GATE paper — 4-8 marks. Time/space complexity, stability, worst/best cases, and recurrence relations are all asked. Know every algorithm's characteristics.

## Core Concepts

### Complete Comparison-Based Sorting Analysis

| Algorithm | Best | Average | Worst | Space | Stable |
|---|---|---|---|---|---|
| Bubble Sort | O(n) | O(n^2) | O(n^2) | O(1) | YES |
| Selection Sort | O(n^2) | O(n^2) | O(n^2) | O(1) | NO |
| Insertion Sort | O(n) | O(n^2) | O(n^2) | O(1) | YES |
| Merge Sort | O(n log n) | O(n log n) | O(n log n) | O(n) | YES |
| Quick Sort | O(n log n) | O(n log n) | O(n^2) | O(log n) | NO |
| Heap Sort | O(n log n) | O(n log n) | O(n log n) | O(1) | NO |
| Count Sort | O(n+k) | O(n+k) | O(n+k) | O(k) | YES |
| Radix Sort | O(d(n+k)) | O(d(n+k)) | O(d(n+k)) | O(n+k) | YES |

**Lower bound:** Any comparison-based sort is Omega(n log n).

### Stable Sorts: Bubble, Insertion, Merge, Count, Radix
### In-place (O(1) space): Bubble, Selection, Insertion, Heap

### Quick Sort Details
**Partition:** Place pivot in correct position; all left < pivot < all right.
**Pivot selection matters:**
- Last element as pivot + sorted array = O(n^2) worst case
- Random pivot = O(n log n) expected
- Median-of-three = better in practice

**Recurrence:**
Average: T(n) = 2T(n/2) + n = O(n log n)
Worst: T(n) = T(n-1) + n = O(n^2)

### Merge Sort Details
Always O(n log n). Preferred for linked lists (no random access needed).
Extra O(n) space for merging.
Recurrence: T(n) = 2T(n/2) + n => O(n log n) by Master Theorem.

### Non-comparison Based Sorting
**Counting Sort:** For integers in range [0,k]. Count occurrences, accumulate, place. O(n+k).
**Radix Sort:** Sort digit by digit using counting sort. O(d(n+k)) where d=digits, k=digit range.
**Bucket Sort:** Divide into buckets, sort each, concatenate. O(n) average for uniformly distributed data.

## PYQs
**GATE 2024:** If input to Quick Sort is already sorted in descending order and we always pick the last element as pivot, what is the time complexity?
O(n^2) — every partition gives 0 and n-1 elements (worst case).

**GATE 2023:** Which of the following sorting algorithms is NOT stable?
Selection Sort and Heap Sort — they swap elements that may violate relative order of equals.

**GATE 2022:** Merge sort on array of 1000 elements. Approximately how many comparisons?
n log2 n = 1000 x 10 = 10000 comparisons approximately.

**GATE 2021:** Can we sort n elements in O(n) time?
Yes, IF elements are integers in small range (use counting sort). NOT possible for general comparison-based sort.

## Revision Notes
```
STABILITY (equal elements keep relative order): Bubble, Insertion, Merge, Count, Radix
IN-PLACE O(1) space: Bubble, Selection, Insertion, Heap

WORST CASES:
Quick sort: O(n^2) when sorted and picking last as pivot
All others: O(n^2) for Bubble/Selection/Insertion; O(n log n) for Merge/Heap

QUICK SORT RECURRENCE:
Best/Average: T(n) = 2T(n/2)+n => O(n log n)
Worst: T(n) = T(n-1)+n => O(n^2)

MERGE SORT: T(n) = 2T(n/2)+n => O(n log n) — always!

NON-COMPARISON:
Count Sort: O(n+k), Radix Sort: O(d(n+k)), Bucket Sort: O(n) avg
```
