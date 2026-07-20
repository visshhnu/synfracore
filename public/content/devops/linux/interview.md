# Linux Interview Q&A

**Q: How do you troubleshoot high CPU on a Linux server?**
```bash
top -c           # real-time process view, press 1 for per-CPU
htop             # better UI version
ps aux --sort=-%cpu | head -10  # top CPU processes
pidstat -u 2 5   # per-process CPU every 2s for 5 iterations (needs the sysstat package)
# Find the thread causing CPU in a Java process:
ps -eLf | grep <pid>  # list threads
```

**Q: How do you find what is consuming disk space?**
```bash
df -h            # disk usage per filesystem
du -sh /*        # top-level directory sizes
du -h --max-depth=2 /var | sort -rh | head -20
find / -size +1G -type f 2>/dev/null  # files > 1GB
ncdu /           # interactive ncurses du (install first: sudo apt install ncdu / sudo dnf install ncdu)
```

**Q: How do you check open ports and connections?**
```bash
ss -tulpn        # listening ports with process (modern -- prefer this)
netstat -tulpn   # listening ports (older, legacy -- still common in older docs/scripts)
ss -an | grep ESTABLISHED  # active connections
lsof -i :8080    # what process is on port 8080
```

**Q: What does a load average of 4.0 mean on a 2-core server?**
Load average is *not* purely a CPU metric on Linux — it counts both CPU-runnable processes and processes in uninterruptible sleep (`D` state, usually blocked on disk I/O), which is a Linux-specific difference from the original BSD/Unix definition. On a 2-core server, a load consistently above 2.0 signals the box is doing more work than it can immediately handle — but that "more work" could be CPU contention, an I/O-wait storm, or both. Load 4.0 doesn't automatically mean "2x CPU overloaded" — confirm the actual cause with `vmstat` (the "r" column for CPU-runnable count, "b" for I/O-blocked count) or `pidstat` before assuming it's pure CPU saturation. Use `nproc` or `lscpu` to check core count first.

**Q: How do you debug a systemd service that won't start?**
```bash
systemctl status myservice -l   # -l/--full: don't truncate unit names/log lines at terminal width (NOT "show more log history" -- that's -n, below)
journalctl -u myservice -n 100 --no-pager  # last 100 log lines for that service
journalctl -u myservice -f      # follow logs live
systemctl cat myservice         # view the actual unit file being used
```
