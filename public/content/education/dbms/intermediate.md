# DBMS — Intermediate

## Functional Dependencies — closure, worked example

```
Given relation R(A, B, C, D, E) with FDs:
  A → B
  B → C
  A, C → D
  D → E

Find the closure of {A}, written A+ (all attributes determined by A):
  Start: A+ = {A}
  A → B applies (A is in A+) → A+ = {A, B}
  B → C applies (B is in A+ now) → A+ = {A, B, C}
  A,C → D applies (both A and C in A+) → A+ = {A, B, C, D}
  D → E applies → A+ = {A, B, C, D, E}

A+ = {A,B,C,D,E} = all attributes of R → A alone is a candidate
key (a superkey with no redundant attribute, since removing A
would give an empty closure).

This closure algorithm is the actual mechanical tool behind
"find all candidate keys" and "is this decomposition lossless"
questions — most students memorize normal-form definitions
without being able to run this algorithm, which is what
intermediate/GATE-level questions actually test.
```

## Indexing — B+ Tree mechanics

```
B+ Tree (used by nearly every real relational database index):
  - All actual data pointers live in leaf nodes only
  - Internal nodes hold only keys, used purely for navigation
  - Leaf nodes are linked together (sequential scan without
    re-traversing the tree — this is why range queries like
    `WHERE age BETWEEN 20 AND 30` are efficient on a B+ tree index)

Order (max children per node) and height relationship:
  A B+ tree of order p, holding n keys, has height ≈ log_⌈p/2⌉(n)
  — this logarithmic height is the entire reason indexed lookup
  is O(log n) instead of O(n): even a billion-row table needs
  only a handful of node reads to reach the target leaf.

Why B+ over plain B-Tree for databases specifically: B-Trees
store data pointers in internal nodes too, which means a range
scan has to traverse up and down the tree repeatedly. B+ trees'
linked-leaf structure turns a range scan into a straight leaf-to-
leaf walk after just one initial descent — a deliberate design
choice for disk-based databases where each node read is an
expensive disk I/O to minimize.
```

## Query Processing — join algorithms

```
Nested Loop Join (simplest, works on any join condition):
  for each row in R (outer):
    for each row in S (inner):
      if match: output
  Cost: O(|R| × |S|) in the worst case — fine for small tables,
  bad for large ones without an index to speed up the inner scan.

Hash Join (equality joins only):
  Build a hash table on the smaller relation's join key,
  then probe it once per row of the larger relation.
  Cost: roughly O(|R| + |S|) — much better than nested loop for
  large tables, but only works for equality conditions (=), not
  range joins (< , BETWEEN), since a hash table can't answer
  "give me everything less than this value" efficiently.

Sort-Merge Join:
  Sort both relations on the join key, then merge like the
  merge step of merge sort.
  Cost: dominated by the sort, O(n log n) — worth it when both
  relations are already sorted (e.g. via an existing index),
  since then the sort cost disappears entirely.

Real query optimizers (PostgreSQL's EXPLAIN, for example) choose
between these per-query based on table statistics — an
intermediate-level understanding means being able to read an
EXPLAIN plan and say *why* the optimizer picked hash join over
nested loop for a given query, not just naming the algorithms.
```

## Concurrency Control — Two-Phase Locking

```
2PL (Two-Phase Locking): every transaction has a growing phase
  (acquiring locks, never releasing) followed by a shrinking
  phase (releasing locks, never acquiring) — once a transaction
  releases its first lock, it may not acquire any new lock.

  This guarantees conflict-serializability — the actual reason
  2PL is used, not an arbitrary rule: if every transaction
  respects growing/shrinking, the resulting schedule is
  guaranteed equivalent to some serial (one-at-a-time) execution
  of the same transactions, which is the correctness property
  concurrent transactions actually need.

Strict 2PL: hold ALL locks (including write locks) until commit
  — prevents cascading rollbacks (one transaction's abort forcing
  another to abort too, because it read data the first transaction
  never actually committed) and is what nearly every real database
  uses in practice, not plain 2PL.

Deadlock in 2PL: two transactions each hold a lock the other
  needs — detected via a wait-for graph (transaction T1 → T2 if
  T1 waits for a lock T2 holds); a cycle in this graph means
  deadlock, resolved by aborting one transaction in the cycle
  (usually the "youngest" one, to avoid repeatedly aborting the
  same long-running transaction).
```

## Transition to Advanced

You're ready for advanced DBMS topics when you can:
- Compute a functional-dependency closure and identify all candidate keys for a given relation and FD set
- Explain why a query optimizer would pick hash join over nested loop for a specific query, from an EXPLAIN-style plan
- Trace a wait-for graph from a set of lock requests and correctly identify a deadlock cycle
