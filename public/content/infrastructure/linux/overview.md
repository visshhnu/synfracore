# Linux Overview

## What is Linux?

Linux is an open-source, Unix-like operating system kernel created by Linus Torvalds in 1991. Combined with GNU utilities, it forms the basis of distributions used in servers (90%+ of internet servers), supercomputers, Android devices, embedded systems, and increasingly on desktops.

## Major Linux Distributions

```
SERVER-FOCUSED:
  Ubuntu Server (LTS): 2-year release cycle, 5-year support, most popular for cloud
  Red Hat Enterprise Linux (RHEL): enterprise support, certification ecosystem
  CentOS Stream / AlmaLinux / Rocky Linux: RHEL-compatible, free
  Debian: stable, conservative, used by Ubuntu as base
  Amazon Linux 2/2023: AWS-optimised, free on EC2

DESKTOP-FOCUSED:
  Ubuntu Desktop: best for beginners, large community
  Fedora: bleeding edge, upstream for RHEL
  Linux Mint: very user-friendly, Windows-like interface
  Pop!_OS: developer-friendly, gaming (System76)
  Arch Linux: DIY, rolling release, for advanced users

PACKAGE MANAGERS:
  apt/apt-get (Debian/Ubuntu): sudo apt install nginx
  yum/dnf (RHEL/CentOS/Fedora): sudo dnf install nginx
  pacman (Arch): sudo pacman -S nginx
  zypper (openSUSE): sudo zypper install nginx
  snap/flatpak: cross-distro universal packages
```

## File System Structure

```
/ (root)
├── /bin       — essential binaries (ls, cp, mv, cat)
├── /sbin      — system binaries (for root, e.g. fdisk, reboot)
├── /etc       — configuration files (nginx.conf, passwd, fstab)
├── /home      — user home directories (/home/alice, /home/bob)
├── /root      — root user's home directory
├── /var       — variable data (logs in /var/log, spool, cache)
├── /tmp       — temporary files (cleared on reboot)
├── /usr       — user programs and libraries
│   ├── /usr/bin   — user commands (python3, git, vim)
│   ├── /usr/sbin  — system admin commands
│   └── /usr/local — locally installed software
├── /opt       — optional/third-party software
├── /dev       — device files (/dev/sda, /dev/null, /dev/tty)
├── /proc      — virtual filesystem for process info (/proc/cpuinfo)
├── /sys       — virtual filesystem for kernel/hardware info
├── /boot      — bootloader and kernel files (grub, vmlinuz)
├── /lib       — shared libraries for /bin and /sbin
└── /mnt       — temporary mount points
```

## Essential Concepts

```
USERS AND PERMISSIONS:
  Root (uid=0): superuser, unrestricted access
  Regular users: limited permissions, home in /home/username
  sudo: run command as root (if in sudoers group)
  
  File permissions: rwx rwx rwx (owner group other)
  r=4, w=2, x=1 → chmod 755 = rwxr-xr-x
  chown alice:developers file.txt (change owner and group)

PROCESSES:
  Every running program is a process with a PID
  ps aux: list all processes | top/htop: interactive monitor
  kill PID: send signal to process (default SIGTERM=15)
  kill -9 PID: force kill (SIGKILL, cannot be ignored)
  jobs: background jobs | fg/bg: foreground/background
  Ctrl+C: interrupt | Ctrl+Z: suspend | & at end: run in background

SERVICES (systemd):
  systemctl start nginx | stop | restart | reload
  systemctl enable nginx  (start on boot)
  systemctl status nginx
  journalctl -u nginx -f  (follow service logs)

NETWORKING:
  ip addr show: show network interfaces and IPs
  ip route show: routing table
  ss -tlnp: listening TCP sockets with process names
  curl, wget: HTTP requests from command line
  ping, traceroute: network diagnostics
  /etc/hosts: local DNS overrides
  /etc/resolv.conf: DNS server configuration
```

## Study Resources
- **Linux Journey** (linuxjourney.com) — free, structured beginner course
- **The Linux Command Line** (William Shotts) — free at linuxcommand.org
- **Linux Foundation LFS101** (edx.org) — free Introduction to Linux
- **LPIC-1 / Linux+** — entry-level Linux certification
- **OverTheWire: Bandit** — learn Linux by playing security games (free)
