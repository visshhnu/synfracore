# Linux & Bash — Fundamentals

Most commands below that install software, manage services, or touch files outside your own home directory need `sudo` — a fresh shell session is not root by default. Where a command needs it, it's shown with `sudo`; where it doesn't (plain reads of your own files/processes), it's shown without.

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
sudo chown user:group file.txt   # change owner and group -- needs sudo unless you already own the file
sudo -u appuser command          # run a command as a specific user, without switching shells
```

**Special permission bits, beyond the standard rwx:**
```bash
sudo chmod u+s /usr/bin/passwd  # SUID (4000) -- runs as the file's OWNER, regardless of who invokes it
                                 # this is exactly how a regular user can run `passwd` to change
                                 # their own password despite it needing root access to /etc/shadow
chmod g+s /shared/dir           # SGID (2000) -- new files created here inherit the directory's group
chmod +t /tmp                   # Sticky bit (1000) -- in a shared, world-writable directory like /tmp,
                                 # only a file's OWNER (or root) can delete it, even though everyone
                                 # can write new files there
```
A SUID bit on a *writable* script (as opposed to a compiled binary) is a real, common privilege-escalation risk worth being deliberate about — it's a legitimate mechanism (see `passwd` above) but an easy one to apply somewhere it shouldn't be.

## Package management, across distros

```bash
sudo apt update && sudo apt install nginx   # Debian/Ubuntu
sudo yum install nginx                       # older RHEL/CentOS
sudo dnf install nginx                       # modern RHEL/Fedora (yum's successor)

# Verify whether something is already installed, before assuming it isn't:
dpkg -l | grep nginx                # Debian/Ubuntu -- read-only, no sudo needed
rpm -qa | grep nginx                # RHEL/CentOS/Fedora -- read-only, no sudo needed
```
Knowing which family a given server belongs to (Debian-based vs. RHEL-based) determines which of these actually works — a common, avoidable early mistake is running `apt` commands against a RHEL-family box or vice versa. `cat /etc/os-release` is the fast way to confirm which family you're on before running anything.

## systemd: managing services on modern Linux

```bash
sudo systemctl start nginx
sudo systemctl stop nginx
sudo systemctl enable nginx      # start automatically on boot
systemctl status nginx           # current state + recent log lines -- read-only, no sudo needed
sudo systemctl restart nginx
journalctl -u nginx --since "30 min ago"   # that service's logs specifically -- read-only
```
**Use `systemctl`, not the older `service` command, on any modern Linux distribution** — `service` is a legacy compatibility shim on systemd-based systems and doesn't expose systemd's actual state/dependency information the way `systemctl` does directly.

## Users, groups, and sudo

```bash
sudo useradd -m -s /bin/bash deploy   # create a user with a home directory and bash shell
sudo usermod -aG docker deploy         # add to the docker group (without this, deploy can't run docker commands)
groups deploy                          # show what groups a user belongs to -- read-only
```
`sudo` grants specific, configurable elevated permissions (via `/etc/sudoers` or `/etc/sudoers.d/`) rather than an all-or-nothing root login — the principle of least privilege applied at the OS level, and the reason disabling direct root SSH login while enabling scoped `sudo` access is standard production hardening, not just convention.

## Finding your way around a server you've never touched before

```bash
uname -a                     # kernel version, architecture
cat /etc/os-release          # distro name and version
df -h                        # disk usage, human-readable
free -h                      # memory usage
uptime                       # how long it's been running, plus load average
ps aux --sort=-%cpu | head   # top CPU consumers
```
None of these need `sudo` — they're all read-only views of system/process state. This sequence — establish what OS/kernel you're on, then check disk/memory/load at a glance — is the standard, fast first orientation on any unfamiliar server, before diving into anything more specific.
