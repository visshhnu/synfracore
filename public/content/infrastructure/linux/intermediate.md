# Linux — Intermediate

## File System Navigation

```bash
# Navigation
pwd                    # print working directory
cd /var/log            # change to absolute path
cd ..                  # go up one level
cd ~                   # go to home directory
cd -                   # go to previous directory

# Listing files
ls                     # basic list
ls -l                  # long format (permissions, size, date)
ls -la                 # include hidden files (starting with .)
ls -lh                 # human readable sizes (KB, MB, GB)
ls -lt                 # sort by modification time
ls -lS                 # sort by size (largest first)
ls -R                  # recursive (all subdirectories)

# File details
ls -al | wc            # count: lines words bytes
# 6   47   284         ← 6 files, 47 words, 284 bytes
```

## Finding Files

```bash
# find — most powerful file search tool
find . -type f                     # all files in current directory
find . -type d                     # all directories
find . -name "*.log"               # files by name pattern
find /etc -name "nginx.conf"       # find in specific directory
find . -name "file" -size +100c    # files larger than 100 bytes
find . -type f -size +100k -size -1M  # between 100KB and 1MB
find . -type f -mtime +3           # files modified more than 3 days ago
find . -type f -mtime -1           # files modified in last 24 hours

# Execute command on each found file
find . -type f -exec cat {} \;     # print contents of each file
find . -type f -mtime -1 -delete   # delete files modified in last 24h

# locate — faster search using pre-built index
locate nginx.conf                  # find file instantly
sudo updatedb                      # update the index

# which — find command location
which python3                      # /usr/bin/python3
which docker                       # /usr/bin/docker
```

## File Operations

```bash
# Create
touch newfile.txt               # create empty file / update timestamp
mkdir mydir                     # create directory
mkdir -p a/b/c                  # create nested directories

# Copy
cp file.txt copy.txt            # copy file
cp -r dir/ newdir/              # copy directory recursively
cp -p file.txt dest/            # preserve permissions and timestamps

# Move and Rename
mv file.txt newname.txt         # rename
mv file.txt /tmp/               # move to different directory

# Delete
rm file.txt                     # remove file
rm -f file.txt                  # force remove (no confirmation)
rm -r dir/                      # remove directory recursively
rm -rf dir/                     # force remove recursively (CAREFUL!)

# View file content
cat file.txt                    # print entire file
less file.txt                   # paginated view (q to quit)
head -20 file.txt               # first 20 lines
tail -20 file.txt               # last 20 lines
tail -f /var/log/syslog         # follow log in real time
```

## Text Processing

```bash
# grep — search text patterns
grep "error" /var/log/syslog          # find lines containing "error"
grep -i "error" file.txt             # case-insensitive
grep -n "error" file.txt             # show line numbers
grep -r "TODO" /home/user/code/       # search recursively in directory
grep -v "DEBUG" app.log               # lines NOT matching
grep -c "error" file.txt              # count matching lines
grep -l "pattern" *.txt               # list files that match

# Combining grep with pipes
cat /var/log/auth.log | grep "Failed" | tail -20

# wc — word count
wc file.txt                   # lines  words  bytes  filename
# 1      1      5   file.txt
wc -l file.txt                # lines only
wc -w file.txt                # words only
wc -c file.txt                # bytes only

# Count number of files in directory
ls -al | wc -l

# sed — stream editor (find and replace)
sed 's/old/new/' file.txt           # replace first occurrence per line
sed 's/old/new/g' file.txt          # replace all occurrences
sed 's/old/new/gi' file.txt         # case-insensitive replace all
sed '/pattern/d' file.txt           # delete lines matching pattern
sed -i 's/old/new/g' file.txt       # edit file in-place

# sed flags from LSU/NI slides:
# -e  combine multiple commands
# -f  read commands from file
# -n  disable automatic printing
# -r  use extended regex
# Commands: s=substitute, d=delete, p=print, g=global, i=ignore case

# awk — pattern scanning and processing
awk '{print $1}' file.txt            # print first column
awk '{print $1, $3}' file.txt        # print columns 1 and 3
awk -F: '{print $1}' /etc/passwd     # use : as delimiter
awk '/pattern/ {print}' file.txt     # print lines matching pattern
awk '{sum += $1} END {print sum}' file.txt  # sum first column

# sort — sort lines
sort file.txt                  # alphabetical sort
sort -r file.txt               # reverse sort
sort -n file.txt               # numeric sort
sort -k2 file.txt              # sort by second column
sort -u file.txt               # sort and remove duplicates (unique)
sort -t: -k3 -n /etc/passwd    # sort by 3rd field, : separator

# cut — extract columns
cut -d: -f1 /etc/passwd        # extract first field (delimiter=:)
cut -d, -f1,3 file.csv         # extract fields 1 and 3 from CSV
cut -c1-10 file.txt            # extract characters 1-10

# uniq — remove/count duplicates (input must be sorted)
sort file.txt | uniq           # remove duplicate lines
sort file.txt | uniq -c        # count occurrences
sort file.txt | uniq -d        # show only duplicates
```

## Compression and Archives

```bash
# gzip — compress files (LZ77 algorithm)
gzip filename             # compress → creates filename.gz, deletes original
gzip -k filename          # keep original file (-k flag)
gzip -c filename > filename.gz  # write to stdout, keep original
gzip -1 filename          # fastest compression (worst ratio)
gzip -9 filename          # slowest compression (best ratio, default=6)
gzip filename1 filename2  # compress multiple files
gunzip filename.gz        # decompress

# tar — archive files (tape archive)
tar -czf archive.tar.gz dir/         # create compressed archive
tar -xzf archive.tar.gz              # extract
tar -tzf archive.tar.gz              # list contents
tar -xzf archive.tar.gz -C /tmp/    # extract to specific directory
tar -czf backup.tar.gz /etc/ /home/  # archive multiple directories

# tar flags:
# c = create, x = extract, t = list
# z = gzip compression, j = bzip2 compression
# f = filename follows, v = verbose
```

## Permissions

```bash
# View permissions
ls -l file.txt
# -rwxr-xr-- 1 user group 4096 Jan 1 12:00 file.txt
# │└──┤└──┤└──┤
# │ owner group others
# - = file, d = directory, l = symlink

# chmod — change permissions
chmod 755 file.txt         # rwxr-xr-x (owner=rwx, group=rx, others=rx)
chmod 644 file.txt         # rw-r--r-- (owner=rw, group=r, others=r)
chmod 600 secret.key       # rw------- (owner only read/write)
chmod +x script.sh         # add execute for all
chmod -w file.txt          # remove write for all
chmod u+x file.txt         # add execute for owner (u=user/owner)
chmod g-w file.txt         # remove write for group
chmod o+r file.txt         # add read for others
chmod -R 755 directory/    # recursive

# Numeric permissions: r=4, w=2, x=1
# 7 = rwx (4+2+1)
# 6 = rw- (4+2)
# 5 = r-x (4+1)
# 4 = r-- (4)

# chown — change owner
chown user file.txt            # change owner
chown user:group file.txt      # change owner and group
chown -R user:group directory/ # recursive

# sudo — run as root
sudo command                  # run single command as root
sudo -i                       # switch to root shell
sudo -u otheruser command     # run as different user
```

## Process Management

```bash
# View processes
ps aux                        # all processes (all users, full format)
ps aux | grep nginx           # find specific process
top                           # live process viewer (q to quit)
htop                          # better live viewer (if installed)

# Kill processes
kill PID                      # send SIGTERM (graceful)
kill -9 PID                   # send SIGKILL (force)
killall nginx                 # kill all processes named nginx
pkill -f "python app.py"      # kill by command pattern

# Background jobs
command &                     # run in background
jobs                          # list background jobs
fg %1                         # bring job 1 to foreground
bg %1                         # send job 1 to background
nohup command &               # run immune to hangups (survives logout)
```

## Networking

```bash
# Check connectivity
ping google.com               # test connectivity
ping -c 4 google.com          # send 4 packets only
curl http://example.com       # fetch URL
curl -I http://example.com    # HTTP headers only
wget http://example.com/file  # download file

# Network info
ip addr show                  # IP addresses (modern)
ifconfig                      # IP addresses (older)
ip route show                 # routing table
ss -tulnp                     # open ports and listening services
netstat -tulnp                # same (older tool)
cat /etc/resolv.conf          # DNS servers

# SSH
ssh user@hostname             # connect to remote
ssh -i ~/.ssh/id_rsa user@host  # with specific key
ssh -p 2222 user@host         # non-standard port
scp file.txt user@host:/path/ # copy file to remote
scp user@host:/path/file.txt . # copy file from remote
```
