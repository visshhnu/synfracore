# Linux Certification Guide

## Certifications Available

| Cert | Provider | Type | Level |
|------|----------|------|-------|
| **RHCSA (EX200)** | Red Hat | Performance-based | Foundation |
| **LFCS** | Linux Foundation | Performance-based | Foundation |
| **CompTIA Linux+** | CompTIA | Multiple choice | Foundation |
| **RHCE (EX294)** | Red Hat | Performance-based | Intermediate |
| **LFCE** | Linux Foundation | Performance-based | Intermediate |

---

## RHCSA (EX200) — Most Valuable Linux Cert

**Format**: Hands-on tasks on RHEL 9 VM | **Time**: 2.5 hours | **Passing**: 210/300

### Key Task Areas

```bash
# ESSENTIAL SYSTEM ADMINISTRATION
# User management
useradd -u 1500 -g developers alice
usermod -aG wheel alice       # Add to sudo group
passwd alice
userdel -r alice              # Delete with home directory

# File permissions
chmod 755 /path/to/file      # rwxr-xr-x
chmod u+s /bin/program        # SUID bit
chmod g+s /shared/dir         # SGID bit (files inherit group)
chmod +t /tmp/dir             # Sticky bit (only owner can delete)
chown alice:developers /path
chown -R alice /home/alice

# ACL (Access Control Lists) — commonly tested
getfacl file.txt
setfacl -m u:alice:rwx file.txt      # Add ACL for user
setfacl -m g:devs:r-x file.txt      # Add ACL for group
setfacl -x u:alice file.txt          # Remove ACL
setfacl -b file.txt                  # Remove all ACLs

# SELinux (always on RHCSA)
getenforce                    # Enforcing/Permissive/Disabled
setenforce 0                  # Temporarily permissive
# Permanent: /etc/selinux/config → SELINUX=permissive
ls -Z /var/www/html           # Check SELinux context
chcon -t httpd_sys_content_t /custom/web/index.html
restorecon -Rv /var/www/html  # Restore default context
setsebool -P httpd_enable_homedirs on  # Persistent boolean
```

```bash
# STORAGE MANAGEMENT
# Partitions and filesystems
fdisk /dev/sdb          # Partition disk (MBR)
gdisk /dev/sdb          # Partition disk (GPT)
mkfs.xfs /dev/sdb1
mkfs.ext4 /dev/sdb1
mount /dev/sdb1 /data
# /etc/fstab for persistence:
echo '/dev/sdb1 /data xfs defaults 0 0' >> /etc/fstab

# LVM (frequently tested)
pvcreate /dev/sdb /dev/sdc
vgcreate myvg /dev/sdb /dev/sdc
lvcreate -L 10G -n mylv myvg
mkfs.xfs /dev/myvg/mylv
mount /dev/myvg/mylv /data
# Extend online
lvextend -L +5G /dev/myvg/mylv
xfs_growfs /data              # XFS resize (online)
resize2fs /dev/myvg/mylv      # ext4 resize

# Swap
mkswap /dev/sdb2
swapon /dev/sdb2
swapon -s                      # Show swap
echo '/dev/sdb2 swap swap defaults 0 0' >> /etc/fstab
```

```bash
# SERVICES AND PROCESSES (systemd)
systemctl start|stop|restart|status nginx
systemctl enable|disable nginx    # Start at boot
systemctl is-active nginx
systemctl is-enabled nginx
systemctl mask nginx              # Prevent start (stronger than disable)
systemctl list-units --type=service
journalctl -u nginx -f --since "1 hour ago"
journalctl --disk-usage
journalctl --vacuum-time=2d

# Scheduling
crontab -e                        # Edit user crontab
crontab -l -u alice               # List alice's crontab
# /etc/cron.d/ for system crontabs
# Syntax: min hour day month weekday command
# 0 2 * * 0 /usr/local/bin/backup.sh  (2am every Sunday)
systemctl --user enable mytimer.timer  # systemd timers
```

```bash
# NETWORKING
ip addr show
ip addr add 192.168.1.100/24 dev eth0
ip route show
ip route add default via 192.168.1.1
nmcli con show
nmcli con add type ethernet con-name eth1 ifname eth1 ip4 10.0.0.1/24 gw4 10.0.0.254
nmcli con up eth1
nmcli con mod eth1 ipv4.dns "8.8.8.8 1.1.1.1"
hostnamectl set-hostname server1.example.com
firewall-cmd --add-service=http --permanent
firewall-cmd --add-port=8080/tcp --permanent
firewall-cmd --reload
firewall-cmd --list-all
ss -tlnp        # Active TCP listening ports
```

---

## Exam Strategy

```
RHCSA exam tips:
1. Read ALL tasks before starting (some are dependencies)
2. Verify each task immediately after completing it
3. reboot is allowed — some tasks require it
4. Don't skip SELinux and firewall tasks (common reason for failure)
5. Use man pages and --help: man 5 crontab | man sudoers
6. Time management: 2.5 hours, ~20 tasks = 7 min per task average
```

## Revision Notes
```
RHCSA: foundational sysadmin on RHEL 9. Hands-on, 210/300 to pass.

TOP TOPICS (never skip):
  Users/Groups: useradd, usermod, passwd, groups, /etc/sudoers
  Permissions: chmod (numeric+symbolic), chown, SUID/SGID/sticky, ACL
  SELinux: chcon, restorecon, setsebool, getenforce/setenforce
  Storage: LVM (pvcreate/vgcreate/lvcreate/lvextend), /etc/fstab, swap
  Services: systemctl enable/start/mask, journalctl
  Network: nmcli, firewall-cmd, ip/ss commands
  Scheduling: crontab -e, cron syntax

LFCS vs RHCSA: LFCS covers Ubuntu/Debian too (apt vs dnf)
CompTIA Linux+: theory-based, easier to pass, less respected
```
