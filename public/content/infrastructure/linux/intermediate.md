# Linux Intermediate

Level up with system administration, networking, and automation.

## Systemd Service Management

Modern Linux uses **systemd** as the init system. Understanding systemd is critical for managing services in production.

\`\`\`bash
# Service control
systemctl start nginx        # Start service
systemctl stop nginx         # Stop service
systemctl restart nginx      # Restart
systemctl reload nginx       # Reload config (no downtime)
systemctl enable nginx       # Start on boot
systemctl disable nginx      # Don't start on boot
systemctl status nginx       # Check status + recent logs

# Query services
systemctl list-units --type=service --state=running
systemctl list-unit-files | grep enabled
systemctl is-active nginx    # Returns "active" or "inactive"
systemctl is-enabled nginx   # Returns "enabled" or "disabled"

# Logs via journald
journalctl -u nginx          # Logs for nginx unit
journalctl -u nginx -f       # Follow logs
journalctl -u nginx --since "2024-01-01" --until "2024-01-02"
journalctl -n 50             # Last 50 lines all services
journalctl --disk-usage      # How much space logs use
journalctl --vacuum-size=1G  # Limit log storage to 1GB
\`\`\`

## Create a Custom Systemd Service

\`\`\`ini
# /etc/systemd/system/myapp.service
[Unit]
Description=My Python Application
After=network.target
Requires=postgresql.service

[Service]
Type=simple
User=appuser
WorkingDirectory=/opt/myapp
Environment=NODE_ENV=production
EnvironmentFile=/etc/myapp/env
ExecStart=/usr/bin/python3 /opt/myapp/app.py
ExecReload=/bin/kill -HUP $MAINPID
Restart=always
RestartSec=5
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=multi-user.target
\`\`\`

\`\`\`bash
sudo systemctl daemon-reload
sudo systemctl enable --now myapp
\`\`\`

## Networking

\`\`\`bash
# Interface information
ip addr show                 # All interfaces and IPs
ip addr show eth0            # Specific interface
ip link show                 # Link status
ifconfig                     # Legacy (still widely used)
hostname -I                  # Just the IP addresses

# Routing
ip route show                # Routing table
ip route add 10.0.0.0/8 via 192.168.1.1   # Add route
route -n                     # Legacy routing table

# Network testing
ping -c 4 google.com         # 4 ping packets
traceroute google.com        # Trace route
mtr google.com               # Combines ping + traceroute
curl -I https://google.com   # HTTP headers only
curl -v https://api.example.com  # Verbose HTTP
wget -O /tmp/file.zip https://example.com/file.zip

# Port and socket info
ss -tlnp                     # TCP listening ports with process
ss -ulnp                     # UDP listening ports
netstat -tlnp                # Legacy equivalent
lsof -i :80                  # What's using port 80
lsof -i :443                 # What's using port 443
nmap -sV localhost           # Scan ports on localhost

# Firewall (iptables / ufw)
sudo ufw status              # Ubuntu firewall status
sudo ufw allow 22/tcp        # Allow SSH
sudo ufw allow 80/tcp        # Allow HTTP
sudo ufw allow 443/tcp       # Allow HTTPS
sudo ufw enable              # Enable firewall
sudo ufw deny 3306           # Block MySQL from outside
\`\`\`

## SSH & Secure Access

\`\`\`bash
# Basic SSH
ssh user@192.168.1.10        # Connect
ssh -p 2222 user@host        # Non-standard port
ssh -i ~/.ssh/mykey.pem ec2-user@1.2.3.4  # With key file

# SSH key management
ssh-keygen -t ed25519 -C "email@example.com"   # Generate key
ssh-copy-id user@remote-host                    # Copy key to server
cat ~/.ssh/id_ed25519.pub >> ~/.ssh/authorized_keys  # Manual add

# SSH config file (~/.ssh/config)
Host myserver
  HostName 192.168.1.10
  User ubuntu
  IdentityFile ~/.ssh/mykey.pem
  Port 22
  ServerAliveInterval 60

# Now just: ssh myserver

# SSH tunneling
ssh -L 8080:localhost:80 user@remote    # Forward local 8080 to remote 80
ssh -R 9090:localhost:3000 user@remote  # Reverse tunnel
ssh -D 1080 user@remote                 # SOCKS proxy

# SCP and rsync
scp file.txt user@remote:/tmp/
scp -r /local/dir user@remote:/opt/
rsync -avz /local/dir/ user@remote:/remote/dir/  # Better than scp
rsync -avz --delete /src/ /dst/  # Mirror with deletion
\`\`\`

## Text Processing (Essential for Logs)

\`\`\`bash
# awk - column-based processing
awk '{print $1}' access.log              # Print first column
awk -F: '{print $1}' /etc/passwd         # Split on : print user names
awk '$9 == "404" {print $7}' access.log  # Print URLs returning 404
awk '{sum += $NF} END {print sum}' data.txt  # Sum last column

# sed - stream editor
sed 's/old/new/' file.txt               # Replace first occurrence
sed 's/old/new/g' file.txt             # Replace all occurrences
sed -i 's/localhost/0.0.0.0/g' config  # Edit file in place
sed -n '10,20p' file.txt               # Print lines 10-20
sed '/^#/d' config.conf                # Delete comment lines

# sort, uniq, cut, wc
sort -k2 -n file.txt                   # Sort by column 2 numerically
sort -u file.txt                       # Sort and remove duplicates
uniq -c sorted.txt                     # Count occurrences
cut -d: -f1 /etc/passwd                # Cut field 1 using : delimiter
wc -l /var/log/syslog                  # Count lines

# Practical log analysis
cat access.log | awk '{print $1}' | sort | uniq -c | sort -rn | head -10
# Top 10 IP addresses hitting your server
\`\`\`

## Cron Jobs

\`\`\`bash
# Edit crontab
crontab -e                   # Edit current user's crontab
sudo crontab -u www-data -e  # Edit another user's crontab
crontab -l                   # List current crontab

# Cron syntax: minute hour day-of-month month day-of-week
# ┌──────────── minute (0-59)
# │ ┌────────── hour (0-23)
# │ │ ┌──────── day of month (1-31)
# │ │ │ ┌────── month (1-12)
# │ │ │ │ ┌──── day of week (0-7, 0=Sunday)
# │ │ │ │ │
# * * * * * command

0 2 * * * /opt/scripts/backup.sh          # Daily at 2am
*/5 * * * * /opt/scripts/healthcheck.sh   # Every 5 minutes
0 0 * * 0 /opt/scripts/weekly-report.sh  # Every Sunday midnight
0 9-17 * * 1-5 /opt/scripts/monitor.sh   # Hourly 9-5, Mon-Fri

# Check cron logs
grep CRON /var/log/syslog
journalctl -u cron
\`\`\`