# Process Management

## Why This Chapter Matters
Process management is a core OS topic in GATE — 6-10 marks. Process states, scheduling algorithms with Gantt charts, and CPU utilization calculations are tested every year.

## Core Concepts

### 1. Process States
New -> Ready -> Running -> Terminated
Running -> Waiting (I/O) -> Ready (I/O complete)
Running -> Ready (preempted by higher priority or time slice expired)

### 2. PCB (Process Control Block)
Stores: PID, state, program counter, CPU registers, memory limits, open files, priority.

### 3. CPU Scheduling Algorithms

**FCFS (First Come First Serve):**
Non-preemptive. Simple. Convoy effect (short jobs wait for long ones).
Average waiting time can be high.

**SJF (Shortest Job First):**
Minimum average waiting time (provably optimal for non-preemptive).
Non-preemptive: once started, runs to completion.
Preemptive SJF = SRTF (Shortest Remaining Time First).
Problem: Cannot know future burst times.

**Round Robin:**
Each process gets a fixed time quantum q.
If q too large: degenerates to FCFS. If q too small: too many context switches.
Good for time-sharing, fair CPU distribution.

**Priority Scheduling:**
Highest priority process runs first.
Problem: Starvation of low-priority processes.
Solution: Aging (increase priority over time).

**Multilevel Queue:** Different queues for different types (interactive, batch, system). Each queue has own scheduling.

### 4. Key Metrics
**Arrival time (AT):** When process arrives.
**Burst time (BT):** CPU time needed.
**Completion time (CT):** When process finishes.
**Turnaround time (TAT) = CT - AT**
**Waiting time (WT) = TAT - BT**
**Response time:** Time from arrival to first CPU execution.

## PYQs
**GATE 2024:** Processes: P1(AT=0,BT=4), P2(AT=1,BT=3), P3(AT=2,BT=5). FCFS. Find avg waiting time.
P1: starts 0, ends 4. WT=0. P2: starts 4, ends 7. WT=3. P3: starts 7, ends 12. WT=5.
Avg WT = (0+3+5)/3 = 8/3 = 2.67

**GATE 2023:** Same processes with SJF non-preemptive.
At t=0, only P1 available -> P1 runs (0-4). At t=4, P2(BT=3) and P3(BT=5) available -> P2 runs (4-7). P3 runs (7-12).
Same as FCFS here. Avg WT = (0+3+5)/3 = 2.67.

**GATE 2022:** With Round Robin quantum=2: P1(BT=5),P2(BT=3),P3(BT=1) all arrive at t=0.
P1 runs 0-2, P2 runs 2-4, P3 runs 4-5, P1 runs 5-7, P2 runs 7-8, P1 runs 8-10.
CT: P1=10, P2=8, P3=5. Avg TAT = (10+8+5)/3 = 23/3 = 7.67.

## Revision Notes
```
METRICS:
TAT = Completion Time - Arrival Time
WT = TAT - Burst Time
Response Time = First CPU start - Arrival Time

ALGORITHMS:
FCFS: non-preemptive, simple, convoy effect
SJF: optimal avg WT (non-preemptive), starvation possible
SRTF: preemptive SJF, best avg WT overall
RR: fair, quantum-based, good for time-sharing
Priority: starvation risk, aging as solution
```
