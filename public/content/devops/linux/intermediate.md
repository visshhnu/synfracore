# Linux & Bash — Performance Troubleshooting & Scripting

## The USE Method: a systematic framework, not ad hoc guessing

For every system resource (CPU, memory, disk, network), check three things: **Utilization** (how busy is it), **Saturation** (is work queued waiting for it), and **Errors** (is it failing). This structured approach is what separates efficient troubleshooting from randomly running commands hoping something looks wrong — a genuinely slow server is almost always traceable to one specific resource being saturated or erroring, not a vague, diffuse "everything is slow."

```bash
vmstat 1 5   # 5 samples, 1 second apart
# the "r" column = run queue length -- if consistently higher than CPU core count, CPU is saturated
# "si"/"so" columns = swap in/out -- any sustained non-zero value means real memory pressure
```
`vmstat` is the right first command specifically because it surfaces both CPU saturation (the `r` column) and memory pressure (swap activity) in one glance, before diving into resource-specific tools.

## Disk I/O: `iostat` and what `await` actually tells you

```bash
iostat -x 1 5    # needs the sysstat package: sudo apt install sysstat / sudo dnf install sysstat
# await: average time (ms) for I/O requests to complete
# > 10ms sustained on SSD-backed storage is a real red flag; higher baselines are normal on spinning disk
```
High `await` specifically means requests are waiting, not that the disk itself is broken — this is a saturation signal (the USE method's second check), pointing toward too much concurrent I/O demand for the storage's actual throughput, not necessarily a hardware failure.

## Network: `ss` over the older `netstat`

```bash
ss -tn state established   # established TCP connections
ss -tn | awk '{print $1}' | sort | uniq -c | sort -rn   # count connections by state
```
Many `TIME-WAIT` connections is normal on a high-traffic server (connections finishing their close sequence). Many `CLOSE-WAIT` connections is a real, specific signal: the application isn't closing connections it should be — a common, genuine resource-leak pattern worth investigating in the application code, not the OS.

## `strace` and `lsof`: process-level debugging

```bash
strace -p <pid> -e trace=all   # see every syscall a running process makes, live
lsof -p <pid>                  # every file/socket a process currently has open
```
`strace` on a hung or misbehaving process reveals exactly what it's doing at the syscall level — a process repeatedly calling `connect()` and failing reveals a network dependency issue directly, faster than guessing from application logs alone. `lsof` is the standard tool for "why won't this file/port release" — showing precisely which process holds a given file or socket open.

## Log Analysis: grep, awk, sed, journalctl

This is the single most frequent Linux task in DevOps work — something is misbehaving, and the answer is somewhere in a log file or the systemd journal.

```bash
# grep -- find matching lines, with context
grep -E "ERROR|WARN" app.log         # -E enables extended regex, so | works as "or"
grep -A3 "Exception" app.log         # -A3: also show 3 lines AFTER each match
grep -B3 "Exception" app.log         # -B3: 3 lines BEFORE each match
grep -C3 "Exception" app.log         # -C3: 3 lines both before and after
grep -c "ERROR" app.log              # -c: just count matching lines, don't print them
grep -v "DEBUG" app.log              # -v: invert -- show lines that DON'T match

# awk -- extract and process columns
awk '{print $1}' access.log          # first column (whitespace-delimited)
awk -F: '{print $1}' /etc/passwd     # custom delimiter
awk '{sum += $1} END {print sum}' file.txt   # accumulate and print at the end

# sed -- stream editor
sed 's/old/new/g' file.txt           # replace all occurrences per line
sed -n '10,20p' file.txt             # print only lines 10-20
sed '/^#/d' config.txt               # delete comment lines
sed -i 's/old/new/g' file.txt        # edit in place -- WARNING: modifies the file directly
sed -i.bak 's/old/new/g' file.txt    # safer: keep a .bak backup before editing in place

# sort, uniq, cut -- the "count and rank" idiom
sort -t: -k3 -n /etc/passwd          # sort by 3rd field, colon-delimited, numeric
sort file.txt | uniq -c              # count occurrences of each unique line
cut -d: -f1 /etc/passwd              # extract just the first field

# The classic combined pipeline -- genuinely one of the most useful patterns
# in day-to-day log analysis:
awk '{print $1}' access.log | sort | uniq -c | sort -rn | head -10
# top 10 IP addresses by request count

# journalctl -- systemd's own log store, not a plain text file
journalctl -u nginx                       # all logs for one service/unit
journalctl -u nginx --since "30 min ago"  # narrow the time range BEFORE searching --
journalctl -u nginx --until "10 min ago"  # much faster than grepping the full history
journalctl -k                              # kernel messages (same source dmesg reads)
journalctl -p err                          # only priority "err" and worse
journalctl -f                              # follow live, like tail -f
```
`grep`/`awk`/`sed` work on plain text log files; `journalctl` is how you read logs for anything running as a systemd service, since those logs often aren't written to a flat file at all by default (they live in the binary journal store) — `journalctl -u <service>` is the right first command for a systemd-managed service, not `grep`-ing around `/var/log` hoping to find it.

## Networking & Security Basics

```bash
# Firewall -- which tool depends on distro family (see Troubleshooting's
# Issue 1 for the full systemctl/firewall-cmd/ufw split by distro)
sudo ufw allow 443/tcp                          # Debian/Ubuntu: allow a port
sudo ufw deny 8080/tcp                          # Debian/Ubuntu: block a port
sudo firewall-cmd --permanent --add-port=443/tcp && sudo firewall-cmd --reload   # RHEL-family
sudo iptables -L INPUT -n --line-numbers        # raw iptables rules, either family

# SSH hardening -- /etc/ssh/sshd_config, then: sudo systemctl restart sshd (or ssh on Debian/Ubuntu)
# PermitRootLogin no          -- disable direct root login; use sudo instead
# PasswordAuthentication no   -- key-based auth only, once keys are set up
# AllowUsers deploy admin     -- explicit allow-list instead of "any valid user"
# AllowTcpForwarding no       -- unless SSH tunneling is specifically needed

# tcpdump -- capture packets at the OS level, below application logs
sudo tcpdump -i eth0 port 443 -c 20    # 20 packets on port 443, interface eth0
sudo tcpdump -i any host 10.0.0.5      # all traffic to/from a specific host, any interface
sudo tcpdump -i eth0 -w capture.pcap   # write to a file for later analysis (e.g. in Wireshark)

# openssl -- verify a certificate directly, without trusting a browser's cached view
openssl s_client -connect example.com:443 -servername example.com </dev/null 2>/dev/null | openssl x509 -noout -dates
# shows notBefore/notAfter -- confirms whether a cert is actually expired,
# independent of what any one client claims
```
`tcpdump` and packet-level tools are for confirming whether traffic is actually leaving/arriving at the OS level at all — useful specifically when application-level logs show a request as "sent" but the other side never saw it, which narrows the problem to the network layer rather than the application.

## Production Bash: `set -euo pipefail`, every time

```bash
#!/usr/bin/env bash
set -euo pipefail
trap 'echo "Failed at line $LINENO"' ERR
```
- `-e`: exit immediately on any command failure, rather than continuing past it silently.
- `-u`: error on any reference to an undefined variable, catching typos before they cause quiet, wrong behavior.
- `-o pipefail`: a pipeline's exit code reflects the *rightmost non-zero* exit status among all its commands (or 0 if every command succeeded) — not just the last command's status by default, and not the *first* failing command either (a common misstatement, worth being precise about). Without `pipefail`, `cmd_that_fails | cmd_that_succeeds` reports success, since only the last command's exit code counts by default — `pipefail` fixes that by surfacing a failure from any stage of the pipeline. If multiple commands in the same pipeline fail, the reported code is the rightmost one that failed, not the first.

This should be the first line of essentially every production Bash script — the cost is near-zero, and the alternative (a script silently continuing past a real failure) is a genuine, recurring source of "the script ran but didn't actually do what it should have" incidents.

## Quoting variables — a small habit, a real, common bug source

```bash
# WRONG -- word-splits on whitespace, breaks on filenames/values containing spaces
files="report one.txt report-two.txt"
for f in $files; do rm "$f"; done

# CORRECT -- files declared as a real bash ARRAY (not a plain string),
# so each element is treated as one item regardless of spaces inside it
files=("report one.txt" "report-two.txt")
for f in "${files[@]}"; do rm "$f"; done
```
Unquoted variable expansion undergoes word-splitting — a plain string value containing a space gets treated as multiple separate arguments, which is a genuine, recurring source of scripts that work fine in testing (with simple test values) and break on real-world input (a filename with a space in it). The fix isn't just "add quotes" — it's using an actual bash array (`files=(...)`, expanded as `"${files[@]}"`) when the underlying data is genuinely a list of items, since quoting a plain unquoted string (`"$files"`) just treats the whole thing as one single item instead of fixing the iteration. `[[ ]]` (not `[ ]`) for conditionals and `$(command)` (not backticks) for command substitution are the same category of small, consistently-recommended defaults — modern, more predictable syntax with fewer edge-case surprises than their older equivalents.

## Compression and Archives

```bash
gzip -k filename            # compress, keep the original (-k)
gzip -9 filename             # slowest compression, best ratio (default is -6)
gunzip filename.gz           # decompress

tar -czf archive.tar.gz dir/      # create a gzip-compressed archive
tar -xzf archive.tar.gz            # extract
tar -tzf archive.tar.gz            # list contents without extracting
# flags: c=create x=extract t=list z=gzip j=bzip2 f=filename-follows v=verbose
```

## Kubernetes context: cgroups and the OOM killer

Kubernetes enforces container resource limits using Linux cgroups directly — when a container's memory usage exceeds its configured limit, the kernel's OOM killer terminates the offending process, which surfaces in `kubectl describe pod` as `OOMKilled`. This is a kernel-level mechanism, not a Kubernetes-specific one — understanding that connection is what makes `OOMKilled` behavior predictable rather than mysterious: it's the same OOM-killer mechanism that would terminate any process exceeding a cgroup memory limit, container or not.
