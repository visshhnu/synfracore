# Linux — Advanced

## Shell Scripting (Bash)

### Script Basics

```bash
#!/bin/bash
# The shebang (#!) tells the OS which interpreter to use
# Always the first line of a script

# Make a script executable
chmod +x myscript.sh

# Run a script
./myscript.sh
bash myscript.sh
source myscript.sh    # run in current shell (shares variables)
. myscript.sh         # same as source

# Script example from LSU/NI slides — ~/.bashrc
#!/bin/bash

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific aliases and functions
export PATH=$HOME/packages/bin:$PATH
export LD_LIBRARY_PATH=$HOME/packages/lib:$LD_LIBRARY_PATH
alias qsubI="qsub -I -X -l nodes=1:ppn=20 -l walltime=01:00:00 -A my_allocation"
alias lh="ls -altrh"
```

### Variables

```bash
# Assign (no spaces around =)
name="Vishnu"
count=10
pi=3.14

# Use variables
echo $name
echo "Hello $name"
echo "Count is: ${count}"    # braces recommended in complex expressions

# Special variables
$0     # script name
$1     # first argument
$2     # second argument
$@     # all arguments as separate words
$*     # all arguments as single string
$#     # number of arguments
$$     # current process ID (PID)
$?     # exit code of last command (0=success, non-zero=error)

# Example using arguments:
#!/bin/bash
echo "Script name: $0"
echo "First arg:   $1"
echo "Second arg:  $2"
echo "All args:    $@"
echo "Arg count:   $#"

# Run: ./script.sh hello world
# Output:
# Script name: ./script.sh
# First arg:   hello
# Second arg:  world
# All args:    hello world
# Arg count:   2

# Note from LSU/NI slides:
# $1, $2, $3... are positional parameters for functions too
# $0 always = script name, NOT function name
# FUNCNAME = array containing function call stack names
# $* or $@ = all parameters passed to a function
# $# = number of positional parameters
# $? = exit code of last command
# $$ = PID of current process
```

### Functions

```bash
# Define function
greet() {
    echo "Hello, $1!"
    echo "Welcome to $2"
}

# Call function
greet "Vishnu" "SynfraCore"
# Hello, Vishnu!
# Welcome to SynfraCore

# Function with return value (use exit codes or echo)
get_date() {
    echo $(date +%Y-%m-%d)
}
today=$(get_date)
echo "Today is: $today"

# Note from LSU/NI: passing arguments to scripts vs functions
# The difference: arguments passed to the SCRIPT are different
# from arguments passed to a FUNCTION within the script
# Inside a function, $1 refers to the function's first argument
# not the script's first argument
```

### Conditionals

```bash
# if-then-elif-else-fi
if [ "$1" == "hello" ]; then
    echo "Hello back!"
elif [ "$1" == "bye" ]; then
    echo "Goodbye!"
else
    echo "I don't understand: $1"
fi

# Numeric comparisons
if [ $count -gt 10 ]; then echo "greater than 10"; fi
# -eq equal, -ne not equal, -gt greater than
# -lt less than, -ge greater or equal, -le less or equal

# String comparisons
if [ "$str" == "hello" ]; then echo "match"; fi
if [ "$str" != "hello" ]; then echo "no match"; fi
if [ -z "$str" ]; then echo "string is empty"; fi
if [ -n "$str" ]; then echo "string is not empty"; fi

# File tests
if [ -f "/etc/nginx/nginx.conf" ]; then echo "file exists"; fi
if [ -d "/var/log" ]; then echo "directory exists"; fi
if [ -r "file.txt" ]; then echo "file is readable"; fi
if [ -w "file.txt" ]; then echo "file is writable"; fi
if [ -x "script.sh" ]; then echo "file is executable"; fi

# Logical operators
if [ $a -gt 0 ] && [ $b -gt 0 ]; then echo "both positive"; fi
if [ $a -gt 0 ] || [ $b -gt 0 ]; then echo "at least one positive"; fi

# case statement (switch)
case $1 in
    start)
        echo "Starting service..."
        ;;
    stop)
        echo "Stopping service..."
        ;;
    restart)
        echo "Restarting service..."
        ;;
    *)
        echo "Usage: $0 {start|stop|restart}"
        exit 1
        ;;
esac
```

### Loops

```bash
# for loop — iterate list
for i in 1 2 3 4 5; do
    echo "Number: $i"
done

# for loop — range
for i in $(seq 1 10); do
    echo $i
done

# for loop — C style
for ((i=0; i<10; i++)); do
    echo $i
done

# for loop — files
for file in *.log; do
    echo "Processing: $file"
    gzip "$file"
done

# while loop
count=0
while [ $count -lt 10 ]; do
    echo "Count: $count"
    count=$((count + 1))
done

# until loop (opposite of while — runs until condition is true)
until [ $count -ge 10 ]; do
    echo "Count: $count"
    count=$((count + 1))
done

# Passing arguments to bash scripts (from LSU/NI slides):
# Note the difference between script arguments and function arguments
# When >= 10 positional parameters, use ${10} not $10
# add() function example
add() {
    result=$(( $1 + $2 ))
    echo $result
}
sum=$(add 5 3)
echo "Sum: $sum"   # Sum: 8
```

### Real-World Scripts

```bash
#!/bin/bash
# Automated backup script
BACKUP_DIR="/backup/$(date +%Y-%m-%d)"
SOURCE_DIR="/var/www/html"
LOG_FILE="/var/log/backup.log"

echo "$(date): Starting backup" >> $LOG_FILE
mkdir -p $BACKUP_DIR
tar -czf "$BACKUP_DIR/webapp.tar.gz" $SOURCE_DIR

if [ $? -eq 0 ]; then
    echo "$(date): Backup successful" >> $LOG_FILE
else
    echo "$(date): Backup FAILED" >> $LOG_FILE
    exit 1
fi

#!/bin/bash
# Check if services are running and restart if down
SERVICES=("nginx" "mysql" "redis")

for service in "${SERVICES[@]}"; do
    if ! systemctl is-active --quiet $service; then
        echo "$(date): $service is down, restarting..." | tee -a /var/log/service-monitor.log
        systemctl restart $service
    fi
done

#!/bin/bash
# Deploy application
APP_DIR="/opt/myapp"
REPO_URL="https://github.com/org/myapp.git"

echo "Pulling latest code..."
cd $APP_DIR && git pull origin main

echo "Installing dependencies..."
pip install -r requirements.txt

echo "Restarting application..."
systemctl restart myapp

echo "Deployment complete!"
```

## Environment Variables and Shell Configuration

```bash
# View environment variables
env                            # all environment variables
printenv PATH                  # specific variable
echo $HOME                     # home directory
echo $USER                     # current username
echo $SHELL                    # current shell
echo $PATH                     # executable search path

# Set environment variables
export MY_VAR="value"          # available to child processes
MY_LOCAL="local"               # only in current script/shell

# Add to PATH
export PATH=$PATH:/usr/local/myapp/bin

# Permanent environment variables — add to:
~/.bashrc             # for interactive shells
~/.bash_profile       # for login shells
/etc/environment      # system-wide

# Source (apply) changes immediately
source ~/.bashrc
. ~/.bashrc           # same as source
```

## System Administration

```bash
# Disk usage
df -h                          # disk space by filesystem
df -h /var                     # specific path
du -sh /var/log                # total size of directory
du -sh /var/log/*              # size of each item
du --max-depth=1 /             # top-level directory sizes

# Memory
free -h                        # RAM usage (human readable)
cat /proc/meminfo              # detailed memory info

# System info
uname -a                       # kernel and system info
cat /etc/os-release            # distribution info
cat /etc/redhat-release        # RHEL/CentOS version
uptime                         # how long system has been running
hostname                       # system hostname

# Service management (systemd)
systemctl start nginx          # start service
systemctl stop nginx           # stop service
systemctl restart nginx        # restart service
systemctl reload nginx         # reload config without restart
systemctl enable nginx         # start on boot
systemctl disable nginx        # don't start on boot
systemctl status nginx         # service status
systemctl is-active nginx      # check if running (exit code)
systemctl list-units --type=service   # all services

# Logs
journalctl -u nginx            # logs for nginx service
journalctl -u nginx -f         # follow nginx logs
journalctl --since "1 hour ago"  # recent logs
journalctl --since "2024-01-01" --until "2024-01-02"
tail -f /var/log/syslog        # system log
tail -f /var/log/auth.log      # authentication log

# Package management
# RHEL/CentOS/Fedora
dnf install nginx              # install
dnf remove nginx               # remove
dnf update                     # update all
dnf search nginx               # search

# Ubuntu/Debian
apt update                     # update package list
apt install nginx              # install
apt remove nginx               # remove
apt upgrade                    # upgrade all packages
apt search nginx               # search
```

## sed — Advanced Usage

From the LSU/NI slides — sed commands and flags reference:

```bash
# sed syntax: sed [flags] 'command' file

# Substitution (most common)
sed 's/pattern/replacement/' file         # replace first occurrence
sed 's/pattern/replacement/g' file        # replace all (global)
sed 's/pattern/replacement/gi' file       # global + case-insensitive
sed 's/pattern/replacement/2' file        # replace 2nd occurrence only
sed 's/http/https/g' config.conf         # practical: update URLs

# Print specific lines
sed -n '5p' file.txt                      # print only line 5
sed -n '5,10p' file.txt                   # print lines 5-10
sed -n '/pattern/p' file.txt             # print lines matching pattern

# Delete lines
sed '/pattern/d' file.txt                 # delete matching lines
sed '5d' file.txt                         # delete line 5
sed '5,10d' file.txt                      # delete lines 5-10

# Edit in-place (modify the actual file)
sed -i 's/old/new/g' file.txt            # WARNING: modifies file!
sed -i.bak 's/old/new/g' file.txt        # create .bak backup first

# Multiple commands with -e
sed -e 's/foo/bar/g' -e 's/baz/qux/g' file.txt

# sed flags table (from LSU/NI slides):
# -e  combine multiple commands
# -f  read commands from file
# -h  print help info
# -n  disable auto-printing (use with p command)
# -V  print version info
# -r  use extended regex

# sed command characters:
# s  substitution       g  global replacement
# d  delete             p  print
# i  ignore case        G  add newline
# w  write to file      x  exchange pattern/hold buffer
# h  copy to hold buf   ;  separate commands
```
