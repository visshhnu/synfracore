# Relational Algebra

## Why This Chapter Matters
Relational algebra is tested in GATE every year — 4-8 marks. Writing RA expressions for given queries, computing result sizes, and understanding join conditions are all tested.

## Core Concepts

### 1. Basic Operations

**Selection (sigma):** sigma_{condition}(R) — selects rows satisfying condition.
Result: subset of tuples. Same number of columns. Columns unchanged.

**Projection (pi):** pi_{col1,col2,...}(R) — selects specific columns.
Result: same rows, fewer columns. Duplicate rows are REMOVED (relation = set).

**Cross Product (x):** R x S — all combinations of rows.
Result: |R|*|S| tuples, |R|+|S| columns.

**Union (union):** R union S — must be union-compatible (same schema).
**Intersection (intersection):** R intersection S — tuples in both.
**Difference (-):** R - S — tuples in R but not in S.

### 2. Joins

**Natural Join (bowtie):** Join on all common attributes. Removes duplicate columns.
Result size: between 0 and |R|*|S|.

**Theta Join (R bowtie_theta S):** Cross product + selection on condition theta.
Equivalent to: sigma_theta(R x S)

**Equi-Join:** Theta join where condition is equality.

**Outer Joins:**
Left outer join: keeps all rows from R, fills NULLs for unmatched S rows.
Right outer join: keeps all rows from S.
Full outer join: keeps all rows from both.

### 3. Division (R/S)
R(X,Y) / S(Y) = tuples of X-values in R that appear with EVERY tuple in S.
Used for "for all" queries ("find students who took ALL courses").

### 4. Result Size Estimation

For join R bowtie_{R.A=S.A} S:
If A is PK of S: result size <= |R|
If A is FK in R referencing S: result = |R| (assuming referential integrity)
Otherwise: estimate = |R| * |S| / max(distinct values of A in R, distinct values in S)

## PYQs
**GATE 2024:** R has 1000 tuples, S has 2000 tuples, R cross S has?
1000 * 2000 = 2,000,000 tuples.

**GATE 2023:** Express "find all student IDs who enrolled in both CS101 and CS201" in RA.
pi_{SID}(sigma_{CID='CS101'}(ENROLLMENT)) intersection pi_{SID}(sigma_{CID='CS201'}(ENROLLMENT))

**GATE 2022:** Natural join of R(A,B,C) and S(B,C,D). What is schema of result?
(A, B, C, D) — common attributes B,C kept once.

## Revision Notes
```
SELECTION: horizontal filter (rows) — sigma
PROJECTION: vertical filter (cols) — pi, removes duplicates

OPERATIONS: union, intersection, difference — need same schema
CROSS PRODUCT: all row combinations, (|R|*|S|) tuples

JOINS:
Natural join: join on common attributes
Theta join: cross product + condition
Left/Right/Full outer join: preserve unmatched rows with NULLs

DIVISION R/S: tuples in R associated with ALL tuples in S
Use for "for all" type queries
```
