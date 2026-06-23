# GATE CSE — Important Topics & Questions

## Data Structures & Algorithms

**Q: What is the time complexity of building a Heap from an array?**
```
Naive approach: insert n elements one by one → O(n log n)
Floyd's algorithm (heapify from bottom): O(n)

Proof: Sum of heights = n/2 × 0 + n/4 × 1 + n/8 × 2 + ... = O(n)
This is why heapify is O(n) even though heap operations are O(log n)

Key fact for GATE: heap BUILD = O(n) | heap SORT = O(n log n)
```

**Q: Dijkstra's shortest path — time complexity with different data structures.**
```
With adjacency matrix + simple array: O(V²)
With binary heap (priority queue): O((V+E) log V)
With Fibonacci heap: O(E + V log V) [theoretical best]

For sparse graphs (E ≈ V): binary heap is better
For dense graphs (E ≈ V²): adjacency matrix implementation better

GATE loves: Bellman-Ford handles negative weights (O(VE))
           Dijkstra fails with negative weight edges
```

## Operating Systems

**Q: Banker's Algorithm — explain with small example.**
```
Used for deadlock AVOIDANCE (not detection/prevention)

State is SAFE if there exists a sequence P1, P2, ..., Pn such that
each process can be completed using remaining + resources released by previous

Example (3 processes, 1 resource type, total=10):
  Process | Allocated | Max Need | Need(Max-Alloc)
  P1      | 2         | 9        | 7
  P2      | 3         | 5        | 2
  P3      | 2         | 7        | 5
  Available = 10 - (2+3+2) = 3

  Can P2 finish? Need=2 ≤ Available=3 → YES → releases 3 → Available=6
  Can P3 finish? Need=5 ≤ Available=6 → YES → releases 2 → Available=8
  Can P1 finish? Need=7 ≤ Available=8 → YES
  Safe sequence: P2→P3→P1 → SAFE STATE
```

## Computer Networks

**Q: What is the difference between TCP and UDP? When is each used?**
```
TCP: Reliable, ordered, connection-oriented
  3-way handshake (SYN-SYN/ACK-ACK) before data
  Acknowledgements, retransmission on packet loss
  Flow control (sliding window) and congestion control
  Use: HTTP/HTTPS, email, file transfer, SSH, databases

UDP: Unreliable, connectionless, no handshake
  No acknowledgements, no retransmission
  Faster, lower overhead
  Use: DNS, streaming video/audio, gaming, VoIP, DHCP

GATE loves: TCP window size, sliding window protocol
           Go-Back-N vs Selective Repeat ARQ
           Efficiency = W / (1 + 2a) where a = propagation/transmission
```

## Revision Notes
```
COMPLEXITY (must memorise):
  Sorting: bubble/selection/insertion O(n²) | merge/heap O(n logn) | quick avg O(n logn)
  Searching: linear O(n) | binary O(log n) | BST O(log n) avg O(n) worst
  Hash: O(1) avg | Heap build O(n) | Dijkstra O(E log V)

OS KEY CONCEPTS:
  CPU scheduling: FCFS, SJF, SRTF, Round Robin, Priority
  Deadlock: Mutual exclusion + Hold&Wait + No preemption + Circular wait
  Page replacement: FIFO, LRU, Optimal
  Banker's algorithm: deadlock AVOIDANCE (safe/unsafe state)

NETWORKS:
  OSI 7 layers | TCP: reliable ordered | UDP: fast unreliable
  Routing: distance vector (Bellman-Ford) | link state (Dijkstra)
  Subnetting: CIDR notation | VLSM
  Stop-and-wait efficiency: 1/(1+2a) | GBN efficiency: N/(1+2a) if N<2a+1

GATE PAPER PATTERN:
  65 questions | 100 marks | 3 hours
  1-mark: 2/3 negative | 2-mark: 2/3 negative
  Virtual Mathematics, Aptitude = 15 marks (don't skip!)
```
