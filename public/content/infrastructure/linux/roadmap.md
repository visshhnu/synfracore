# Linux — Learning Roadmap

## Time to Job-Ready: 8 weeks (2 hours/day)

**Goal:** Confidently administer Linux servers, write automation scripts, and diagnose production issues.

## Phase 1 — Shell Fundamentals (Week 1-2)
- Navigate the filesystem: `ls`, `cd`, `pwd`, `find`, `locate`
- File operations: `cp`, `mv`, `rm`, `mkdir`, `touch`, `ln`
- Text processing: `cat`, `grep`, `sed`, `awk`, `cut`, `sort`, `uniq`
- I/O redirection: `>`, `>>`, `|`, `2>&1`, `tee`
- Permissions: `chmod`, `chown`, `umask`, SUID/SGID bits

## Phase 2 — System Administration (Week 3-4)
- Process management: `ps`, `top`, `htop`, `kill`, `nice`, `systemctl`
- Package management: `apt` (Ubuntu/Debian), `yum`/`dnf` (RHEL/CentOS)
- User and group management: `useradd`, `usermod`, `passwd`, `groupadd`
- Cron jobs and scheduling: `crontab -e`, `/etc/cron.d/`, systemd timers
- Disk management: `df`, `du`, `lsblk`, `fdisk`, `mount`, LVM basics

## Phase 3 — Networking & Security (Week 5-6)
- Networking tools: `ip`, `ss`, `netstat`, `curl`, `wget`, `nmap`
- SSH: key generation, config file, `~/.ssh/authorized_keys`, `sshd_config` hardening
- Firewall: `ufw` (Ubuntu), `firewalld` (RHEL), `iptables` basics
- Log analysis: `journalctl`, `/var/log/`, `logrotate`, `grep` patterns
- File permissions deep-dive: `setuid`, `setgid`, sticky bit, ACLs

## Phase 4 — Bash Scripting & Performance (Week 7-8)
- Bash scripting: variables, arrays, loops (`for`, `while`), conditionals, functions
- Error handling: `set -euo pipefail`, `trap`, exit codes
- System monitoring: `vmstat`, `iostat`, `sar`, `dstat`, `perf`
- Text processing scripts: parse logs, generate reports, automate tasks
- Crontab automation: backup scripts, health checks, alerting

## Weekly Study Schedule
```
Monday:    Read one section → take notes in your own words
Tuesday:   Lab practice — run every command from Monday
Wednesday: Write a small script applying what you learned
Thursday:  Read man pages for 5 commands you use daily
Friday:    Interview Q&A practice — explain concepts out loud
Weekend:   Build a real automation script for your own use
```

## Certifications to Target
- **LFCS** — Linux Foundation Certified System Administrator (recommended first)
- **RHCSA (EX200)** — Red Hat Certified System Administrator (most recognized)

## Jobs After Linux Mastery
Linux Administrator · DevOps Engineer · SRE · Cloud Engineer · Platform Engineer

## Resources
- **This course** — Overview → Fundamentals → Labs → Projects
- **The Linux Command Line** by William Shotts (free at linuxcommand.org)
- **OverTheWire: Bandit** — gamified Linux practice (bandit.labs.overthewire.org)
- **tldr.sh** — simplified man pages for quick reference
