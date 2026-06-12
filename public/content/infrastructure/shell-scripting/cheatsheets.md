# Shell Scripting — Cheatsheet

```bash
#!/bin/bash
set -euo pipefail

# ── VARIABLES ─────────────────────────────────────────────
var="value"
readonly CONST="immutable"
local local_var="only in function"
${var:-default}       # Use default if unset or empty
${var:=default}       # Assign default if unset or empty
${var:?error msg}     # Error if unset or empty
${#var}               # Length of string
${var:2:5}            # Substring: 5 chars from position 2
${var/old/new}        # Replace first occurrence
${var//old/new}       # Replace all occurrences
${var%suffix}         # Remove shortest suffix match
${var%%suffix}        # Remove longest suffix match
${var#prefix}         # Remove shortest prefix match
${var^^}              # Uppercase
${var,,}              # Lowercase

# ── CONDITIONALS ──────────────────────────────────────────
[[ -f file ]]         # Is regular file
[[ -d dir ]]          # Is directory
[[ -r file ]]         # Is readable
[[ -w file ]]         # Is writable
[[ -x file ]]         # Is executable
[[ -z "$var" ]]       # Is empty
[[ -n "$var" ]]       # Is non-empty
[[ "$a" == "$b" ]]    # String equal
[[ "$a" != "$b" ]]    # String not equal
[[ "$a" =~ regex ]]   # Regex match
[[ $n -eq 0 ]]        # Numeric equal (also -ne -lt -le -gt -ge)
(( n > 5 ))           # Arithmetic condition

# ── LOOPS ──────────────────────────────────────────────────
for i in {1..10}; do echo $i; done
for f in /var/log/*.log; do gzip "$f"; done
for ((i=0; i<10; i++)); do echo $i; done
while [[ $count -lt 10 ]]; do ((count++)); done
while IFS= read -r line; do echo "$line"; done < file.txt
while IFS= read -r line; do process "$line"; done < <(command)

# ── FUNCTIONS ─────────────────────────────────────────────
my_func() {
    local arg1="$1"
    local arg2="${2:-default}"
    echo "Result"
    return 0      # 0=success, 1-255=error
}
result=$(my_func "a" "b")

# ── ARRAYS ─────────────────────────────────────────────────
arr=("a" "b" "c")
${arr[0]}             # First element
${arr[@]}             # All elements
${#arr[@]}            # Count
arr+=("d")            # Append
unset arr[1]          # Delete element
for item in "${arr[@]}"; do echo "$item"; done

declare -A map
map[key]="value"
${map[key]}
for k in "${!map[@]}"; do echo "$k=${map[$k]}"; done

# ── TEXT PROCESSING ───────────────────────────────────────
grep -E "pattern" file.txt          # Extended regex
grep -r "pattern" dir/              # Recursive
grep -l "pattern" *.txt             # Files containing pattern
grep -v "pattern" file.txt          # Invert match
sed 's/old/new/g' file.txt          # Replace all
sed -i.bak 's/old/new/g' file.txt   # In-place with backup
awk '{print $1, $3}' file.txt       # Print columns 1 and 3
awk -F: '{print $1}' /etc/passwd    # Custom delimiter
awk '/pattern/ {print NR, $0}' f    # Line number + line

# ── USEFUL PATTERNS ───────────────────────────────────────
# Trap for cleanup
trap 'rm -f /tmp/lockfile' EXIT
trap 'echo "Error on line $LINENO"' ERR

# Retry logic
retry() {
    local n=$1; shift
    local delay=$1; shift
    for ((i=1; i<=n; i++)); do
        "$@" && return 0
        sleep "$delay"
    done
    return 1
}
retry 3 5 curl -sf https://api.example.com

# Check required commands
for cmd in aws kubectl jq; do
    command -v "$cmd" >/dev/null 2>&1 || { echo "Required: $cmd"; exit 1; }
done

# Read key=value config file
while IFS='=' read -r key val; do
    [[ "$key" =~ ^[[:space:]]*# ]] && continue  # skip comments
    export "${key// /}=${val// /}"
done < config.env
```
