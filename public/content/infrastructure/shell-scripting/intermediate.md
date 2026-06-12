# Shell Scripting — Intermediate

## Real-World Deployment Scripts

```bash
#!/bin/bash
set -euo pipefail

# Deployment script with rollback capability
DEPLOY_DIR="/opt/app"
BACKUP_DIR="/opt/app-backup"
NEW_VERSION="${1:?Usage: deploy.sh <version>}"
LOG_FILE="/var/log/deploy.log"

log() { echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"; }

check_prerequisites() {
    log "Checking prerequisites..."
    command -v docker >/dev/null 2>&1 || { log "ERROR: docker not found"; exit 1; }
    command -v kubectl >/dev/null 2>&1 || { log "ERROR: kubectl not found"; exit 1; }
    [[ "$(free -m | awk '/^Mem:/{print $7}')" -gt 512 ]] || { log "ERROR: Low memory"; exit 1; }
}

backup_current() {
    log "Backing up current version..."
    if [[ -d "$DEPLOY_DIR" ]]; then
        cp -r "$DEPLOY_DIR" "$BACKUP_DIR.$(date +%s)"
        ls -dt "$BACKUP_DIR"* | tail -n +4 | xargs rm -rf  # keep last 3 backups
    fi
}

deploy() {
    log "Deploying version $NEW_VERSION..."
    docker pull "myapp:$NEW_VERSION"
    kubectl set image deployment/myapp myapp="myapp:$NEW_VERSION"
    kubectl rollout status deployment/myapp --timeout=5m
}

healthcheck() {
    log "Running health check..."
    local max_retries=10
    for ((i=1; i<=max_retries; i++)); do
        if curl -sf http://localhost:8080/health >/dev/null; then
            log "Health check passed"
            return 0
        fi
        log "Health check $i/$max_retries failed, waiting..."
        sleep 10
    done
    return 1
}

rollback() {
    log "ROLLING BACK..."
    kubectl rollout undo deployment/myapp
    kubectl rollout status deployment/myapp
}

# Main execution
check_prerequisites
backup_current

if deploy && healthcheck; then
    log "Deployment of $NEW_VERSION successful!"
else
    log "Deployment failed, rolling back..."
    rollback
    exit 1
fi
```

## Process Management

```bash
# Background jobs
long_running_command &
PID=$!
echo "Started with PID: $PID"

# Wait for background job
wait $PID
echo "Exit code: $?"

# Run multiple jobs in parallel
pids=()
for server in web01 web02 web03; do
    ssh "$server" "sudo apt update && sudo apt upgrade -y" &
    pids+=($!)
done

# Wait for all and check results
failed=0
for pid in "${pids[@]}"; do
    wait "$pid" || ((failed++))
done
[[ $failed -eq 0 ]] || { echo "$failed servers failed"; exit 1; }

# Timeout a command
timeout 30 wget -q https://slow-site.com || echo "Download timed out"

# Run with lower priority
nice -n 19 backup_script.sh
ionice -c 3 rsync -av /data/ /backup/
```

## String Operations

```bash
# Parameter expansion
filename="report_2024-01-15.csv"
echo "${filename%.csv}"          # report_2024-01-15 (strip suffix)
echo "${filename##*.}"           # csv (extension only)
echo "${filename#report_}"       # 2024-01-15.csv (strip prefix)
echo "${filename^^}"             # REPORT_2024-01-15.CSV (uppercase)
echo "${filename,,}"             # report_2024-01-15.csv (lowercase)
echo "${filename/2024/2025}"     # report_2025-01-15.csv (replace first)
echo "${filename//2024/2025}"    # replace all occurrences

# Substrings
str="Hello, World!"
echo "${str:7}"      # World!
echo "${str:7:5}"    # World
echo "${str: -6}"    # World!

# Arrays
servers=("web01" "web02" "db01")
echo "${servers[0]}"             # web01
echo "${servers[@]}"             # all elements
echo "${#servers[@]}"            # count: 3
servers+=("cache01")             # append
unset servers[1]                 # remove element

# Associative arrays (bash 4+)
declare -A config
config[host]="localhost"
config[port]="5432"
config[db]="myapp"
echo "${config[host]}"
for key in "${!config[@]}"; do
    echo "$key = ${config[$key]}"
done
```

## Here Documents and Here Strings

```bash
# Heredoc — multiline string
cat > /etc/nginx/conf.d/app.conf << 'NGINX_EOF'
server {
    listen 80;
    server_name app.example.com;
    location / {
        proxy_pass http://localhost:3000;
        proxy_set_header Host $host;
    }
}
NGINX_EOF

# Heredoc with variable expansion (no quotes on delimiter)
cat > /opt/app/.env << ENV_EOF
DATABASE_URL=postgresql://${DB_USER}:${DB_PASS}@${DB_HOST}/app
REDIS_URL=redis://${REDIS_HOST}:6379
APP_ENV=${ENVIRONMENT}
ENV_EOF

# Pipe heredoc to command
psql -U postgres << SQL
CREATE DATABASE IF NOT EXISTS myapp;
CREATE USER appuser WITH PASSWORD 'secure123';
GRANT ALL ON DATABASE myapp TO appuser;
SQL

# Here string (single string)
grep "ERROR" <<< "$log_output"
```

## Logging and Monitoring Scripts

```bash
# Log rotation check script
check_disk_space() {
    local threshold=80
    while IFS= read -r line; do
        local usage mount
        usage=$(echo "$line" | awk '{print $5}' | tr -d '%')
        mount=$(echo "$line" | awk '{print $6}')
        if [[ $usage -gt $threshold ]]; then
            echo "ALERT: $mount is at ${usage}% (threshold: ${threshold}%)"
            # Send to Slack
            curl -s -X POST "$SLACK_WEBHOOK" \
                -H 'Content-type: application/json' \
                -d "{\"text\":\"Disk alert: $mount at ${usage}% on $(hostname)\"}"
        fi
    done < <(df -h | grep -E '^/dev/')
}

# Watch log for errors and alert
tail -F /var/log/app/error.log | while IFS= read -r line; do
    if echo "$line" | grep -qE "CRITICAL|FATAL|OOMKilled"; then
        echo "[ALERT] $(date): $line" >> /var/log/alerts.log
        send_alert "$line"
    fi
done &
```
