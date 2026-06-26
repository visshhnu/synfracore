# GATE CSE/ECE — Previous Year Pattern Questions

## Data Structures & Algorithms (CSE)

**Q1.** What is the time complexity of building a max-heap from n elements?
(a) O(n log n)    **(b) O(n)**    (c) O(log n)    (d) O(n²)

Floyd's build-heap algorithm: O(n). Intuition: most nodes are near leaves (short paths). Inserting one by one would be O(n log n).

---

**Q2.** A queue is implemented using a stack. The minimum number of stacks needed to implement a queue efficiently (O(1) amortized push and O(1) amortized pop) is:
**(a) 2**    (b) 1    (c) 3    (d) 4

Two stacks: Stack1 for enqueue, Stack2 for dequeue. When Stack2 empty, transfer all from Stack1 to Stack2. Amortized O(1).

---

**Q3.** Which sorting algorithm is stable and has O(n log n) worst-case complexity?
(a) Quick sort    (b) Heap sort    **(c) Merge sort**    (d) Selection sort

Merge sort: stable, O(n log n) worst case. Quick sort: O(n²) worst case. Heap sort: not stable.

---

## Operating Systems (CSE)

**Q4.** In Banker's Algorithm for deadlock avoidance, the system is in a safe state if:
(a) No process is waiting for resources
(b) All processes can complete in some order without deadlock
**(c) There exists a safe sequence for all processes**
(d) Each process gets exactly the resources it requests

A safe sequence exists → system can complete all processes without deadlock → safe state.

---

## Digital Electronics (ECE)

**Q5.** The Boolean expression AB + A'C + BC simplifies to:
**(a) AB + A'C**

This is the Consensus Theorem: XY + X'Z + YZ = XY + X'Z. The term BC is redundant (consensus term). Can be verified with K-map.

---

**Q6.** A 4-bit ripple carry adder adds two 4-bit numbers. The worst-case propagation delay if each full adder has carry propagation delay of 10 ns and sum delay of 15 ns is:
(a) 45 ns    **(b) 55 ns**    (c) 60 ns    (d) 40 ns

Worst case: carry ripples through all 4 stages. Carry delay: 4 × 10 = 40 ns. Plus final sum: 15 ns. Total = 55 ns.

---

## Computer Networks (CSE/ECE)

**Q7.** In IPv4, the maximum number of host addresses in a /28 subnet is:
(a) 16    **(b) 14**    (c) 30    (d) 32

/28 = 32 - 28 = 4 host bits = 2⁴ = 16 addresses. Subtract network (all 0s) and broadcast (all 1s) = 14 usable hosts.

---

## GATE Exam Strategy

**Marks Distribution (CSE):**

| Subject | Marks |
|---------|-------|
| DS & Algorithms | 15–20 |
| DBMS | 8–10 |
| OS | 10–12 |
| Computer Networks | 8–10 |
| TOC | 8–10 |
| Compiler Design | 5–7 |
| Digital Logic | 8–10 |
| Architecture | 5–7 |
| Math (Discrete, Probability, LA, Calculus) | 13–15 |
| Programming (C) | 5–8 |
| **Total** | **100** |

**Scoring:** 65+ score (out of 100) puts you in top 1000. 70+ for IIT/IISc CS. Check GATE cutoffs for specific institution.
