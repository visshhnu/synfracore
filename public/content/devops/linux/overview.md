# Linux & Bash

> **Production Linux — performance troubleshooting, Bash scripting, system administration**

**Category:** Linux & OS
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

---

## What is Linux & Bash?

Every DevOps engineer must be fluent in Linux. Key directories: `/etc` (config files), `/var` (logs, data), `/opt` (third-party apps), `/proc` (kernel interfaces), `/sys` (hardware interfaces). Permissions: owner/group/others, `rwx` = 4+2+1. Systemd manages services — always use `systemctl`, not the older `service` command, on modern Linux.

## Why Linux & Bash?

USE Method: for every resource, check Utilization, Saturation, Errors. A slow server is almost always one of: CPU saturated (run queue > CPU count), memory pressure (swap active), disk I/O bottleneck (`await` > 10ms), or network issues (retransmits). Run `vmstat` first — the "r" column (run queue) tells you if CPU is saturated immediately.

---

## Learning Modules

### Module 01 — Linux Fundamentals for DevOps
*Filesystem, permissions, package management, systemd, users*

**Topics covered:**

- Filesystem hierarchy (`/etc`, `/var`, `/opt`, `/proc`, `/sys`) — 🟢 Beginner
- File permissions (rwx, chmod, chown, SUID/SGID/sticky bit) — 🟢 Beginner
- Package management (apt, yum, dnf) — 🟢 Beginner
- Systemd — start, stop, enable, status — 🟢 Beginner
- Users, groups, sudo — 🟢 Beginner

### Module 02 — Performance Troubleshooting
*CPU, memory, disk, network — USE method*

**Topics covered:**

- vmstat — CPU and memory saturation — 🟡 Intermediate
- iostat — disk I/O analysis — 🟡 Intermediate
- ss / netstat — network connections — 🟡 Intermediate
- strace / lsof — process debugging — 🔴 Advanced
- USE method framework — 🟡 Intermediate

### Module 03 — Log Analysis
*grep, awk, sed, journalctl*

Log analysis is the most frequent Linux task for DevOps. `grep -E` for extended regex, `-A`/`-B`/`-C` for context around matches. `awk` extracts specific columns from log lines. `sed` replaces patterns inline. `journalctl` for systemd logs — always use `--since` and `--until` to narrow the time range before searching.

**Topics covered:**

- grep with regex and context — 🟢 Beginner
- awk for log field extraction — 🟡 Intermediate
- sed for stream editing — 🟡 Intermediate
- sort / uniq / cut for the "count and rank" idiom — 🟡 Intermediate
- journalctl filters and time ranges — 🟡 Intermediate

### Module 04 — Bash Scripting
*Production-grade automation scripts*

Production Bash scripts always start with `set -euo pipefail`: `-e` exits on error, `-u` errors on undefined variables, `-o pipefail` catches pipe failures. Always use `trap` for cleanup. Quote all variables — plain strings with `"$var"`, real lists with a bash array (`"${arr[@]}"`), not a space-separated string. Use `[[ ]]` not `[ ]` for conditionals. Use `$(command)` not backticks for command substitution.

**Topics covered:**

- set -euo pipefail (safe mode) — 🟡 Intermediate
- Quoting: strings vs. real arrays — 🟡 Intermediate
- Error handling and traps — 🟡 Intermediate
- Compression and archives (gzip, tar) — 🟢 Beginner

### Module 05 — Networking & Security
*iptables, firewalld/ufw, SSL, SSH hardening, tcpdump*

Every production Linux server should have a firewall enabled, SSH hardened, and root login disabled. Use `ss` (the modern replacement for `netstat`) for socket analysis. `tcpdump` captures packets — essential for diagnosing network issues at the OS level. `openssl` commands verify certificate validity and expiry directly.

**Topics covered:**

- ss and netstat for port analysis — 🟢 Beginner
- iptables / firewalld / ufw rules — 🟡 Intermediate
- SSH hardening (`sshd_config`) — 🟡 Intermediate
- SSL/TLS certificate verification with openssl — 🟡 Intermediate
- tcpdump for packet analysis — 🔴 Advanced

### Module 06 — Linux in Kubernetes Context
*OOMKilled, cgroups, kernel tuning*

Kubernetes uses Linux cgroups to enforce resource limits. When a container exceeds its memory limit, the kernel's OOM killer terminates the process — shown as `OOMKilled` in Kubernetes. This is a kernel-level mechanism, not a Kubernetes-specific one — the same OOM killer would terminate any process exceeding a cgroup memory limit, container or not.

**Topics covered:**

- cgroups and container resource limits — 🔴 Advanced
- OOM killer behaviour — 🔴 Advanced
- Node performance debugging — 🔴 Advanced

---

## Production Example

```bash
# Production Runbook — "the server feels slow, users are complaining"
# Follow this order; each step narrows down which resource is actually
# the problem before you go deeper on any single one.

# Step 1: Quick orientation (10 seconds)
uptime
# load average 8.42, 7.90, 6.15 on a 4-core box → CPU is genuinely
# saturated (load consistently > core count), not just briefly spiking
# -- though also check: Linux load average includes D-state (disk-wait)
# processes too, not just CPU-runnable ones, so confirm with vmstat next
# rather than assuming CPU from load average alone.

# Step 2: USE method -- CPU
vmstat 1 5
# "r" column consistently > 4 (core count) confirms CPU saturation
# "us"/"sy" columns tell you user-space vs kernel-space time

# Step 3: Which process specifically?
ps aux --sort=-%cpu | head -10
top -c    # press 1 for per-core breakdown -- a single maxed core vs.
          # all cores loaded evenly implies different root causes
          # (a single-threaded runaway process vs. genuine overall load)

# Step 4: If it's not obviously one process, check memory pressure too
# (CPU symptoms can actually be caused by memory pressure -- the kernel
# spends CPU time on page reclaim/swapping when memory is tight)
free -h
vmstat 1 5   # "si"/"so" columns -- any sustained non-zero value means
             # the system is actively swapping, which will look like a
             # CPU problem in top even though the root cause is memory

# Step 5: Disk, if the app is I/O-bound rather than CPU-bound
iostat -x 1 5
# await column: sustained > 10ms on SSD-backed storage is a real signal

# Step 6: Confirm at the application level once a resource is identified
# -- a saturated CPU with a clear single-process cause usually means
# that process needs profiling (strace, or a language-specific
# profiler), not further OS-level investigation
strace -c -p <pid>   # -c summarizes syscall counts/time, fast overview
                      # before deciding whether a full trace is needed
```

## Interview Prep

**PSR Formula:** Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

**Q1. What is Linux & Bash and why would you use it in production?**

**A:** **Problem:** production incidents happen at any hour and don't wait for you to look something up — every layer of a modern stack (Kubernetes nodes, containers, the app itself) ultimately runs on Linux, and not knowing the OS layer means being blind to a huge share of real failure causes. **Solution:** fluency in the filesystem hierarchy, permissions, process management, and the USE method (Utilization/Saturation/Errors) turns "the server is slow" from a vague complaint into a systematic diagnosis. **Result:** most production Linux issues get isolated to a specific resource (CPU, memory, disk, network) within minutes using a fixed diagnostic sequence, rather than guessing.

---

**Q2. How does Linux & Bash work internally? Explain the architecture.**

**A:** **Problem:** understanding *why* a command works, not just *that* it works, is what lets you debug something you've never seen before. **Solution:** the kernel manages hardware and resources directly; `/proc` and `/sys` are virtual filesystems exposing live kernel state (not real files on disk — writes to certain `/proc` entries change kernel behavior immediately); systemd (PID 1) manages every other process and service as its children, which is why `journalctl -u <service>` can show a service's full lifecycle. **Result:** this mental model is what makes something like "why does killing the parent process make a zombie process disappear" make sense immediately, rather than needing to be memorized as a fact.

---

**Q3. What are the main components of Linux & Bash?**

**A:** **Problem:** without breaking "Linux administration" into concrete pieces, it's hard to know what to actually study. **Solution:** the pieces that come up constantly in DevOps work are the filesystem hierarchy and permissions model, process management (`ps`, `kill`, signals, process states), systemd for service management, package management (apt/yum/dnf), log analysis (grep/awk/sed/journalctl), networking and security basics (firewall rules, SSH hardening, tcpdump), the USE method for performance troubleshooting, and Bash scripting for automation. **Result:** each maps to a recognizable class of real task or incident, which is why they're this course's core modules.

---

**Q4. How do you handle failures in Linux & Bash?**

**A:** **Problem:** a failure can originate at almost any layer (application, OS resource, network, misconfiguration), and treating every incident as a fresh mystery doesn't scale. **Solution:** follow the USE method in a fixed order — check CPU, then memory, then disk, then network — narrowing at each step rather than jumping to conclusions; for scripts specifically, `set -euo pipefail` plus a `trap` for cleanup means failures are caught immediately rather than silently continuing. **Result:** this ordered approach is directly reflected in the Production Example runbook above and the Troubleshooting tab — it's the actual sequence used to resolve real incidents faster, not an abstract principle.

---

**Q5. What is your production experience with Linux & Bash?**

**A:** This is a genuinely personal question — answer with a real incident using the Problem → Solution → Result structure: what broke, your actual diagnostic command sequence and why you chose that order, and what the root cause turned out to be. Interviewers are listening for whether you have a *methodology* more than whether you recite the "correct" answer.

---

**Q6. How do you monitor and observe Linux & Bash in production?**

**A:** **Problem:** many failure modes (memory pressure building slowly, disk filling up gradually, a slow leak in connection count) are invisible until they become a full outage if you're only checking reactively. **Solution:** track leading indicators — swap activity (any sustained `si`/`so` in `vmstat` means real memory pressure before it becomes an OOM kill), disk usage trend (not just current `df -h` output, but the rate of growth), and `CLOSE-WAIT` connection counts (a growing count is a specific, real signal of an application not closing connections it should). **Result:** these catch problems while there's still time to intervene, rather than after the OOM killer or a full disk has already caused an outage.

---

**Q7. What are the security considerations for Linux & Bash?**

**A:** **Problem:** a compromised or misconfigured Linux host is a direct path to whatever it has access to. **Solution:** disable direct root SSH login and use scoped `sudo` instead (least privilege at the OS level), keep a firewall enabled with explicit allow rules rather than a wide-open default, and be deliberate about SUID binaries (`chmod u+s`) since they run with the file owner's privileges regardless of who invokes them — an unnecessary SUID bit on a writable script is a real, common privilege-escalation path. **Result:** these are the same defense-in-depth principles that show up across this platform's Security material, applied specifically at the OS-administration layer.

---

**Q8. How does Linux & Bash compare to alternatives?**

**A:** This usually means a more specific comparison — e.g., "why Bash instead of Python for this kind of task," or "systemd vs. the older SysV init," or "RHEL-family vs. Debian-family for a given deployment." Problem → Solution → Result still applies: state the specific tradeoff being asked about, the mechanism difference, and when you'd actually pick one over the other — e.g., Bash is the right choice for gluing existing command-line tools together and simple automation; Python becomes the better choice once the logic needs real data structures, error handling beyond exit codes, or will be maintained by people less comfortable reading shell syntax.

---

**Q9. Explain Linux Fundamentals for DevOps in Linux & Bash.**

**A:** The filesystem hierarchy, permissions model (`rwx` = 4+2+1, owner/group/other), and systemd service management are the foundation everything else builds on. Knowing which directories are real (persisted to disk) versus virtual/kernel-generated (`/proc`, `/sys`) matters practically — it's the difference between "this file represents actual stored data" and "this file is a live view into current kernel state that changes on its own." Package management differs by distro family (`apt` for Debian/Ubuntu, `dnf`/`yum` for RHEL-family) — running the wrong tool against the wrong family is a common, avoidable early mistake worth checking `/etc/os-release` to avoid.

---

**Q10. Explain Performance Troubleshooting in Linux & Bash.**

**A:** The USE method (Utilization, Saturation, Errors) applied to each resource in turn — CPU, memory, disk, network — turns "the server is slow" into a systematic diagnosis rather than guesswork. `vmstat` is the right first command because it surfaces both CPU saturation (the `r` column, run queue length) and memory pressure (swap activity) in one glance. High `iostat` `await` specifically signals disk saturation (requests waiting), not necessarily hardware failure. A growing `CLOSE-WAIT` count in `ss`/`netstat` output signals an application-level connection leak, not an OS problem — knowing which layer a given symptom actually points to is what separates efficient troubleshooting from randomly running commands.

---

## Official Resources

- [Linux man pages online](https://man7.org/linux/man-pages/)
- [Bash Reference Manual](https://www.gnu.org/software/bash/manual/bash.html)
- [Linux Performance Tools (Brendan Gregg)](https://www.brendangregg.com/linuxperf.html)
- [USE Method Reference](https://www.brendangregg.com/usemethod.html)
