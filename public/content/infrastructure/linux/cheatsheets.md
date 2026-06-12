# Linux Cheatsheet

## File and Directory Operations

```bash
# Navigation
pwd                         # current directory
ls -lah                     # list with sizes, hidden files
cd -                        # go to previous directory
tree -L 2                   # directory tree 2 levels deep

# File operations
cp -r src/ dest/            # copy directory
mv file.txt /new/path/      # move/rename
rm -rf directory/           # delete (careful!)
ln -s /real/path link-name  # symbolic link
find /var/log -name "*.log" -mtime +7    # files older than 7 days
find . -type f -size +100M               # files over 100MB
find . -name "*.py" -exec grep -l "import os" {} \;

# View files
cat file.txt                # print file
less file.txt               # paginated view (q to quit)
head -20 file.txt           # first 20 lines
tail -100f /var/log/app.log # last 100 lines, follow
grep -r "ERROR" /var/log/   # recursive search
grep -n "pattern" file.txt  # show line numbers
grep -v "DEBUG" app.log     # exclude DEBUG lines

# Permissions
chmod 755 script.sh         # rwxr-xr-x
chmod +x script.sh          # add execute bit
chown user:group file.txt   # change owner
ls -l                       # see permissions

# Disk usage
df -h                       # disk space by mount
du -sh /var/log/*           # size of each item
du -sh * | sort -hr         # sorted by size
ncdu /var                   # interactive disk usage
```

## Process Management

```bash
# View processes
ps aux                      # all processes
ps aux | grep nginx         # find specific process
top                         # live view (press 1 for per-CPU)
htop                        # better top
pgrep nginx                 # PID by name
lsof -i :8080               # what's using port 8080
lsof -p 1234                # files open by PID

# Kill processes
kill 1234                   # graceful (SIGTERM)
kill -9 1234                # force (SIGKILL)
pkill nginx                 # kill by name
killall -HUP nginx          # reload signal

# Background jobs
command &                   # run in background
nohup command &             # survives terminal close
jobs                        # list background jobs
fg %1                       # bring job 1 to foreground
Ctrl+Z                      # suspend current job
Ctrl+C                      # kill current job

# systemd services
systemctl start|stop|restart|status nginx
systemctl enable nginx      # start on boot
systemctl disable nginx
journalctl -u nginx -f      # follow service logs
journalctl -u nginx --since "1 hour ago"
```

## Text Processing

```bash
# grep
grep -r "error" .           # recursive
grep -i "error" file        # case insensitive
grep -A 3 "FATAL" app.log   # 3 lines after match
grep -B 3 "FATAL" app.log   # 3 lines before match
grep -c "ERROR" app.log     # count matches

# sed (stream editor)
sed 's/old/new/g' file.txt          # replace all
sed -i 's/old/new/g' file.txt       # in-place edit
sed -n '10,20p' file.txt            # print lines 10-20
sed '/^#/d' config.txt              # delete comment lines

# awk
awk '{print $1, $3}' file.txt       # print columns 1 and 3
awk -F: '{print $1}' /etc/passwd    # colon delimiter
awk '/ERROR/ {count++} END {print count}' app.log
awk '{sum += $2} END {print "Total:", sum}' sales.txt

# sort, uniq, wc
sort file.txt               # alphabetical sort
sort -n numbers.txt         # numeric sort
sort -k2 -t: file.txt       # sort by column 2, colon delimiter
sort file.txt | uniq        # remove duplicates
sort file.txt | uniq -c     # count occurrences
wc -l file.txt              # count lines

# Real-world pipeline
cat access.log | awk '{print $1}' | sort | uniq -c | sort -rn | head -10
# → Top 10 IP addresses by request count
```

## Networking

```bash
# Connectivity
ping -c 4 8.8.8.8           # test connectivity
traceroute google.com        # trace route
mtr google.com               # live trace
curl -I https://example.com  # HTTP headers
curl -o /dev/null -s -w "%{http_code}" https://example.com  # just status code

# Ports and sockets
ss -tlnp                    # listening TCP ports
ss -tlnp | grep :80         # specific port
netstat -tlnp               # older alternative
nc -zv host 22              # test port is open
nc -l 8080                  # listen on port (simple server)

# DNS
dig example.com             # A record
dig +short example.com      # just IP
dig @8.8.8.8 example.com    # use specific DNS server
nslookup example.com
host example.com

# IP and interfaces
ip addr show                # network interfaces
ip route show               # routing table
ifconfig                    # older alternative
```

## Bash Shortcuts

```bash
Ctrl+R       # search command history
Ctrl+A/E     # beginning/end of line
Ctrl+U/K     # delete to start/end of line
Ctrl+W       # delete word before cursor
!!           # repeat last command
!$           # last argument of last command
Alt+.        # insert last argument
history 50   # last 50 commands
!nginx       # run last command starting with nginx
```
