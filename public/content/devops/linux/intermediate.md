# Linux & Bash — Performance Troubleshooting & Scripting

## The USE Method: a systematic framework, not ad hoc guessing

For every system resource (CPU, memory, disk, network), check three things: **Utilization** (how busy is it), **Saturation** (is work queued waiting for it), and **Errors** (is it failing). This structured approach is what separates efficient troubleshooting from randomly running commands hoping something looks wrong — a genuinely slow server is almost always traceable to one specific resource being saturated or erroring, not a vague, diffuse "everything is slow."

```bash
vmstat 1 5   # 5 samples, 1 second apart
# the "r" column = run queue length — if consistently higher than CPU core count, CPU is saturated
# "si"/"so" columns = swap in/out — any sustained non-zero value means real memory pressure
```
`vmstat` is the right first command specifically because it surfaces both CPU saturation (the `r` column) and memory pressure (swap activity) in one glance, before diving into resource-specific tools.

## Disk I/O: `iostat` and what `await` actually tells you

```bash
iostat -x 1 5
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
strace -p <pid> -e trace=all         # see every syscall a running process makes, live
lsof -p <pid>                          # every file/socket a process currently has open
```
`strace` on a hung or misbehaving process reveals exactly what it's doing at the syscall level — a process repeatedly calling `connect()` and failing reveals a network dependency issue directly, faster than guessing from application logs alone. `lsof` is the standard tool for "why won't this file/port release" — showing precisely which process holds a given file or socket open.

## Production Bash: `set -euo pipefail`, every time

```bash
#!/usr/bin/env bash
set -euo pipefail
trap 'echo "Failed at line $LINENO"' ERR
```
- `-e`: exit immediately on any command failure, rather than continuing past it silently.
- `-u`: error on any reference to an undefined variable, catching typos before they cause quiet, wrong behavior.
- `-o pipefail`: a pipeline's exit code reflects the *first* failing command in it, not just the last one — without this, `cmd_that_fails | cmd_that_succeeds` reports success despite the first command's real failure.

This should be the first line of essentially every production Bash script — the cost is near-zero, and the alternative (a script silently continuing past a real failure) is a genuine, recurring source of "the script ran but didn't actually do what it should have" incidents.

## Quoting variables — a small habit, a real, common bug source

```bash
# WRONG — breaks on filenames/values containing spaces
for f in $files; do rm $f; done

# CORRECT
for f in "${files[@]}"; do rm "$f"; done
```
Unquoted variable expansion undergoes word-splitting — a value containing a space gets treated as multiple separate arguments, which is a genuine, recurring source of scripts that work fine in testing (with simple test values) and break on real-world input (a filename with a space in it). `[[ ]]` (not `[ ]`) for conditionals and `$(command)` (not backticks) for command substitution are the same category of small, consistently-recommended defaults — modern, more predictable syntax with fewer edge-case surprises than their older equivalents.

## Kubernetes context: cgroups and the OOM killer

Kubernetes enforces container resource limits using Linux cgroups directly — when a container's memory usage exceeds its configured limit, the kernel's OOM killer terminates the offending process, which surfaces in `kubectl describe pod` as `OOMKilled`. This is a kernel-level mechanism, not a Kubernetes-specific one — understanding that connection is what makes `OOMKilled` behavior predictable rather than mysterious: it's the same OOM-killer mechanism that would terminate any process exceeding a cgroup memory limit, container or not.
