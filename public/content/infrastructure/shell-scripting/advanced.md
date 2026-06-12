# Shell Scripting — Advanced

## Advanced Process Management

```bash
#!/bin/bash
set -euo pipefail

# Named pipes (FIFOs) — communicate between processes
mkfifo /tmp/mypipe
producer() { echo "data1"; echo "data2"; } > /tmp/mypipe &
consumer() { while read line; do process "$line"; done; } < /tmp/mypipe
wait

# Process substitution — treat command output as file
diff <(ssh server1 'cat /etc/passwd') <(ssh server2 'cat /etc/passwd')
comm -13 <(sort list1.txt) <(sort list2.txt)  # Lines only in list2

# Parallel execution with job control
MAX_JOBS=4
for server in "${servers[@]}"; do
    # Wait if too many jobs running
    while [[ $(jobs -r | wc -l) -ge $MAX_JOBS ]]; do
        sleep 0.5
    done
    deploy_to_server "$server" &
done
wait   # Wait for all background jobs

# Timeout with cleanup
run_with_timeout() {
    local timeout="$1"; shift
    "$@" &
    local pid=$!
    (sleep "$timeout"; kill "$pid" 2>/dev/null) &
    local watcher=$!
    wait "$pid"
    local status=$?
    kill "$watcher" 2>/dev/null
    return $status
}
run_with_timeout 30 ./long-running-script.sh
```

## Advanced Text Processing

```bash
# Multi-file sed operations
find . -name "*.conf" -exec sed -i 's/old_host/new_host/g' {} \;

# Awk for complex log analysis
# Find top 10 slowest API endpoints from nginx logs
awk '
    /GET|POST/ {
        split($7, path, "?")   # URL without query params
        total[path[1]] += $NF  # Last field = response time
        count[path[1]]++
    }
    END {
        for (path in total) {
            printf "%.3f %s %d\n", total[path]/count[path], path, count[path]
        }
    }
' /var/log/nginx/access.log | sort -rn | head -10

# Parse JSON in bash (with jq)
RESPONSE=$(curl -s https://api.example.com/data)
echo "$RESPONSE" | jq -r '.items[] | "\(.name) \(.status)"'

# Build JSON in bash
build_payload() {
    local name="$1" env="$2" version="$3"
    jq -n \
        --arg name "$name" \
        --arg env "$env" \
        --arg version "$version" \
        '{name: $name, environment: $env, version: $version, timestamp: now}'
}
curl -X POST https://api.example.com/deploy \
    -H "Content-Type: application/json" \
    -d "$(build_payload myapp prod 1.2.3)"
```

## Configuration Management Scripts

```bash
#!/bin/bash
# Production-grade configuration script

set -euo pipefail

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly LOG_FILE="/var/log/configure-$(date +%Y%m%d-%H%M%S).log"
readonly LOCK_FILE="/tmp/configure.lock"

# Logging
log()  { echo "[$(date '+%H:%M:%S')] INFO  $*" | tee -a "$LOG_FILE"; }
warn() { echo "[$(date '+%H:%M:%S')] WARN  $*" | tee -a "$LOG_FILE" >&2; }
die()  { echo "[$(date '+%H:%M:%S')] ERROR $*" | tee -a "$LOG_FILE" >&2; exit 1; }

# Exclusive lock (prevent concurrent runs)
exec 9>"$LOCK_FILE"
flock -n 9 || die "Another instance is already running"

# Cleanup on exit
cleanup() {
    flock -u 9
    rm -f "$LOCK_FILE"
    log "Cleanup complete"
}
trap cleanup EXIT

# Idempotent file operations
ensure_line() {
    local file="$1" line="$2"
    grep -qF "$line" "$file" || echo "$line" >> "$file"
}

backup_and_replace() {
    local file="$1" content="$2"
    [[ -f "$file" ]] && cp "$file" "${file}.bak.$(date +%s)"
    echo "$content" > "$file"
}

# Rollback capability
ROLLBACK_ACTIONS=()
add_rollback() { ROLLBACK_ACTIONS+=("$1"); }
rollback() {
    warn "Rolling back..."
    for ((i=${#ROLLBACK_ACTIONS[@]}-1; i>=0; i--)); do
        eval "${ROLLBACK_ACTIONS[$i]}" || warn "Rollback step failed: ${ROLLBACK_ACTIONS[$i]}"
    done
}
trap rollback ERR

# Main logic
log "Starting configuration"
install_package nginx && add_rollback "apt remove -y nginx"
configure_nginx && add_rollback "cp /etc/nginx/nginx.conf.bak /etc/nginx/nginx.conf"
systemctl reload nginx && add_rollback "systemctl restart nginx"
log "Configuration complete"
```
