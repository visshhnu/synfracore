# Linux Interview Q&A

**Q: How do you troubleshoot high CPU on a Linux server?**
```bash
top -c           # real-time process view, press 1 for per-CPU
htop             # better UI version
ps aux --sort=-%cpu | head -10  # top CPU processes
pidstat -u 2 5   # per-process CPU every 2s for 5 iterations
# Find the thread causing CPU in a Java process:
ps -eLf | grep <pid>  # list threads
```

**Q: How do you find what is consuming disk space?**
```bash
df -h            # disk usage per filesystem
du -sh /*        # top-level directory sizes
du -h --max-depth=2 /var | sort -rh | head -20
find / -size +1G -type f 2>/dev/null  # files > 1GB
ncdu /           # interactive ncurses du (install first)
```

**Q: How do you check open ports and connections?**
```bash
ss -tulpn        # listening ports with process (modern)
netstat -tulpn   # listening ports (older)
ss -an | grep ESTABLISHED  # active connections
lsof -i :8080    # what process is on port 8080
```

**Q: What does a load average of 4.0 mean on a 2-core server?**
Load average represents the number of processes waiting for CPU. On a 2-core server, load > 2.0 means CPU is saturated — processes are queuing. Load 4.0 means 2x overloaded. Use `nproc` or `lscpu` to check core count.

**Q: How do you debug a systemd service that won't start?**
```bash
systemctl status myservice -l   # -l for full log
journalctl -u myservice -n 100 --no-pager  # service logs
journalctl -u myservice -f      # follow logs
systemctl cat myservice         # view unit file
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
