# Operating Systems Intermediate Concepts

## Advanced Process Management

### Fork-Exec Model
```c
pid_t pid = fork();  // Create child
if (pid == 0) {
    // Child process
    exec("/bin/ls", ...);  // Replace child with new program
} else {
    wait(NULL);  // Parent waits for child
}
```

### Zombie and Orphan Processes
- **Zombie**: Process finished but parent hasn't called wait(). Entry stays in process table.
- **Orphan**: Parent died before child. Adopted by init (PID 1).

### Signals
- SIGKILL (9): Cannot be caught, immediately terminates
- SIGTERM (15): Graceful termination request
- SIGCHLD: Sent to parent when child terminates
- SIGSEGV: Segmentation fault

## Synchronization

### Race Condition
When outcome depends on the sequence/timing of events. Example: two threads incrementing a shared counter.

### Critical Section
Code accessing shared resources. Must be executed atomically.

**Requirements:**
1. **Mutual Exclusion**: Only one thread in critical section
2. **Progress**: If no thread is in critical section, any can enter
3. **Bounded Waiting**: Finite wait before entering critical section

### Mutex and Semaphores
```c
// Mutex
pthread_mutex_t lock;
pthread_mutex_lock(&lock);
// critical section
pthread_mutex_unlock(&lock);

// Semaphore
sem_t sem;
sem_init(&sem, 0, 1);
sem_wait(&sem);   // P operation (decrement)
// critical section
sem_post(&sem);   // V operation (increment)
```

### Classic Synchronization Problems
- **Producer-Consumer**: Bounded buffer with semaphores
- **Readers-Writers**: Multiple readers, exclusive writer
- **Dining Philosophers**: N philosophers, N forks, avoid deadlock

### Monitors and Condition Variables
```c
pthread_cond_t cond;
pthread_cond_wait(&cond, &mutex);   // Wait and release mutex
pthread_cond_signal(&cond);         // Wake one waiting thread
pthread_cond_broadcast(&cond);      // Wake all waiting threads
```

## Memory Management — Advanced

### Virtual Memory
Each process has its own virtual address space. OS maps virtual to physical using page tables.

**Benefits:**
- Process isolation
- More processes than physical RAM allows
- Simplified memory allocation

### Page Replacement Algorithms
When a page must be swapped out:
- **FIFO**: Evict oldest page. Simple but Belady's anomaly.
- **LRU**: Evict least recently used. Good approximation of optimal.
- **Optimal**: Evict page used furthest in future. Theoretical best.
- **Clock Algorithm**: Approximate LRU using reference bits. Practical.

### Thrashing
Too many page faults because working set doesn't fit in memory. CPU spends more time on paging than executing. Solution: reduce multiprogramming.

### Memory Mapping (mmap)
Map files or devices into process address space. Used for shared memory and file I/O.

## I/O Systems

### Disk Scheduling
- **FCFS**: Fair but not optimal
- **SSTF**: Shortest Seek Time First. Starvation risk.
- **SCAN (Elevator)**: Move head in one direction, service requests, then reverse.
- **C-SCAN**: Only service on one sweep, return to start.

### Buffering and Caching
- **Buffer**: Temporary storage during data transfer
- **Cache**: Copy of data for faster access
- **Spool**: Queue for printer/slow device

## Kernel Architecture

### Monolithic Kernel
OS services in kernel space. Fast but complex. Linux, Unix.

### Microkernel
Minimal kernel, services in user space. Isolated, slow due to message passing. Mach, QNX.

### Hybrid Kernel
Combine both approaches. Windows NT, macOS.

### System Calls
Interface between user and kernel space.
```
User process → System call → Trap to kernel mode → Kernel handles → Return to user mode
```
Examples: open, read, write, fork, exec, exit, wait, kill
