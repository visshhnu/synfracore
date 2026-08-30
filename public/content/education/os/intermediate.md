# Operating Systems — Intermediate

## Process Synchronization Primitives

```
Race Condition: multiple processes/threads access shared data,
final result depends on execution order (bug, not a feature)

Critical Section: code segment accessing shared resource
  Requirements for a solution:
  1. Mutual Exclusion — only one process in critical section at a time
  2. Progress — no process outside CS blocks others from entering
  3. Bounded Waiting — a process can't wait forever

Mutex Lock (binary):
  lock()   — acquire, blocks if already held
  unlock() — release
  Only the holder can unlock (ownership matters)

Semaphore (counting):
  wait(S)  / P(S):  S--; if S < 0, block
  signal(S) / V(S): S++; if S <= 0, wake one waiting process
  Binary semaphore (0/1) behaves like a mutex, BUT any process
  can signal() it — no ownership, which is why semaphores are
  more error-prone for mutual exclusion than a dedicated mutex

Monitor: higher-level construct — a lock + condition variables,
  built into the language (Java `synchronized`, Python's
  `threading.Condition`) so you don't manually call wait/signal
  on a raw semaphore for every access
```

## Classic Synchronization Problems — worked

```
Producer-Consumer (bounded buffer, size N):
  semaphore empty = N   // slots free
  semaphore full = 0    // slots filled
  semaphore mutex = 1   // protects buffer access

  Producer:                    Consumer:
    wait(empty)                  wait(full)
    wait(mutex)                  wait(mutex)
    add item to buffer           remove item from buffer
    signal(mutex)                signal(mutex)
    signal(full)                 signal(empty)

  Why empty/full are separate from mutex: mutex alone can't stop
  a producer from adding to a full buffer or a consumer from
  removing from an empty one — empty/full track buffer *state*,
  mutex only protects the *access*.

Readers-Writers (writers need exclusive access, readers can share):
  Common bug: naive solutions starve writers if readers keep
  arriving — a correct solution needs a way to say "no new
  readers once a writer is waiting," not just "readers share,
  writers exclude."

Dining Philosophers (5 philosophers, 5 forks, need 2 forks to eat):
  Naive "pick up left fork, then right fork" deadlocks if all 5
  pick up their left fork simultaneously — this is a direct,
  concrete instance of the circular-wait deadlock condition.
  Fix: break the symmetry — e.g. odd philosophers pick up left
  fork first, even philosophers pick up right fork first.
```

## Scheduling — worked numerical example

```
Processes (arrival time, burst time):
  P1: AT=0, BT=5      P2: AT=1, BT=3      P3: AT=2, BT=8

FCFS (First Come First Served):
  Order: P1, P2, P3
  P1: 0-5     P2: 5-8     P3: 8-16
  Waiting time = start time - arrival time
  P1: 0-0=0   P2: 5-1=4   P3: 8-2=6
  Average waiting time = (0+4+6)/3 = 3.33

SJF Non-preemptive (pick shortest available burst at each decision):
  At t=0, only P1 available → run P1 (0-5)
  At t=5, P2(BT=3) and P3(BT=8) both arrived → run P2 (5-8)
  At t=8, run P3 (8-16)
  Waiting time: P1=0, P2=4, P3=6 → same as FCFS here (order coincided)

Round Robin (quantum = 4):
  P1(0-4, remaining 1)  P2(4-7, done)  P3(7-11, remaining 4)
  P1(11-12, done)       P3(12-16, done)
  Completion: P1=12  P2=7  P3=16
  Turnaround = completion - arrival: P1=12  P2=6  P3=14
  Waiting = turnaround - burst: P1=12-5=7  P2=6-3=3  P3=14-8=6
  Average waiting = (7+3+6)/3 = 5.33 — worse than FCFS here because
  smaller quantum adds more context-switch-equivalent waiting for
  this specific mix, even though RR is fairer in general
```

## Virtual Memory — thrashing and the working set

```
Thrashing: system spends more time paging (swapping pages in/out)
  than executing actual instructions — happens when the degree of
  multiprogramming exceeds what physical memory can support, so
  every process is constantly stealing frames from every other
  process, causing a page fault almost immediately after each one
  is resolved.

Working Set Model: the set of pages a process actively references
  in its most recent Δ instructions ("working set window").
  Allocate each process enough frames to hold its working set —
  if total working sets across all processes exceed physical
  memory, thrashing is the predictable outcome, and the fix is
  reducing multiprogramming degree (suspend a process), not adding
  more RAM to any single process's allocation.

Effective Memory Access Time (EMAT) — a genuinely common GATE
numerical, given TLB hit ratio h, TLB access time t, memory
access time m:
  EMAT = h × (t + m) + (1-h) × (t + 2m)
  [TLB hit: 1 TLB lookup + 1 memory access.
   TLB miss: 1 TLB lookup + 1 page-table memory access + 1 actual memory access]

  Example: h=0.9, t=20ns, m=100ns
  EMAT = 0.9×(20+100) + 0.1×(20+200) = 108 + 22 = 130ns
```

## File Systems — allocation and structure

```
Contiguous allocation: fast sequential access, but external
  fragmentation and hard to grow a file in place

Linked allocation: no external fragmentation, but slow random
  access (must traverse the chain) and pointer overhead per block

Indexed allocation (inode-style, used by most real filesystems):
  each file has an index block listing all its data blocks —
  fast random access, no external fragmentation; Unix inodes
  extend this with direct + single/double/triple indirect blocks
  specifically so small files stay cheap while still supporting
  very large files without a huge fixed-size index per file.

Journaling: writes are first logged to a journal before being
  applied to the actual filesystem structures — after a crash,
  replaying the journal restores a consistent state instead of
  requiring a full filesystem scan (fsck), which is why nearly
  every modern filesystem (ext4, NTFS, APFS) is journaled.
```

## Transition to Advanced

You're ready for advanced OS topics when you can:
- Trace a Producer-Consumer or Dining Philosophers solution and explain exactly which condition it violates without the fix
- Compute waiting/turnaround time correctly for FCFS, SJF, and Round Robin by hand, including quantum-related edge cases
- Solve an EMAT/TLB-hit-ratio numerical without looking up the formula
