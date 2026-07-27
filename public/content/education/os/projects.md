# Operating Systems — Portfolio Projects

Build these to actually understand OS mechanisms by implementing (simplified versions of) them yourself — the difference between "I read about CPU scheduling" and "I implemented and compared three CPU scheduling algorithms" is exactly what interviewers probe for.

## Project 1: CPU Scheduler Simulator (Beginner)

**Time:** 3-4 days

Simulate FCFS, SJF, and Round Robin CPU scheduling algorithms on a set of synthetic processes (arrival time, burst time), and compute/compare their average waiting time and turnaround time.

### Steps

1. Define a `Process` structure (PID, arrival time, burst time, priority if needed)
2. Implement FCFS (First Come First Serve) scheduling and compute average waiting/turnaround time
3. Implement SJF (Shortest Job First, both preemptive and non-preemptive if you want the extra depth) the same way
4. Implement Round Robin with a configurable time quantum, and observe how waiting time changes as you vary the quantum
5. Compare all three on the same process set — which performs best, and does that match what the theory predicts?

### Skills Demonstrated
- Understanding scheduling algorithms at the implementation level, not just definitions
- Comparative analysis of algorithm performance
- Working with queues and process state transitions in code

### Repository Name
`os-cpu-scheduler-sim`

---

## Project 2: A Simple Memory Allocator (Intermediate)

**Time:** 1 week

Implement a basic memory allocator (your own `malloc`/`free`-equivalent) using a simulated memory pool, supporting at least two allocation strategies (First-Fit and Best-Fit), and measure fragmentation under each.

### Steps

1. Simulate a fixed-size memory pool (a large byte array works fine)
2. Implement First-Fit allocation: scan for the first free block large enough
3. Implement Best-Fit allocation: scan for the smallest free block that still fits
4. Implement `free`, including merging adjacent free blocks (coalescing) — this is the part that actually tests whether you understand the mechanism, not just the allocation logic
5. Run a sequence of alloc/free operations under both strategies and measure external fragmentation — which strategy actually fragments less in your test case?

### Skills Demonstrated
- Understanding manual memory management at the mechanism level
- Implementing and comparing allocation strategies
- Recognizing and measuring fragmentation, not just avoiding crashes

---

## Project 3: A Toy File System or Deadlock Detector (Advanced)

**Time:** 1-2 weeks

Choose one: (a) implement a simplified file system supporting basic file/directory operations backed by a simulated disk, or (b) implement deadlock detection using resource-allocation graphs on a set of processes and resources.

### Steps (File System path)
1. Design a simple inode-like structure and a simulated disk (a large file or byte array)
2. Implement create, read, write, and delete for files
3. Implement basic directory structure (even a flat one is a reasonable start)
4. Handle the case where the simulated disk is full

### Steps (Deadlock Detector path)
1. Model processes, resources, and allocation/request edges as a graph
2. Implement cycle detection to identify deadlock
3. Given a detected deadlock, implement one recovery strategy (e.g., process termination to break the cycle)
4. Test against both deadlock and non-deadlock scenarios to confirm your detector doesn't produce false positives

### Skills Demonstrated
- Translating an OS concept into a working implementation
- Graph algorithms applied to a real systems problem (deadlock path)
- Working with simulated persistent storage (file system path)

### Repository Name
`os-filesystem-sim` or `os-deadlock-detector`

---

## Tips for Great Projects

**Implement the mechanism, don't just call a library function.** The entire point of an OS project is understanding what's happening underneath — a project that just wraps existing OS calls doesn't demonstrate the same understanding as one that reimplements the logic yourself.

**Test edge cases specifically.** An empty process queue, a memory pool with zero free space, a resource-allocation graph with no deadlock — these edge cases are exactly where implementation bugs (and interview follow-up questions) live.

**Connect results back to theory.** If your Round Robin simulation shows a smaller time quantum increasing average waiting time due to context-switch overhead, say so explicitly — connecting empirical results to the underlying theory is what turns a working program into a genuine demonstration of understanding.

**For GATE/interview prep specifically:** be ready to explain trade-offs — when would you choose Round Robin over SJF, and what does "starvation" actually mean in the context of a scheduling algorithm you implemented yourself?

## Project Checklist
- [ ] At least one scheduling algorithm implemented and benchmarked against alternatives
- [ ] At least one project involving manual memory or resource management
- [ ] Edge cases tested explicitly, not just the "happy path"
- [ ] Comfortable explaining results in terms of the underlying OS theory
- [ ] Clear README connecting what you built to the concept it demonstrates
