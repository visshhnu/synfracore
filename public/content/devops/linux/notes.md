# Linux — Revision Notes

Condensed reference for quick review. Consolidated from this course's interview and certification material, de-duplicated, and corrected where source files disagreed or were out of date (corrections marked inline).

---

## Filesystem Hierarchy

```
/etc    config files (nginx.conf, passwd, fstab, sudoers)
/var    variable data — logs (/var/log), spool, cache, databases
/home   user home directories       /root   root's own home
/tmp    temp files, cleared on reboot, STICKY BIT set (only owner deletes,
                                     though anyone can create files there)
/usr    user programs/libraries (/usr/bin, /usr/local for locally installed)
/opt    third-party apps outside the standard package manager's locations
/proc   VIRTUAL filesystem — live kernel/process info, not real disk files
/sys    VIRTUAL filesystem — kernel/hardware interfaces
/bin /sbin   essential binaries (sbin = root-oriented: fdisk, iptables)
/dev    device files (/dev/sda, /dev/null, /dev/tty)
/boot   bootloader + kernel files (grub, vmlinuz)

KEY DISTINCTION: /proc and /sys are NOT real files on disk — writing to
certain /proc entries changes live kernel behavior immediately.
```

## Permissions

```
rwx rwx rwx  (owner / group / other)
r=4 w=2 x=1  →  chmod 755 = rwxr-xr-x  |  644 = rw-r--r--  |  600 = rw-------
                (600 = SSH keys/secrets — owner only)

Special bits (a real, common source of confusion — know these cold):
  SUID (4000, u+s): runs as the FILE'S OWNER regardless of who invokes it
    — this is literally how `passwd` lets a regular user change their own
    password despite needing root access to /etc/shadow
  SGID (2000, g+s) on a DIRECTORY: new files created inside inherit the
    directory's group automatically — the standard fix for shared team
    directories where files need a consistent group regardless of creator
  Sticky (1000, +t): in a shared writable directory, only the file's OWNER
    (or root) can delete it — this is exactly what makes /tmp safe-ish
    despite being world-writable

chown user:group file    chmod -R 755 dir/    (recursive)
getfacl / setfacl — ACLs when owner/group/other doesn't cleanly express
  the access pattern needed (e.g., "this ONE other user needs write access,
  nobody else in their group should")

REAL MISTAKE TO AVOID: "just chmod 777 it" resolves a permission ERROR
but grants far broader access than almost any real situation needs — the
correct fix identifies WHO specifically needs WHAT specific access, not
"everyone gets everything." See this course's own PYQ for the full framing.
```

## Processes & Signals

```
Process states: R(running) S(sleeping, interruptible) D(sleeping,
  UNINTERRUPTIBLE — blocked on kernel I/O, won't respond to ANY signal
  including SIGKILL until the I/O completes) Z(zombie — terminated, parent
  hasn't called wait()) T(stopped, e.g. Ctrl+Z)

kill -15 PID   SIGTERM — graceful, lets the process clean up first
kill -9  PID   SIGKILL — immediate, kernel-level, cannot be caught/ignored
               (but does nothing for a process stuck in D state — that's
               a kernel I/O problem, not a signal-handling one)

Zombie processes: harmless individually (just a process-table slot), but
a RISING, RECURRING zombie count is a real signal of an application bug
(missing wait()/waitpid() on some code path) — clearing zombies as they
appear treats the symptom, not the cause; see this course's Real World
Scenarios for a full example of this exact failure mode.

kill vs killall vs pkill: kill=by PID (precise, needs lookup first) |
  killall=by exact name | pkill -f=by pattern match on full command line
  (flexible but easy to accidentally match more than intended — check
  with `ps aux | grep` first before running destructively)

Multi-threaded process CPU debugging: ps -eLf | grep <pid> (list threads)
  or top -H -p <pid> (live per-thread view) — for finding which THREAD in
  a process (e.g. a Java app) is actually consuming CPU, not just which
  process.
```

## Memory Metrics — genuinely different things, often conflated

```
RSS (Resident Set Size): actual physical RAM in use RIGHT NOW — but
  includes shared library memory that can be double-counted across
  multiple processes using the same library
VSZ (Virtual Size): memory ALLOCATED/mapped, not necessarily touched —
  can be far larger than actual usage
→ For "how much RAM is really free," use `free -h`, not a sum of
  individual processes' RSS values (which overcounts via shared libraries)

Swap activity (vmstat's si/so columns): ANY sustained non-zero value =
  genuine memory pressure, not a normal/expected condition
```

## USE Method — Performance Troubleshooting Framework

```
For CPU, Memory, Disk, Network — check in this order:
  Utilization (how busy)  Saturation (queued work waiting)  Errors (failing)

vmstat 1 5   → FIRST command to run, surfaces BOTH CPU saturation
  ("r" column, run queue — if consistently > core count, CPU saturated)
  AND memory pressure (si/so swap columns) in one glance

iostat -x 1 5 → await column: >10ms sustained on SSD = real red flag
  (saturation signal — requests WAITING, not necessarily hardware failure)

ss -tn state established / count by state → many TIME-WAIT = normal on
  high-traffic servers; many CLOSE-WAIT = a REAL signal the APPLICATION
  isn't closing connections properly (investigate app code, not the OS)

strace -p <pid> -e trace=all → see every syscall live; repeated connect()
  failures = network dependency issue; stuck in one read()/write() with
  no further syscalls often = blocked I/O (e.g. hung NFS), not app logic

High load average with LOW CPU usage in top? Linux load average includes
  processes in UNINTERRUPTIBLE SLEEP (disk/network I/O wait), not just
  CPU-competing processes — cross-check iostat before assuming "high
  load" automatically means "CPU problem."

CORRECTED: /proc/<pid>/oom_adj is DEPRECATED. Current mechanism is
  oom_score_adj (different scale: -1000 to 1000, not -17 to 15).
  echo -1000 > /proc/<pid>/oom_score_adj   (protect from OOM killer)

cgroups + Kubernetes: OOMKilled is the SAME kernel OOM-killer mechanism
  that terminates any process over its cgroup memory limit — container
  or not. Not a Kubernetes-specific mechanism, just Kubernetes exposing
  the kernel behavior via `kubectl describe pod`.
```

## Bash Scripting — Production Defaults

```
#!/usr/bin/env bash
set -euo pipefail
trap 'echo "Failed at line $LINENO"' ERR

-e : exit immediately on any command failure
-u : error on any UNDEFINED variable reference (catches typos, and catches
     the exact "variable unexpectedly empty" failure mode covered in this
     course's Real World Scenarios — a destructive rm -rf on an empty,
     unset variable)
-o pipefail : CORRECTED — pipeline exit code reflects the RIGHTMOST
     non-zero exit status among ALL commands in the pipeline (not just
     the last command's status by default, and NOT "the first failing
     command" — that's a common misstatement worth actively unlearning)

ALWAYS quote variables: "$var" not $var — unquoted expansion undergoes
  word-splitting; a value with a space becomes multiple arguments, which
  works fine in testing with simple values and breaks on real input later

Guard destructive commands against empty/unset variables explicitly:
  rm -rf "${TEMP_DIR:?TEMP_DIR must be set}"  — fails loudly instead of
  silently expanding to a dangerous, unintended path

[[ ]] not [ ]  |  $(command) not backticks — modern, more predictable
  syntax with fewer edge-case surprises
```

## systemd & Cron

```
systemctl start|stop|restart|reload|status|enable|disable SERVICE
systemctl is-active SERVICE     — scriptable exit-code check
systemctl mask SERVICE          — CORRECTED distinction from disable:
  disable = won't start on BOOT but still manually startable;
  mask = blocks even MANUAL `systemctl start` (symlinks unit to /dev/null)
systemctl daemon-reload         — required after editing a unit file directly
journalctl -u SERVICE -f        — follow live | --since "1 hour ago"

Cron syntax: minute hour day-of-month month day-of-week command
  */15 * * * *   every 15 minutes
  0 2 * * *      2 AM daily
  0 9 * * 1-5    9 AM weekdays only

CRITICAL, commonly missed: redirect BOTH stdout and stderr in cron jobs
  ( >> /var/log/job.log 2>&1 ) — otherwise cron emails all output to the
  crontab owner by default, a very common "why am I getting flooded with
  cron emails" real-world annoyance.

Cron jobs run with a MINIMAL environment (no .bashrc sourced, small PATH,
  possibly no $HOME) — this is exactly why a script that "works fine
  manually" can fail under cron; use absolute paths and set -u to catch
  environment-dependent failures early.
```

## SELinux (RHCSA-tested, frequently a point of real confusion)

```
getenforce / setenforce 0 (temporarily permissive) / 1 (enforcing)
/etc/selinux/config → SELINUX=enforcing|permissive|disabled (persistent)

ls -Z file            — check SELinux context
chcon -t TYPE file    — change context temporarily
restorecon -Rv path   — restore DEFAULT context, survives relabeling
setsebool -P bool on  — persistent boolean toggle

KEY POINT (commonly tested BECAUSE it trips people up): SELinux enforces
access control INDEPENDENTLY of standard Unix permissions. A file can
have perfectly correct chmod/chown and STILL be blocked entirely by
SELinux — "the permissions look right" is not sufficient troubleshooting
on an SELinux-enabled system; check `ls -Z` too.
```

## Networking Commands (Linux-administration angle — see this course's
## dedicated Networking technology for the deeper networking-concepts version)

```
ip addr show / ip route show    (modern — replaces ifconfig/route)
ss -tulpn                        (modern — replaces netstat)
nmcli con show / nmcli con add ... (modern RHEL 8/9 way — NOT hand-
  editing legacy ifcfg files directly)
dig / nslookup / host           (DNS lookups)
iptables -L -n -v  /  firewall-cmd --list-all   (firewall rule inspection)
```

## LVM (frequently tested — the two-step resize pattern matters)

```
pvcreate /dev/sdb  →  vgcreate myvg /dev/sdb  →  lvcreate -L 10G -n mylv myvg
lvextend -L +5G /dev/myvg/mylv     — resizes the LOGICAL VOLUME only

COMMONLY INCOMPLETE ANSWER: lvextend alone does NOT resize the filesystem
sitting on top of it. Second step required:
  xfs_growfs /mountpoint     (XFS — online, no unmount needed)
  resize2fs /dev/myvg/mylv   (ext4 — also online-capable)
```

## Certifications

```
RHCSA (EX200): 100% hands-on, RHEL 9, 2.5hrs, 210/300 passing.
  VERIFIED price: $400-500 (region-dependent) — not previously listed in
  this course's own certification material.
LFCS: same hands-on format, Linux Foundation, covers Ubuntu/Debian too
  (not RHEL-only) — genuinely useful if your environment isn't RHEL-family
CompTIA Linux+: multiple-choice (not hands-on), theory-based, easier to
  pass, generally considered less respected than RHCSA/LFCS specifically
  because it doesn't test hands-on task completion the way employers
  actually care about for this particular skill
```

## Getting-Started Environment Note (verified, time-sensitive)

```
AWS Free Tier CHANGED July 15, 2025:
  Accounts created BEFORE that date: old 12-month free usage model
  Accounts created AFTER that date: credit-based ($100-200 credits,
    6-month window) — behaves like a prepaid balance, NOT a fixed-
    duration free allowance. Set a cost budget alert immediately
    regardless of which model applies to your account.
```
