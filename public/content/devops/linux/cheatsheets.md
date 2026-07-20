# Linux Quick Reference

```bash
# File and directory operations
pwd                          find . -name "*.log" -mtime +7
ls -lah                      ls -lt (sort by modification time)
cd -                         tree -L 2 (directory tree, 2 levels)
cp -r src/ dst/               rsync -avz src/ user@host:dst/
mv file.txt /new/path/        ln -s /real/path link-name
find . -type f -size +100M    find . -name "*.py" -exec grep -l "import os" {} \;

# Process management
ps aux | grep app    pgrep -l nginx
kill 1234             kill -9 1234       kill -15 1234
pkill nginx           killall -HUP nginx (reload signal, common for config reload)
top / htop            lsof -i :8080 (what's using port 8080)
command &             nohup cmd &        disown %1
jobs                  fg %1 / bg %1      Ctrl+Z (suspend) / Ctrl+C (kill)

# Network
ip addr show          ip route show
curl -v http://api    curl -I https://example.com (headers only)
ping -c 4 host        traceroute host    mtr host
ss -tulpn             netstat -an   # ss is the modern replacement -- prefer it; netstat is legacy but still common in older docs/scripts
dig example.com       dig +short example.com   nslookup example.com

# Text processing
grep -r "error" logs/          grep -i "warn" app.log
awk '{print $1,$4}' access.log sed 's/old/new/g' file
sort | uniq -c | sort -rn      cut -d: -f1 /etc/passwd

# System info
uname -a    lscpu    free -h
df -h       uptime
cat /proc/cpuinfo    cat /proc/meminfo
dmesg | tail -50     journalctl -xe

# File permissions (octal)
# 7=rwx  6=rw-  5=r-x  4=r--  0=---
# 755 = rwxr-xr-x (owner all, others read+execute)
# 644 = rw-r--r-- (owner read+write, others read)
# 600 = rw------- (owner only, for SSH keys/secrets)
# Special bits: SUID (4000, u+s), SGID (2000, g+s), Sticky (1000, +t)

# Bash shortcuts (interactive shell, not scripting)
Ctrl+R       search command history
Ctrl+A / Ctrl+E   jump to beginning / end of line
Ctrl+U / Ctrl+K   delete to start / end of line
Ctrl+W       delete word before cursor
!!           repeat last command
!$           last argument of last command
!nginx       run last command starting with "nginx"
history 50   show last 50 commands
```
