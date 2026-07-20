# Linux Interview Q&A

**Q: What is a Linux process, and what do the process states mean?**

A process is an executing instance of a program, with a PID (process ID), PPID (parent PID), its own memory space, file descriptors, and CPU state.

```
R  Running                — currently executing on CPU (or ready to)
S  Sleeping, interruptible — waiting for I/O, can be woken by a signal
D  Sleeping, uninterruptible — waiting on kernel-level I/O, cannot be interrupted
                              (a process stuck here won't even respond to kill -9,
                              until the underlying I/O operation actually completes)
Z  Zombie                 — terminated, but the parent hasn't called wait() yet
T  Stopped                — paused by a signal (Ctrl+Z) or under a debugger
```
```bash
ps aux                    # all processes with resource usage
pstree                    # process tree (parent/child relationships)
kill -15 PID              # SIGTERM -- graceful, lets the process clean up
kill -9 PID                # SIGKILL -- immediate, kernel-level, no cleanup chance
kill -SIGSTOP PID          # pause a running process
kill -SIGCONT PID          # resume a stopped process
```

**Q: How do you troubleshoot high CPU on a Linux server?**
```bash
top -c           # real-time process view, press 1 for per-CPU
htop             # better UI version
ps aux --sort=-%cpu | head -10  # top CPU processes
pidstat -u 2 5   # per-process CPU every 2s for 5 iterations (needs the sysstat package)
# Find the thread causing CPU in a Java process:
ps -eLf | grep <pid>  # list threads
top -H -p <pid>        # per-thread CPU view, live
```

**Q: How do you find what is consuming disk space?**
```bash
df -h            # disk usage per filesystem
du -sh /*        # top-level directory sizes
du -h --max-depth=2 /var | sort -rh | head -20
find / -size +1G -type f 2>/dev/null  # files > 1GB
ncdu /           # interactive ncurses du (install first: sudo apt install ncdu / sudo dnf install ncdu)
lsof | grep deleted  # files deleted but still held open by a process -- space isn't freed until it closes them
```

**Q: How do you check open ports and connections?**
```bash
ss -tulpn        # listening ports with process (modern -- prefer this)
netstat -tulpn   # listening ports (older, legacy -- still common in older docs/scripts)
ss -an | grep ESTABLISHED  # active connections
lsof -i :8080    # what process is on port 8080
```

**Q: What does a load average of 4.0 mean on a 2-core server?**
Load average is *not* purely a CPU metric on Linux -- it counts both CPU-runnable processes and processes in uninterruptible sleep (`D` state, usually blocked on disk I/O), which is a Linux-specific difference from the original BSD/Unix definition. On a 2-core server, a load consistently above 2.0 signals the box is doing more work than it can immediately handle -- but that "more work" could be CPU contention, an I/O-wait storm, or both. Load 4.0 doesn't automatically mean "2x CPU overloaded" -- confirm the actual cause with `vmstat` (the "r" column for CPU-runnable count, "b" for I/O-blocked count) or `pidstat` before assuming it's pure CPU saturation. Use `nproc` or `lscpu` to check core count first.

**Q: How do you debug a systemd service that won't start?**
```bash
systemctl status myservice -l   # -l/--full: don't truncate unit names/log lines at terminal width (NOT "show more log history" -- that's -n, below)
journalctl -u myservice -n 100 --no-pager  # last 100 log lines for that service
journalctl -u myservice -f      # follow logs live
systemctl cat myservice         # view the actual unit file being used
```

**Q: What are the key directories in the Linux filesystem hierarchy?**
```
/          Root -- everything starts here
├── bin/   Essential user binaries (ls, cp, mv, bash)
├── sbin/  System binaries, typically root-only (iptables, fdisk, mount)
├── etc/   System configuration files (passwd, fstab, nginx/, ssh/)
├── var/   Variable data (logs in /var/log, mail, spool, databases)
├── tmp/   Temporary files (cleared on reboot on many systems)
├── home/  User home directories (/home/alice, /home/bob)
├── root/  The root user's own home directory (not the filesystem root)
├── opt/   Optional/third-party software packages outside normal package-manager locations
├── usr/   User programs and data -- its own large hierarchy (usr/bin, usr/local, usr/lib)
├── lib/   Shared libraries needed by /bin and /sbin
├── proc/  Virtual filesystem -- live process/kernel info (/proc/cpuinfo, /proc/meminfo) -- not real files on disk
├── sys/   Virtual filesystem -- kernel and device interfaces, also not real files on disk
├── dev/   Device files (sda, null, zero, random, tty)
└── mnt/, /media/   Conventional mount points for external/removable filesystems
```

**Q: What actually happens during a Linux boot, from power-on to login prompt?**
1. **BIOS/UEFI**: power on, POST (Power-On Self Test), locates a boot device.
2. **MBR/GPT**: the boot loader is found in the disk's first sector (MBR) or EFI partition (UEFI/GPT).
3. **GRUB** (or another bootloader): loads the Linux kernel and an initramfs image into memory.
4. **Kernel**: decompresses itself, initializes hardware, mounts the early virtual filesystems (`/proc`, `/sys`, `/dev`).
5. **initramfs**: a temporary root filesystem containing just enough drivers to find and mount the real root filesystem.
6. **init/systemd (PID 1)**: the first real userspace process; everything else is its descendant.
7. **systemd targets**: boots to a default target -- `multi-user.target` (no GUI) or `graphical.target`.
8. Login prompt (or a graphical login manager) appears.

**Q: How do you schedule a recurring job on Linux?**
```bash
crontab -e        # edit the current user's crontab
crontab -l        # list current crontab entries
crontab -r        # remove all crontab entries
sudo crontab -e   # edit root's crontab (needs sudo -- editing another user's job schedule is a privileged action)
```
Cron syntax: `minute hour day-of-month month day-of-week command`
```
30 2 * * *     /opt/scripts/backup.sh          # 2:30 AM daily
*/15 * * * *   /opt/scripts/healthcheck.sh     # every 15 minutes
0 9 * * 1-5    /opt/scripts/report.sh          # 9 AM on weekdays (Mon-Fri)
0 0 1 * *      /opt/scripts/monthly-report.sh  # midnight on the 1st of every month
* * * * *      /opt/scripts/job.sh >> /var/log/job.log 2>&1   # redirect stdout+stderr to a log
```
A cron job's environment is meaningfully different from an interactive shell's (minimal `$PATH`, no `.bashrc` sourced) -- this is exactly why a script that "works when I run it by hand" can fail under cron; see the Real World tab for a concrete incident this pattern causes.
