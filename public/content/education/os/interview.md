# Operating Systems — Interview Questions

**What is the difference between process and thread?**
A process is an independent program execution with its own memory space — code, stack, heap, and OS resources (file handles, etc.). Processes are isolated; one crashing doesn't affect others, but communication requires IPC (pipes, sockets). A thread is a lightweight execution unit within a process. Threads share the process's memory space, making communication fast but requiring synchronization to avoid race conditions. Creating threads is faster and cheaper than processes. Modern applications use processes for isolation (microservices) and threads for parallelism within a service.

**Explain virtual memory and why it's useful.**
Virtual memory gives each process the illusion of having the entire address space (e.g., 4GB on 32-bit) even if physical RAM is smaller. The OS and MMU (Memory Management Unit) transparently map virtual addresses to physical frames using page tables. Benefits: process isolation (each process has its own address space), more programs can run than RAM allows (swapping idle pages to disk), programs can use more memory than physical RAM, simplifies memory allocation. The downside: page faults when accessing swapped-out pages cause disk I/O — much slower than RAM access.

**What is a semaphore and how does it differ from a mutex?**
A mutex (mutual exclusion lock) allows only ONE thread to hold it at a time — used to protect a critical section. Binary semaphore is similar but can be signaled from a different thread (mutex must be released by the same thread that acquired it). Counting semaphore allows a resource to be accessed by N threads simultaneously — `sem_init(sem, N)`. Initialize to N; `sem_wait` decrements (blocks at 0); `sem_post` increments. Use case: limit database connection pool to 10 concurrent users. Mutex: toilet key. Semaphore: parking lot with N spaces.

**What causes a race condition and how do you prevent it?**
A race condition occurs when multiple threads access shared data concurrently and the outcome depends on the relative timing of their execution. Example: two threads both do `counter++` (read, increment, write) — if both read the same value before either writes, one increment is lost. Prevention: mutual exclusion using locks/mutexes, atomic operations (hardware-supported), immutable data, message passing (share nothing). In practice: minimize shared mutable state, use language-provided thread-safe data structures, use higher-level synchronization (channels in Go).

**Explain how Linux handles system calls.**
When a process needs OS services (read file, allocate memory, create socket), it executes a system call. The `syscall` instruction switches from user mode to kernel mode, saving the process state. The kernel looks up the system call number in the syscall table, executes the handler (with full hardware access), then returns the result and switches back to user mode. The mode switch is expensive (~1-5µs) — that's why batching I/O operations and using mmap (fewer syscalls than many reads) improves performance. `strace` traces system calls for debugging.
