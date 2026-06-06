# Linux Fundamentals

Master the essential commands and concepts that every DevOps engineer uses daily.

## Filesystem Navigation

\`\`\`bash
# Where am I?
pwd                          # Print working directory

# List files
ls                           # Basic listing
ls -la                       # Long format, show hidden files
ls -lh                       # Human-readable file sizes
ls -lt                       # Sort by modification time

# Navigate
cd /etc                      # Go to /etc
cd ..                        # Go up one level
cd ~                         # Go to home directory
cd -                         # Go to previous directory

# Find files
find / -name "nginx.conf"    # Find by name
find /var/log -mtime -1      # Files modified in last 1 day
find . -type f -size +100M   # Files larger than 100MB
locate nginx.conf            # Fast search (uses database)
which nginx                  # Show full path of command
\`\`\`

## File Operations

\`\`\`bash
# Create
touch file.txt               # Create empty file
mkdir -p /opt/app/logs       # Create nested directories
echo "hello" > file.txt      # Create file with content

# Copy / Move / Delete
cp file.txt /tmp/            # Copy
cp -r /src /dst              # Copy directory recursively
mv file.txt /tmp/            # Move (also renames)
rm file.txt                  # Delete file
rm -rf /tmp/testdir          # Delete directory (BE CAREFUL!)

# View files
cat /etc/hosts               # Print entire file
less /var/log/syslog         # Page through large files (q to quit)
head -20 /var/log/nginx/access.log   # First 20 lines
tail -100 /var/log/app.log   # Last 100 lines
tail -f /var/log/app.log     # Follow log in real time

# Search in files
grep "ERROR" /var/log/app.log
grep -r "database" /etc/     # Recursive search
grep -i "error" app.log      # Case insensitive
grep -n "failed" auth.log    # Show line numbers
grep -v "DEBUG" app.log      # Exclude lines with DEBUG
\`\`\`

## File Permissions

\`\`\`bash
# Permission format: [type][owner][group][others]
# Example: -rwxr-xr-- 
# - = file, d = directory, l = symlink
# rwx = read(4), write(2), execute(1)

# View permissions
ls -la /etc/passwd
# -rw-r--r-- 1 root root 1872 Jan 15 10:23 /etc/passwd

# Change permissions
chmod 755 script.sh          # rwxr-xr-x (owner=7, group=5, others=5)
chmod +x script.sh           # Add execute for all
chmod u+w file.txt           # Add write for owner
chmod o-r secret.txt         # Remove read for others
chmod -R 644 /var/www/html   # Recursive

# Change ownership
chown user:group file.txt
chown -R www-data:www-data /var/www/
sudo chown root:root /etc/crontab

# SUID, SGID, Sticky bit
chmod u+s /usr/bin/passwd    # SUID - run as owner
chmod +t /tmp                # Sticky bit - only owner can delete
\`\`\`

## Process Management

\`\`\`bash
# View processes
ps aux                       # All processes, detailed
ps aux | grep nginx          # Find specific process
top                          # Interactive process viewer
htop                         # Better interactive viewer (install it!)
pgrep nginx                  # Get PID of process
pidof nginx                  # Same

# Control processes
kill 1234                    # Send SIGTERM (graceful stop)
kill -9 1234                 # Send SIGKILL (force stop)
killall nginx                # Kill by name
pkill -f "python app.py"     # Kill by pattern

# Background jobs
./long_script.sh &           # Run in background
jobs                         # List background jobs
fg 1                         # Bring job 1 to foreground
bg 1                         # Send job 1 to background
nohup ./script.sh &          # Keep running after logout
screen / tmux                # Terminal multiplexer (learn tmux!)
\`\`\`

## User Management

\`\`\`bash
# Users
whoami                       # Current user
id                           # User and group IDs
sudo -i                      # Switch to root
su - username                # Switch to user

# Create/manage users
sudo useradd -m -s /bin/bash john    # Create user with home dir
sudo passwd john             # Set password
sudo usermod -aG docker john         # Add to group
sudo userdel -r john         # Delete user and home

# Groups
groups                       # Show current user's groups
cat /etc/group | grep docker # Show docker group members
\`\`\`

## Package Management

\`\`\`bash
# Ubuntu/Debian (apt)
sudo apt update              # Update package lists
sudo apt upgrade             # Upgrade all packages
sudo apt install nginx       # Install package
sudo apt remove nginx        # Remove package
sudo apt autoremove          # Remove unused dependencies
apt search nginx             # Search packages
dpkg -l | grep nginx         # Check if installed

# RHEL/CentOS (yum/dnf)
sudo yum update
sudo yum install nginx
sudo dnf install nginx       # Modern RHEL 8+
rpm -qa | grep nginx         # Check if installed
\`\`\`

## Disk and Storage

\`\`\`bash
df -h                        # Disk usage (human readable)
du -sh /var/log              # Directory size
du -sh /*                    # Size of each top-level dir
lsblk                        # List block devices
fdisk -l                     # List disk partitions (root needed)
mount | grep sda             # Show mounted filesystems
\`\`\`