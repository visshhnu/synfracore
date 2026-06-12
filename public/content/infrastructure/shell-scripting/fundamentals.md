# Shell Scripting — Fundamentals

## Bash Basics

```bash
#!/bin/bash
# Shebang line — which interpreter to use
# Always use: #!/bin/bash (explicit) or #!/usr/bin/env bash (portable)

# Variables
name="Alice"           # No spaces around =
echo "Hello, $name"    # Double quotes expand variables
echo 'Hello, $name'    # Single quotes are literal
echo "Path: ${PATH}"   # Braces for clarity in complex strings

# Read user input
read -p "Enter your name: " username
read -sp "Password: " password  # -s = silent (no echo)

# Command substitution
current_date=$(date +%Y-%m-%d)
file_count=$(ls -1 | wc -l)
echo "Today: $current_date, Files: $file_count"

# Arithmetic
count=5
echo $((count + 3))    # 8
echo $((count * 2))    # 10
let "total = count * 100"
total=$((total / 100 + 1))
```

## Conditionals

```bash
# File tests
if [[ -f /etc/passwd ]]; then echo "File exists"; fi
if [[ -d /tmp ]]; then echo "Directory exists"; fi
if [[ -r file.txt ]]; then echo "Readable"; fi
if [[ -z "$var" ]]; then echo "Variable is empty"; fi
if [[ -n "$var" ]]; then echo "Variable is not empty"; fi

# String comparison
if [[ "$env" == "production" ]]; then
    echo "Production!"
elif [[ "$env" == "staging" ]]; then
    echo "Staging"
else
    echo "Unknown environment: $env"
fi

# Numeric comparison
if [[ $count -gt 10 ]]; then echo "More than 10"; fi
if [[ $count -eq 0 ]]; then echo "Zero"; fi
# -eq -ne -lt -le -gt -ge

# Regex match
if [[ "$email" =~ ^[a-z]+@[a-z]+\.[a-z]+$ ]]; then
    echo "Valid email"
fi

# Logical operators
if [[ -f file.txt && -r file.txt ]]; then echo "Readable file"; fi
if [[ "$mode" == "dev" || "$mode" == "debug" ]]; then echo "Debug mode"; fi
```

## Loops

```bash
# for loop — iterate over list
for fruit in apple banana mango; do
    echo "Fruit: $fruit"
done

# for loop — C-style
for ((i=1; i<=5; i++)); do
    echo "Count: $i"
done

# for loop — files
for file in /var/log/*.log; do
    echo "Processing: $file"
    gzip "$file"
done

# while loop
count=0
while [[ $count -lt 5 ]]; do
    echo "Count: $count"
    ((count++))
done

# Read file line by line
while IFS= read -r line; do
    echo "Line: $line"
done < /etc/hosts

# Process command output
while IFS= read -r pod; do
    echo "Deleting: $pod"
    kubectl delete pod "$pod"
done < <(kubectl get pods -o name | grep "Error")
```

## Functions

```bash
# Define function
greet() {
    local name="$1"      # local = scoped to function
    local greeting="${2:-Hello}"  # default value if $2 not set
    echo "$greeting, $name!"
    return 0             # return exit code (0=success, 1-255=error)
}

# Call function
greet "Alice"            # Hello, Alice!
greet "Bob" "Hi"         # Hi, Bob!

# Capture return value
result=$(greet "Charlie")
echo "Result: $result"

# Function with error handling
check_service() {
    local service="$1"
    if systemctl is-active --quiet "$service"; then
        echo "$service is running"
        return 0
    else
        echo "ERROR: $service is not running" >&2  # stderr
        return 1
    fi
}

check_service nginx || exit 1
```

## Error Handling — Production Patterns

```bash
#!/bin/bash
set -euo pipefail
# -e: exit on any error
# -u: error on undefined variables
# -o pipefail: pipe fails if any command fails

# Trap for cleanup on exit
cleanup() {
    echo "Cleaning up..."
    rm -f /tmp/deploy_lock
}
trap cleanup EXIT
trap 'echo "Error on line $LINENO"' ERR

# Safe variable defaults
DB_HOST="${DB_HOST:-localhost}"
DB_PORT="${DB_PORT:-5432}"
TIMEOUT="${TIMEOUT:-30}"

# Check required variables
for var in APP_ENV DB_PASSWORD AWS_REGION; do
    if [[ -z "${!var}" ]]; then
        echo "ERROR: $var is not set" >&2
        exit 1
    fi
done

# Retry logic
retry() {
    local max="$1"; shift
    local delay="$2"; shift
    local cmd=("$@")
    for ((i=1; i<=max; i++)); do
        "${cmd[@]}" && return 0
        echo "Attempt $i/$max failed, retrying in ${delay}s..."
        sleep "$delay"
    done
    echo "All $max attempts failed" >&2
    return 1
}

retry 3 5 curl -f https://healthcheck.example.com
```

## Text Processing

```bash
# grep — search
grep "ERROR" /var/log/app.log
grep -i "error" file.txt        # case insensitive
grep -n "ERROR" file.txt        # show line numbers
grep -r "TODO" ./src/           # recursive
grep -v "DEBUG" app.log         # invert (exclude DEBUG)
grep -E "ERROR|WARN" app.log    # extended regex
grep -c "ERROR" app.log         # count matches

# sed — stream editor
sed 's/old/new/g' file.txt              # replace all
sed -i 's/localhost/db.prod.com/g' config.yml  # in-place
sed -n '10,20p' file.txt                # print lines 10-20
sed '/^#/d' config.conf                 # delete comment lines

# awk — field processing
awk '{print $1}' file.txt              # first field
awk -F: '{print $1}' /etc/passwd       # colon delimiter, first field
awk '{sum += $3} END {print sum}' data.txt  # sum column 3
awk '$3 > 100 {print $1, $3}' data.txt     # filter and print

# Practical: Parse nginx access log
awk '{print $9}' /var/log/nginx/access.log | sort | uniq -c | sort -rn
# Counts HTTP status codes: 200, 404, 500...

# cut, sort, uniq
cut -d',' -f1,3 data.csv          # columns 1 and 3 of CSV
sort -k2 -n file.txt              # sort by 2nd field numerically
sort -u file.txt                   # sort + unique
uniq -c sorted.txt                 # count consecutive duplicates
```
