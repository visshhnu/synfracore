# Transactions and Concurrency

## Why This Chapter Matters
Transactions appear in every GATE paper — 6-8 marks. ACID properties, conflict serializability (precedence graph), two-phase locking, and timestamp-based concurrency are all tested.

## Core Concepts

### 1. ACID Properties
**Atomicity:** All or nothing — complete or rollback.
**Consistency:** DB moves from one consistent state to another.
**Isolation:** Concurrent transactions appear to execute serially.
**Durability:** Committed transactions persist even after failure.

### 2. Transaction States
Active -> Partially Committed -> Committed (success)
Active -> Failed -> Aborted -> Rolled Back

### 3. Schedules and Serializability

**Serial schedule:** Transactions execute one after another, no interleaving. Always correct.
**Serializable schedule:** Concurrent schedule equivalent to some serial schedule. Correct.

**Conflict:** Two operations conflict if:
- They access the same data item AND
- At least one is a WRITE AND
- They belong to different transactions

**Conflict serializability check (Precedence Graph):**
Create node for each transaction.
Add edge Ti -> Tj if Ti has a conflicting operation that comes BEFORE Tj's conflicting operation.
**If graph has NO CYCLE: schedule is conflict serializable.**

### 4. Two-Phase Locking (2PL)
Phase 1 (Growing): Acquire locks, no releases.
Phase 2 (Shrinking): Release locks, no new acquisitions.

2PL guarantees conflict serializability.
**Strict 2PL:** Hold all exclusive (write) locks until commit/abort. Prevents cascading rollbacks.
**Deadlock** can still occur with 2PL.

### 5. Timestamp-Based Concurrency

Each transaction gets a timestamp TS(Ti) when it begins.
Read rule: If TS(Ti) < write_TS(X): abort Ti (reading outdated value)
Write rule: If TS(Ti) < read_TS(X) or TS(Ti) < write_TS(X): abort Ti

**Thomas Write Rule:** If TS(Ti) < write_TS(X): ignore write (don't abort). Allows more concurrency.

### 6. Recovery — Log-Based

**WAL (Write Ahead Logging):** Log before actual change to DB.
**UNDO logging:** For crash recovery (abort uncommitted transactions).
**REDO logging:** For crash recovery (redo committed transactions).

## PYQs
**GATE 2024:** Schedule S: R1(X), R2(X), W1(X), W2(X). Is it conflict serializable?
Conflicts: R1(X) vs W2(X): T1->T2. W1(X) vs R2(X): T1 before? No, R2 before W1: T2->T1.
Cycle: T1->T2->T1. NOT conflict serializable.

**GATE 2023:** What is the lock point in 2PL?
Lock point = the point where a transaction acquires its LAST lock (transition from growing to shrinking phase). Serialization order = order of lock points.

**GATE 2022:** Strict 2PL vs 2PL?
Strict 2PL holds all write locks until commit/abort. Prevents cascading rollbacks (if Ti aborts, no other transaction has read Ti's uncommitted data).

## Revision Notes
```
ACID: Atomicity, Consistency, Isolation, Durability

SERIALIZABILITY CHECK (Precedence Graph):
1. Node for each transaction
2. Ti->Tj edge if Ti's conflicting op precedes Tj's on same item
3. No cycle = conflict serializable

2PL: Growing phase (acquire) + Shrinking phase (release)
Guarantees conflict serializability but allows deadlock.
Strict 2PL: hold write locks till commit (prevents cascading rollback)

TIMESTAMP:
TS(Ti) < write_TS(X) on read: abort Ti (reading old value after newer write)
TS(Ti) < read_TS(X) on write: abort Ti (write would invalidate already-read data)
```
