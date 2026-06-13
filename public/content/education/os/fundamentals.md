# Operating Systems — Fundamentals

## Process vs Thread

```
Process:
  - Independent program in execution
  - Has own memory space (code, heap, stack)
  - Isolated — crash doesn't affect other processes
  - IPC needed: pipes, sockets, shared memory
  - Context switch: expensive (save/restore full state)

Thread:
  - Lightweight execution unit within a process
  - Shares memory with other threads in same process
  - Crash can affect entire process
  - Communication: shared memory (needs synchronization)
  - Context switch: cheaper (share memory space)

Goroutines/Green threads: User-space threads, even lighter
  - Go goroutines: ~2KB stack, millions possible
  - OS thread: ~1MB stack, thousands possible
```

## CPU Scheduling Algorithms

```
FCFS (First Come First Served):
  Simple but convoy effect (long job blocks short ones)

SJF (Shortest Job First):
  Optimal average waiting time but need to know burst time
  Can cause starvation of long jobs

Round Robin:
  Each process gets time quantum (10-100ms), then preempted
  Fair, good for time-sharing
  Too small quantum = too many context switches
  Too large quantum = behaves like FCFS

Priority Scheduling:
  Higher priority runs first
  Problem: starvation (low priority may never run)
  Fix: aging (increase priority over time)

CFS (Completely Fair Scheduler — Linux default):
  Uses red-black tree sorted by vruntime (virtual runtime)
  Process with lowest vruntime runs next
  Nice values adjust how fast vruntime accumulates
```

## Memory Management

```python
# Virtual memory concepts

# Page fault handling:
# 1. CPU accesses virtual address
# 2. MMU checks page table — page not in RAM (page fault)
# 3. OS finds frame in RAM (maybe evict a page)
# 4. OS loads page from disk (swap)
# 5. Updates page table, retries instruction

# Page replacement algorithms:
# LRU (Least Recently Used) — best in practice
# FIFO — simple but Belady's anomaly
# Optimal — theoretical best (future knowledge needed)

# Memory hierarchy:
# Register → L1 (1ns) → L2 (10ns) → L3 (100ns) → RAM (100ns)
# → SSD (100µs) → HDD (10ms) → Network (1ms-100ms)

# TLB (Translation Lookaside Buffer):
# Cache for page table entries
# TLB hit: fast address translation
# TLB miss: walk page table, update TLB
```

## Deadlock

```
Four Conditions for Deadlock (all must hold):
1. Mutual Exclusion: resource held by one process at a time
2. Hold and Wait: process holding resource waits for another
3. No Preemption: resources not forcibly taken away
4. Circular Wait: P1 waits for P2 waits for P3 waits for P1

Prevention: eliminate one condition
  - No Hold and Wait: acquire all resources at once
  - Preemption: allow OS to take resources
  - Circular Wait: impose ordering on resource acquisition

Detection: allow deadlocks, detect and recover
  - Resource allocation graph
  - Kill one process to break cycle

Banker's Algorithm:
  - Safety algorithm: check if granting request leads to safe state
  - Safe state: sequence exists where all processes can complete
```
