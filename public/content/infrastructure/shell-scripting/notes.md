# Shell Scripting — Revision Notes

Condensed reference for quick review. Consolidated from this course's certification and interview material, de-duplicated, and organized by topic.

---

## Shebang & Safety Flags

```
#!/usr/bin/env bash     → portable, resolves bash via $PATH (preferred default)
#!/bin/bash              → explicit, fine on Linux servers, fails on systems without bash at that path
#!/bin/sh                → POSIX-only, most portable, but no arrays/[[ ]]/process substitution

set -euo pipefail        → put at the top of EVERY script
  -e            exit immediately on any command failure
  -u            error on unset variables (catches typos in var names)
  -o pipefail   pipeline fails if ANY stage fails, not just the last one

Exceptions to -e: failures inside if/while conditions, or in && / || chains,
do NOT trigger exit — that's expected, since the failure IS the condition being tested.
```

## Variables & Quoting

```
name="value"              no spaces around =
readonly CONST="x"        constant, cannot be reassigned
local var="x"              (inside functions only) scoped to the function

ALWAYS double-quote variable expansions: "$var" not $var
  → unquoted values undergo word-splitting and glob expansion
  → this is the single most common source of real bash bugs

"${var}"     explicit boundary — needed for "${var}suffix"
${var:-default}   use default if var is unset OR empty (doesn't change var)
${var:=default}   same, but ALSO assigns default to var
${var:?msg}       error with msg if var is unset or empty
${#var}           length of string
```

## String Manipulation (parameter expansion)

```
${var#pattern}    remove SHORTEST matching prefix
${var##pattern}   remove LONGEST matching prefix
${var%pattern}    remove SHORTEST matching suffix
${var%%pattern}   remove LONGEST matching suffix
${var/old/new}    replace FIRST occurrence
${var//old/new}   replace ALL occurrences
${var^^}          uppercase
${var,,}          lowercase
${var:pos:len}    substring

Worked example — filename="archive.tar.gz":
  ${filename%.*}    → archive.tar   (strip shortest suffix from a dot)
  ${filename%%.*}   → archive       (strip longest suffix from a dot)
  ${filename#*.}    → tar.gz        (strip shortest prefix to a dot)
  ${filename##*.}   → gz            (strip longest prefix to a dot)
```

## Conditionals & Tests

```
[ ]      POSIX test — must quote variables, limited operators, portable to /bin/sh
[[ ]]    bash extended test — no word-splitting on unquoted vars, supports =~ regex, && / ||
(( ))    arithmetic context — no $ needed inside, e.g. (( count > 5 ))

File tests:  -f file (regular file) | -d dir | -e exists | -r readable
             -w writable | -x executable | -s non-empty
String:      -z (empty) | -n (non-empty) | == | != | =~ (regex, [[ ]] only)
Numeric:     -eq -ne -lt -le -gt -ge   (NOT ==/< /> inside [ ] or [[ ]])

Gotcha: [ $UNDEFINED = "hi" ]   → can be a syntax error if UNDEFINED is unset
        [[ $UNDEFINED = "hi" ]] → safe, treated as empty string comparison
```

## Loops

```
for x in list; do ... done                    iterate over a list
for f in *.log; do ... done                    iterate over files (glob)
for ((i=0; i<10; i++)); do ... done            C-style counting loop
while [[ cond ]]; do ... done                  condition-based loop
until [[ cond ]]; do ... done                  inverse of while (loop until true)

Reading files — the ONLY safe pattern:
  while IFS= read -r line; do ... done < file.txt
    IFS=   → don't strip leading/trailing whitespace
    -r     → don't interpret backslash escapes
  while IFS= read -r line; do ... done < <(command)   → process substitution,
    avoids the subshell problem of piping into a while loop
```

## Functions

```
name() {
    local arg1="$1"
    local arg2="${2:-default}"    # default value if $2 not given
    ...
    return 0                       # 0-255 only; 0 = success
}
result=$(name "a" "b")             # capture stdout as the "return value"

$@   all arguments, quote-preserving  → use this
$*   all arguments as ONE joined string → rarely what you want
$#   argument count
$0   script name | $1.. positional args | $?  last exit code | $$ PID | $!  last bg PID
```

## Arrays

```
arr=("a" "b" "c")            indexed array
${arr[0]}                    first element
${arr[@]}                    all elements
${#arr[@]}                   count
arr+=("d")                   append
unset arr[1]                 remove an element

declare -A map                associative array (bash 4+ ONLY — not on macOS default bash 3.2)
map[key]="value"
${map[key]}
for k in "${!map[@]}"; do echo "$k=${map[$k]}"; done
```

## Error Handling

```
trap cleanup EXIT           runs cleanup on ANY exit (success, error, most signals)
trap 'echo err $LINENO' ERR runs specifically when a command returns non-zero
                             (subject to same -e exceptions: not in if/while conditions)

command || { echo "failed"; exit 1; }     inline failure handling
command || true                            explicitly allow a command to fail without tripping -e

Retry pattern:
retry() {
    local n="$1" delay="$2"; shift 2
    for ((i=1; i<=n; i++)); do
        "$@" && return 0
        sleep "$delay"
    done
    return 1
}
```

## Text Processing — grep / sed / awk

```
grep "pat" file        search        -i case-insens | -v invert | -r recursive
                                       -n line numbers | -c count | -E extended regex
sed 's/old/new/g' file  replace all (per line)   -i in-place    -n '10,20p' print range
                         '/^#/d' delete matching lines
awk '{print $1}' file   print column 1 (whitespace-delimited)
awk -F: '{print $1}'    custom delimiter (colon)
awk '{sum+=$3} END{print sum}'   accumulate + print at end
cut -d, -f1,3 file      extract fields 1 and 3, comma-delimited
sort -k2 -n | uniq -c | sort -rn    classic "count and rank" pipeline
```

## Redirection

```
> file      stdout to file (overwrite)     >> file    stdout append
2> file     stderr to file
2>&1        redirect stderr to wherever stdout currently points
command > file 2>&1     both streams to file (order matters — this works)
command 2>&1 > file     stderr goes to OLD stdout target, only stdout to file (common gotcha)
```

## Process Substitution & Job Control

```
<(command)              treat command's output as a readable "file"
diff <(cmd1) <(cmd2)     compare two command outputs directly

command &                run in background, capture PID with $!
wait $PID                 block until that background job finishes
wait                       block until ALL background jobs finish
jobs -r                    list running background jobs (used for MAX_JOBS throttling patterns)
```

## Common Certifications That Test This Material

```
RHCSA (EX200)     — Red Hat, script-writing tasks
LFCS               — Linux Foundation, shell scripting on Linux
AWS SysOps         — shell usage on EC2 instances
ShellCheck (shellcheck.net) — de-facto linting standard, not a certification but
                              worth running against every script before shipping it
```

## Debugging Checklist

```
bash -n script.sh        syntax check only, doesn't execute
bash -x script.sh         trace every command as it executes
shellcheck script.sh      static analysis — catches unquoted vars, [ ] vs [[ ]] issues, etc.
echo "DEBUG: var=$var"    manual print-debugging, still legitimate for quick checks
```
