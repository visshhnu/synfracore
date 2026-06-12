# Networking — Intermediate

## TCP Deep Dive

```bash
# Analyze TCP connections on your server
ss -s                          # Summary: established, time-wait, etc.
ss -tnp state established      # All established TCP connections
ss -tnp state time-wait | wc -l  # Count TIME_WAIT (should be low)

# TIME_WAIT accumulation fix (for high-traffic servers)
# /etc/sysctl.conf:
net.ipv4.tcp_tw_reuse = 1         # Reuse TIME_WAIT sockets
net.ipv4.tcp_fin_timeout = 15     # Reduce from 60s default
net.ipv4.tcp_keepalive_time = 300 # Keepalive after 5 min idle
net.ipv4.tcp_keepalive_intvl = 30 # Retry every 30s
net.ipv4.tcp_keepalive_probes = 3 # Drop after 3 failed probes
sysctl -p                         # Apply without reboot
```

## Linux Network Namespaces (Foundation of Containers)

```bash
# Network namespaces = isolated network stacks
# Docker and Kubernetes use these internally

# Create isolated namespace
ip netns add myns

# Run commands inside namespace
ip netns exec myns ip addr          # Has only loopback
ip netns exec myns ip link set lo up

# Create veth pair (virtual cable between namespaces)
ip link add veth0 type veth peer name veth1
ip link set veth1 netns myns

# Configure IPs
ip addr add 192.168.100.1/24 dev veth0
ip netns exec myns ip addr add 192.168.100.2/24 dev veth1
ip link set veth0 up
ip netns exec myns ip link set veth1 up

# Now host can ping into namespace
ping 192.168.100.2

# This is exactly what Docker does for each container!
# docker inspect <container> | grep IPAddress
```

## iptables / nftables

```bash
# iptables chains:
# INPUT: traffic to this host
# OUTPUT: traffic from this host
# FORWARD: traffic through this host (routing)
# PREROUTING: before routing decision (DNAT)
# POSTROUTING: after routing decision (SNAT/masquerade)

# View all rules with line numbers
iptables -L -n -v --line-numbers

# Allow established connections (critical - add first)
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow specific ports
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -s 10.0.0.0/8 -j ACCEPT  # SSH from internal

# Drop everything else (default deny)
iptables -P INPUT DROP

# NAT - masquerade outbound traffic (for containers/VMs)
iptables -t nat -A POSTROUTING -s 10.0.0.0/8 -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward

# DNAT - port forwarding
iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination 192.168.1.10:8080

# Save rules (persist across reboots)
iptables-save > /etc/iptables/rules.v4
iptables-restore < /etc/iptables/rules.v4

# nftables (modern replacement)
nft list ruleset
nft add rule inet filter input tcp dport 443 accept
```

## Load Balancing Algorithms

```
Round Robin:        Request 1 → Server A, Request 2 → B, Request 3 → C...
                    Simple, even distribution, ignores server load
                    
Least Connections:  Route to server with fewest active connections
                    Better for long-lived connections (WebSocket, streaming)
                    
IP Hash:            hash(client_ip) % num_servers → same client → same server
                    Session affinity without cookies
                    Problem: uneven if clients behind NAT (one IP, many users)
                    
Weighted RR:        Server A weight 3 gets 3x more traffic than Server B weight 1
                    Use for heterogeneous servers
                    
Random with 2:      Pick 2 random servers, send to least loaded of the 2
                    Nginx: random two; HAProxy: leastconn with randomness
                    
Health checking:    Remove unhealthy backends automatically
                    Active: probe /health endpoint every N seconds
                    Passive: detect failures from real traffic errors
```

## Network Troubleshooting Toolkit

```bash
# Full connectivity debug path:

# 1. DNS resolving?
dig +short api.example.com
nslookup api.example.com 8.8.8.8  # Test with specific DNS

# 2. Route reachable?
ip route get 10.0.0.1              # Which interface would be used
traceroute -n 10.0.0.1             # Hop-by-hop path
mtr --report 10.0.0.1              # Combined ping+traceroute

# 3. Port open?
nc -zv 10.0.0.1 443               # TCP connect test
nc -zvu 10.0.0.1 53               # UDP test
timeout 5 bash -c "cat < /dev/tcp/10.0.0.1/443" && echo "Open"

# 4. TLS working?
echo | openssl s_client -connect api.example.com:443 -servername api.example.com 2>/dev/null | openssl x509 -noout -dates
curl -vI https://api.example.com 2>&1 | grep -E "SSL|TLS|cert|expire"

# 5. HTTP response?
curl -w "\nHTTP: %{http_code}\nTime: %{time_total}s\nSize: %{size_download}b\n" -so /dev/null https://api.example.com

# 6. Packet capture (last resort)
tcpdump -i eth0 -n host 10.0.0.1 and port 443 -w /tmp/cap.pcap
tcpdump -i any -n 'tcp port 80' -A  # Print packet content

# 7. Conntrack (stateful firewall state)
conntrack -L | grep 10.0.0.1
```
