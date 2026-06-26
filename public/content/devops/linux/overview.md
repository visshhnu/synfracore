# Linux & Bash

> **Production Linux — performance troubleshooting, Bash scripting, system administration**

**Category:** Linux & OS  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is Linux & Bash?

Every DevOps engineer must be fluent in Linux. Key directories: /etc (config files), /var (logs, data), /opt (third-party apps), /proc (kernel interfaces), /sys (hardware interfaces). Permissions: owner/group/others, rwx = 4+2+1. Systemd manages services — always use systemctl, not service command for modern Linux.

## Why Linux & Bash?

USE Method: for every resource check Utilization, Saturation, Errors. A slow server is almost always one of: CPU saturated (run queue > CPU count), memory pressure (swap active), disk I/O bottleneck (await > 10ms), or network issues (retransmits). Always run vmstat first — the "r" column (run queue) tells you if CPU is saturated immediately.

---

## Learning Modules

### Module 01 — Linux Fundamentals for DevOps
*Filesystem, users, permissions*

Every DevOps engineer must be fluent in Linux. Key directories: /etc (config files), /var (logs, data), /opt (third-party apps), /proc (kernel interfaces), /sys (hardware interfaces). Permissions: owner/group/others, rwx = 4+2+1. Systemd manages services — always use systemctl, not service command for modern Linux.

**Topics covered:**

- Filesystem hierarchy (/etc, /var, /opt, /proc) — 🟢 Beginner
- File permissions (rwx, chmod, chown) — 🟢 Beginner
- Users, groups, sudo — 🟢 Beginner
- Package management (apt, yum, dnf) — 🟢 Beginner
- Systemd — start, stop, enable, status — 🟢 Beginner

### Module 02 — Performance Troubleshooting
*CPU, memory, disk, network — USE method*

USE Method: for every resource check Utilization, Saturation, Errors. A slow server is almost always one of: CPU saturated (run queue > CPU count), memory pressure (swap active), disk I/O bottleneck (await > 10ms), or network issues (retransmits). Always run vmstat first — the "r" column (run queue) tells you if CPU is saturated immediately.

**Topics covered:**

- vmstat — CPU and memory saturation — 🟡 Intermediate
- iostat — disk I/O analysis — 🟡 Intermediate
- ss / netstat — network connections — 🟡 Intermediate
- strace / lsof — process debugging — 🔴 Advanced
- sar — historical performance — 🔴 Advanced
- USE method framework — 🟡 Intermediate

### Module 03 — Log Analysis
*tail, grep, awk, journalctl*

Log analysis is the most frequent Linux task for DevOps. grep -E for extended regex, -A/-B/-C for context around matches. awk extracts specific columns from log lines. sed replaces patterns inline. journalctl for systemd logs — always use --since and --until to narrow time range before searching.

**Topics covered:**

- tail -f for live log following — 🟢 Beginner
- grep with regex and context — 🟢 Beginner
- awk for log field extraction — 🟡 Intermediate
- sed for stream editing — 🟡 Intermediate
- journalctl filters and time ranges — 🟡 Intermediate

### Module 04 — Bash Scripting
*Production-grade automation scripts*

Production Bash scripts always start with set -euo pipefail: -e exits on error, -u errors on undefined variables, -o pipefail catches pipe failures. Always use trap for cleanup. Quote all variables: "$var" not $var. Use [[ ]] not [ ] for conditionals. Use $(command) not backticks for command substitution.

**Topics covered:**

- set -euo pipefail (safe mode) — 🟡 Intermediate
- Functions, args, return codes — 🟡 Intermediate
- Error handling and traps — 🟡 Intermediate
- Loops and conditionals — 🟢 Beginner
- String manipulation — 🟡 Intermediate
- Working with JSON (jq) — 🟡 Intermediate

### Module 05 — Networking & Security
*iptables, firewalld, SSL, SSH hardening*

Every production Linux server should have a firewall enabled, SSH hardened, and root login disabled. Use ss (modern replacement for netstat) for socket analysis. tcpdump captures packets — essential for diagnosing network issues at the OS level. openssl commands verify certificate validity and content.

**Topics covered:**

- ss and netstat for port analysis — 🟢 Beginner
- iptables / firewalld rules — 🟡 Intermediate
- SSH hardening — 🟡 Intermediate
- SSL/TLS certificate management — 🟡 Intermediate
- tcpdump for packet analysis — 🔴 Advanced

### Module 06 — Linux in Kubernetes Context
*OOMKilled, cgroups, kernel tuning*

Kubernetes uses Linux cgroups to enforce resource limits. When a container exceeds its memory limit, the kernel's OOM killer terminates the process — shows as OOMKilled in K8s. Node performance affects all pods — tune kernel parameters for high-throughput workloads. Always check node-level metrics when multiple pods are struggling.

**Topics covered:**

- cgroups and container resource limits — 🔴 Advanced
- OOM killer behaviour — 🔴 Advanced
- Kernel parameter tuning for K8s — 🔴 Advanced
- Node performance debugging — 🔴 Advanced

---

## Production Example


---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is Linux & Bash and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Linux & Bash work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of Linux & Bash?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in Linux & Bash?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with Linux & Bash?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe Linux & Bash in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for Linux & Bash?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Linux & Bash compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Linux Fundamentals for DevOps in Linux & Bash."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Performance Troubleshooting in Linux & Bash."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [Linux man pages online](https://man7.org/linux/man-pages/)
- [Bash Reference Manual](https://www.gnu.org/software/bash/manual/bash.html)
- [Linux Performance Tools (Brendan Gregg)](https://www.brendangregg.com/linuxperf.html)
- [USE Method Reference](https://www.brendangregg.com/usemethod.html)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*