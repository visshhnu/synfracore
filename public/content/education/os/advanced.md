# Operating Systems — Advanced

## Banker's Algorithm — full worked example

```
3 processes, 4 resource types. Max, Allocation, and Available given:

         Allocation        Max              Need = Max - Allocation
         A B C D          A B C D           A B C D
P0       0 0 1 2          0 0 1 2           0 0 0 0
P1       1 0 0 0          1 7 5 0           0 7 5 0
P2       1 3 5 4          2 3 5 6           1 0 0 2

Available: A=1 B=5 C=2 D=0

Safety check — find a process whose Need <= Available:
  P0: Need(0,0,0,0) <= Available(1,5,2,0)? Yes → run P0, release its
      allocation: Available becomes (1,5,3,2)
  P1: Need(0,7,5,0) <= (1,5,3,2)? No (7>5) → try next
  P2: Need(1,0,0,2) <= (1,5,3,2)? Yes → run P2, release: Available
      becomes (2,8,8,6)
  P1: Need(0,7,5,0) <= (2,8,8,6)? Yes → run P1

Safe sequence exists: P0 → P2 → P1, so the current state is SAFE.
This is exactly the check the algorithm re-runs on every resource
request before granting it — if no safe sequence exists after a
hypothetical grant, the request is denied even though the resources
are technically available, specifically to avoid entering a state
that *could* deadlock later.
```

## CPU Scheduling — a multi-concept problem

```
5 processes, priority scheduling with aging, quantum-based preemption
mixed in a single GATE-style question:

Given: process priorities can change over time (aging), and two
processes with equal priority use Round Robin between themselves.
This kind of question tests whether you can layer two scheduling
rules correctly, not just apply one formula — the usual failure
mode is applying aging correctly but then forgetting to re-sort
the ready queue by the *updated* priority before picking the next
process to run, which changes the entire subsequent schedule.

General approach for compound scheduling questions:
1. Build a timeline table: time | event | ready queue state
2. Apply the primary rule (priority) to pick the next process
3. Apply the tie-breaking rule (RR) only when the primary rule
   doesn't decide uniquely
4. Recompute any state (priority via aging, remaining burst) at
   every decision point, not just once at the start
```

## Disk Scheduling — worked comparison

```
Requests: 98, 183, 37, 122, 14, 124, 65, 67 — head starts at 53

FCFS: total head movement = |53-98|+|98-183|+|183-37|+|37-122|+
      |122-14|+|14-124|+|124-65|+|65-67| = 45+85+146+85+108+110+59+2 = 640

SSTF (Shortest Seek Time First — always go to nearest request):
  53→65→67→37→14→98→122→124→183 (greedily nearest each step)
  = 12+2+30+23+84+24+2+59 = 236 — much better, but can starve a
  far-away request if closer requests keep arriving

SCAN (elevator — sweep to one end, then reverse):
  53→14 (sweep down to 0 direction, hitting 37,14 on the way)→
  then reverse: 65,67,98,122,124,183
  Bounded worst-case wait, and specifically fixes SSTF's starvation
  problem by guaranteeing every request gets serviced within one
  full sweep, not "whenever it happens to be nearest."

C-SCAN (Circular SCAN — sweep one direction only, jump back to
  start without servicing on the return trip):
  gives more uniform wait times than SCAN, since SCAN's requests
  near the point where the head reverses get serviced twice as
  often (once on the way out, again almost immediately on the
  way back) as requests near the other end.
```

## Real-Time and Distributed OS Concepts

```
Real-time scheduling — correctness depends on timing, not just
  eventual completion:
  Hard real-time: missing a deadline is a system failure
    (e.g. airbag deployment timing)
  Soft real-time: missing a deadline degrades quality, not fatal
    (e.g. video frame drop)

Rate Monotonic Scheduling (RMS): fixed priority, shorter period =
  higher priority. Schedulability test (n tasks):
  U = Σ(Ci/Ti) <= n(2^(1/n) - 1)
  For n=3, bound ≈ 0.780 — if total CPU utilization exceeds this,
  RMS cannot guarantee all deadlines are met even though the raw
  CPU has enough total capacity, which is the counterintuitive
  part students most often get wrong on this topic.

Distributed mutual exclusion (no shared memory to build a mutex on):
  Lamport's algorithm: uses logical clocks + a request queue at
  every node, requiring every node to agree on ordering via
  timestamped messages, since there's no single shared clock or
  memory location to lock the way single-machine OS mutexes rely on.
```

## High-Yield Advanced Topics

Based on GATE/placement exam patterns, prioritize in this order:
1. Banker's Algorithm and deadlock numericals — appear almost every cycle, mechanical once the table method above is memorized
2. TLB/EMAT and page-replacement numericals (LRU/FIFO/Optimal comparison on a given reference string) — high frequency, formula-driven
3. Compound scheduling problems (priority + aging, or multilevel feedback queue) — lower frequency but high point value since they test layered understanding

## Practice Resources

- **Labs section**: Advanced MCQ sets with detailed explanations, including full Banker's Algorithm and disk-scheduling numericals
- **Interview Q&A**: Conceptual questions testing *why*, not just *how* (e.g. "why can SSTF starve a request but SCAN can't")
- Previous year GATE CS papers, specifically the OS numericals — the compound-concept pattern shown above repeats nearly every year with different numbers
