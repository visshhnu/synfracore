# Operating Systems Interview Questions

## Core Concepts

**Q: Processes vs Threads — key differences.**

| | Process | Thread |
|---|---|---|
| Memory | Separate address space | Shared address space (within process) |
| Creation cost | High (fork, copy) | Low (share memory) |
| Communication | IPC (pipes, sockets, shared memory) | Shared memory directly |
| Isolation | Crash doesn't affect other processes | Crash can kill all threads |
| Context switch | Expensive (switch address space) | Cheaper |

**Process states**: New → Ready → Running → Blocked (I/O wait) → Terminated.

**Context switch**: Saving and restoring CPU state (registers, PC, stack pointer) when switching between processes/threads.

---

**Q: CPU scheduling algorithms.**

**FCFS (First Come First Served)**: Non-preemptive. Simple. Convoy effect (long job blocks short ones).

**SJF (Shortest Job First)**: Optimal average wait time. Requires knowing job lengths. Starvation possible.

**Round Robin**: Each process gets time quantum (10-100ms). Then preempted, moved to end of ready queue. Good response time.

**Priority Scheduling**: Higher priority runs first. Starvation (low priority waits forever) → solution: Aging (gradually increase priority of waiting processes).

**Multilevel Queue**: Separate queues for foreground/background/batch. Each queue has own algorithm.

---

**Q: Deadlock — conditions, detection, prevention.**

**Four necessary conditions** (Coffman conditions):
1. **Mutual Exclusion**: Resource held exclusively
2. **Hold and Wait**: Holding one resource, waiting for another
3. **No Preemption**: Resources can't be forcefully taken
4. **Circular Wait**: Circular chain of processes each waiting for next

**Prevention**: Eliminate one condition.
- No circular wait: always request resources in predefined order
- No hold-and-wait: request all resources at once
- Allow preemption: take resources from lower priority processes

**Detection**: Resource allocation graph. Cycle = possible deadlock (for single-instance resources, cycle = deadlock).

**Banker's Algorithm**: Before granting resource, check if system remains in safe state (can still complete all processes). Expensive for large systems.

---

**Q: Memory management — paging and virtual memory.**

**Physical memory**: Actual RAM chips.
**Virtual memory**: Each process has its own large virtual address space (e.g., 4GB on 32-bit). OS maps virtual → physical via page table.

**Paging**: Divide memory into fixed-size pages (typically 4KB). No external fragmentation. Internal fragmentation (page not fully used).

**Page fault**: Process accesses virtual page not in physical RAM. OS: bring page from disk (swap space), update page table, retry instruction. Expensive (~milliseconds vs nanoseconds for RAM).

**Page replacement algorithms:**
- **FIFO**: Replace oldest page. Simple but not optimal (Belady's anomaly).
- **LRU** (Least Recently Used): Replace least recently accessed. Good approximation.
- **Optimal**: Replace page not needed for longest. Theoretical best (requires future knowledge).

**Thrashing**: Process spends more time swapping pages than executing. Cause: too many processes for available RAM. Solution: reduce degree of multiprogramming, working set model.

---

**Q: File systems — inodes, journaling.**

**Inode**: Data structure storing file metadata.
- Size, permissions, timestamps (atime/mtime/ctime), owner, group
- Pointers to data blocks (direct, indirect, doubly indirect)
- Does NOT store filename (stored in directory entry)

**ext4 structure**: Superblock → Block group descriptor → Inode table → Data blocks.

**Journaling** (write-ahead logging): Before modifying filesystem, write intent to journal. On crash, replay journal to ensure consistency. Prevents filesystem corruption on power failure.
- Journal modes: writeback (journal metadata only), ordered (data written before metadata), data (everything journaled — safest, slowest)

---

**Q: System calls and kernel vs user space.**

**User space**: Applications run with limited privileges. Cannot access hardware directly.
**Kernel space**: OS core. Full hardware access.

**System call**: Interface from user space to kernel. Examples:
- `open()`, `read()`, `write()`, `close()` — file operations
- `fork()`, `exec()`, `wait()` — process management
- `mmap()`, `brk()` — memory management
- `socket()`, `connect()`, `send()` — networking

**System call overhead**: Requires mode switch (user → kernel → user). ~microsecond. Context save/restore.

## Revision Notes
```
PROCESS vs THREAD:
Process: separate memory, high isolation, expensive creation
Thread: shared memory (within process), cheap, concurrent access needs sync

SCHEDULING:
FCFS (simple, convoy) | SJF (optimal avg, needs job length) | Round Robin (fair)
Priority (starvation → aging) | Multilevel Queue

DEADLOCK (all 4 needed):
Mutual exclusion + Hold & Wait + No Preemption + Circular Wait
Prevention: break one condition (fixed resource order eliminates circular wait)

VIRTUAL MEMORY: virtual → physical mapping via page table
Page fault: page not in RAM → fetch from disk (expensive)
LRU: best practical replacement policy

INODE: file metadata (no filename). Pointers to data blocks.
Journaling: write-ahead log → prevents filesystem corruption on crash

SYSTEM CALLS: user space → kernel space interface
fork/exec/wait | open/read/write/close | socket/connect/send
Mode switch overhead ~microsecond
```
