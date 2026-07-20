# Linux — FAQ

## Why does `kill -9` sometimes not actually kill a process?

`kill -9` sends `SIGKILL`, which the kernel handles directly and a process genuinely cannot ignore or block — but a process stuck in **uninterruptible sleep** (state `D` in `ps`/`top`, typically waiting on a kernel-level I/O operation like a hung NFS mount or a failing disk) won't respond to *any* signal, including `SIGKILL`, until the kernel operation it's blocked on actually completes or times out. This is a genuinely useful thing to recognize during an incident — a process that won't die even under `kill -9` is a strong signal the real problem is a stuck I/O operation at the kernel level, not the process itself misbehaving.

## What's actually different between `kill`, `killall`, and `pkill`?

`kill` targets a specific PID and requires you to already know it. `killall` targets by exact process *name*. `pkill` matches against a broader pattern (including full command line with `-f`), which is more flexible but also easier to accidentally match more processes than intended — `pkill -f python` on a server running several unrelated Python scripts would signal all of them, not just the one you meant. The practical tradeoff: `kill` is the most precise but requires a lookup step first; `pkill -f` is fast but worth double-checking your pattern against `ps aux | grep` before actually running it destructively.

## Why does my script work when I run it by hand but fail when cron runs it?

Almost always an environment difference — cron runs jobs with a minimal environment (no `.bashrc` sourced, a much smaller `$PATH`, sometimes no `$HOME` set), which is exactly the failure mode in the Real World tab's third scenario (a script that assumed an environment variable would be set, which held true in interactive testing but not under cron). Fixes: use absolute paths for every command in the script, explicitly set any environment variables the script needs at the top rather than assuming they're inherited, and — critically — use `set -u` so an unexpectedly-unset variable causes a loud failure instead of silently expanding to empty.

## Is `/tmp` actually safe to write to, given it's world-writable?

It's writable by everyone, but the **sticky bit** (`chmod +t`, which `/tmp` has by default on virtually every distro) means only a file's owner (or root) can *delete* it, even though anyone can create new files there — this is specifically what makes shared world-writable directories safe-ish rather than a free-for-all. That said, `/tmp` is still not appropriate for sensitive data (any user can potentially *read* another user's files there depending on the specific permissions set on each file) or for anything that needs to survive a reboot, since many systems clear `/tmp` on restart.

## Why does `ps aux` show a process's memory usage differently from what `top` shows, or from what the process actually seems to be using?

Several genuinely different memory metrics exist and get conflated casually: **RSS** (Resident Set Size — actual physical RAM currently in use) is usually what `ps`/`top` display by default, but it includes shared library memory that might be counted against *multiple* processes simultaneously (each process using a shared library shows that library's memory in its own RSS, even though it's not duplicated in actual RAM) — so summing every process's RSS can substantially overcount total memory in use. **VSZ** (Virtual Size) includes memory that's been allocated/mapped but not necessarily actually touched yet, and can be far larger than what's really being used. For an accurate "how much RAM is actually free" answer, `free -h` is more reliable than summing individual process RSS values.

## What's the actual difference between `SIGTERM` and `SIGKILL`, beyond "one is nicer"?

`SIGTERM` (`kill -15`, the default) asks a process to terminate but lets it run its own cleanup handlers first — closing open files properly, finishing an in-flight database write, releasing locks — before actually exiting. `SIGKILL` (`kill -9`) terminates immediately at the kernel level with zero opportunity for the process to clean up anything. The practical reason this matters beyond politeness: killing a database process or anything with in-flight writes via `SIGKILL` can leave data in an inconsistent state that `SIGTERM`'s graceful shutdown path was specifically designed to avoid — `SIGKILL` should generally be the last resort after `SIGTERM` has been given a real chance to work, not the default first move.

## Why do some servers show high load average with fairly low CPU usage in `top`?

Linux's load average includes processes in **uninterruptible sleep** (state `D` — typically blocked on disk or network I/O), not just processes actively competing for CPU time. A server with genuinely idle CPU but several processes stuck waiting on slow or failing storage can show a high load average that has nothing to do with CPU saturation at all — this is exactly why the USE method checks CPU, memory, disk, *and* network separately rather than treating "high load average" as automatically meaning "CPU problem." Cross-check with `iostat` specifically before assuming a high load number means the CPU itself is the bottleneck.

## Is it ever actually fine to run something as root instead of using `sudo` for a specific command?

Occasionally, but it should be a deliberate, rare exception rather than a habit — `sudo -i` (a full root shell) removes the audit trail benefit of `sudo` (which logs exactly which command was run, by whom, and when) and removes the safety net of least privilege for the duration of that session. The much more common and safer pattern is `sudo <specific command>` for each individual action, which preserves both the audit log and the "only elevated for this one thing" property. A full root shell session is occasionally genuinely necessary (extended multi-step system recovery work), but reaching for it as a default convenience rather than an exception is exactly the habit that scoped `sudo` access exists to prevent.

## Why does `df -h` sometimes show a filesystem as nearly full, but `du -sh` on that same filesystem's contents adds up to way less than the reported usage?

This is almost always **deleted-but-still-open files** — if a process has a file open when it gets deleted, the disk space isn't actually freed until that process closes the file handle or exits, even though the file no longer appears in any directory listing `du` can see (since `du` walks the visible directory tree, and a deleted file isn't in it anymore). `lsof | grep deleted` finds exactly this — files held open by a running process despite being deleted from the filesystem's namespace. This is a specific, well-known Linux behavior (not a bug) that trips people up because it makes `du` and `df` appear to disagree when they're actually both correctly reporting different things.

## Why does this course recommend `ss` over `netstat` when `netstat` is more familiar to a lot of people?

`ss` is the modern replacement built specifically to be faster and to expose more detailed socket state information directly from the kernel, whereas `netstat` is considered legacy on most current distros (some minimal installations don't even include it by default anymore, requiring a separate package). The command-line flags map closely enough (`ss -tulpn` roughly mirrors `netstat -tulpn`) that switching is a small adjustment, and it's worth making since `netstat`'s continued familiarity is mostly inertia at this point rather than any functional advantage over `ss`.
