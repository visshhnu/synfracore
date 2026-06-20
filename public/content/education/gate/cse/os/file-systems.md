# File Systems and I/O

## Why This Chapter Matters
File systems appear in GATE — 4-6 marks. Disk scheduling algorithms (FCFS, SSTF, SCAN, C-SCAN), file allocation methods, and inode-based access calculations are tested.

## Core Concepts

### 1. File Allocation Methods

**Contiguous Allocation:**
File stored in contiguous blocks. Direct access easy (block = start + offset).
Problem: External fragmentation, file size must be known in advance.

**Linked Allocation:**
Blocks form a linked list. No external fragmentation.
Problem: Random access O(n), pointer overhead, reliability (broken link = lost file).
FAT (File Allocation Table): linked allocation stored in separate table.

**Indexed Allocation:**
Index block holds pointers to all data blocks.
Direct access possible. No external fragmentation.
Problem: Index block overhead. Multi-level indexing for large files (Unix inode).

**Inode Structure (Unix):**
12 direct pointers + 1 single indirect + 1 double indirect + 1 triple indirect

If block size = 4KB, pointer size = 4 bytes:
Pointers per block = 4KB/4 = 1024
Single indirect: 1024 blocks = 4MB
Double indirect: 1024^2 blocks = 4GB
Triple indirect: 1024^3 blocks = 4TB

### 2. Disk Scheduling Algorithms

Given: Head at position X. Queue of cylinder requests.

**FCFS:** Service in order received. Simple but poor performance.
**SSTF (Shortest Seek Time First):** Service nearest request. Good throughput, but starvation possible.
**SCAN (Elevator):** Head moves in one direction servicing all requests, then reverses. No starvation.
**C-SCAN (Circular SCAN):** Like SCAN but only services in one direction, jumps to other end.
**LOOK:** Like SCAN but reverses at last request (not disk end).
**C-LOOK:** Like C-SCAN but jumps to first/last actual request.

SSTF is best average seek time. SCAN/C-SCAN best for heavy load.

## PYQs
**GATE 2024:** Disk head at cylinder 53. Requests: 98,183,37,122,14,124,65,67. SCAN moving towards higher. Total head movement?
Moving up from 53: 65,67,98,122,124,183. Then reverse: 37,14.
Movement: (183-53) + (183-14) = 130 + 169 = 299 cylinders.

**GATE 2023:** With SSTF, same scenario:
From 53: nearest is 65 (12), then 67 (2), then 37 (30), then 98 (61)...
Track total movement.

**GATE 2022:** File with 5 direct, 1 single indirect, 1 double indirect. Block=512B, pointer=4B. Max file size?
Pointers per block = 512/4 = 128.
Max = 5*512 + 128*512 + 128^2*512 = 2560 + 65536 + 8388608 = 8456704 bytes ≈ 8MB.

## Revision Notes
```
FILE ALLOCATION:
Contiguous: fast, fragmentation problem
Linked: no fragmentation, no random access, FAT improvement
Indexed: no fragmentation, random access, inode in Unix

INODE ACCESS (block size B, n=ptrs/block):
Direct: 12 blocks
Single indirect: n blocks
Double indirect: n^2 blocks
Triple indirect: n^3 blocks

DISK SCHEDULING (total head movement is key metric):
FCFS: simple, poor
SSTF: best avg, starvation
SCAN: elevator, no starvation
C-SCAN: uniform wait time
```
