# Shell Scripting — Bash Automation for DevOps

## Why Shell Scripting for DevOps?

Bash is the universal automation language of Linux/Unix systems. Every server, container, and cloud instance runs Bash. DevOps engineers write shell scripts for:
- Deployment automation
- CI/CD pipeline steps
- System health checks and monitoring
- Log parsing and data transformation
- Backup and maintenance tasks
- Container entrypoint scripts

---

## Bash Fundamentals

### Variables
```bash
# Assignment — no spaces around =
name="synfracore"
count=10
readonly PI=3.14159    # constant

# Access with $
echo "Hello $name"
echo "Count is ${count}"   # braces are explicit — best practice

# Command substitution
today=$(date +%Y-%m-%d)
files=$(ls *.log | wc -l)
```

### Script Header (Best Practice)
```bash
#!/bin/bash
set -euo pipefail   # Exit on error (-e), unset variable (-u), pipe failure (-o pipefail)
IFS=$'\n\t'        # Internal Field Separator — safer splitting

# Usage function
usage() {
    echo "Usage: $0 <environment> <version>"
    echo "Example: $0 production v1.2.3"
    exit 1
}

# Check args
[ $# -lt 2 ] && usage
```

### Conditionals
```bash
# if/elif/else
if [ "$environment" = "production" ]; then
    echo "Deploying to production"
elif [ "$environment" = "staging" ]; then
    echo "Deploying to staging"
else
    echo "Unknown environment"
    exit 1
fi

# File/directory tests
[ -f /etc/nginx/nginx.conf ] && echo "nginx config exists"
[ -d /var/log/app ] || mkdir -p /var/log/app
[ -r /etc/secret ] && echo "readable"
[ -w /tmp ] && echo "writable"
[ -x /usr/local/bin/deploy ] && echo "executable"

# Arithmetic
if (( count > 10 )); then
    echo "Too many"
fi

# String tests
[[ -z "$var" ]] && echo "empty"    # -z = zero length
[[ -n "$var" ]] && echo "not empty"  # -n = non-zero length
[[ "$str" =~ ^v[0-9]+\..*$ ]] && echo "valid semver"  # regex match
```

### Loops
```bash
# For loop — list
for env in dev staging production; do
    echo "Deploying to $env"
done

# For loop — range
for i in {1..5}; do echo "Attempt $i"; done

# While loop
while ! kubectl rollout status deployment/myapp -n production; do
    echo "Waiting for rollout..."
    sleep 10
done

# Read lines from file
while IFS= read -r line; do
    echo "Processing: $line"
done < services.txt

# Loop with index
services=("web" "api" "worker")
for i in "${!services[@]}"; do
    echo "$i: ${services[$i]}"
done
```

### Functions
```bash
# Define
deploy_service() {
    local service=$1      # local = scoped to function
    local version=$2
    local namespace=${3:-production}  # default value

    echo "Deploying $service:$version to $namespace"
    helm upgrade --install "$service" ./charts/"$service" \
        --set image.tag="$version" -n "$namespace"
}

# Call
deploy_service "web" "v1.2.3"
deploy_service "api" "v1.2.3" "staging"
```

---

## Error Handling

```bash
# Check return code
kubectl apply -f manifest.yaml
if [ $? -ne 0 ]; then
    echo "ERROR: kubectl apply failed"
    exit 1
fi

# Or use || directly
kubectl apply -f manifest.yaml || { echo "Apply failed"; exit 1; }

# Trap for cleanup on exit
cleanup() {
    echo "Cleaning up..."
    rm -f /tmp/deploy_lock
}
trap cleanup EXIT    # runs on any exit

trap 'echo "Error on line $LINENO"; exit 1' ERR   # runs on any error
```

---

## Common DevOps Patterns

### Retry with Backoff
```bash
retry() {
    local max_attempts=5
    local delay=5
    local attempt=1

    while [ $attempt -le $max_attempts ]; do
        "$@" && return 0
        echo "Attempt $attempt/$max_attempts failed. Retrying in ${delay}s..."
        sleep $delay
        ((attempt++))
        ((delay *= 2))  # exponential backoff
    done

    echo "All $max_attempts attempts failed."
    return 1
}

# Usage
retry curl -f https://api.example.com/health
retry kubectl wait --for=condition=ready pod -l app=myapp --timeout=60s
```

### Health Check Script
```bash
#!/bin/bash
set -euo pipefail

ENDPOINT="${1:-http://localhost:8080/health}"
MAX_WAIT="${2:-120}"
INTERVAL=5
elapsed=0

echo "Waiting for $ENDPOINT to be healthy..."
while ! curl -sf "$ENDPOINT" > /dev/null 2>&1; do
    if [ $elapsed -ge $MAX_WAIT ]; then
        echo "TIMEOUT: Service not healthy after ${MAX_WAIT}s"
        exit 1
    fi
    sleep $INTERVAL
    elapsed=$((elapsed + INTERVAL))
    echo "  Waiting... ${elapsed}s elapsed"
done
echo "Service is healthy!"
```

### Log Parsing
```bash
# Count errors in last hour
grep "$(date -d '-1 hour' '+%Y-%m-%d %H')" app.log | grep -c ERROR

# Extract unique IPs from nginx logs
awk '{print $1}' /var/log/nginx/access.log | sort | uniq -c | sort -rn | head 20

# Find slow requests (> 1 second)
awk '$NF > 1.0 {print $0}' access.log | wc -l
```
