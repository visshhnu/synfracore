# GATE Computer Science — Intermediate

## GATE CSE — Intermediate Preparation

### OS and Networks Deep Dive

```
OPERATING SYSTEMS — MUST KNOW:

DEADLOCK HANDLING:
  Ostrich algorithm: ignore (Unix/Windows default for most cases)
  Detection + Recovery: banker's algorithm, resource allocation graph
  Prevention: break one of 4 necessary conditions
  
  Banker's Algorithm (Deadlock Avoidance):
    For each process: Allocation + Need = Maximum
    Need = Maximum - Allocation
    Available = Total - sum(Allocation)
    Safe state: exists a safe sequence where all processes can complete

VIRTUAL MEMORY:
  Page size tradeoff:
    Small pages: less internal fragmentation, large page table
    Large pages: large internal fragmentation, small page table
  
  Working Set model: set of pages process has used recently (last Δ references)
  Thrashing: if sum of working sets > available frames
  
  TLB Hit Ratio: h
  Effective Access Time = h × (TLB time + memory time) + (1-h) × (TLB time + 2×memory time)

COMPUTER NETWORKS — MUST KNOW:

TCP SLIDING WINDOW:
  Sender window size = min(cwnd, rwnd)
  Slow start: cwnd doubles each RTT
  Congestion avoidance: cwnd increases by 1 per RTT
  Fast retransmit: 3 duplicate ACKs → retransmit without timeout
  
ERROR DETECTION:
  Parity: single bit error detection only
  CRC (Cyclic Redundancy Check): burst error detection (up to degree of polynomial)
  Checksum: TCP/UDP/IP — 16-bit ones complement sum
  Hamming code: detect and correct single-bit errors

SUBNETTING:
  IP: 192.168.1.0/26
  Subnet mask: 255.255.255.192 (/26 = 11111111.11111111.11111111.11000000)
  Network address: 192.168.1.0
  Broadcast: 192.168.1.63
  Usable hosts: 62 (64 - 2)
  
  VLSM: variable length subnet masking — different subnets get different prefix lengths
  CIDR: classless inter-domain routing — aggregation of multiple networks
```

## Revision Notes
```
BANKER'S: Need = Max - Allocation | find safe sequence from Available
TLB HIT RATIO: effective access time formula is frequently asked in GATE
TCP CONGESTION: slow start (double) → ssthresh → additive increase → triple dup ACK
SLIDING WINDOW: throughput = window_size / RTT (bandwidth-delay product)
CRC: generator polynomial | remainder appended to message | detect burst errors
SUBNETTING: /n means n bits for network | 2^(32-n) - 2 usable hosts
```
