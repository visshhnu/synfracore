# Normalisation

## Why This Chapter Matters
Normalisation is the most-tested GATE DBMS topic — 6-10 marks. Finding functional dependencies, finding candidate keys, determining normal form, and lossless/dependency-preserving decomposition are all tested.

## Core Concepts

### 1. Functional Dependencies (FDs)
A -> B means: for any two tuples, if A values are equal, B values must be equal.
A is the determinant, B is the dependent.

**Trivial FD:** A -> B where B is subset of A. Trivially always true.
**Non-trivial:** B is not subset of A.

### 2. Closure of Attribute Set
F+ = all FDs derivable from given set F.
Closure of A (A+): set of all attributes functionally determined by A.

**Algorithm for closure A+:**
Start with A+ = A
For each FD X->Y in F: if X is subset of A+, add Y to A+.
Repeat until no change.

### 3. Candidate Keys
**Superkey:** A set whose closure includes all attributes.
**Candidate key:** Minimal superkey (no subset is a superkey).

To find candidate keys: check which attribute combinations determine all others.

### 4. Normal Forms

**1NF:** All attributes are atomic (no multi-valued, no nested attributes). Every relation is in 1NF by definition in relational model.

**2NF:** In 1NF AND no partial dependency (non-key attribute depends on PART of composite key).
Violation: Prime attribute -> non-prime attribute.
Simple fix: Remove partial dependency into separate table.

**3NF:** In 2NF AND no transitive dependency (non-key attribute depends on another non-key attribute).
Rule: For every FD A->B: either A is superkey OR B is prime attribute (part of some candidate key).

**BCNF (Boyce-Codd):** For every FD A->B: A must be a superkey.
Stricter than 3NF. BCNF may not preserve all dependencies.

3NF vs BCNF:
- BCNF: no anomalies but may lose some FDs
- 3NF: may have some anomalies but preserves all FDs

### 5. Decomposition Properties
**Lossless decomposition:** Original relation can be reconstructed by natural join. For decomposition into R1,R2: must have R1 intersection R2 -> R1 or R1 intersection R2 -> R2.

**Dependency preserving:** All original FDs can be verified within individual decomposed relations (without joining).

## PYQs
**GATE 2024:** R(A,B,C,D), FDs: AB->C, C->D, D->A. Find candidate keys.
Closure of AB: AB+ = {A,B,C,D} (AB->C, C->D, D->A). AB is superkey. Is it minimal? Yes. CK = AB.
Wait: closure of BC: BC+ = {B,C,D,A} = all. BC is superkey. Is B alone enough? B+ = {B}. No. Is C alone? C+ = {C,D,A}. Needs B. So BC is also CK.
Candidate keys: AB, BC, BD... (work out all minimal superkeys).

**GATE 2023:** R(A,B,C,D), FD: A->B, B->C, C->D. What is highest normal form?
A->B->C->D is a transitive chain. A is the only candidate key.
All non-key (B,C,D) depend on key A, but B->C (non-key->non-key = transitive dependency).
Violates 3NF. So R is in 2NF but NOT 3NF.

**GATE 2022:** When is BCNF decomposition preferred over 3NF?
When we want to eliminate ALL redundancy and don't need to preserve all FDs within individual tables.

## Revision Notes
```
CLOSURE A+: start with A, repeatedly add B where X->B and X subset A+

CANDIDATE KEY: set whose closure = all attributes, no proper subset is a superkey

NORMAL FORMS (from weakest to strongest):
1NF: atomic attributes
2NF: no partial dependency on composite key
3NF: no transitive dependency (A->B: A is superkey OR B is prime)
BCNF: every determinant is superkey

DECOMPOSITION:
Lossless: R1 ∩ R2 -> R1 OR R1 ∩ R2 -> R2
Dependency-preserving: all FDs checkable in decomposed tables

TRADE-OFF: BCNF = no redundancy but may lose FDs
          3NF = preserves all FDs but may have some anomalies
```
