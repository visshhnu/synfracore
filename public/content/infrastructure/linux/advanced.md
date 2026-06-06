# Linux Advanced

Production-grade skills: kernel tuning, security hardening, performance analysis.

## Performance Analysis

\`\`\`bash
# CPU Analysis
top                          # Real-time CPU, press 1 for per-core
htop                         # Better top
mpstat -P ALL 1              # Per-CPU stats every 1 second
vmstat 1 5                   # System stats, 5 samples
uptime                       # Load averages (1, 5, 15 min)
sar -u 1 10                  # CPU utilization via sysstat

# Memory Analysis
free -h                      # Memory overview
cat /proc/meminfo            # Detailed memory info
vmstat -s                    # Memory stats
smem -t -k                   # Per-process memory usage
pmap -x <pid>                # Memory map of a process

# Disk I/O Analysis
iostat -xz 1                 # Disk I/O stats
iotop                        # Top for disk I/O
lsof +D /var/log             # Open files in directory
fuser /var/log/app.log       # Who has file open

# Network Analysis
iftop                        # Network usage per connection
nethogs                      # Network usage per process
ss -s                        # Socket statistics summary
netstat -s                   # Protocol statistics
tcpdump -i eth0 port 80      # Capture HTTP traffic
tcpdump -i any -w capture.pcap  # Capture all to file
\`\`\`

## Kernel Tuning (sysctl)

\`\`\`bash
# View current settings
sysctl -a | grep net.ipv4
sysctl vm.swappiness

# Set temporarily
sysctl -w vm.swappiness=10
sysctl -w net.ipv4.tcp_fin_timeout=15

# Persistent settings: /etc/sysctl.conf or /etc/sysctl.d/99-custom.conf
cat >> /etc/sysctl.d/99-production.conf << 'EOF'
# Reduce swap usage (good for databases)
vm.swappiness = 10

# Increase file descriptor limits
fs.file-max = 2097152

# Network performance tuning
net.core.somaxconn = 65535
net.core.netdev_max_backlog = 65535
net.ipv4.tcp_max_syn_backlog = 65535
net.ipv4.tcp_fin_timeout = 15
net.ipv4.tcp_tw_reuse = 1

# Kubernetes required settings
net.bridge.bridge-nf-call-iptables = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward = 1
EOF

sysctl --system   # Apply all sysctl configs
\`\`\`

## Security Hardening

\`\`\`bash
# SSH hardening (/etc/ssh/sshd_config)
PermitRootLogin no              # Never allow root SSH
PasswordAuthentication no       # Keys only
PubkeyAuthentication yes
AllowUsers deploy ubuntu        # Whitelist users
MaxAuthTries 3
LoginGraceTime 20
X11Forwarding no
Protocol 2

# Fail2ban - ban IPs after failed logins
sudo apt install fail2ban
cat /etc/fail2ban/jail.local
[sshd]
enabled = true
maxretry = 3
bantime = 3600
findtime = 600

# File integrity monitoring (AIDE)
sudo apt install aide
aide --init && mv /var/lib/aide/aide.db.new /var/lib/aide/aide.db
aide --check  # Check for changes

# Audit logging
auditctl -w /etc/passwd -p wa -k passwd_changes
auditctl -w /etc/sudoers -p wa -k sudoers_changes
ausearch -k passwd_changes

# Find SUID/SGID files (security audit)
find / -perm -4000 -type f 2>/dev/null   # SUID files
find / -perm -2000 -type f 2>/dev/null   # SGID files

# Check for world-writable files
find / -perm -0002 -type f 2>/dev/null
\`\`\`

## Linux Namespaces & Cgroups (Container Internals)

Understanding these is essential because Docker and Kubernetes are built on them.

\`\`\`bash
# Namespaces isolate resources
# Types: pid, net, mnt, uts, ipc, user, cgroup

# See namespaces of a process
ls -la /proc/1/ns
lsns                         # List all namespaces
lsns -t pid                  # PID namespaces only

# Create isolated namespace (what Docker does)
unshare --pid --fork --mount-proc bash  # New PID namespace
# Now ps aux only shows processes in this namespace!

# Cgroups limit resources
cat /proc/1/cgroup            # cgroups of process 1
ls /sys/fs/cgroup/            # cgroup hierarchy

# Create a cgroup limiting memory (v2)
mkdir /sys/fs/cgroup/myapp
echo "104857600" > /sys/fs/cgroup/myapp/memory.max  # 100MB limit
echo $$ > /sys/fs/cgroup/myapp/cgroup.procs         # Add shell to cgroup

# This is exactly what 'docker run --memory=100m' does!
\`\`\`

## LVM — Logical Volume Management

\`\`\`bash
# Check existing LVM
pvs                          # Physical volumes
vgs                          # Volume groups
lvs                          # Logical volumes
lvdisplay /dev/vg0/root      # Detailed view

# Extend a logical volume (common in production)
lvextend -L +20G /dev/vg0/data          # Add 20GB
resize2fs /dev/vg0/data                 # Resize ext4 filesystem
xfs_growfs /dev/vg0/data               # For XFS filesystem

# Create new LV
lvcreate -L 50G -n newvol vg0
mkfs.ext4 /dev/vg0/newvol
mkdir /mnt/newvol
mount /dev/vg0/newvol /mnt/newvol
echo "/dev/vg0/newvol /mnt/newvol ext4 defaults 0 2" >> /etc/fstab
\`\`\`