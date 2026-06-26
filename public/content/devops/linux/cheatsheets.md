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

## Quick Reference — Linux

### Key Points for Revision

- Review the overview section for core architecture and fundamentals
- Practice commands/configurations from the cheatsheet section
- Use interview Q&A for active recall before exams or interviews
- Cross-reference with related tools in the devops academy

### Related Topics

Explore these connected topics to build complete understanding:
- Overview and Architecture
- Fundamentals and Core Concepts
- Advanced Patterns and Production Usage
- Interview Preparation Q&A
- Quick Reference Cheatsheet

### Practice Approach

1. Read the overview to understand *what* and *why*
2. Work through fundamentals for *how*
3. Attempt hands-on labs or configurations
4. Test yourself with interview questions
5. Keep cheatsheet accessible for quick reference during work

### Further Learning

Connect this topic to the broader devops ecosystem. 
Each tool in this academy is designed to work with others —
understanding the integration points is what separates intermediate from senior practitioners.
