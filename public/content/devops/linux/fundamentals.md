# Linux & Bash — Fundamentals

## The filesystem hierarchy that actually matters day to day

- `/etc` — configuration files. Almost every service's config lives here (`/etc/nginx/`, `/etc/systemd/`).
- `/var` — variable data: logs (`/var/log`), application data that changes at runtime.
- `/opt` — third-party applications installed outside the standard package manager's usual locations.
- `/proc` — a virtual filesystem exposing live kernel/process information (not real files on disk) — `cat /proc/cpuinfo`, `/proc/<pid>/status`.
- `/sys` — another virtual filesystem, exposing kernel/hardware/device interfaces.

Knowing which of these is a real, persistent location vs. a virtual, kernel-generated view (`/proc`, `/sys`) matters practically — writing to certain `/proc` entries changes live kernel behavior immediately, and files there don't represent anything actually stored on disk.

## Permissions: owner/group/other, and what the numbers mean

```bash
chmod 644 file.txt   # owner: read+write, group: read, other: read
chmod 755 script.sh  # owner: read+write+execute, group+other: read+execute
```
Each digit is a sum: read=4, write=2, execute=1. `644` = owner gets 4+2=6 (rw-), group and other get 4 (r--). This arithmetic is worth being genuinely fluent in — reconstructing a permission mode from first principles under time pressure (in an interview, or mid-incident) is much slower than having it memorized.

```bash
chown user:group file.txt     # change owner and group
sudo -u appuser command       # run a command as a specific user, without switching shells
```

## Package management, across distros

```bash
apt update && apt install nginx     # Debian/Ubuntu
yum install nginx                    # older RHEL/CentOS
dnf install nginx                    # modern RHEL/Fedora (yum's successor)
```
Knowing which family a given server belongs to (Debian-based vs. RHEL-based) determines which of these actually works — a common, avoidable early mistake is running `apt` commands against a RHEL-family box or vice versa.

## systemd: managing services on modern Linux

```bash
systemctl start nginx
systemctl stop nginx
systemctl enable nginx      # start automatically on boot
systemctl status nginx      # current state + recent log lines
systemctl restart nginx
journalctl -u nginx --since "30 min ago"   # that service's logs specifically
```
**Use `systemctl`, not the older `service` command, on any modern Linux distribution** — `service` is a legacy compatibility shim on systemd-based systems and doesn't expose systemd's actual state/dependency information the way `systemctl` does directly.

## Users, groups, and `sudo`

```bash
useradd -m -s /bin/bash deploy    # create a user with a home directory and bash shell
usermod -aG docker deploy          # add to the docker group (without this, deploy can't run docker commands)
groups deploy                       # show what groups a user belongs to
```
`sudo` grants specific, configurable elevated permissions (via `/etc/sudoers` or `/etc/sudoers.d/`) rather than an all-or-nothing root login — the principle of least privilege applied at the OS level, and the reason disabling direct root SSH login while enabling scoped `sudo` access is standard production hardening, not just convention.

## Finding your way around a server you've never touched before

```bash
uname -a              # kernel version, architecture
cat /etc/os-release    # distro name and version
df -h                   # disk usage, human-readable
free -h                 # memory usage
uptime                  # how long it's been running, plus load average
ps aux --sort=-%cpu | head   # top CPU consumers
```
This sequence — establish what OS/kernel you're on, then check disk/memory/load at a glance — is the standard, fast first orientation on any unfamiliar server, before diving into anything more specific.
