# Operating Systems — Cheatsheet

## Linux Commands for OS Concepts

```bash
# ── PROCESSES ─────────────────────────────────────────────
ps aux                    # All processes
ps -ef                    # Full format
top / htop                # Interactive process viewer
kill -9 PID               # SIGKILL (force)
kill -15 PID              # SIGTERM (graceful)
nice -n 10 cmd            # Run with lower priority
renice 5 -p PID           # Change priority of running process
nohup cmd &               # Run detached from terminal

# ── MEMORY ────────────────────────────────────────────────
free -h                   # RAM usage
cat /proc/meminfo         # Detailed memory info
vmstat 1                  # Virtual memory stats (1 sec intervals)
pmap PID                  # Memory map of process
/proc/PID/maps            # Virtual memory areas

# ── CPU ───────────────────────────────────────────────────
lscpu                     # CPU info
cat /proc/cpuinfo         # Detailed CPU info
uptime                    # Load averages (1, 5, 15 min)
mpstat 1                  # Per-CPU statistics
perf top                  # Performance analysis (profiler)
strace -p PID             # Trace system calls

# ── DISK / I/O ────────────────────────────────────────────
iostat -x 1               # Disk I/O statistics
iotop                     # Per-process I/O
lsblk                     # Block devices
df -h                     # Disk space
du -sh /path/*            # Directory sizes

# ── NETWORKING ────────────────────────────────────────────
ss -tlnp                  # TCP listening ports
netstat -s                # Network statistics
/proc/net/tcp             # TCP connections raw data
```

## Key Concepts Quick Reference

```
Scheduling:
  Preemptive:  OS can interrupt running process
  Non-preemptive: Process runs until it yields/blocks
  Linux CFS: Completely Fair Scheduler (default)

Memory:
  Page size: typically 4KB (large pages: 2MB, 1GB)
  Page table: virtual → physical mapping
  TLB: cache for page table (hardware-managed)
  Swap: pages moved to disk when RAM full

IPC:
  Pipes:     |, unidirectional, related processes
  Named pipes (FIFO): filesystem, unrelated processes
  Shared memory: fastest, needs sync
  Sockets:   network communication, same or different host
  Signals:   SIGTERM(15), SIGKILL(9), SIGHUP(1), SIGUSR1(10)
  Message queues: structured messages

File System:
  inode: metadata (permissions, timestamps, block pointers)
  Hard link: another directory entry pointing to same inode
  Soft link (symlink): file containing path to target
  Journal: log changes before applying (ext4, XFS)
```
