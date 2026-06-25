# Operating Systems Cheatsheet

## Process Management Commands
```bash
ps aux                  # List all processes
ps -ef | grep nginx     # Find process by name
top / htop              # Interactive process viewer
kill -9 PID             # Force kill process
kill -15 PID            # Graceful termination
killall process_name    # Kill by name
nice -n 10 command      # Run with lower priority (+19 to -20)
renice 10 PID           # Change priority of running process
nohup command &         # Run immune to hangup
bg / fg                 # Background / foreground
jobs                    # List background jobs
```

## Memory Commands
```bash
free -h                 # Memory usage
vmstat 1 10             # Virtual memory stats every 1s, 10 times
cat /proc/meminfo       # Detailed memory info
pmap PID                # Memory map of process
smem                    # Memory usage with shared memory breakdown
```

## File System Commands
```bash
df -h                   # Disk space by filesystem
du -sh /path            # Disk usage of path
lsblk                   # List block devices
mount /dev/sdb1 /mnt    # Mount device
umount /mnt             # Unmount
fsck /dev/sdb1          # Check/repair filesystem
mkfs.ext4 /dev/sdb1     # Format as ext4
```

## I/O and Performance
```bash
iostat -x 1             # I/O stats every 1s
iotop                   # I/O by process
lsof                    # List open files
lsof -p PID             # Files opened by process
strace -p PID           # Trace system calls of process
perf top                # Performance counters
```

## Scheduling Algorithms Summary
| Algorithm | Preemptive | Starvation | Use Case |
|-----------|-----------|-----------|---------|
| FCFS | No | No | Batch |
| SJF | No | Yes | Batch |
| SRTF | Yes | Yes | Optimal avg wait |
| Priority | Both | Yes | Real-time |
| Round Robin | Yes | No | Time-sharing |

## Process States
```
New → Ready ← → Running → Terminated
              ↓         ↑
            Waiting ----
```

## Memory Management Quick Reference
- Page size: typically 4KB
- TLB hit time: ~1ns; Miss + page table walk: ~100ns; Page fault: ~10ms
- Virtual address = page number + offset
- Physical address = frame number + offset

## Synchronization Primitives
| Primitive | Use Case |
|-----------|---------|
| Mutex | Mutual exclusion |
| Semaphore | Signaling, counting |
| Spinlock | Short critical sections (kernel) |
| RW Lock | Multiple readers, one writer |
| Condition Variable | Wait for condition |

## Signals Quick Reference
| Signal | Number | Meaning |
|--------|--------|---------|
| SIGHUP | 1 | Hangup |
| SIGINT | 2 | Interrupt (Ctrl+C) |
| SIGKILL | 9 | Kill (cannot catch) |
| SIGSEGV | 11 | Segfault |
| SIGTERM | 15 | Graceful terminate |
| SIGCHLD | 17 | Child status change |
