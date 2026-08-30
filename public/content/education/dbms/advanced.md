# DBMS — Advanced

## BCNF Decomposition — full worked example

```
Relation R(A, B, C, D) with FDs:
  A → B
  B → C

Candidate key: closure of {A,D} = {A,B,C,D} (all attributes) —
  and no smaller set works, so {A,D} is the only candidate key.

Check BCNF: every FD's left side must be a superkey.
  A → B: is A a superkey? A+ = {A,B,C} ≠ all attributes → NO.
  This violates BCNF — A determines B but A alone isn't a key.

Decompose on the violating FD (A → B):
  R1(A, B)  — contains the violating FD, A is now a key of R1
  R2(A, C, D) — everything else, plus the determinant A to
                preserve the connection back to R1

Check R1(A,B): A → B, A is the only attribute on the left of any
  FD and determines everything in R1 → A is a key of R1 → BCNF ✓

Check R2(A,C,D): does B→C still apply here? B isn't even in R2,
  so no FD violates BCNF in R2 (with the given FD set) → BCNF ✓

This is the actual mechanical BCNF algorithm: find a violating FD
(left side not a superkey), split the relation into
{determinant + dependents} and {everything else + determinant},
repeat on each piece until every FD's left side is a superkey.
Note the trade-off: this decomposition is always lossless
(you can always rejoin R1 and R2 via A to reconstruct R), but is
not guaranteed to be dependency-preserving — some FDs may become
impossible to check without an actual join, which is the real
reason 3NF (a strictly weaker but always dependency-preserving
normal form) is sometimes chosen deliberately over BCNF.
```

## Multiversion Concurrency Control (MVCC)

```
Instead of blocking readers with locks, MVCC keeps multiple
versions of each row — a reader sees a consistent snapshot from
the moment its transaction started, while writers create new
row versions rather than overwriting in place.

PostgreSQL's actual implementation (a concrete, real example):
  Every row has xmin (transaction ID that created it) and xmax
  (transaction ID that deleted/updated it, if any).
  A transaction with snapshot ID S sees a row version if:
    xmin was committed before S started, AND
    (xmax is null, OR xmax's transaction hasn't committed before S)

  This is why "SELECT never blocks on UPDATE" in PostgreSQL —
  a reader simply sees the version consistent with its own
  snapshot, while a concurrent writer creates a new version
  rather than fighting the reader for a lock. The trade-off:
  old row versions accumulate ("dead tuples") until VACUUM
  reclaims them — a genuinely real operational concern, not a
  theoretical footnote, in any production PostgreSQL deployment.
```

## Distributed Databases — Two-Phase Commit and CAP in practice

```
Two-Phase Commit (2PC) — coordinating a transaction across
multiple database nodes that must all commit or all abort:

  Phase 1 (Prepare): coordinator asks every participant
    "can you commit?" — each participant locks resources,
    writes to its own log, and replies yes/no, but does NOT
    commit yet.
  Phase 2 (Commit/Abort): if ALL participants said yes,
    coordinator sends COMMIT to all; if ANY said no (or timed
    out), coordinator sends ABORT to all.

  Known weakness: if the coordinator crashes after Phase 1 but
  before sending Phase 2's decision, participants are stuck
  holding locks, unable to unilaterally decide commit or abort
  — this "blocking" failure mode is the specific, well-known
  reason more modern systems favor either a consensus protocol
  (Raft/Paxos, avoiding a single coordinator point of failure)
  or eventual consistency where the strict atomicity 2PC
  guarantees isn't actually required.

CAP Theorem applied to real systems, concretely (not abstractly):
  A distributed database can't have Consistency + Availability
  during a network Partition — it must choose.
  PostgreSQL with synchronous replication: CP — a write blocks
    (unavailable) until the replica confirms, rather than risk
    the replica serving stale data.
  Cassandra (default settings): AP — always accepts a write/read
    even during a partition, resolving conflicts later (eventual
    consistency), rather than blocking.
  This isn't a permanent label on a whole database technology —
  it's a per-configuration choice: Cassandra can be tuned toward
  CP with `QUORUM` consistency levels, trading some availability
  back for stronger consistency guarantees.
```

## High-Yield Advanced Topics

Based on GATE/placement exam patterns, prioritize in this order:
1. BCNF/3NF decomposition numericals (given a relation + FD set, decompose and verify) — the single most repeated DBMS numerical pattern
2. Functional dependency closure and candidate key enumeration — appears standalone and as a prerequisite step inside decomposition questions
3. Concurrency control (wait-for graphs, 2PL schedules — is a given schedule conflict-serializable) — frequent, mechanical once the closure/graph method is solid

## Practice Resources

- **Labs section**: Advanced MCQ sets with detailed explanations, including full BCNF decomposition and serializability-checking numericals
- **Interview Q&A**: Conceptual questions on trade-offs (MVCC vs locking, CP vs AP) rather than pure definitions
- Previous year GATE CS papers, specifically the normalization and serializability numericals — these repeat the same underlying algorithm with different relations/FD sets nearly every cycle
