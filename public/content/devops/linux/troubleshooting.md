# Linux Troubleshooting Guide

Commands that modify system state, restart services, or read privileged files below generally need `sudo` (or a root shell) unless noted otherwise — that's not called out on every single line, but assume it unless the command is a plain read of your own process/user info.

## Issue 1: Cannot SSH into server — Connection refused

**Symptom:** `ssh user@host` → `ssh: connect to host port 22: Connection refused`

**Root Cause:** SSH daemon not running, firewall blocking port 22, wrong port, or host is down.

**Debug steps:**
```bash
ping host                              # is host reachable?
nmap -p 22 host                        # is port 22 open? (nmap isn't installed by default — sudo apt install nmap / sudo dnf install nmap)
nc -zv host 22                         # nc is more often preinstalled than telnet's client — quick alternative to nmap for a single port

# On the server (if console access available) — service name and firewall
# tooling differ by distro family, check which one you're on first:
cat /etc/os-release

# Debian/Ubuntu:
systemctl status ssh                   # unit is "ssh", not "sshd", on Debian/Ubuntu
ss -tlpn | grep ssh
sudo ufw status                        # ufw is Debian/Ubuntu's default firewall front-end

# RHEL/CentOS/Fedora:
systemctl status sshd                  # unit is "sshd" on RHEL-family
ss -tlpn | grep sshd
sudo firewall-cmd --list-all           # firewalld is RHEL-family's default
sudo iptables -L INPUT -n | grep 22    # raw iptables, either family, if neither ufw nor firewalld is in use
```

**Fix patterns:**
```bash
# Debian/Ubuntu:
sudo systemctl start ssh && sudo systemctl enable ssh
sudo ufw allow 22/tcp

# RHEL/CentOS/Fedora:
sudo systemctl start sshd && sudo systemctl enable sshd
sudo firewall-cmd --permanent --add-service=ssh && sudo firewall-cmd --reload

ssh -p 2222 user@host                  # if the server actually uses a non-standard port
```

**Prevention:** Whitelist allowed users with `AllowUsers` in `/etc/ssh/sshd_config`, and enable fail2ban to auto-block repeated failed login attempts. (`AllowTcpForwarding` controls whether SSH port-forwarding/tunneling is permitted through a session — it has no relationship to connection-refused errors; standard hardening guidance is actually to set it to `no` unless tunneling is specifically needed, not to enable it.)

---

## Issue 2: Disk 100% full — system unstable

**Symptom:** Commands fail with `No space left on device`. Cannot write logs, create files.

**Root Cause:** Logs grown unbounded, large temp files, Docker layer accumulation, inode exhaustion.

**Debug steps:**
```bash
df -h                                  # which filesystem is full?
df -i                                  # check inode usage separately — a filesystem can be "full" on inodes with plenty of byte-space free
du -sh /* 2>/dev/null | sort -rh | head -20  # find large directories
du -sh /var/log/* 2>/dev/null | sort -rh | head -10     # common culprit
find / -size +1G -type f 2>/dev/null   # files over 1GB
lsof 2>/dev/null | grep deleted | grep -v "0,0"   # deleted files a process still has open (space isn't freed until the process closes them)
```

**Fix:**
```bash
sudo journalctl --vacuum-size=200M     # trim systemd journal
sudo truncate -s 0 /var/log/syslog     # emergency: zero out log (Debian/Ubuntu path; RHEL-family: /var/log/messages)
sudo find /tmp -mtime +7 -delete       # clean old temp files
docker system prune -a -f              # if Docker is installed
```

**Prevention:** Configure log rotation in `/etc/logrotate.d/`. Monitor disk usage with alerting (not just manually running `df -h`).

---

## Issue 3: Process zombie state — defunct processes

**Symptom:** `ps aux | grep Z` shows zombie processes. `top` shows a nonzero zombie count.

**Root Cause:** Child process finished but its parent never called `wait()`/`waitpid()` to collect its exit status.

**Debug steps:**
```bash
# Zombies show as Z+ (not a bare Z) when started from an interactive shell
# foreground process group -- an exact-match "$8==\"Z\"" filter misses these.
# Use a substring/regex match instead:
ps aux | awk '$8 ~ /Z/ {print $0}'     # list all zombies
ps -ef | grep defunct

# Find the parent of a specific zombie
ps -ef | grep <zombie-pid>             # look at the PPID column
pstree -p | grep <zombie-pid>
```

**Fix:**
```bash
kill -s SIGCHLD <parent-pid>           # only works if the parent actually has a SIGCHLD
                                        # handler that calls wait() -- often does nothing,
                                        # since a parent that already had one usually
                                        # wouldn't have accumulated zombies in the first place
kill -9 <parent-pid>                   # the reliable fix: kill the parent, the zombie is
                                        # reaped automatically once its parent exits
# Zombies are harmless individually (they hold almost no resources -- just a
# process table entry), but a growing count indicates a genuinely buggy
# parent process that needs fixing, not just repeated manual cleanup
```

---

## Issue 4: High CPU — system load unresponsive

**Symptom:** `top` shows load average > number of CPU cores. System very slow.

Load average on Linux counts both CPU-runnable processes **and** processes in uninterruptible sleep (`D` state — usually blocked on disk I/O), unlike the classic BSD/Unix definition. A high load average alone doesn't prove CPU is the bottleneck — confirm with `vmstat`/`pidstat` before assuming it's pure CPU saturation; it could be an I/O-wait storm instead.

**Debug steps:**
```bash
top -c                                 # real-time view, press 1 for per-core breakdown
uptime                                 # load average (1/5/15 min)
ps aux --sort=-%cpu | head -10         # CPU-heavy processes
pidstat -u 2 5                         # CPU per process over time (needs the sysstat package: sudo apt install sysstat / sudo dnf install sysstat)
strace -p <pid>                        # what syscalls is the culprit making
cat /proc/<pid>/status                 # process state details
```

**Fix:**
```bash
nice -n 19 <command>                   # start a new command at lower priority
renice +10 -p <pid>                    # reduce priority of an already-running process
kill -9 <pid>                          # terminate if genuinely runaway
# For Kubernetes: check for CPU throttling specifically
kubectl top pods -n production
kubectl describe pod <name> | grep -A3 Limits
```

**Prevention:** Set CPU limits on containers. Use `ulimit -u` for per-user process-count limits. Implement autoscaling for genuinely variable load.

---

## Issue 5: OOM Killer terminating processes

**Symptom:** Process disappears unexpectedly. `dmesg | grep -i oom` shows kills.

**Root Cause:** System ran out of RAM. The kernel's OOM killer selected and killed a process to free memory.

**Debug steps:**
```bash
dmesg | grep -i "oom\|killed"          # see what was killed and why
journalctl -k | grep -i oom            # kernel log via journald -- works regardless of distro
cat /var/log/syslog 2>/dev/null | grep oom   # Debian/Ubuntu-specific path; use journalctl -k above if this file doesn't exist (e.g. RHEL-family)
free -h                                # current memory state
vmstat -s                              # memory statistics
cat /proc/<pid>/status | grep VmRSS    # a specific process's memory usage
```

**Fix:**
```bash
# Increase swap (emergency, buys time -- not a real fix for sustained memory pressure)
sudo dd if=/dev/zero of=/swapfile bs=1M count=2048
sudo chmod 600 /swapfile && sudo mkswap /swapfile && sudo swapon /swapfile

# Protect a critical process from being OOM-killed.
# /proc/<pid>/oom_adj is the LEGACY interface, deprecated since kernel 2.6.36
# (~2010) -- often doesn't exist at all on a current kernel. Use oom_score_adj,
# which uses a different scale (-1000 to 1000, not -17 to 15):
echo -1000 | sudo tee /proc/<critical-pid>/oom_score_adj   # -1000 = never kill

# Kubernetes: set memory limits explicitly (unbounded memory requests are
# what leads to OOMKilled pods in the first place)
resources:
  limits:
    memory: "512Mi"
  requests:
    memory: "256Mi"
```

**Prevention:** Monitor memory with alerts at 80% and 90% thresholds, before the OOM killer has to intervene. Set proper container memory limits. Swap is a reasonable safety net on dev servers, not a substitute for right-sizing production memory limits.
