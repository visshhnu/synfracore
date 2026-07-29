# Shell Scripting — PYQ (Previously Asked / Practice Questions)

**Framing note:** As this course's own certification guide states, there is no dedicated "Shell Scripting" certification exam — so there's no literal past-paper archive to draw from here, unlike GATE/JEE/banking-exam subjects elsewhere on this platform. What follows instead are practical, task-based questions in the style actually used by the certifications and screening processes that *do* test shell scripting directly: **RHCSA (EX200)**, **LFCS**, and **AWS SysOps**, plus the kind of live "write this script" tasks common in DevOps technical screens. Each is a genuine, verifiable task type from those formats, not an invented "exam question."

---

### 1. (RHCSA/LFCS-style) Write a script that takes a directory as an argument and reports the 5 largest files in it.

```bash
#!/usr/bin/env bash
set -euo pipefail

DIR="${1:?Usage: $0 <directory>}"
[[ -d "$DIR" ]] || { echo "ERROR: $DIR is not a directory" >&2; exit 1; }

find "$DIR" -maxdepth 1 -type f -printf '%s %p\n' | sort -rn | head -5 | \
    awk '{printf "%.2f MB  %s\n", $1/1024/1024, $2}'
```
**What's being tested:** `find` with `-printf` for size + path, numeric `sort`, and basic `awk` formatting — a very common RHCSA-style "find and report" task.

---

### 2. (LFCS-style) Write a script that checks whether a systemd service is active, and restarts it if not.

```bash
#!/usr/bin/env bash
set -euo pipefail

SERVICE="${1:?Usage: $0 <service-name>}"

if systemctl is-active --quiet "$SERVICE"; then
    echo "$SERVICE is already running"
else
    echo "$SERVICE is down — restarting"
    systemctl restart "$SERVICE"
    sleep 2
    systemctl is-active --quiet "$SERVICE" && echo "Restart successful" || { echo "Restart FAILED" >&2; exit 1; }
fi
```
**What's being tested:** `systemctl is-active --quiet` as a scriptable exit-code check (rather than parsing text output), and verifying the fix actually worked instead of assuming it did.

---

### 3. (AWS SysOps-style) Write a script that reports EC2 instances above a given CPU threshold using the AWS CLI.

```bash
#!/usr/bin/env bash
set -euo pipefail

THRESHOLD="${1:-80}"
INSTANCE_ID="${2:?Usage: $0 <threshold> <instance-id>}"

# query.json — verified against AWS's GetMetricData CLI reference
cat > query.json <<EOF
[
  {
    "Id": "cpu1",
    "MetricStat": {
      "Metric": {
        "Namespace": "AWS/EC2",
        "MetricName": "CPUUtilization",
        "Dimensions": [{"Name": "InstanceId", "Value": "${INSTANCE_ID}"}]
      },
      "Period": 300,
      "Stat": "Average"
    },
    "ReturnData": true
  }
]
EOF

aws cloudwatch get-metric-data \
    --metric-data-queries file://query.json \
    --start-time "$(date -u -d '-15 minutes' +%FT%TZ)" \
    --end-time "$(date -u +%FT%TZ)" \
    --scan-by TimestampDescending \
    --output json | \
jq -r --argjson t "$THRESHOLD" \
    '.MetricDataResults[] | select((.Values[0] // 0) > $t) | "\(.Id): \(.Values[0])% CPU"'
```
**Verified:** the `MetricDataQuery` shape (`Id`, `MetricStat.Metric.Namespace/MetricName/Dimensions`, `Period`, `Stat`, `ReturnData`) and the `file://query.json` invocation pattern match AWS's current `GetMetricData` CLI reference and AWS re:Post's own worked example. `--scan-by TimestampDescending` is added deliberately — without it, the order of `Values`/`Timestamps` in the response isn't guaranteed, so indexing `Values[0]` to mean "most recent" would otherwise be an assumption rather than a guarantee. One thing still worth double-checking per-account: `Period: 300` (5 minutes) must be a valid granularity for however far back `--start-time` reaches — AWS enforces coarser minimum periods the further back you query (finer than 1-minute periods only work within the last 3 hours, for example), so this exact `Period` value may need adjusting if you widen the time window.

---

### 4. (RHCSA-style) Write a script that adds a line to `/etc/hosts` only if it isn't already present (idempotent).

```bash
#!/usr/bin/env bash
set -euo pipefail

IP="${1:?Usage: $0 <ip> <hostname>}"
HOST="${2:?Usage: $0 <ip> <hostname>}"
ENTRY="${IP} ${HOST}"

if grep -qF "$ENTRY" /etc/hosts; then
    echo "Entry already present, skipping"
else
    echo "$ENTRY" | sudo tee -a /etc/hosts >/dev/null
    echo "Added: $ENTRY"
fi
```
**What's being tested:** idempotency — a script that's safe to run twice without duplicating the line. `grep -qF` (fixed-string, quiet) is the correct tool here rather than a fragile regex match.

---

### 5. (Common technical-screen task) Given a log file, print the count of each unique HTTP status code.

```bash
awk '{print $9}' access.log | sort | uniq -c | sort -rn
```
**What's being tested:** whether the candidate knows nginx/Apache common log format places the status code as roughly the 9th whitespace-delimited field, and the standard `sort | uniq -c | sort -rn` idiom for frequency counting. **Caveat:** the exact field number depends on the log format string configured on that server — this is correct for the default combined log format, but a customized `log_format` directive could shift it. A more robust real-world version would extract by pattern rather than fixed field position.

---

### 6. (LFCS-style) Write a one-liner to find and delete files older than 30 days in `/tmp`, safely (no accidental deletion of directories).

```bash
find /tmp -type f -mtime +30 -print0 | xargs -0 --no-run-if-empty rm -v
```
**What's being tested:** `-type f` to avoid touching directories, `-print0`/`xargs -0` to handle filenames with spaces safely, and `--no-run-if-empty` so `rm` isn't invoked with zero arguments (which would otherwise error, or worse, misbehave depending on shell quoting).

---

### 7. (RHCSA-style) Write a script that validates all required environment variables are set before proceeding.

```bash
#!/usr/bin/env bash
set -euo pipefail

REQUIRED_VARS=(APP_ENV DB_HOST DB_PASSWORD API_KEY)
MISSING=()

for var in "${REQUIRED_VARS[@]}"; do
    [[ -z "${!var:-}" ]] && MISSING+=("$var")
done

if [[ ${#MISSING[@]} -gt 0 ]]; then
    echo "ERROR: missing required variables: ${MISSING[*]}" >&2
    exit 1
fi
echo "All required variables present"
```
**What's being tested:** indirect variable expansion (`${!var}`) to check a variable whose *name* is itself stored in another variable — a pattern that trips up a lot of candidates who haven't used it before.

---

### 8. (Common technical-screen task) Write a script that tails a log and sends an alert the moment a `CRITICAL` line appears, without polling in a tight loop.

```bash
#!/usr/bin/env bash
set -euo pipefail

LOG="${1:?Usage: $0 <logfile>}"
WEBHOOK="${SLACK_WEBHOOK_URL:?SLACK_WEBHOOK_URL must be set}"

tail -F "$LOG" | while IFS= read -r line; do
    if [[ "$line" == *CRITICAL* ]]; then
        curl -s -X POST "$WEBHOOK" \
            -H 'Content-Type: application/json' \
            -d "{\"text\":\"🔴 CRITICAL: ${line}\"}"
    fi
done
```
**What's being tested:** `tail -F` (capital F — follows the file even if it's rotated/truncated, unlike lowercase `-f`) combined with a blocking `read` loop instead of a `sleep`-based polling loop, so the alert fires immediately rather than up to N seconds late.

---

### 9. (RHCSA-style) Write a script that reports which of a list of required commands are missing from the system.

```bash
#!/usr/bin/env bash
set -euo pipefail

REQUIRED=(git curl jq awk sed docker kubectl)
MISSING=()

for cmd in "${REQUIRED[@]}"; do
    command -v "$cmd" &>/dev/null || MISSING+=("$cmd")
done

if [[ ${#MISSING[@]} -eq 0 ]]; then
    echo "All required tools are installed"
else
    echo "Missing: ${MISSING[*]}"
    exit 1
fi
```
**What's being tested:** the same `command -v` existence check pattern from the Quiz Blocks section, applied across a whole list rather than a single tool — this exact task (dependency preflight checks) shows up constantly in real deploy scripts, which is why it's tested so often.

---

### 10. (AWS SysOps-style) Write a script to rotate an application's log file once it exceeds 100MB, without losing in-flight writes.

```bash
#!/usr/bin/env bash
set -euo pipefail

LOG_FILE="/var/log/myapp/app.log"
MAX_SIZE_BYTES=$((100 * 1024 * 1024))

SIZE=$(stat -c%s "$LOG_FILE" 2>/dev/null || echo 0)
if (( SIZE > MAX_SIZE_BYTES )); then
    mv "$LOG_FILE" "${LOG_FILE}.$(date +%Y%m%d%H%M%S)"
    # Signal the app to reopen its log file handle rather than restarting it.
    # The correct signal is application-specific — see the verified note below.
    [[ -f /run/myapp.pid ]] && kill -HUP "$(cat /run/myapp.pid)"
    gzip "${LOG_FILE}".*
fi
```
**Correction from an earlier draft of this answer:** I originally cited nginx as an example of a daemon that uses `SIGHUP` to reopen log files after rotation. Checked against current nginx and logrotate documentation, and that was wrong: **nginx's actual dedicated log-reopen signal is `SIGUSR1`** (`kill -USR1 $(cat /run/nginx.pid)`, exactly as used in its official `logrotate.d` postrotate script). `SIGHUP` on nginx triggers a full configuration reload, which reopens logs only as a side effect — heavier than necessary if a log reopen is all you need, and the wrong signal to reach for specifically.

`SIGHUP` genuinely is the standard reopen/reload convention for **rsyslog** and many other traditional Unix daemons, and it's a reasonable default guess for a custom in-house app (`myapp` above) that follows that older convention — but the corrected, honest takeaway is: **the signal is application-specific, and nginx is the wrong example to cite for `SIGHUP`.** Always confirm against that specific application's own docs (or its packaged `logrotate.d` file, if one ships with it) rather than assuming one signal convention applies universally.
