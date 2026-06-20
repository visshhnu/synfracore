# Dynamic Programming

## Why This Chapter Matters
DP is tested in GATE every year — 6-10 marks. Classical problems (LCS, LIS, 0/1 Knapsack, Matrix Chain, Edit Distance, Coin Change) with recurrences and time complexity analysis are regularly asked.

## Prerequisites
- Recursion and recursion tree
- Arrays and 2D arrays (for DP table)
- Basic algorithm analysis

---

## Core Concepts

### 1. What is Dynamic Programming?

DP is an algorithmic technique for solving optimization problems with:
1. **Optimal Substructure:** Optimal solution contains optimal solutions to subproblems
2. **Overlapping Subproblems:** Same subproblems solved multiple times (unlike Divide & Conquer)

**Approaches:**
- **Top-down (Memoization):** Recursion + caching results
- **Bottom-up (Tabulation):** Fill table iteratively

### 2. Classical DP Problems

#### Fibonacci (Basic DP example)
Naive: O(2^n) | With DP: O(n) time, O(n) space (or O(1) with two variables)

#### Longest Common Subsequence (LCS)

Given strings X[1..m] and Y[1..n], find length of longest common subsequence.

**Recurrence:**
```
LCS[i][j] = 0 if i=0 or j=0
LCS[i][j] = LCS[i-1][j-1] + 1 if X[i] = Y[j]
LCS[i][j] = max(LCS[i-1][j], LCS[i][j-1]) if X[i] != Y[j]
```
Time: O(mn), Space: O(mn)

**Example:** X = "ABCBDAB", Y = "BDCAB"
LCS length = 4 (BCAB or BDAB)

#### Longest Increasing Subsequence (LIS)

Given array A[1..n], find length of longest strictly increasing subsequence.

**O(n^2) DP:**
```
dp[i] = 1 + max(dp[j]) for all j < i where A[j] < A[i]
LIS = max(dp[i])
```

**O(n log n) using Patience Sorting** (with binary search on tails array)

**Example:** A = [3, 1, 4, 1, 5, 9, 2, 6]
LIS = 4 (1, 4, 5, 9 or 1, 4, 5, 6)

#### 0/1 Knapsack

Given n items with weights w[] and values v[], and capacity W.
Choose items to maximize value without exceeding weight W.

**Recurrence:**
```
dp[i][w] = max value using items 1..i with capacity w
dp[i][w] = dp[i-1][w] if w[i] > w (can't include item i)
dp[i][w] = max(dp[i-1][w], v[i] + dp[i-1][w-w[i]]) if w[i] <= w
```
Time: O(nW), Space: O(nW)

**IMPORTANT:** 0/1 Knapsack is NOT polynomial in input size (W can be exponentially large) — it's pseudo-polynomial.

**Fractional Knapsack:** Greedy works (take fractions allowed). ONLY 0/1 Knapsack requires DP.

#### Matrix Chain Multiplication

Given matrices A1, A2, ..., An, find optimal order to minimize total multiplications.

**Key:** Multiplying p x q matrix with q x r matrix costs p*q*r multiplications.

**Recurrence:**
```
dp[i][j] = minimum cost to multiply matrices i through j
dp[i][i] = 0 (single matrix, no cost)
dp[i][j] = min over all k (i <= k < j) of: dp[i][k] + dp[k+1][j] + p[i-1]*p[k]*p[j]
```
Time: O(n^3), Space: O(n^2)

#### Edit Distance (Levenshtein Distance)

Minimum operations (insert, delete, replace) to convert string X to string Y.

**Recurrence:**
```
dp[i][j] = 0 if i=0: insert j characters
dp[i][j] = 0 if j=0: delete i characters
dp[i][j] = dp[i-1][j-1] if X[i] = Y[j]: same character
dp[i][j] = 1 + min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) if X[i] != Y[j]
```
Operations: dp[i-1][j] + 1 = delete | dp[i][j-1] + 1 = insert | dp[i-1][j-1] + 1 = replace

Time: O(mn), Space: O(mn)

#### Coin Change

**Minimum coins to make amount S using coins c[1..n] (unlimited supply):**
```
dp[0] = 0
dp[s] = min over all i: dp[s - c[i]] + 1 for c[i] <= s
```
Time: O(S*n)

**Number of ways to make amount S:**
```
dp[0] = 1
for each coin c: for s from c to S: dp[s] += dp[s-c]
```

---

## Solved Examples (GATE-style)

### Example 1 — LCS
**Q:** Find LCS length of "AGGTAB" and "GXTXAYB".
LCS = "GTAB", length = **4**

### Example 2 — 0/1 Knapsack
**Q:** Items: (w=1, v=1), (w=3, v=4), (w=4, v=5), (w=5, v=7). Capacity W=7.
Take items 2 and 1: weight=4, value=5? No...
Optimal: Items (w=3,v=4) + (w=4,v=5) = weight 7, value 9
Or: (w=3,v=4) + (w=1,v=1) = weight 4, value 5. Not optimal.
Best: items with w=3 and w=4: **value = 9**

### Example 3 — Edit Distance
**Q:** Edit distance between "KITTEN" and "SITTING"?
k->s (replace), i=i (same), t=t (same), t->t (same), e->i (replace), n->n (same), (add g)
Wait — standard DP gives: **3** (replace k->s, replace e->i, insert g)

---

## PYQs (GATE CSE)

**GATE 2024:** For LCS of "ABCDE" and "ABEDC", what is the length?
DP table computation: LCS = "ABDC" or "ABEC", length = **4**

**GATE 2023:** Bellman-Ford vs Dijkstra: which can handle negative weights?
**Bellman-Ford** handles negative weights. Dijkstra cannot.

**GATE 2022:** Matrix chain with dimensions 10x30, 30x5, 5x60. Find optimal cost.
Option 1: (A1 x A2) x A3 = 10x30x5 + 10x5x60 = 1500 + 3000 = **4500**
Option 2: A1 x (A2 x A3) = 30x5x60 + 10x30x60 = 9000 + 18000 = 27000
Optimal: **4500**

**GATE 2021:** In 0/1 Knapsack with n items and capacity W, time complexity of DP solution?
**O(nW)** — fill dp[n+1][W+1] table.

---

## MCQ Practice

**Q1.** Which problem has O(n^3) DP solution?
(A) LCS (B) LIS (C) Matrix Chain Multiplication (D) Coin Change
Answer: C

**Q2.** 0/1 Knapsack differs from fractional Knapsack because:
(A) Greedy works for 0/1 (B) DP needed for 0/1, greedy for fractional (C) Both use DP (D) Both use greedy
Answer: B

**Q3 (Hard).** Minimum number of scalar multiplications to compute A1.A2.A3.A4 where dimensions are 5x4, 4x6, 6x2, 2x7?
Use matrix chain DP...
Optimal: ((A1.A2).A3).A4 = (5x4x6 + 5x6x2) + 5x2x7 = (120+60) + 70 = **250**

---

## Revision Notes

```
DP REQUIRES:
1. Optimal Substructure
2. Overlapping Subproblems

CLASSICAL DP PROBLEMS:
LCS: O(mn) - common subsequence of two strings
LIS: O(n^2) or O(n log n) - increasing subsequence in array
0/1 Knapsack: O(nW) - select items with max value under weight limit
Matrix Chain: O(n^3) - optimal parenthesisation for matrix multiplication
Edit Distance: O(mn) - min operations to convert one string to another
Coin Change: O(Sn) - min coins or number of ways to make amount S

RECURRENCE TEMPLATE:
1. Define dp[i] or dp[i][j] with clear meaning
2. Write base cases
3. Write recurrence
4. Determine traversal order (ensure subproblems solved before needed)
5. Return final answer (often dp[n] or dp[m][n])

MEMOIZATION vs TABULATION:
Memoization: top-down recursion + cache, easier to write
Tabulation: bottom-up iteration, better space management
```

## Related Topics
- Graphs (Bellman-Ford, Floyd-Warshall are DP on graphs)
- Trees (tree DP)
- GATE: Algorithm design, NP-completeness (Knapsack is NP-hard)
