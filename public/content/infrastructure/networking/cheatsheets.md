# Networking — Cheatsheet

```bash
# ── INTERFACES ────────────────────────────────────────────
ip addr show                       # All interfaces with IPs
ip addr show eth0                  # Specific interface
ip link show                       # All interfaces (link layer)
ip link set eth0 up/down           # Enable/disable interface

# ── ROUTING ───────────────────────────────────────────────
ip route show                      # Routing table
ip route get 8.8.8.8               # Which interface/gateway for this IP
ip route add 10.0.0.0/8 via 192.168.1.1  # Add static route
ip route del 10.0.0.0/8            # Remove route
ip route add default via 192.168.1.1     # Set default gateway

# ── CONNECTIONS ───────────────────────────────────────────
ss -tlnp                           # TCP listening with process
ss -tlnp sport :8080               # Specific port
ss -tnp state established          # Established connections
ss -s                              # Connection summary
netstat -tlnp                      # Older equivalent

# ── DNS ───────────────────────────────────────────────────
dig example.com                    # Full DNS query
dig +short example.com             # IP only
dig example.com @8.8.8.8          # Use specific DNS server
dig +trace example.com             # Full resolution chain
dig -x 1.2.3.4                    # Reverse lookup
nslookup example.com
host example.com
cat /etc/resolv.conf               # DNS servers configured
resolvectl status                  # systemd-resolved status

# ── CONNECTIVITY TESTING ──────────────────────────────────
ping -c 4 8.8.8.8                 # ICMP connectivity
traceroute -n 8.8.8.8             # Hop-by-hop path
mtr -n --report 8.8.8.8           # Combined ping+traceroute
nc -zv host 443                   # TCP port check
nc -zvu host 53                   # UDP port check
curl -w "%{http_code}" -so /dev/null https://example.com
curl -vI https://example.com 2>&1 | head -30  # Headers + TLS info
telnet host 80                     # Old-school port test

# ── CAPTURE ───────────────────────────────────────────────
tcpdump -i eth0 -n                 # Capture all traffic
tcpdump -i any port 80             # Specific port
tcpdump -i eth0 host 10.0.0.1     # Specific host
tcpdump -i eth0 -w /tmp/cap.pcap  # Save to file
tcpdump -r /tmp/cap.pcap           # Read from file
tcpdump 'tcp[tcpflags] & tcp-syn != 0'  # SYN packets only

# ── BANDWIDTH ─────────────────────────────────────────────
iperf3 -s                          # Start server
iperf3 -c server -t 30            # 30-second throughput test
iperf3 -c server -u -b 100M       # UDP test at 100Mbps
nload eth0                         # Real-time bandwidth (install first)
nethogs eth0                       # Per-process bandwidth

# ── FIREWALL ──────────────────────────────────────────────
iptables -L -n -v                  # All rules
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -s 10.0.0.0/8 -j ACCEPT
iptables -P INPUT DROP             # Default deny
iptables-save > /etc/iptables/rules.v4
# UFW (Ubuntu):
ufw allow 443/tcp
ufw deny from 1.2.3.4
ufw status verbose
# firewalld (RHEL/CentOS):
firewall-cmd --add-port=8080/tcp --permanent
firewall-cmd --reload

# ── TLS / CERTIFICATES ────────────────────────────────────
openssl s_client -connect host:443 -servername host
echo | openssl s_client -connect host:443 2>/dev/null | openssl x509 -noout -dates -subject
openssl x509 -in cert.pem -text -noout
openssl verify -CAfile ca.pem cert.pem
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes  # Self-signed
```

## CIDR / Subnet Quick Reference

```
/32 = 1 IP         (single host)
/31 = 2 IPs        (point-to-point link)
/30 = 4 IPs        (2 usable hosts)
/29 = 8 IPs        (6 usable hosts)
/28 = 16 IPs       (14 usable, AWS: 11 usable after reservations)
/27 = 32 IPs       (30 usable)
/26 = 64 IPs       (62 usable)
/25 = 128 IPs      (126 usable)
/24 = 256 IPs      (254 usable) ← most common subnet
/23 = 512 IPs      (510 usable)
/22 = 1,024 IPs
/20 = 4,096 IPs
/16 = 65,536 IPs   ← typical VPC
/8  = 16,777,216 IPs
```
