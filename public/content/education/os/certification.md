# Operating Systems Certification Guide

## Certifications Available

| Cert | Provider | Cost | Format |
|------|----------|------|--------|
| **Linux Foundation LFCS** | Linux Foundation | $395 | Hands-on, 2 hrs |
| **CompTIA Linux+** | CompTIA | $338 | MCQ + performance |
| **GATE CS** | IIT/IISc | Rs.1,800 | MCQ + NAT, 3 hrs |
| **NPTEL OS MOOC** | NPTEL | Free | Proctored exam |

---

## Core Topics

```
PROCESS vs THREAD:
  Process: program in execution, has own memory space (PCB tracks state)
  Thread:  lightweight process, shares memory with siblings in same process
  PCB: Process Control Block — PID, state, PC, registers, memory info, I/O

PROCESS STATES: New -> Ready -> Running -> Waiting/Blocked -> Terminated
  Context switch: save current process state, load next process state

SCHEDULING ALGORITHMS (CPU scheduling):
  FCFS:        First Come First Served — simple, convoy effect problem
  SJF:         Shortest Job First — optimal average wait, needs burst time
  SRTF:        Preemptive SJF — shortest remaining time
  Round Robin: time quantum (usually 10-100ms), preemptive, fair
  Priority:    can starve low-priority (aging prevents starvation)
  MLFQ:        Multi-Level Feedback Queue — modern OS default

MEMORY MANAGEMENT:
  Virtual memory: each process sees its own contiguous address space
  Paging: divide memory into fixed-size pages and frames
    Page table maps virtual page -> physical frame
    TLB: cache for recent page table entries (very fast lookup)
  Segmentation: variable-size segments (code, data, stack, heap)
  Page faults: page not in memory -> load from swap space
  Thrashing: too many page faults, CPU spends more time paging than running

PAGE REPLACEMENT ALGORITHMS:
  FIFO:    evict oldest page — Belady's anomaly (more frames -> more faults!)
  LRU:     evict least recently used — approximated with clock algorithm
  Optimal: evict page used furthest in future (theoretical best, unrealizable)

SYNCHRONISATION:
  Race condition: shared state modified by multiple threads without coordination
  Critical section: code accessing shared resource that must be atomic
  Mutex:      binary lock — only the holder can unlock
  Semaphore:  integer counter — P (wait, decrement) and V (signal, increment)
  Monitor:    high-level synchronisation with wait() and notify()

DEADLOCK:
  Four necessary conditions (all must hold): mutual exclusion | hold and wait
    no preemption | circular wait
  Prevention: break one condition (e.g. allow preemption or order resources)
  Avoidance:  Banker's algorithm — only grant if safe state preserved
  Detection:  wait-for graph — cycle = deadlock
  Recovery:   kill process or preempt resources

FILE SYSTEMS:
  Inode: stores metadata (size, owner, permissions, timestamps, data block ptrs)
  Directory: maps file name -> inode number
  Types: FAT32 (simple) | NTFS (Windows, ACL) | ext4 (Linux default) | APFS (Mac)
  RAID: 0 (striping) | 1 (mirror) | 5 (parity, 1 disk failure) | 10 (1+0 mirror+stripe)
```

---

## Study Resources

- **Operating System Concepts** (Silberschatz/Galvin) — standard university textbook
- **GFG Operating Systems** (geeksforgeeks.org/operating-systems) — free, GATE-oriented
- **NPTEL OS MOOC** (nptel.ac.in) — free IIT course with certification exam
- **OSDev Wiki** (wiki.osdev.org) — for hands-on OS development projects

## Revision Notes
```
PROCESS vs THREAD: process = own memory | thread = shared memory within process
SCHEDULING: FCFS (convoy) | SJF (optimal, non-preemptive) | RR (interactive) | MLFQ (modern)
MEMORY: paging (no external frag) | segmentation (natural units) | virtual memory
PAGE REPLACEMENT: Optimal (best) | LRU (practical) | FIFO (Belady anomaly)
DEADLOCK: 4 conditions all required | prevention/avoidance/detection/recovery

SYNCHRONISATION: mutex (binary) | semaphore (counter) | monitor (high-level)
CRITICAL SECTION REQUIREMENTS: mutual exclusion + progress + bounded waiting
```
