# Linux Troubleshooting Guide

## Issue 1: Cannot SSH into server — Connection refused

**Symptom:** `ssh user@host` → `ssh: connect to host port 22: Connection refused`

**Root Cause:** SSH daemon not running, firewall blocking port 22, wrong port, or host is down.

**Debug steps:**
```bash
ping host                              # is host reachable?
nmap -p 22 host                        # is port 22 open?
telnet host 22                         # can you reach the SSH port?
# On the server (if console access available):
systemctl status sshd
ss -tlpn | grep sshd                  # what port is sshd listening on?
firewall-cmd --list-all               # is firewall blocking 22?
iptables -L INPUT -n | grep 22        # iptables rules
```

**Fix patterns:**
```bash
systemctl start sshd && systemctl enable sshd
firewall-cmd --permanent --add-service=ssh && firewall-cmd --reload
ssh -p 2222 user@host                  # if non-standard port
```

**Prevention:** Use `AllowTcpForwarding yes` + `AllowUsers` whitelist in `/etc/ssh/sshd_config`. Enable fail2ban.

---

## Issue 2: Disk 100% full — system unstable

**Symptom:** Commands fail with `No space left on device`. Cannot write logs, create files.

**Root Cause:** Logs grown unbounded, large temp files, Docker layer accumulation, inode exhaustion.

**Debug steps:**
```bash
df -h                                  # which filesystem is full?
df -i                                  # check inode usage separately!
du -sh /* 2>/dev/null | sort -rh | head -20  # find large directories
du -sh /var/log/* | sort -rh | head -10     # common culprit
find / -size +1G -type f 2>/dev/null   # files over 1GB
lsof | grep deleted | grep -v "0,0"   # deleted files still held open
```

**Fix:**
```bash
journalctl --vacuum-size=200M          # trim systemd journal
truncate -s 0 /var/log/syslog          # emergency: zero out log
find /tmp -mtime +7 -delete            # clean old temp files
docker system prune -a -f              # if Docker installed
```

**Prevention:** Configure log rotation in `/etc/logrotate.d/`. Monitor with `df -h` in cron alerts.

---

## Issue 3: Process zombie state — defunct processes

**Symptom:** `ps aux | grep Z` shows zombie processes. `top` shows `zombie` count > 0.

**Root Cause:** Child process finished but parent didn't call `wait()` to collect exit status.

**Debug steps:**
```bash
ps aux | awk '$8=="Z" {print $0}'      # list all zombies
ps -ef | grep defunct
# Find parent of zombie
ps -ef | grep <zombie-pid>             # look at PPID column
pstree -p | grep <zombie-pid>
```

**Fix:**
```bash
kill -s SIGCHLD <parent-pid>          # signal parent to reap
# If parent is stuck, kill the parent (zombie disappears automatically)
kill -9 <parent-pid>
# Zombies are harmless individually, but many indicates buggy parent process
```

---

## Issue 4: High CPU — system load unresponsive

**Symptom:** `top` shows load average > number of CPU cores. System very slow.

**Debug steps:**
```bash
top -c                                 # real-time view, press 1 for per-CPU
uptime                                 # check load average (1/5/15 min)
ps aux --sort=-%cpu | head -10         # CPU-heavy processes
pidstat -u 2 5                         # CPU per process over time
strace -p <pid>                        # what syscalls is culprit making?
cat /proc/<pid>/status                 # process state details
```

**Fix:**
```bash
nice -n 19 <command>                   # run lower priority
renice +10 <pid>                       # reduce priority of running process
kill -9 <pid>                          # terminate if runaway
# For K8s: check for CPU throttling
kubectl top pods -n production
kubectl describe pod <name> | grep -A3 Limits
```

**Prevention:** Set CPU limits on containers. Use `ulimit -u` for process limits. Implement autoscaling.

---

## Issue 5: OOM Killer terminating processes

**Symptom:** Process disappears unexpectedly. `dmesg | grep -i oom` shows kills.

**Root Cause:** System ran out of RAM. Kernel OOM killer selected and killed a process to free memory.

**Debug steps:**
```bash
dmesg | grep -i "oom\|killed"          # see what was killed and why
cat /var/log/syslog | grep oom         # or journalctl -k | grep oom
free -h                                # current memory state
vmstat -s                              # memory statistics
cat /proc/<pid>/status | grep VmRSS   # process memory usage
```

**Fix:**
```bash
# Increase swap (emergency)
dd if=/dev/zero of=/swapfile bs=1M count=2048
chmod 600 /swapfile && mkswap /swapfile && swapon /swapfile

# Protect critical process from OOM
echo -17 > /proc/<critical-pid>/oom_adj  # -17 = never kill

# Kubernetes: set memory limits
resources:
  limits:
    memory: "512Mi"
  requests:
    memory: "256Mi"
```

**Prevention:** Monitor memory with alerts at 80% and 90% thresholds. Set proper container memory limits. Add swap on dev servers.
