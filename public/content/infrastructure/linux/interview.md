# Linux Interview Questions

## Core Concepts

**Q: What is a Linux process? Explain process states.**

A process is an executing instance of a program. Each process has a PID (Process ID), PPID (Parent PID), memory space, file descriptors, and CPU state.

**Process states:**
- `R` (Running): Currently executing on CPU
- `S` (Sleeping, interruptible): Waiting for I/O, can be woken by signal
- `D` (Sleeping, uninterruptible): Waiting for I/O, cannot be interrupted (kernel I/O)
- `Z` (Zombie): Process terminated but parent hasn't called wait() yet
- `T` (Stopped): Stopped by signal (Ctrl+Z) or being debugged

```bash
ps aux                    # All processes with resource usage
ps -ef                    # All processes in full format
top / htop               # Real-time process monitoring
pstree                   # Process tree
kill -9 PID              # SIGKILL (force kill)
kill -15 PID             # SIGTERM (graceful termination)
kill -SIGSTOP PID        # Pause process
kill -SIGCONT PID        # Resume process
```

---

**Q: Explain Linux file permissions.**

```bash
ls -la
# -rwxr-xr--  1 alice dev  4096 Jan 1 10:00 script.sh
# |||||||||
# Type: - (file), d (dir), l (link), c (char device), b (block device)
#  Owner: rwx (read write execute)
#     Group: r-x (read execute)
#        Others: r-- (read only)
```

**chmod:**
```bash
chmod 755 script.sh      # rwxr-xr-x (octal)
chmod u+x,g-w file       # symbolic: add exec to user, remove write from group
chmod -R 644 /data/      # Recursive
```

**chown:**
```bash
chown alice:dev file.txt    # Change owner and group
chown -R www-data /var/www  # Recursive
```

**Special bits:**
- SUID (4000): Run as file owner (e.g., `/usr/bin/passwd` runs as root)
- SGID (2000): Run as file group | New files inherit directory group
- Sticky bit (1000): Only file owner can delete in directory (e.g., `/tmp`)

```bash
chmod u+s /usr/local/bin/myapp   # Set SUID
ls -la → -rwsr-xr-x              # s in user execute position = SUID
```

---

**Q: What is a Linux filesystem? Explain key directories.**

```
/          Root — everything starts here
├── bin/   Essential user binaries (ls, cp, mv, bash)
├── sbin/  System binaries (root only: iptables, fdisk, mount)
├── etc/   System configuration files (passwd, fstab, nginx/, ssh/)
├── var/   Variable data (logs /var/log, mail, spool, databases)
├── tmp/   Temporary files (cleared on reboot)
├── home/  User home directories (/home/alice, /home/bob)
├── root/  Root user's home
├── opt/   Optional software packages (non-OS apps)
├── usr/   User programs and data (large hierarchy)
│   ├── bin/    Non-essential user binaries
│   ├── local/  Locally installed software
│   └── lib/    Libraries
├── lib/   Shared libraries for /bin and /sbin
├── proc/  Virtual filesystem — running process info (/proc/cpuinfo, /proc/meminfo)
├── sys/   Virtual filesystem — kernel and device info
├── dev/   Device files (sda, null, zero, random, tty)
└── mnt/ /media/  Temporary mount points
```

---

**Q: How do you diagnose high CPU, memory, and disk usage?**

**CPU:**
```bash
top                          # Real-time; press 'P' to sort by CPU
htop                         # Better interactive view
ps aux --sort=-%cpu | head   # Top CPU consumers
mpstat -P ALL 1              # Per-core CPU stats
perf top                     # Performance profiling
# Check load average: uptime → 1.23 0.89 0.92 (1/5/15 min avg)
# Load > number of CPUs = overloaded
```

**Memory:**
```bash
free -h                      # Memory overview
cat /proc/meminfo            # Detailed memory
ps aux --sort=-%mem | head   # Top memory consumers
vmstat 1                     # Virtual memory stats (si/so = swap in/out)
# High swap usage = system under memory pressure
```

**Disk:**
```bash
df -h                        # Disk space usage per filesystem
du -sh /var/log/*            # Directory sizes
du -sh * | sort -rh | head   # Top space consumers
iotop                        # Real-time I/O per process
iostat -x 1                  # Disk I/O stats (await = average wait time)
lsof | grep deleted          # Files deleted but still held open (space not freed)
```

**Network:**
```bash
netstat -tuln                # Listening ports
ss -tuln                     # Faster alternative to netstat
netstat -an | grep ESTABLISHED | wc -l  # Active connections
tcpdump -i eth0 port 80      # Packet capture
iftop / nload                # Real-time bandwidth usage
```

---

**Q: Explain Linux boot process.**

1. **BIOS/UEFI**: Power on → POST (Power-On Self Test) → finds boot device
2. **MBR/GPT**: Boot loader found in first sector (MBR) or EFI partition (UEFI)
3. **GRUB** (bootloader): Loads Linux kernel and initrd/initramfs into memory
4. **Kernel**: Decompresses, initialises hardware, mounts virtual filesystems (proc, sys, dev)
5. **initramfs**: Temporary root filesystem with drivers needed to mount real root
6. **init/systemd** (PID 1): First process. Manages all other services.
7. **systemd targets**: Boots to default target (multi-user.target or graphical.target)
8. **Login prompt** or GUI

---

**Q: What is systemd? Key commands?**

systemd is the init system (PID 1) and service manager for most modern Linux distros.

```bash
# Service management
systemctl start nginx
systemctl stop nginx
systemctl restart nginx
systemctl reload nginx        # Reload config without restart
systemctl status nginx        # Show service status, recent logs
systemctl enable nginx        # Start on boot
systemctl disable nginx       # Remove from boot
systemctl is-active nginx     # Check if running

# System management
systemctl list-units --type=service --state=running
systemctl list-failed         # Failed services
systemctl daemon-reload       # Reload systemd after unit file change
systemctl reboot / poweroff / halt

# Journald (logging)
journalctl -u nginx           # Logs for nginx service
journalctl -f                 # Follow (like tail -f)
journalctl --since "1 hour ago"
journalctl -p err             # Only error level and above
journalctl -n 100             # Last 100 lines
```

---

**Q: What is a cron job? How do you set one up?**

```bash
crontab -e        # Edit current user's crontab
crontab -l        # List crontab entries
crontab -r        # Remove all crontab entries
sudo crontab -e   # Edit root's crontab
```

**Cron syntax:** `minute hour day-of-month month day-of-week command`

```
# Run at 2:30 AM daily
30 2 * * * /opt/scripts/backup.sh

# Run every 15 minutes
*/15 * * * * /opt/scripts/healthcheck.sh

# Run at 9 AM on weekdays (Mon-Fri)
0 9 * * 1-5 /opt/scripts/report.sh

# Run at midnight on 1st of every month
0 0 1 * * /opt/scripts/monthly-report.sh

# Redirect output
* * * * * /opt/scripts/job.sh >> /var/log/job.log 2>&1
```

---

**Q: Explain common networking commands.**

```bash
# Connectivity
ping google.com              # ICMP ping
traceroute google.com        # Trace route
curl -I https://example.com  # HTTP headers
wget https://example.com/file  # Download file
nslookup example.com         # DNS lookup
dig example.com              # Detailed DNS lookup
host example.com             # Simple DNS lookup

# Network config
ip addr show                 # IP addresses (replaces ifconfig)
ip route show                # Routing table
ip link show                 # Network interfaces
ip addr add 192.168.1.100/24 dev eth0  # Add IP address

# Firewall (iptables)
iptables -L -n -v            # List rules
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -j DROP    # Default drop

# Firewall (nftables / firewalld)
firewall-cmd --list-all
firewall-cmd --add-service=http --permanent
firewall-cmd --reload

# Port/connection info
ss -tuln                     # Listening ports
ss -tunp                     # Ports with process names
lsof -i :80                  # What's using port 80
```

---

**Q: Important shell scripting concepts.**

```bash
#!/bin/bash
set -euo pipefail   # e: exit on error, u: error on undefined, o pipefail: pipe error

# Variables
NAME="world"
echo "Hello, ${NAME}!"

# If/else
if [ -f "/etc/nginx/nginx.conf" ]; then
    echo "Nginx config found"
elif [ -d "/etc/nginx" ]; then
    echo "Nginx dir exists but no config"
else
    echo "Nginx not installed"
fi

# For loop
for file in /var/log/*.log; do
    echo "Processing: $file"
    gzip "$file"
done

# Functions
check_service() {
    local service=$1
    if systemctl is-active --quiet "$service"; then
        echo "$service is running"
        return 0
    else
        echo "$service is not running"
        return 1
    fi
}
check_service nginx

# Process substitution and pipes
active_users=$(who | wc -l)
echo "Active users: $active_users"

# Exit codes
command && echo "Success" || echo "Failed"

# Trap for cleanup
trap 'rm -f /tmp/tempfile; echo "Cleaned up"' EXIT INT TERM
```

## Revision Notes
```
PROCESS STATES: R(running) S(sleep) D(uninterruptible) Z(zombie) T(stopped)
kill -15 (SIGTERM, graceful) | kill -9 (SIGKILL, force)
ps aux --sort=-%cpu | top | htop

PERMISSIONS: rwxrwxrwx (owner/group/others)
chmod 755 = rwxr-xr-x | 644 = rw-r--r-- | 777 = all access
SUID(4000): run as owner | SGID(2000): run as group | Sticky(1000): only owner deletes

KEY DIRECTORIES:
/etc: config | /var/log: logs | /proc: process info (virtual)
/tmp: temp (cleared on boot) | /opt: optional software

CPU DIAGNOSIS: top → load average | ps aux --sort=-%cpu | mpstat
MEMORY: free -h | vmstat (swap in/out) | /proc/meminfo
DISK: df -h (space) | du -sh * (sizes) | iostat -x (I/O stats) | iotop

SYSTEMD: systemctl start/stop/restart/status/enable/disable
journalctl -u service -f (follow logs)

CRON: min hour day month weekday command
*/5 * * * * (every 5 min) | 0 2 * * * (2 AM daily)

NETWORKING:
ip addr / ip route (modern) | ss -tuln (listening ports)
curl / wget / dig / traceroute
iptables -L -n -v / firewall-cmd
```
