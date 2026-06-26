# Linux Quick Reference

```bash
# File operations
ls -lah              find . -name "*.log" -mtime +7
chmod 755 file       chown user:group file
cp -r src/ dst/      rsync -avz src/ user@host:dst/

# Process management
ps aux | grep app    pgrep -l nginx
kill -9 <pid>        pkill nginx
nohup cmd &          disown %1

# Network
ip addr show         ip route show
curl -v http://api   wget -O - http://api
ping -c 4 host       traceroute host
ss -tulpn            netstat -an

# Text processing
grep -r "error" logs/          grep -i "warn" app.log
awk '{print $1,$4}' access.log sed 's/old/new/g' file
sort | uniq -c | sort -rn      cut -d: -f1 /etc/passwd

# System info
uname -a   lscpu   free -h   df -h   uptime
cat /proc/cpuinfo  cat /proc/meminfo
dmesg | tail -50   journalctl -xe

# File permissions (octal)
# 7=rwx  6=rw-  5=r-x  4=r--  0=---
# 755 = rwxr-xr-x (owner all, others read+execute)
# 644 = rw-r--r-- (owner read+write, others read)
# 600 = rw------- (owner only, for SSH keys/secrets)
```
