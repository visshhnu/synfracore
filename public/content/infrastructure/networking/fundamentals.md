# Networking Fundamentals for DevOps

## OSI Model — What Each Layer Means in Practice

```
Layer 7 Application  HTTP, gRPC, DNS, SMTP — what your app speaks
Layer 4 Transport    TCP (reliable), UDP (fast) — ports live here
Layer 3 Network      IP addressing, routing — how packets find destinations
Layer 2 Data Link    MAC addresses, switches — same network communication
Layer 1 Physical     Cables, signals — ignore this in cloud
```

## IP Addressing

```bash
# CIDR notation: IP/prefix-length
# 10.0.0.0/24 = 256 addresses (10.0.0.0 – 10.0.0.255)
# 10.0.0.0/16 = 65,536 addresses
# 10.0.0.0/32 = single host

# Subnet math
ipcalc 10.0.0.0/24    # Shows network, broadcast, host range
# Network:   10.0.0.0
# Broadcast: 10.0.0.255
# Hosts:     10.0.0.1 – 10.0.0.254 (254 usable)

# Private ranges (RFC 1918 — not routable on internet)
10.0.0.0/8        # Class A — AWS VPCs, large private nets
172.16.0.0/12     # Class B — Docker default bridge uses 172.17.0.0/16
192.168.0.0/16    # Class C — Home networks

# Check your routing
ip route show
# default via 10.0.0.1 dev eth0 proto dhcp src 10.0.0.50
# 10.0.0.0/24 dev eth0 scope link src 10.0.0.50

# Trace path to destination
traceroute google.com
mtr google.com  # Real-time traceroute
```

## TCP vs UDP

```
TCP (Transmission Control Protocol):
  Connection-oriented: 3-way handshake before data
  Reliable: Acknowledgments, retransmission on loss
  Ordered: Packets arrive in sequence
  Flow control: Receiver controls sender speed
  Use: HTTP/HTTPS, SSH, databases, file transfers
  Port examples: 22 (SSH), 80 (HTTP), 443 (HTTPS), 5432 (PostgreSQL)

UDP (User Datagram Protocol):
  Connectionless: Fire and forget
  Unreliable: No ACKs, no retransmission
  Unordered: Packets may arrive out of order
  Fast: No overhead
  Use: DNS, video streaming, online gaming, VoIP, NTP
  Port examples: 53 (DNS), 123 (NTP), 161 (SNMP)
```

## DNS — How Name Resolution Works

```bash
# Full DNS resolution path for synfracore.com:
# 1. Check local cache (/etc/hosts, OS cache)
# 2. Query resolver (8.8.8.8 or ISP resolver)
# 3. Resolver asks root nameserver → .com TLD
# 4. .com TLD → authoritative nameserver for synfracore.com
# 5. Authoritative NS returns A record (IP address)

# Query DNS records
dig synfracore.com          # A record (IPv4)
dig synfracore.com AAAA     # IPv6
dig synfracore.com MX       # Mail servers
dig synfracore.com NS       # Nameservers
dig synfracore.com TXT      # SPF, DKIM, verification
dig @8.8.8.8 synfracore.com # Use specific DNS server

# Check full resolution chain
dig +trace synfracore.com

# Reverse DNS lookup
dig -x 142.250.80.46

# Common DNS tools
nslookup synfracore.com
host synfracore.com

# DNS record TTL (Time To Live) = how long to cache
# Low TTL (60s): Changes propagate in 1 min — use before deployments
# High TTL (3600s): Reduces DNS queries — use normally
```

## Ports and Services

```bash
# Well-known ports (0-1023) — require root to bind
22    SSH
25    SMTP (email)
53    DNS (TCP+UDP)
80    HTTP
443   HTTPS
3306  MySQL
5432  PostgreSQL
6379  Redis
27017 MongoDB
2379  etcd (Kubernetes)
6443  Kubernetes API server
2181  ZooKeeper

# Check what's listening
ss -tlnp          # All listening TCP sockets
ss -tlnp sport :80  # Specific port
netstat -tlnp     # Older alternative

# Check if port is reachable
nc -zv 10.0.0.1 5432    # Test PostgreSQL port
telnet 10.0.0.1 80      # Test HTTP port
curl -v telnet://10.0.0.1:6379  # Redis test
```

## Firewalls

```bash
# iptables (lower level)
iptables -L -n -v          # List all rules
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -j DROP  # Drop everything else

# firewalld (RHEL/CentOS/Amazon Linux)
firewall-cmd --permanent --add-service=https
firewall-cmd --permanent --add-port=8080/tcp
firewall-cmd --reload

# ufw (Ubuntu)
ufw allow 443/tcp
ufw allow from 10.0.0.0/24 to any port 5432  # Only allow internal
ufw deny 22     # Block SSH from outside
ufw enable
ufw status verbose
```

## curl and wget for Network Testing

```bash
# Full HTTP request details
curl -v https://api.example.com/health

# Response time breakdown
curl -o /dev/null -s -w "DNS: %{time_namelookup}s\nConnect: %{time_connect}s\nTTFB: %{time_starttransfer}s\nTotal: %{time_total}s\n" https://example.com

# POST with JSON
curl -X POST https://api.example.com/data \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TOKEN" \
  -d '{"key": "value"}'

# Follow redirects, show headers
curl -L -I https://synfracore.com

# Download with progress
wget -c https://releases.ubuntu.com/ubuntu.iso  # -c = resume

# Test TCP connection
curl -o /dev/null --connect-timeout 5 telnet://10.0.0.1:5432
```
