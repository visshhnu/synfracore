# Process Synchronisation

## Why This Chapter Matters
Synchronisation is one of the most-tested OS topics in GATE — 6-10 marks. Critical section problem, semaphores, deadlock conditions (Coffman), and Banker's algorithm are tested frequently.

## Core Concepts

### 1. Critical Section Problem
**Critical section:** Code accessing shared resources.
**Requirements for correct solution:**
1. Mutual Exclusion: At most one process in CS at a time
2. Progress: If no process in CS, one of the waiting processes must enter
3. Bounded Waiting: Each process gets CS eventually (no starvation)

### 2. Peterson's Solution (2 processes)
flag[i] = true (process i wants to enter)
turn = j (give turn to other process)
Entry: flag[i]=true; turn=j; while(flag[j] && turn==j) wait;
Exit: flag[i] = false

Satisfies all 3 requirements. Works for 2 processes.

### 3. Semaphores
**Binary semaphore (mutex):** 0 or 1. Simple lock/unlock.
**Counting semaphore:** Non-negative integer. Controls access to k resources.

wait(S): while S<=0 do nothing; S--
signal(S): S++

**Producer-Consumer with semaphores:**
mutex = 1 (mutual exclusion)
full = 0 (count of full slots)
empty = N (count of empty slots)

Producer: wait(empty); wait(mutex); add item; signal(mutex); signal(full)
Consumer: wait(full); wait(mutex); remove item; signal(mutex); signal(empty)

### 4. Deadlock
**Four Necessary Conditions (Coffman):**
1. Mutual Exclusion: Resource held non-sharable
2. Hold and Wait: Process holds resource and waits for more
3. No Preemption: Resources not taken forcibly
4. Circular Wait: P1 waits for P2, P2 waits for P1 (cycle in resource allocation graph)

**Deadlock Prevention:** Ensure at least one Coffman condition never holds.
**Deadlock Avoidance:** Banker's Algorithm.
**Deadlock Detection:** Allow deadlock, detect and recover.

### 5. Banker's Algorithm
State is SAFE if a sequence exists such that each process can complete.
For each process: check if its maximum remaining need can be satisfied by current available resources. If yes, allocate, let it finish, release all resources. Repeat.

## PYQs
**GATE 2024:** How many binary semaphores are needed to solve n-process critical section problem?
1 binary semaphore (mutex=1) is sufficient for mutual exclusion.

**GATE 2023:** Which condition is NOT required for deadlock?
Deadlock requires ALL FOUR Coffman conditions. Removing any one prevents deadlock.

**GATE 2022:** System has 3 resources, 4 processes. Max need, current allocation, available resources given. Is it in safe state?
Apply Banker's algorithm — check if safe sequence exists.

## Revision Notes
```
CRITICAL SECTION REQUIREMENTS:
1. Mutual Exclusion
2. Progress (liveness)
3. Bounded Waiting (no starvation)

SEMAPHORE:
wait(S): if S<=0 block; else S--
signal(S): S++; wake up blocked process

DEADLOCK - ALL 4 NEEDED:
1. Mutual Exclusion  2. Hold and Wait
3. No Preemption     4. Circular Wait

BANKER'S ALGORITHM:
Safe state = exists a sequence where all processes can finish
Need[i] = Max[i] - Allocation[i]
If Need[i] <= Available for some process: allocate, run, release, repeat
```
