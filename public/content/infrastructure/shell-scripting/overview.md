# Shell Scripting — Bash Automation for DevOps

Shell scripting is the glue of DevOps. Every deployment script, health check, log rotation, backup job, and automation pipeline uses Bash. Mastering it means automating anything in Linux.

## Why Shell Scripting?

- **Pre-installed everywhere** — bash is on every Linux server, container, CI runner
- **No dependencies** — no Python, no Node.js needed
- **Direct OS access** — files, processes, networks, cron, systemd
- **CI/CD foundation** — GitHub Actions, Jenkins, and every pipeline runs shell commands
- **Fast to write** — 5 lines of bash replaces 50 lines of any other language for file ops

## Script Structure & Best Practices

```bash
#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────
# deploy.sh — Deploy application to Kubernetes
# Usage: ./deploy.sh <environment> <image-tag>
# Author: DevOps Team
# ─────────────────────────────────────────────────────────

# Exit on error, undefined vars, pipe failures — ALWAYS set these
set -euo pipefail

# Constants
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly TIMESTAMP=$(date +%Y%m%d_%H%M%S)
readonly LOG_FILE="/var/log/deploy_${TIMESTAMP}.log"

# Colors for output
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'

# Logging functions
log()    { echo -e "${GREEN}[$(date +'%H:%M:%S')]${NC} $*" | tee -a "$LOG_FILE"; }
warn()   { echo -e "${YELLOW}[WARN]${NC} $*" | tee -a "$LOG_FILE" >&2; }
error()  { echo -e "${RED}[ERROR]${NC} $*" | tee -a "$LOG_FILE" >&2; exit 1; }

# Validate arguments
[[ $# -lt 2 ]] && error "Usage: $0 <environment> <image-tag>"

ENVIRONMENT="$1"
IMAGE_TAG="$2"

[[ "$ENVIRONMENT" =~ ^(dev|staging|prod)$ ]] || error "Environment must be: dev, staging, prod"

log "Starting deployment: env=$ENVIRONMENT tag=$IMAGE_TAG"
```

## Variables, Arrays & String Operations

```bash
# Variables
NAME="SynfraCore"
VERSION=1.5
IS_PROD=true

# String operations
echo "${NAME,,}"           # lowercase: synfracore
echo "${NAME^^}"           # uppercase: SYNFRACORE
echo "${NAME:0:5}"         # substring: Synfr
echo "${NAME/Core/Base}"   # replace: SynfraBase
echo "${#NAME}"            # length: 10

# Default values
PORT="${PORT:-8080}"       # Use 8080 if PORT not set
NAME="${1:-default}"       # Use first arg or "default"

# Arrays
SERVERS=("web01" "web02" "web03")
echo "${SERVERS[0]}"       # First element
echo "${SERVERS[@]}"       # All elements
echo "${#SERVERS[@]}"      # Count: 3
SERVERS+=("web04")         # Append

# Associative arrays (bash 4+)
declare -A CONFIG
CONFIG[host]="localhost"
CONFIG[port]="5432"
CONFIG[db]="myapp"
echo "${CONFIG[host]}"
for key in "${!CONFIG[@]}"; do echo "$key = ${CONFIG[$key]}"; done

# Command substitution
CURRENT_DATE=$(date +%Y-%m-%d)
RUNNING_PODS=$(kubectl get pods --no-headers | wc -l)
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')
```

## Conditionals & Comparisons

```bash
# File/directory checks
[[ -f "/etc/config.yaml" ]]  && echo "File exists"
[[ -d "/var/log/app" ]]      && echo "Dir exists"
[[ -r "/etc/secret" ]]       && echo "Readable"
[[ -x "/usr/bin/kubectl" ]]  && echo "Executable"
[[ -s "/var/log/app.log" ]]  && echo "Non-empty"

# String comparisons
[[ "$ENV" == "production" ]]  && echo "Prod!"
[[ "$ENV" != "dev" ]]         && echo "Not dev"
[[ -z "$API_KEY" ]]           && error "API_KEY is required"
[[ -n "$API_KEY" ]]           && echo "API key set"
[[ "$VAR" =~ ^[0-9]+$ ]]     && echo "Is a number"

# Numeric comparisons
[[ $COUNT -gt 10 ]]   && echo "More than 10"
[[ $COUNT -eq 0 ]]    && echo "Zero"
[[ $COUNT -lt 100 ]]  && echo "Less than 100"

# if/elif/else
if [[ "$ENVIRONMENT" == "prod" ]]; then
    REPLICAS=5
    MEMORY="2Gi"
elif [[ "$ENVIRONMENT" == "staging" ]]; then
    REPLICAS=2
    MEMORY="1Gi"
else
    REPLICAS=1
    MEMORY="512Mi"
fi

# Case statement
case "$1" in
    start)   systemctl start myapp ;;
    stop)    systemctl stop myapp  ;;
    restart) systemctl restart myapp ;;
    status)  systemctl status myapp ;;
    *)       error "Usage: $0 {start|stop|restart|status}" ;;
esac
```

## Loops

```bash
# For loop - list
for server in web01 web02 web03; do
    echo "Checking $server..."
    ssh "$server" 'systemctl status nginx' || warn "$server nginx is down"
done

# For loop - array
NAMESPACES=("dev" "staging" "production")
for ns in "${NAMESPACES[@]}"; do
    kubectl get pods -n "$ns" --no-headers | wc -l
done

# For loop - range
for i in $(seq 1 10); do
    echo "Attempt $i/10..."
    curl -sf http://localhost:8080/health && break
    sleep 5
done

# While loop
ATTEMPTS=0
MAX_ATTEMPTS=30
until kubectl get deployment myapp -o jsonpath='{.status.readyReplicas}' | grep -q "^3$"; do
    ATTEMPTS=$((ATTEMPTS + 1))
    [[ $ATTEMPTS -ge $MAX_ATTEMPTS ]] && error "Deployment timed out"
    echo "Waiting... ($ATTEMPTS/$MAX_ATTEMPTS)"
    sleep 10
done
echo "Deployment ready!"

# Read file line by line
while IFS= read -r line; do
    [[ "$line" =~ ^#.*$ ]] && continue  # Skip comments
    [[ -z "$line" ]]       && continue  # Skip empty lines
    echo "Processing: $line"
done < servers.txt

# Process output
kubectl get pods -A --no-headers | while read -r ns pod ready _ _; do
    echo "Namespace: $ns | Pod: $pod | Ready: $ready"
done
```

## Functions

```bash
# Function definition
check_dependency() {
    local cmd="$1"
    local install_hint="${2:-}"
    if ! command -v "$cmd" &>/dev/null; then
        error "Required: $cmd not found.${install_hint:+ Install: $install_hint}"
    fi
    log "✓ $cmd found: $(command -v "$cmd")"
}

# Function with return value
get_pod_count() {
    local namespace="$1"
    local app="$2"
    kubectl get pods -n "$namespace" -l "app=$app" --no-headers 2>/dev/null | wc -l
}

# Usage
check_dependency "kubectl" "brew install kubectl"
check_dependency "helm"    "brew install helm"
check_dependency "aws"     "pip install awscli"

COUNT=$(get_pod_count "production" "myapp")
echo "Running pods: $COUNT"

# Retry function
retry() {
    local attempts="$1"
    local delay="$2"
    shift 2
    local cmd=("$@")
    
    for ((i=1; i<=attempts; i++)); do
        if "${cmd[@]}"; then
            return 0
        fi
        echo "Attempt $i/$attempts failed. Retrying in ${delay}s..."
        sleep "$delay"
    done
    return 1
}

# Usage: retry 5 10 curl -sf https://api.example.com/health
```

## Real DevOps Scripts

```bash
# Health check with alerting
#!/usr/bin/env bash
set -euo pipefail

SERVICES=("https://api.myapp.com/health" "https://www.myapp.com" "https://auth.myapp.com/ping")
SLACK_WEBHOOK="${SLACK_WEBHOOK_URL:-}"
FAILED=0

check_service() {
    local url="$1"
    local response_time
    response_time=$(curl -o /dev/null -s -w "%{time_total}" --max-time 10 "$url" 2>/dev/null) || {
        echo "FAIL: $url (connection failed)"
        return 1
    }
    local http_code
    http_code=$(curl -o /dev/null -s -w "%{http_code}" --max-time 10 "$url" 2>/dev/null)
    if [[ "$http_code" -ge 200 && "$http_code" -lt 300 ]]; then
        echo "OK: $url (${response_time}s)"
    else
        echo "FAIL: $url (HTTP $http_code)"
        return 1
    fi
}

for svc in "${SERVICES[@]}"; do
    check_service "$svc" || FAILED=$((FAILED + 1))
done

if [[ $FAILED -gt 0 ]]; then
    [[ -n "$SLACK_WEBHOOK" ]] && \
    curl -s -X POST "$SLACK_WEBHOOK" \
         -H "Content-Type: application/json" \
         -d "{\"text\":\"🔴 $FAILED service(s) unhealthy! Check dashboard.\"}"
    exit 1
fi
echo "✅ All services healthy"
```

```bash
# Log rotation + archive script
#!/usr/bin/env bash
set -euo pipefail

LOG_DIR="/var/log/myapp"
ARCHIVE_DIR="/backup/logs"
RETENTION_DAYS=7

find "$LOG_DIR" -name "*.log" -mtime +1 | while read -r logfile; do
    filename=$(basename "$logfile")
    date_suffix=$(date +%Y%m%d)
    archive_name="${filename%.log}_${date_suffix}.log.gz"
    
    gzip -c "$logfile" > "${ARCHIVE_DIR}/${archive_name}"
    truncate -s 0 "$logfile"  # Clear without breaking file handles
    echo "Archived: $archive_name"
done

# Remove old archives
find "$ARCHIVE_DIR" -name "*.log.gz" -mtime +"$RETENTION_DAYS" -delete
echo "Cleaned archives older than $RETENTION_DAYS days"
```

## Interview Questions

**What does `set -euo pipefail` mean?**
`-e` exits immediately if any command returns non-zero exit code. `-u` treats unset variables as errors. `-o pipefail` makes pipelines fail if any command in the pipe fails (without this, `false | true` returns 0). Together they make scripts fail loudly on errors instead of silently continuing. Always put this at the top of every script.

**What is the difference between `$()` and backticks?**
Both capture command output, but `$()` is strongly preferred: it's readable, nestable (`$(echo $(date))`), and handles quotes correctly. Backticks are legacy syntax that can't be easily nested and handle escaping poorly. Always use `$()`.

**How do you safely handle spaces in filenames?**
Always quote variables: `"$filename"` not `$filename`. Use `find ... -print0 | xargs -0` for filenames with spaces in pipelines. Use `IFS= read -r line` when reading files line by line. The single most common bash bug is unquoted variables failing on filenames with spaces.
