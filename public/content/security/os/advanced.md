# Operating Systems Advanced Concepts

## Kernel Internals

### Interrupt Handling
1. Hardware sends interrupt signal
2. CPU saves current state
3. Jumps to Interrupt Service Routine (ISR)
4. ISR handles interrupt
5. CPU restores state

**Types:**
- Hardware interrupts: I/O completion, timer, keyboard
- Software interrupts (traps): System calls, page faults
- Exceptions: Divide by zero, invalid memory access

### Context Switching
Saving and restoring CPU state when switching processes.
- Save: PC, registers, stack pointer to Process Control Block (PCB)
- Load: New process PCB into CPU

**Cost factors:**
- Number of registers to save/restore
- TLB flush (or ASID tagging to avoid flush)
- Cache effects (cold cache after switch)

## Advanced Memory Topics

### NUMA (Non-Uniform Memory Access)
Multi-CPU systems where memory access time depends on which CPU is accessing it. OS must be NUMA-aware for performance.

### Huge Pages
Default page size is 4KB. Huge pages (2MB, 1GB) reduce TLB pressure for memory-intensive apps.

### Copy-on-Write (CoW)
fork() doesn't copy parent's memory immediately. Pages are shared and only copied when either process modifies them. Efficient for exec-after-fork.

### Memory Overcommit
OS allows allocating more memory than physically available. Works because most allocated memory is never used. Risky: OOM killer can terminate processes.

## Advanced File Systems

### Journaling
Before modifying file system, write changes to a journal (log). If crash occurs, replay journal on recovery. Ensures consistency.

**Types:**
- **Writeback**: Only metadata journaled
- **Ordered**: Data written before metadata journaled
- **Journal**: Both data and metadata journaled (safest, slowest)

ext3/ext4 use journaling. Without it, fsck needed after crash.

### Virtual File System (VFS)
Abstraction layer that allows different file systems (ext4, NTFS, NFS) to be accessed uniformly.

```
Application calls → VFS interface → Specific FS driver → Storage
```

### Log-Structured File Systems
All writes go to log sequentially. Fast writes, complex reads. Cleaning process reclaims space. Example: LFS.

## Virtualization

### Type 1 Hypervisor (Bare-metal)
Runs directly on hardware. Guest OSes run on top. VMware ESXi, Xen, KVM (with hardware support).

### Type 2 Hypervisor (Hosted)
Runs on host OS. Slower, easier to use. VirtualBox, VMware Workstation.

### Container Virtualization
OS-level virtualization using namespaces and cgroups. Shares host kernel. Docker, LXC.
- **Namespaces**: Isolate PID, network, mount, UTS, IPC, user
- **cgroups**: Limit and account for resource usage (CPU, memory, I/O)

## Real-Time Operating Systems

### Hard Real-Time
Missing a deadline is catastrophic failure. Avionics, medical devices.

### Soft Real-Time
Missing deadlines degrades performance but not catastrophic. Multimedia streaming.

### Real-Time Scheduling
- **Rate Monotonic**: Static priority based on period. Shorter period = higher priority.
- **Earliest Deadline First (EDF)**: Dynamic priority. Process with nearest deadline runs first.

## Performance and Profiling

### Performance Metrics
- **Throughput**: Work done per unit time
- **Latency**: Time to complete a single operation
- **Utilization**: % of time resource is busy
- **Saturation**: How much extra work is queued

### Tools
- `top`/`htop`: CPU and memory usage per process
- `vmstat`: Virtual memory statistics
- `iostat`: I/O statistics
- `strace`: Trace system calls
- `perf`: Performance counters, profiling
- `eBPF`: Dynamic kernel tracing

## Security

### Protection Rings
x86 has 4 rings (0=kernel, 3=user). OS uses ring 0 and 3.

### Memory Protection
- **ASLR**: Address Space Layout Randomization. Randomizes base addresses.
- **NX bit**: Non-executable pages prevent code injection.
- **Stack canaries**: Detect stack buffer overflows.

### Capabilities and Mandatory Access Control
- **DAC**: Discretionary Access Control (Unix permissions)
- **MAC**: Mandatory Access Control (SELinux, AppArmor)
- **Capabilities**: Fine-grained privilege subdivision (vs all-or-nothing root)
