# Linux — System Administration & Shell Scripting

les. Systematic approach: First: df -h to confirm which partition is full. Second: du -sh /* to find the largest directories. Third: common culprits in order — /var/log (logs grew unbounded), /var/lib/docker (Docker images/containers), /tmp (someone wrote large temp files), /home (developer left large files). Safe immediate fixes: journalctl --vacuum-size=500M to trim journal logs. find /var/log -name '*.gz' -mtime +30 -delete to remove old compressed logs. docker system prune -f to remove unused Docker resources. For permanent fix: add logrotate config, add monitoring alert at 80% disk usage. At HPE: had this on a TeMIP server. /var/log/app filled up because log level was set to DEBUG in production. Fixed by changing log level to INFO and adding logrotate.

LINUX · ARCHITECT
Explain Linux file permissions. How do you secure a private key file?
Every file has three permission sets: owner, group, others. Each set has three bits: read (4), write (2), execute (1). Common values: 755 = owner can rwx, group and others can rx — good for executables. 644 = owner can rw, group and others can read — good for config files. 600 = only owner can rw, nobody else has any access — required for SSH private keys. 700 = only owner can rwx — good for directories with sensitive content. For SSH private key: chmod 600 ~/.ssh/id_rsa. If permissions are wrong (too open), SSH refuses to use the key with a permission denied error. For production: sensitive config files should be 640 (owner read-write, group read) and owned by the application user. Never 777 on production — that means anyone can modify the file.

LINUX · PRODUCTION
How do you investigate a memory leak on a Linux server?
Memory leak = application allocates memory and never frees it. Symptoms: free -h shows available memory decreasing over hours/days, server eventually OOM-kills processes. Investigation: watch the specific process over time: watch -n 60 'ps -o pid,vsz,rss,comm -p PID' — VSZ (virtual) and RSS (resident) should both grow over time for a leak. Check dmesg and journalctl -k for OOM killer messages — they show which process was killed and how much memory it had. For Java: jmap -histo PID shows object count by class — which class is growing? For Python: use tracemalloc or memory_profiler. For Go: use pprof. Immediate mitigation: restart the leaking service (cron job restart every night if fix takes time). Permanent fix: find the object that is never dereferenced and fix the code. At HPE: Python Kafka consumer cached every processed message ID in a dict without expiry. Fixed by using OrderedDict with maxlen limit.

LINUX · ENGINEER
What is set -euo pipefail and why do you use it in bash scripts?
Three separate options: set -e makes the script exit immediately when any command returns non-zero exit code. Without it, errors are silently ignored and the script continues — dangerous in deployment scripts. set -u makes the script exit when you reference an undefined variable. Without it, a typo in a variable name gives an empty string — silent bug. Example: rm -rf $DIRECOTRY/ (typo) without -u would run rm -rf / (delete everything). set -o pipefail makes a pipeline fail if ANY command in the pipe fails. Without it, ls /nonexistent | sort returns exit code 0 because sort succeeded — the ls failure is hidden. Together they make bash scripts behave like proper programming languages — fail loudly on errors rather than silently continuing in a broken state. Every production bash script should start with these.

LINUX · PRODUCTION
A service cannot connect to a database. Walk through network troubleshooting.
Layered investigation from application to network. Step 1: can we reach the DB host at all? ping db-server from the app server. If ping fails, routing or firewall issue. Step 2: is the DB port open? nc -zv db-server 5432 (PostgreSQL) or nc -zv db-server 3306 (MySQL). If this fails, DB is not listening, firewall blocking, or wrong host/port. Step 3: is DNS resolving correctly? nslookup db-server — check if it resolves to the right IP. Step 4: is there a firewall rule? On the DB server: sudo iptables -L -n | grep 5432, or ss -tlnp | grep 5432 — is PostgreSQL actually listening? On the app server: check if outbound traffic on 5432 is allowed. Step 5: test the actual connection with the DB client: psql -h db-server -U user -d dbname — this confirms credentials and SSL settings too. Step 6: check application config — wrong host name? wrong port? wrong credentials in config file?

LINUX · ARCHITECT
What is the Linux /proc filesystem and how do you use it for troubleshooting?
/proc is a virtual filesystem — it exists only in memory, not on disk. It exposes kernel and process information as readable files. Every process has a directory /proc/PID containing: cmdline (full command), fd (open file descriptors), status (memory, state), net (network info). Key files: /proc/meminfo shows detailed memory breakdown including cached, buffers, available. /proc/cpuinfo shows CPU details, core count. /proc/loadavg shows 1/5/15 minute load average. /proc/net/tcp shows all TCP connections in kernel format. For troubleshooting: cat /proc/PID/status shows memory usage and OOM score. ls -la /proc/PID/fd | wc -l counts open file descriptors — if this is very high, you have a file descriptor leak. cat /proc/PID/net/tcp shows which network connections this process has. You should never edit /proc files except for specific tuning like /proc/sys/net/ipv4/tcp_fin_timeout or /proc/PID/oom_score_adj.


## 🗺️ Roadmap›





Week 1
Navigation

Navigate filesystem without GUI
Understand file permissions
Manage files: cp, mv, rm, find, grep



Week 2
Processes & Services

ps, top, kill — find and manage processes
systemctl — manage services
journalctl — read system logs



Week 3
Networking & Troubleshooting

ss, netstat, nc — port checking
curl, dig — HTTP and DNS testing
iostat, vmstat — performance analysis



Month 2
Bash Scripting

set -euo pipefail in every script
Functions, loops, error handling
Write a deployment script from scratch
Understand cron, at, systemd timers


Continue Learning
[☸️ Kubernetes](/devops/kubernetes.html)[🐳 Docker](/devops/docker.html)[🤖 Ansible](/devops/ansible.html)[🏠 All Topics](/)

🤖
✕




🤖



AI Assistant

Ask anything about this topic

Clear





👋 Hi! I have read this page and can answer your questions.


Try asking: *"Explain this topic in simple terms"* or *"Give me an example"* or ask any specific question.




Explain simply
Give an example
Interview tips
Common mistakes




➤

## Shell Scripting for DevOps

```bash
#!/bin/bash
set -euo pipefail  # Exit on error, unset variable, pipe failure
IFS=$'\n\t'

# Functions
log() { echo "[$(date +'%Y-%m-%d %H:%M:%S')] $*"; }
die() { log "ERROR: $*" >&2; exit 1; }

# Check prerequisites
command -v kubectl >/dev/null 2>&1 || die "kubectl not found"
[ -n "${NAMESPACE:-}" ] || die "NAMESPACE not set"

# Retry function
retry() {
    local n=3 delay=5
    until "$@"; do
        ((n--)) || die "Command failed after retries: $*"
        sleep $delay
    done
}

# Deployment script
log "Deploying to $NAMESPACE"
retry kubectl rollout status deployment/myapp -n $NAMESPACE --timeout=300s
log "Deployment complete"
```
