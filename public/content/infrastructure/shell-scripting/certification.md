# Shell Scripting Certification Guide

## Certifications Available

No dedicated shell scripting certification. Shell scripting tested in:

| Cert | Coverage | Provider |
|------|----------|----------|
| **RHCSA (EX200)** | Script writing tasks | Red Hat |
| **LFCS** | Shell scripting on Linux | Linux Foundation |
| **AWS SysOps** | Shell on EC2 instances | AWS |

**ShellCheck** (shellcheck.net) is the de-facto linting standard for shell scripts.

---

## Core Shell Scripting Patterns

```bash
#!/usr/bin/env bash
# ALWAYS start with proper shebang
# Use #!/usr/bin/env bash for portability

# SAFETY FLAGS (put at top of every script)
set -euo pipefail
# -e: exit on error | -u: error on undefined variable | -o pipefail: fail on pipe error

# VARIABLES
name="Alice"
age=30
readonly CONFIG_FILE="/etc/myapp/config"  # Constants use UPPERCASE + readonly

# Double-quote variables to prevent word splitting
echo "Hello, $name"               # correct
echo "Files: $(ls /tmp)"          # command substitution
echo "Count: $((age + 10))"       # arithmetic

# ARRAYS
fruits=("apple" "banana" "cherry")
echo "${fruits[0]}"                # First element
echo "${fruits[@]}"                # All elements
echo "${#fruits[@]}"               # Length

# Read into array
mapfile -t lines < file.txt        # Read file lines into array
```

```bash
# CONDITIONALS
if [[ -f "$file" ]]; then          # [[ ]] preferred over [ ]
    echo "File exists"
elif [[ -d "$file" ]]; then
    echo "Directory exists"
else
    echo "Neither"
fi

# File tests
[[ -f file ]]   # regular file | [[ -d dir ]]  directory
[[ -e path ]]   # exists       | [[ -r file ]] readable
[[ -s file ]]   # non-empty    | [[ -x file ]] executable
[[ -z "$var" ]] # empty string | [[ -n "$var" ]] non-empty
[[ "$a" == "$b" ]] # string equal | [[ $n -eq $m ]] numeric equal

# LOOPS
for i in {1..10}; do echo "$i"; done
for file in /tmp/*.log; do [[ -f "$file" ]] && echo "$file"; done

while IFS= read -r line; do        # Read file line by line
    echo "$line"
done < file.txt

# FUNCTIONS
greet() {
    local name="$1"                 # local: function-scoped variable
    local -r title="${2:-Mr/Ms}"    # default value with :-
    echo "Hello, $title $name"
    return 0                        # Return exit code
}
greet "Alice" "Dr"
```

```bash
# ERROR HANDLING
die() {
    echo "ERROR: $1" >&2            # Write to stderr
    exit "${2:-1}"                  # Default exit code 1
}

cleanup() {
    rm -f "$TMPFILE"
    echo "Cleaned up" >&2
}
trap cleanup EXIT INT TERM          # Always run cleanup

TMPFILE=$(mktemp)
[[ -f "$TMPFILE" ]] || die "Failed to create temp file"

# Check exit codes
if ! command -v docker &>/dev/null; then
    die "Docker not installed" 127
fi
```

```bash
# TEXT PROCESSING (essential tools)
# grep
grep -rn "ERROR" /var/log/          # Recursive, line numbers
grep -E "^(ERROR|WARN)" app.log     # Extended regex
grep -v "DEBUG" app.log | grep -c "ERROR"  # Count non-debug errors

# awk
awk '{print $1}' access.log         # First column (space-delimited)
awk -F',' '{print $2}' data.csv     # Second column (comma-delimited)
awk '$3 > 1000 {print $0}' data     # Filter rows
awk '{sum += $5} END {print sum}' data  # Sum column 5

# sed
sed 's/foo/bar/g' file.txt          # Replace all occurrences
sed -i 's/foo/bar/g' file.txt       # In-place edit
sed -n '10,20p' file.txt            # Print lines 10-20
sed '/^#/d' config.txt              # Delete comment lines

# cut, sort, uniq
cut -d: -f1 /etc/passwd             # First field, colon delimiter
sort -k2 -n file.txt                # Sort by 2nd field, numeric
sort | uniq -c | sort -rn           # Count duplicates, most first
```

---

## Common Script Templates

```bash
#!/usr/bin/env bash
# Script template with argument parsing
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_FILE="/tmp/$(basename "$0" .sh).log"

usage() {
    cat <<EOF
Usage: $(basename "$0") [OPTIONS] ARGUMENT

Options:
  -h, --help     Show this help
  -v, --verbose  Verbose output
  -o FILE        Output file (default: stdout)

EOF
    exit "${1:-0}"
}

VERBOSE=false
OUTPUT=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help)   usage 0 ;;
        -v|--verbose) VERBOSE=true ;;
        -o)          OUTPUT="$2"; shift ;;
        --)          shift; break ;;
        -*)          echo "Unknown option: $1" >&2; usage 1 ;;
        *)           break ;;
    esac
    shift
done

[[ $# -lt 1 ]] && { echo "Error: ARGUMENT required" >&2; usage 1; }
ARGUMENT="$1"
```

## Revision Notes
```
SHEBANG: #!/usr/bin/env bash (portable) or #!/bin/bash
SAFETY: set -euo pipefail at top of EVERY script

VARIABLES:
  UPPERCASE for env vars/constants | lowercase for local vars
  Always quote: "$var" not $var | local in functions

CONDITIONALS: [[ ]] preferred (handles spaces, regex)
  File tests: -f (file) -d (dir) -e (exists) -z (empty) -n (non-empty)

LOOPS: for x in list; | while IFS= read -r line; (safest file reading)

DEBUGGING: set -x (trace) | bash -n script.sh (syntax check)
LINTING: shellcheck script.sh (install: apt install shellcheck)

TEXT TOOLS:
  grep: search | awk: column processing | sed: stream edit
  cut: extract columns | sort | uniq -c | wc -l
```
