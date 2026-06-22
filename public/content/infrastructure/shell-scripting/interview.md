# Shell Scripting Interview Questions

## Core Concepts

**Q: What is the difference between `#!/bin/bash` and `#!/bin/sh`?**

`/bin/sh` is a POSIX-compliant shell — the most portable, available on every Unix/Linux system. Uses only POSIX standard features.
`/bin/bash` is Bash (Bourne Again Shell) — superset of sh with extensions: arrays, `[[...]]` conditionals, process substitution, and more.

**Rule**: Use `#!/bin/bash` when you use Bash-specific features. Use `#!/bin/sh` for maximum portability (Alpine Docker containers, minimal systems).

**Always start scripts with:** `set -euo pipefail`
- `-e`: Exit immediately if any command fails
- `-u`: Treat unset variables as errors (catches typos)
- `-o pipefail`: If any command in a pipe fails, the whole pipe fails (not just last command)

---

**Q: Explain variables, quoting, and special variables.**

```bash
# Variable assignment (no spaces around =)
NAME="John"
COUNT=5
ARRAY=(one two three)

# Access variables (always double-quote to prevent word splitting)
echo "$NAME"          # Correct
echo "${NAME}"        # Explicit boundary (useful: "${NAME}suffix")
echo $NAME            # Works but breaks with spaces in value

# Special variables
echo "$0"   # Script name
echo "$1"   # First argument
echo "$@"   # All arguments (preserves quotes — use this)
echo "$*"   # All arguments (joins as one string — rarely useful)
echo "$#"   # Number of arguments
echo "$?"   # Exit code of last command (0=success, non-zero=failure)
echo "$$"   # Current process PID
echo "$!"   # PID of last background process

# Command substitution
DATE=$(date +%Y-%m-%d)   # Modern syntax (preferred)
DATE=`date +%Y-%m-%d`    # Old syntax (avoid — no nesting)

# Arithmetic
RESULT=$((5 + 3))
((COUNT++))
let "TOTAL = A + B"
```

---

**Q: How do you handle errors in shell scripts?**

```bash
#!/bin/bash
set -euo pipefail

# Trap for cleanup on exit or error
cleanup() {
    echo "Cleaning up..."
    rm -f /tmp/lock.$$
}
trap cleanup EXIT         # Always runs on exit
trap 'echo "Error on line $LINENO"' ERR  # Runs on error

# Check command exit codes explicitly
if ! command -v docker &>/dev/null; then
    echo "ERROR: docker not found" >&2
    exit 1
fi

# Run command with error context
mkdir -p /opt/app || { echo "Failed to create directory" >&2; exit 1; }

# Capture exit code without set -e interfering
grep "pattern" file || true   # OK to fail
if grep -q "pattern" file; then
    echo "Found"
fi

# Redirect all output of a command
{
    echo "Step 1..."
    long_command
    echo "Done"
} 2>&1 | tee -a /var/log/deploy.log
```

---

**Q: Write a script to check disk usage and alert if above 80%.**

```bash
#!/bin/bash
set -euo pipefail

THRESHOLD=80
ALERT_EMAIL="ops@company.com"

check_disk() {
    local mount_point="$1"
    local usage
    usage=$(df -h "$mount_point" | awk 'NR==2 {print $5}' | tr -d '%')
    
    if [[ "$usage" -gt "$THRESHOLD" ]]; then
        echo "ALERT: $mount_point disk usage is ${usage}% (threshold: ${THRESHOLD}%)"
        return 1
    fi
    return 0
}

ALERT=0
while IFS= read -r line; do
    mount=$(echo "$line" | awk '{print $6}')
    usage=$(echo "$line" | awk '{print $5}' | tr -d '%')
    
    if [[ "$usage" -gt "$THRESHOLD" ]]; then
        echo "WARNING: $mount is at ${usage}%" | tee -a /var/log/disk-alert.log
        ALERT=1
    fi
done < <(df -h | tail -n +2)

if [[ "$ALERT" -eq 1 ]]; then
    echo "Disk alert triggered" | mail -s "Disk Alert: $(hostname)" "$ALERT_EMAIL"
    exit 1
fi

echo "All disks OK (below ${THRESHOLD}%)"
```

---

**Q: Explain the difference between `[`, `[[`, `(( ))`, and `test`.**

```bash
# [ ] = POSIX test command (also /bin/test or 'test' builtin)
# Must quote variables, limited operators
if [ "$VAR" = "hello" ]; then ...    # String comparison
if [ -f "/etc/passwd" ]; then ...    # File test
if [ "$A" -gt "$B" ]; then ...       # Integer comparison
if [ -z "$VAR" ]; then ...           # Check if empty
if [ -n "$VAR" ]; then ...           # Check if non-empty

# [[ ]] = Bash extended test (NOT POSIX, more powerful)
# No quoting needed for variables (mostly), more operators, regex support
if [[ "$VAR" == "hello" ]]; then ... # String comparison
if [[ "$VAR" =~ ^[0-9]+$ ]]; then .. # Regex match (=~)
if [[ -f "/etc/passwd" && -r "/etc/passwd" ]]; then ... # Compound with && ||

# (( )) = Arithmetic evaluation (no $ needed, no spaces required)
if (( A > B )); then ...
((count++))
if (( ${#array[@]} > 0 )); then ...

# Examples of gotchas:
[ $UNDEF = "hi" ]   # FAILS if UNDEF not set (word splitting)
[[ $UNDEF = "hi" ]] # SAFE (empty string comparison)
```

---

**Q: How do you work with arrays in bash?**

```bash
# Indexed arrays
fruits=("apple" "banana" "cherry")
fruits+=("date")        # Append
echo "${fruits[0]}"     # First element
echo "${fruits[@]}"     # All elements
echo "${#fruits[@]}"    # Length
echo "${fruits[@]:1:2}" # Slice: elements 1-2

# Iterate
for fruit in "${fruits[@]}"; do
    echo "Fruit: $fruit"
done

# Associative arrays (bash 4+)
declare -A user
user[name]="Alice"
user[role]="admin"
echo "${user[name]}"
for key in "${!user[@]}"; do
    echo "$key = ${user[$key]}"
done

# Read file into array
mapfile -t lines < /etc/hosts   # Each line as array element
IFS=$'
' read -r -d '' -a lines < /etc/hosts  # Alternative
```

---

**Q: Write a deployment script with rollback capability.**

```bash
#!/bin/bash
set -euo pipefail

APP_DIR="/opt/myapp"
BACKUP_DIR="/opt/myapp-backup"
LOG="/var/log/deploy.log"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

log() { echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG"; }

rollback() {
    log "ERROR: Deployment failed. Rolling back..."
    if [[ -d "$BACKUP_DIR" ]]; then
        rm -rf "$APP_DIR"
        cp -r "$BACKUP_DIR" "$APP_DIR"
        systemctl restart myapp
        log "Rollback complete"
    else
        log "ERROR: No backup available for rollback!"
    fi
    exit 1
}
trap rollback ERR

# Backup current version
log "Backing up current version..."
rm -rf "$BACKUP_DIR"
cp -r "$APP_DIR" "$BACKUP_DIR"

# Deploy new version
log "Deploying new version..."
cd "$APP_DIR"
git fetch origin
git checkout "${VERSION:-main}"
git pull origin "${VERSION:-main}"

# Install dependencies
log "Installing dependencies..."
npm ci --only=production

# Build
log "Building..."
npm run build

# Restart service
log "Restarting service..."
systemctl restart myapp

# Health check
log "Running health check..."
sleep 5
for i in {1..10}; do
    if curl -sf http://localhost:3000/health; then
        log "Health check passed!"
        rm -rf "$BACKUP_DIR"
        exit 0
    fi
    log "Health check $i/10 failed, retrying..."
    sleep 5
done

rollback
```

---

**Q: Common text processing tools — explain sed, awk, grep.**

```bash
# grep — search for patterns
grep "error" /var/log/app.log              # Lines containing "error"
grep -i "error" file                       # Case insensitive
grep -r "TODO" ./src/                      # Recursive
grep -l "pattern" *.txt                    # Only filenames
grep -v "DEBUG" log.txt                    # Inverted (exclude)
grep -E "error|warn" log.txt              # Extended regex
grep -c "error" log.txt                   # Count matches
grep -n "error" log.txt                   # With line numbers
grep -A3 "ERROR" log.txt                  # 3 lines after match

# sed — stream editor (substitution, deletion, transformation)
sed 's/old/new/' file                     # Replace first on each line
sed 's/old/new/g' file                    # Replace all
sed 's/old/new/gi' file                   # Case insensitive
sed -i 's/old/new/g' file                 # In-place edit
sed -n '10,20p' file                      # Print lines 10-20
sed '/^#/d' file                          # Delete comment lines
sed 's/[[:space:]]*$//' file              # Remove trailing whitespace

# awk — data extraction and reporting
awk '{print $1, $3}' file                 # Print columns 1 and 3
awk -F: '{print $1}' /etc/passwd          # Custom delimiter (colon)
awk '{sum += $2} END {print sum}' file    # Sum column 2
awk 'NR==5' file                          # Print line 5
awk '/pattern/ {print $0}' file           # Print matching lines
awk 'NR>1 && $3 > 100 {print $1}' file   # Filter and extract
ps aux | awk 'NR>1 && $3>50 {print $11}' # Processes >50% CPU
df -h | awk 'NR>1 {print $6, $5}' | sort # Disk usage sorted
```

## Common Interview Tasks

**Parse a log file and find top 5 IPs:**
```bash
awk '{print $1}' /var/log/nginx/access.log | sort | uniq -c | sort -rn | head -5
```

**Find files modified in last 24 hours:**
```bash
find /var/log -name "*.log" -mtime -1 -ls
```

**Kill all processes matching a name:**
```bash
pkill -f "processname"  # Or: kill $(pgrep -f "processname")
```

**Check if script is run as root:**
```bash
if [[ "$EUID" -ne 0 ]]; then echo "Run as root"; exit 1; fi
```

## Revision Notes
```
SHEBANG: #!/bin/bash (Bash features) vs #!/bin/sh (portable)
SET: set -euo pipefail (always add to scripts)
  -e: exit on error | -u: error on undefined var | -o pipefail: pipe fails right

QUOTING: always double-quote variables: "$VAR" not $VAR

TEST:
[ ] = POSIX, quote needed | [[ ]] = Bash, no quote needed, supports regex (=~)
(( )) = arithmetic, no $ needed

SPECIAL VARS:
$0=script $1-$9=args $@=all args $#=count $?=exit code $$=PID

ARRAYS:
arr=(a b c) | ${arr[0]} | ${arr[@]} | ${#arr[@]}
Associative: declare -A map; map[key]=val

TEXT PROCESSING:
grep: search | sed: transform | awk: extract/report
awk -F: '{print $1}' = split by : and print column 1
sed 's/old/new/g' = replace all occurrences

ERROR HANDLING:
trap cleanup EXIT | trap 'echo line $LINENO' ERR
command || { echo "failed"; exit 1; }
```
