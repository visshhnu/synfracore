# Linux Cheat Sheet

Quick reference for the most-used commands in production.

## Navigation & Files

\`\`\`bash
pwd                     # Current directory
ls -la                  # List all files with details
cd -                    # Previous directory
find . -name "*.log" -mtime -7    # Logs modified in 7 days
grep -r "ERROR" /var/log/ --include="*.log"
tail -f /var/log/syslog | grep -i error
\`\`\`

## Processes

\`\`\`bash
ps aux | grep python    # Find python processes
kill -9 $(pgrep nginx)  # Kill all nginx processes
lsof -i :8080           # What's on port 8080
nice -n 10 ./script.sh  # Run with lower priority
nohup ./server.sh &     # Run detached
\`\`\`

## Networking

\`\`\`bash
ip addr show            # IP addresses
ss -tlnp                # TCP listening ports
curl -IL https://site.com  # HTTP check with redirects
dig @8.8.8.8 domain.com  # DNS lookup via Google
traceroute domain.com
\`\`\`

## Disk

\`\`\`bash
df -h                   # Disk space
du -sh /var/* | sort -rh | head -10  # Largest dirs
lsblk                   # Block devices
ncdu /                  # Interactive disk usage (install ncdu)
\`\`\`

## Services (systemd)

\`\`\`bash
systemctl status nginx
systemctl restart nginx
journalctl -u nginx -f  # Follow logs
systemctl list-units --failed  # What's broken
\`\`\`

## Performance

\`\`\`bash
top -c                  # Show full command
iostat -xz 1 3          # Disk I/O, 3 samples
free -h                 # Memory
uptime                  # Load average
dmesg | tail -20        # Kernel messages
\`\`\`

## One-liners

\`\`\`bash
# Count HTTP status codes in access log
awk '{print $9}' /var/log/nginx/access.log | sort | uniq -c | sort -rn

# Find large files
find / -type f -size +1G 2>/dev/null

# Watch a file for changes
watch -n 2 "ls -la /tmp/"

# Monitor a directory
inotifywait -m /etc/nginx/

# Kill all processes by name
pkill -f "gunicorn"

# Check SSL certificate expiry
echo | openssl s_client -connect example.com:443 2>/dev/null | openssl x509 -noout -dates

# Disk usage excluding certain dirs
du -sh --exclude=/proc --exclude=/sys /

# Compress a directory
tar -czf backup.tar.gz /opt/myapp/

# Extract
tar -xzf backup.tar.gz -C /opt/restore/
\`\`\`

## File Permissions Quick Reference

\`\`\`
chmod 777  # rwxrwxrwx - everyone everything (AVOID)
chmod 755  # rwxr-xr-x - standard for executables
chmod 644  # rw-r--r--  - standard for files
chmod 600  # rw-------  - private files (SSH keys)
chmod 700  # rwx------  - private executables
chmod 400  # r--------  - read-only (AWS .pem files)
\`\`\`

## Critical Files

\`\`\`
/etc/passwd         User accounts
/etc/shadow         Password hashes
/etc/group          Group definitions
/etc/hosts          Local DNS
/etc/resolv.conf    DNS servers
/etc/fstab          Filesystem mounts
/etc/crontab        System cron
/etc/sudoers        Sudo permissions
/etc/ssh/sshd_config  SSH daemon config
/proc/cpuinfo       CPU information
/proc/meminfo       Memory information
/var/log/syslog     System log
/var/log/auth.log   Authentication log
\`\`\`