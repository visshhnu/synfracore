# Linux Interview Questions

Comprehensive Q&A for every level — from junior to senior engineer.

## Beginner Questions

**What is the difference between a process and a thread?**
A process is an independent program with its own memory space, file descriptors, and resources. A thread is a lightweight unit of execution that shares memory space with other threads in the same process. Processes are isolated; threads are not. In Linux, both are implemented as tasks using the \`clone()\` system call — threads just share more resources.

*Follow-up: How does this relate to containers?*

---

**Explain the Linux file permission model.**
Linux uses a discretionary access control (DAC) model with three categories of permissions: owner, group, and others. Each has three bits: read (4), write (2), execute (1). Permissions are represented as octal (e.g., 755 = rwxr-xr-x). Special bits include SUID (run as owner), SGID (run as group), and sticky bit (only owner can delete). In modern environments, SELinux or AppArmor add mandatory access controls on top.

---

**What does \`chmod 644\` mean?**
Owner has read+write (6=4+2), group has read-only (4), others have read-only (4). This is standard for configuration files — the owner can edit them, but others can only read them.

---

**How do you check disk space and find what's consuming it?**
\`\`\`bash
df -h            # Check overall disk usage per filesystem
du -sh /var/*    # Find which subdirectory is large
du -sh /* 2>/dev/null | sort -rh | head -10  # Top 10 largest
ncdu /           # Interactive drill-down (best tool)
\`\`\`

---

**What's the difference between \`>>\` and \`>\` in shell?**
\`>\` truncates (overwrites) the file before writing. \`>>\` appends to the existing file. In production scripts, use \`>>\` for log files to avoid data loss.

---

## Intermediate Questions

**Explain Linux boot process from BIOS to login prompt.**
1. **BIOS/UEFI** — POST (Power-On Self-Test), finds bootable device
2. **Bootloader (GRUB2)** — Loads kernel and initramfs from /boot
3. **initramfs** — Temporary filesystem, mounts real root filesystem
4. **Kernel** — Initializes hardware, mounts root FS, launches PID 1
5. **systemd (PID 1)** — Starts system targets (multi-user.target), manages service dependencies
6. **Login** — getty/agetty prompts for credentials

*In containers, steps 1-3 are skipped — the container runtime provides the kernel.*

---

**What are Linux namespaces and how do containers use them?**
Namespaces are a kernel feature that partition global resources into isolated views. Docker uses:
- **PID namespace** — Container sees its own PID 1 (not host's)
- **Network namespace** — Separate network interfaces, routing tables
- **Mount namespace** — Separate filesystem view
- **UTS namespace** — Separate hostname
- **IPC namespace** — Separate inter-process communication
- **User namespace** — Map container root to unprivileged host user

\`\`\`bash
# Verify: container PID 1 on host has different PID
docker run nginx &
ps aux | grep nginx   # Has a different PID on host
\`\`\`

---

**What are cgroups and why do they matter for Kubernetes?**
Control Groups (cgroups) limit and account for resource usage (CPU, memory, I/O) for groups of processes. Kubernetes uses cgroups to enforce resource requests and limits:
- \`resources.requests.memory: "128Mi"\` → soft hint for scheduling
- \`resources.limits.memory: "256Mi"\` → hard cgroup memory limit (OOMKill if exceeded)

---

**How would you troubleshoot high CPU load on a server?**
\`\`\`bash
# 1. Identify overall load
uptime    # Load averages - if > CPU count, you have a problem

# 2. Find the process
top -c    # Sort by CPU, press P
ps aux --sort=-%cpu | head -10

# 3. Investigate the process  
strace -p <pid>       # System calls
perf top              # CPU profiling
cat /proc/<pid>/status  # Process details

# 4. Check if I/O wait is the cause
iostat -xz 1          # High %iowait = disk bottleneck, not CPU

# 5. Check for runaway cron jobs
grep CRON /var/log/syslog | tail -20
\`\`\`

---

## Advanced Questions

**How does the OOM killer work and how do you control it?**
When the system runs out of memory, the kernel's OOM (Out-of-Memory) killer selects a process to kill based on its "badness" score. The score considers memory usage, run time, and \`oom_score_adj\`. 

\`\`\`bash
# Check OOM score
cat /proc/<pid>/oom_score

# Protect a process from OOM kill (-1000 = never kill)
echo -1000 > /proc/<pid>/oom_score_adj

# Make a process more likely to be killed (1000 = kill first)  
echo 1000 > /proc/<pid>/oom_score_adj

# In Kubernetes, this is set via QoS classes:
# Guaranteed (requests=limits) → oom_score_adj = -998
# Burstable (requests < limits) → based on memory usage
# BestEffort (no limits) → oom_score_adj = 1000
\`\`\`

---

**Explain inode exhaustion and how to diagnose it.**
Every file needs an inode (metadata: permissions, timestamps, location). You can run out of inodes before running out of disk space — this causes "No space left on device" even with free disk.

\`\`\`bash
df -i              # Check inode usage
df -i / | awk 'NR==2{print $5}' # Inode usage percentage

# Find directories with many files
for i in /*; do echo $i; find $i -xdev | wc -l; done 2>/dev/null | paste - -

# Common cause: millions of small temp files
ls /tmp | wc -l
ls /var/spool/postfix/maildrop | wc -l
\`\`\`

---

**Architect Question: You have a production server running out of disk. Walk me through your response.**

1. **Don't panic, assess** — \`df -h\` to find which filesystem, \`du -sh /*\` to find what's growing
2. **Quick wins** — Clear old logs (\`journalctl --vacuum-size=1G\`), clean package cache (\`apt clean\`)  
3. **Find the real cause** — Runaway log file? Growing database? Old Docker images? (\`docker system df\`)
4. **Fix without downtime** — LVM: add disk, extend VG, extend LV, resize filesystem
5. **Prevent recurrence** — Log rotation (logrotate), monitoring alerts at 80%, Prometheus disk alerts
6. **Post-mortem** — Document what happened, update runbooks, add capacity planning