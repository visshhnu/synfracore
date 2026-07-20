# Linux — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production Linux incidents industry-wide, not one specific traceable company's incident.

---

## Scenario 1: The disk that filled up from a log nobody was watching

**The pattern:** A production server starts returning intermittent 500 errors. The application logs show nothing unusual at first glance — until someone runs `df -h` and finds the root filesystem at 100%. Digging further with `du -sh /var/log/*` reveals one specific service's log file has grown to 40GB, because a recent code change started logging every request body in full (including large file uploads) without anyone realizing the volume implication, and log rotation was never configured for that particular service's log path.

**Why this is a genuinely common failure, not just an oversight:** disk usage grows silently and gradually — unlike CPU or memory pressure, which usually produces some visible symptom (slowness, OOM kills) before it becomes critical, a filling disk often gives no warning at all until the exact moment it hits 100% and everything relying on writing to that filesystem starts failing at once. A logging change that seems harmless in code review ("let's log the request body for debugging") can have a completely non-obvious storage cost that only shows up under real production traffic volume.

**What actually prevents this:**
- **Monitor disk usage trend, not just current percentage** — an alert firing at "80% full" is much less useful than one firing on "growing at a rate that will hit 100% within 24 hours," which catches the problem while there's still time to intervene calmly rather than during an active outage.
- **Configure log rotation as a default for any new service, not an opt-in step someone has to remember** — `/etc/logrotate.d/` entries should be part of a service's initial deployment checklist, not something added reactively after the first incident.
- **Check inode usage separately from disk space** (`df -i`) — a filesystem can run out of inodes (typically from an enormous number of small files) while still showing available space by byte count, which is a genuinely different failure mode that the same `df -h` check won't catch.

---

## Scenario 2: The zombie processes that were a symptom, not the disease

**The pattern:** A monitoring alert fires on "zombie process count > 50" for a specific application server. An engineer, following the standard fix (signal the parent to reap its children, or kill the parent if it's stuck), clears the zombies — and they reappear within the hour, climbing steadily again. The zombies keep coming back because the actual root cause is a bug in the application's own child-process-spawning logic: it forks a subprocess per incoming request but has a code path (specifically, requests that time out) where it never calls `wait()` on the child it spawned.

**Why treating the symptom didn't fix anything:** zombie processes are, individually, essentially harmless — they're not consuming meaningful CPU or memory, just a process table slot. The alert threshold existed as a proxy for "something in the application isn't cleanly managing its child processes," and clearing zombies as they appear treats the visible symptom while the actual defect (the missing `wait()` call on a specific code path) keeps generating new ones indefinitely. This is a genuinely common shape of production incident: the "fix" that makes an alert go quiet isn't always the fix that addresses why the alert fired in the first place.

**What actually addresses this:**
- **Trace zombies back to their parent process and ask what code path is failing to reap them** (`ps -ef` and check the `PPID` column) rather than just clearing them — a rising, recurring zombie count is a leading indicator of an application bug, not something to treat as routine cleanup.
- **In this specific case, the actual fix lives in application code** (properly handling the timeout code path to still call `wait()`/`waitpid()` regardless of how the child request concluded) — no OS-level Linux administration step actually fixes a bug in how the application manages its own child processes; the OS-level tools are for diagnosis, not remediation, in this particular failure mode.
- **A monitoring threshold that keeps firing after being "fixed" the same way repeatedly is itself a signal** worth escalating past the standard runbook response, rather than continuing to apply the same temporary fix indefinitely.

---

## Scenario 3: The script that worked in testing and deleted the wrong thing in production

**The pattern:** A cleanup script intended to remove old temporary files uses `rm -rf "$TEMP_DIR"/*` where `$TEMP_DIR` is supposed to be set by an earlier line in the script. In testing, `$TEMP_DIR` was always set correctly because the engineer always ran the script manually, with the environment already configured. In production, the script is invoked by a cron job under a slightly different environment where the variable that sets `$TEMP_DIR` wasn't exported the way the script assumed — `$TEMP_DIR` is empty, and `rm -rf ""/*` (effectively `rm -rf /*` after the shell's own expansion) starts deleting far more than intended before someone notices and kills the process.

**Why this specific failure mode is so consistently dangerous:** this is exactly the pattern the Intermediate tab warns about with unquoted, unvalidated variables in destructive commands — the script "worked" in every test run specifically because the untested condition (the variable being unexpectedly empty) never occurred during manual testing, only under the different environment a cron job actually runs with. A destructive command that's only ever been tested under conditions where its inputs are guaranteed valid hasn't actually been tested against its most dangerous failure mode.

**What actually prevents this:**
- **Guard destructive commands with an explicit check that critical variables are actually set and non-empty**, using Bash's own built-in mechanism for this: `"${TEMP_DIR:?TEMP_DIR must be set}"` causes the script to fail loudly with a clear error the moment the variable is unset or empty, rather than silently proceeding with a dangerous, unintended expansion.
- **Test scripts under the actual environment they'll run in**, not just an interactive shell — a cron job's environment is meaningfully different (minimal `$PATH`, no `.bashrc` sourced, potentially missing variables the interactive shell had) from testing a script by hand, which is exactly the gap this specific incident falls through.
- **`set -u`** (part of the `set -euo pipefail` combination recommended as standard in the Intermediate tab) would have caught this specific failure immediately — an unset variable reference would cause the script to exit with an error rather than silently expanding to an empty string. This is a concrete, specific example of why that flag combination is recommended as a default rather than a situational choice.
