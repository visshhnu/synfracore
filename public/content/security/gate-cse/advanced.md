# GATE CSE Advanced Topics

## Complexity Theory
**Complexity Classes:**
- P: Problems solvable in polynomial time
- NP: Problems verifiable in polynomial time
- NP-Hard: At least as hard as NP problems
- NP-Complete: NP ∩ NP-Hard

**Reductions:**
Cook-Levin theorem: SAT is NP-complete.
Prove X is NP-complete: Show X ∈ NP and reduce known NP-complete problem to X.

**Common NP-Complete Problems:**
Vertex Cover, Independent Set, Clique, Hamiltonian Cycle, TSP, 3-SAT, Subset Sum

## Compiler Design
**Parsing:**
- LL(1): Top-down, leftmost derivation, lookahead 1
- LR(0), SLR(1), LALR(1), LR(1): Bottom-up parsers
- FIRST and FOLLOW sets for LL(1) grammar construction

**Syntax-Directed Translation:**
Attach semantic rules to grammar productions. Inherited vs synthesized attributes.

**Code Generation:**
- Three-address code: x = y op z
- Register allocation: graph coloring
- Peephole optimization

## Advanced Database Concepts
**Serializability:**
- Conflict Serializability: Check precedence graph for cycles
- View Serializability: Superset of conflict serializable schedules

**Locking Protocols:**
- 2PL guarantees conflict serializability
- Strict 2PL: Don't release locks until commit (prevents cascading rollbacks)

**Recovery:**
- Undo logging: Write old value before modifying, undo uncommitted transactions
- Redo logging: Write new value after commit, redo committed transactions
- Undo-Redo (ARIES): Most practical

## Advanced Architecture Topics
**Pipeline Hazards:**
- Structural: Two instructions need same hardware
- Data: RAW, WAR, WAW hazards
- Control: Branch instructions

**Cache Performance:**
```
AMAT = Hit time + Miss rate × Miss penalty
Miss rate depends on: capacity, conflict, compulsory misses
```

**Memory Hierarchy:**
Registers → L1 → L2 → L3 → RAM → SSD → HDD

## Mock Test Strategy
- 3-hour simulation under exam conditions
- Analysis: time per question, accuracy by subject
- Weak area targeted revision
- Previous year papers: 2015-2024 mandatory
