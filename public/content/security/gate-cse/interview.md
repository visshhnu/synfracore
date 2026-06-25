# GATE CSE Interview Q&A

## Algorithms and Data Structures

**Q: Time complexity of building a heap from n elements?**
O(n) using bottom-up construction. Most nodes are near the bottom and do minimal work during heapify. Despite calling heapify n/2 times, total operations sum to O(n) by geometric series analysis. Contrasted with inserting n elements one by one into an empty heap: O(n log n).

**Q: BFS vs DFS for finding shortest path?**
BFS guarantees shortest path (minimum edges) in UNWEIGHTED graphs — explores all nodes level by level before going deeper. DFS does NOT guarantee shortest path — returns first path found, which may not be minimum. For weighted non-negative graphs: Dijkstra's algorithm. For graphs with negative weights: Bellman-Ford.

**Q: Kruskal's vs Prim's algorithm for MST?**
Kruskal: Sort all edges by weight; add edge if it doesn't create a cycle (union-find). O(E log E). Better for sparse graphs (fewer edges).
Prim: Start from any vertex; greedily add minimum weight edge connecting tree to non-tree vertex. O((V+E) log V) with min-heap. Better for dense graphs (more edges).
Both produce a valid MST with identical total weight.

**Q: What is amortized analysis?**
Average cost per operation over a worst-case sequence of n operations. Example: dynamic array — individual push_back is O(1) but occasionally O(n) when resizing. Amortized cost = O(1) per operation because expensive resize happens infrequently. The cost is "amortized" over many cheap operations. Methods: aggregate, accounting, potential.

## Theory of Computation

**Q: Can every NFA be converted to a DFA?**
Yes — subset construction (powerset construction). Each DFA state represents a subset of NFA states. Resulting DFA may have up to 2^n states (worst case). NFAs and DFAs recognize exactly the same class: regular languages. NFA just offers a more compact representation.

**Q: What does the pumping lemma prove?**
Used to prove a language is NOT regular. For any regular language, strings longer than pumping length p can have a middle portion repeated (pumped) any number of times and still remain in the language. If you can find a string where no valid decomposition satisfies this, the language is not regular.

**Q: Is the language {a^n b^n c^n | n≥1} context-free?**
No. The pumping lemma for CFLs shows that any pumping of a string from this language breaks the equal-count constraint between a, b, and c. This language is context-sensitive (Type 1) — requires a linear-bounded automaton.

## Databases and OS

**Q: What is lossless join decomposition?**
Decomposing relation R into R1 and R2 such that R1 ⋈ R2 = R exactly — no spurious tuples generated. Condition: R1∩R2 → R1 OR R1∩R2 → R2 must hold as a functional dependency.

**Q: 3NF vs BCNF?**
BCNF: Every non-trivial FD X→Y requires X to be a superkey. Stricter — eliminates all redundancy.
3NF: Relaxes BCNF — allows X→Y where X is not a superkey IF Y is a prime attribute (member of some candidate key). Benefit: 3NF decomposition always preserves all functional dependencies; BCNF decomposition may not.

**Q: Semaphore vs mutex?**
Mutex: Binary (0/1), ownership-based (only locking thread can unlock), used for mutual exclusion within same thread context.
Semaphore: Counting (can be >1), no ownership concept, signalling between different threads/processes is valid. More general. Binary semaphore ≠ mutex due to ownership.

**Q: TCP three-way handshake?**
SYN (client initiates) → SYN-ACK (server acknowledges and sends its own SYN) → ACK (client acknowledges server's SYN). Establishes sequence numbers for both directions before any data is transferred. Ensures both parties are ready and have agreed on initial sequence numbers.

**Q: What is the difference between process and thread?**
Process: Independent execution unit with its own address space, memory, file handles, and OS resources. Process creation (fork) is expensive. Communication between processes (IPC) requires explicit mechanisms (pipes, shared memory, sockets).
Thread: Lightweight execution unit within a process sharing the process's address space, heap, and resources. Thread creation is cheap. Communication between threads is easy (shared memory) but requires synchronisation (mutexes, semaphores) to avoid race conditions. Multiple threads enable parallelism within a single program.

**Q: What is virtual memory and how does it work?**
Virtual memory creates the illusion that each process has its own large, private address space, even when physical RAM is limited. OS divides virtual address space into pages (typically 4KB); physical memory divided into frames. Page table maps virtual pages to physical frames. When a page is not in RAM (page fault), OS loads it from disk (swap space). Benefits: programs can use more memory than physically available, isolation between processes, allows memory to be shared between processes (shared libraries). Cost: page faults are expensive (disk access ~10ms vs RAM access ~100ns).

**Q: What is dynamic programming and how does it differ from recursion?**
Dynamic programming (DP): solving complex problems by breaking into overlapping subproblems, solving each once, and storing results (memoization or tabulation). Key property: optimal substructure (optimal solution contains optimal solutions to subproblems) + overlapping subproblems (same subproblems solved repeatedly in naive recursion).
Naive recursion: recomputes the same subproblems many times — exponential time. DP: stores results → polynomial time.
Top-down (memoization): recursive with caching. Bottom-up (tabulation): iterative, fill table from small to large.
Classic examples: Fibonacci (naive O(2^n) → DP O(n)), 0/1 Knapsack, Longest Common Subsequence, Matrix Chain Multiplication.

**Q: What is the difference between synchronous and asynchronous reset in digital design?**
Synchronous reset: the flip-flop only resets on the active clock edge AND when reset signal is active. The reset is synchronized with the clock — predictable, avoids glitches, better for formal verification, more area-efficient with modern tools.
Asynchronous reset: the flip-flop resets immediately when reset signal is asserted, regardless of clock. Faster response to reset. Risk: if reset de-asserts near a clock edge (metastability risk), it can cause unpredictable state. Typically preferred when: startup/power-on reset, global reset that must work even if clock fails. Most modern FPGAs and ASICs support both but prefer synchronous reset for internal logic and asynchronous reset for global power-on only.

**Q: What is pipelining in computer architecture?**
Pipelining: executing multiple instructions simultaneously by dividing instruction execution into stages, with each stage working on a different instruction. Classic 5-stage MIPS pipeline: IF (Instruction Fetch) → ID (Instruction Decode) → EX (Execute) → MEM (Memory Access) → WB (Write Back). Benefit: increases throughput (instructions per unit time) without reducing individual instruction latency. Hazards: structural (resource conflict), data (instruction depends on previous result — solved by forwarding or stalling), control (branch instructions — solved by branch prediction). Pipeline CPI ideally = 1 (one instruction completes per cycle). Hazards cause stall cycles, increasing CPI.
