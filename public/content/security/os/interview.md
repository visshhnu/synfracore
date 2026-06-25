# Operating Systems Interview Questions

## Process Management

**Q: Difference between process and thread?**
Process: independent execution unit, own memory space, expensive to create.
Thread: lightweight, shares process memory, cheaper context switch. Threads share heap/globals but have their own stack.

**Q: What happens during a fork() call?**
Creates a copy of the parent process. Copy-on-Write: pages are shared until either process writes. Child gets PID 0 as return value from fork, parent gets child's PID.

**Q: What is a zombie process?**
A process that has exited but whose entry remains in the process table because the parent hasn't called wait(). Fix: parent calls wait() or waitpid().

**Q: How does the OS handle a system call?**
User process executes a trap instruction (syscall). CPU switches to kernel mode. Kernel runs the syscall handler. Returns to user mode with result. CPU state saved/restored.

## Scheduling

**Q: Which scheduling algorithm gives minimum average waiting time?**
SJF (Shortest Job First) — provably optimal for average waiting time. Problem: requires knowing burst time in advance.

**Q: What is starvation and how is it prevented?**
Starvation: process waits indefinitely because higher-priority processes keep arriving.
Prevention: Aging — gradually increase priority of waiting processes over time.

**Q: What is a context switch?**
Saving CPU state of current process (registers, PC, stack pointer to PCB) and loading state of next process. Pure overhead — no useful work done during context switch.

## Memory Management

**Q: What is virtual memory?**
Abstraction where each process has its own large virtual address space. OS maps virtual to physical using page tables. Allows processes larger than physical RAM.

**Q: What is thrashing?**
When processes spend more time swapping pages than executing. Caused by too many processes competing for limited physical memory. Solution: reduce multiprogramming or increase RAM.

**Q: LRU vs FIFO page replacement?**
LRU evicts least recently used page — good locality approximation.
FIFO evicts oldest page — simple but Belady's anomaly (more frames can cause more faults).

**Q: What is internal vs external fragmentation?**
Internal: wasted space inside allocated blocks (page size vs needed size).
External: free memory exists but not contiguous enough to satisfy request. Paging eliminates external fragmentation; segmentation can suffer from it.

## Deadlocks

**Q: What are the four conditions for deadlock?**
Mutual exclusion, Hold and wait, No preemption, Circular wait. ALL four must hold for deadlock.

**Q: How does the Banker's Algorithm work?**
Deadlock avoidance. Before granting resource, simulate allocation and check if system remains in safe state (all processes can complete in some order). If unsafe, deny request.

**Q: How to detect and recover from deadlock?**
Detection: resource allocation graph with cycle detection.
Recovery: preempt resources (rollback), kill one process, or kill all deadlocked processes.

## Synchronization

**Q: What is a race condition?**
When result depends on timing of concurrent operations. Classic example: two threads reading, incrementing, writing a shared counter without synchronization.

**Q: Mutex vs semaphore?**
Mutex: binary (locked/unlocked), ownership (only locker can unlock), used for mutual exclusion.
Semaphore: counting, no ownership, can be used for signaling and counting resources.

**Q: What is priority inversion?**
Low-priority process holds a resource needed by high-priority process. High-priority process is blocked by medium-priority processes indirectly.
Solution: Priority inheritance — low-priority process temporarily inherits high priority.

## Advanced

**Q: What is the difference between monolithic and microkernel?**
Monolithic: all OS services in kernel space, fast but complex, crashes can affect whole system. Linux.
Microkernel: minimal kernel, services in user space via IPC, more stable/secure but slower. Mach.

**Q: How do containers differ from VMs?**
VMs virtualize hardware, each has its own OS. Containers share host kernel, use namespaces for isolation and cgroups for resource limits. Containers are lighter, faster, less isolated.

**Q: What is Copy-on-Write?**
Optimization for fork(): parent and child share pages after fork. Pages are only copied when either process tries to write. Efficient for fork-exec pattern.
