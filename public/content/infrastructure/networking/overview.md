# Networking for DevOps & Cloud Engineers

Networking is the invisible foundation of every cloud system. You cannot debug production issues, design secure architectures, or understand Kubernetes without a solid networking foundation.

## OSI Model — What Actually Matters

```
Layer 7 — Application   HTTP, HTTPS, DNS, SMTP, gRPC
Layer 4 — Transport     TCP (reliable), UDP (fast)
Layer 3 — Network       IP addressing, routing
Layer 2 — Data Link     MAC addresses, Ethernet, VLANs
Layer 1 — Physical      Cables, Wi-Fi (you won't touch this)
```

As a DevOps engineer you live at **Layers 3, 4, and 7**. Understanding these deeply solves 95% of production networking issues.

## IP Addressing & CIDR

```
IPv4 address: 192.168.1.10
Binary:       11000000.10101000.00000001.00001010
              [Network part]        [Host part]

CIDR notation: 192.168.1.0/24
/24 = 24 bits for network = 256 addresses (254 usable)
/16 = 16 bits for network = 65,536 addresses
/32 = single host

Private ranges (RFC 1918 — not routable on internet):
10.0.0.0/8        → 10.x.x.x (large enterprise)
172.16.0.0/12     → 172.16-31.x.x (medium)
192.168.0.0/16    → 192.168.x.x (home/small office)
```

```bash
# Quick CIDR calculations
ipcalc 10.0.0.0/16              # Shows network, broadcast, range
ipcalc 192.168.1.100/24

# Check your IP
ip addr show eth0
ip addr show | grep 'inet '     # All interfaces

# Routing table
ip route show
ip route show default           # Default gateway
route -n                        # Legacy
```

## TCP vs UDP

| | TCP | UDP |
|--|--|--|
| **Reliability** | Guaranteed delivery (ACK) | Best effort, may drop |
| **Order** | Maintains packet order | No ordering |
| **Speed** | Slower (handshake + ACK) | Fast (no overhead) |
| **Use for** | HTTP, HTTPS, SSH, databases | DNS, video, VoIP, gaming |
| **Connection** | Stateful (3-way handshake) | Stateless |

```
TCP 3-way handshake:
Client → SYN     → Server
Client ← SYN-ACK ← Server
Client → ACK     → Server
[Connection established]

TIME_WAIT state: After connection closes, socket stays in TIME_WAIT
for 2×MSL (~60 seconds). Normal — don't panic when you see it.
```

## DNS — How Names Become IPs

```
You type: api.myapp.com

1. Check /etc/hosts                         (local override)
2. Check local DNS cache
3. Ask configured DNS server (8.8.8.8)
4. DNS server checks its cache
5. If not cached: Recursive resolution
   Root nameserver → TLD (.com) → Authoritative (myapp.com)
6. Returns: api.myapp.com → 1.2.3.4
7. Cache the result (TTL seconds)
```

```bash
# DNS lookups
dig api.myapp.com                   # Full DNS query
dig api.myapp.com A                 # Only A records
dig api.myapp.com MX                # Mail records
dig api.myapp.com @8.8.8.8          # Use specific DNS server
dig +short api.myapp.com            # Just the IP
nslookup api.myapp.com

# Reverse DNS (IP → hostname)
dig -x 1.2.3.4

# Check DNS propagation
dig @ns1.example.com api.myapp.com  # Ask specific nameserver
dig @8.8.8.8 api.myapp.com          # Google DNS
dig @1.1.1.1 api.myapp.com          # Cloudflare DNS

# DNS record types
A       → IPv4 address
AAAA    → IPv6 address
CNAME   → Alias (points to another name)
MX      → Mail server
TXT     → Text (used for SPF, DKIM, domain verification)
NS      → Nameserver
SOA     → Start of Authority (zone metadata)

# Local DNS
cat /etc/resolv.conf                # DNS servers configured
cat /etc/hosts                      # Local overrides
```

## Ports — What Runs Where

```
Well-known ports (0-1023) — require root to bind:
22    SSH
25    SMTP (email)
53    DNS
80    HTTP
443   HTTPS
3306  MySQL
5432  PostgreSQL
6379  Redis
27017 MongoDB

Registered ports (1024-49151):
8080  HTTP alternative
8443  HTTPS alternative
9090  Prometheus
3000  Grafana / Node.js default
5601  Kibana
9200  Elasticsearch

Ephemeral ports (49152-65535):
Used by clients for outbound connections
```

```bash
# Check what's listening
ss -tlnp                            # TCP listening, numeric, with process
ss -ulnp                            # UDP listening
netstat -tlnp                       # Legacy
lsof -i :8080                       # What's on port 8080
lsof -i -P -n | grep LISTEN        # All listening processes

# Test connectivity
nc -zv host 443                     # Test TCP port open
nc -zv -w3 host 443                 # With 3 second timeout
curl -I https://api.example.com     # HTTP check
telnet host 22                      # Old school (still works)
```

## Firewalls — iptables & Security Groups

```bash
# iptables — Linux kernel firewall
# Chains: INPUT (incoming), OUTPUT (outgoing), FORWARD (routing)

# View rules
iptables -L -n -v                   # List all rules
iptables -L INPUT -n -v             # INPUT chain only

# Allow SSH
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Allow established connections (critical — don't lock yourself out!)
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Block an IP
iptables -A INPUT -s 1.2.3.4 -j DROP

# Drop all other incoming
iptables -A INPUT -j DROP

# UFW (Ubuntu Firewall — simpler interface)
ufw status
ufw allow 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw deny 3306                       # Block MySQL from outside
ufw enable
ufw delete allow 80/tcp
```

## Load Balancing

```
Layer 4 (TCP/UDP):
  Routes based on IP + port only
  Faster — no content inspection
  Examples: AWS NLB, HAProxy TCP mode

Layer 7 (HTTP/HTTPS):
  Routes based on URL path, headers, cookies
  Can modify requests/responses
  Examples: AWS ALB, nginx, Traefik, Envoy

Algorithms:
  Round Robin       → Request 1→server1, 2→server2, 3→server3, 4→server1
  Least Connections → Send to server with fewest active connections
  IP Hash           → Same client IP always goes to same server (sticky)
  Weighted          → Server3 gets 3× traffic of server1

Health checks:
  TCP check         → Can we connect?
  HTTP check        → Does /health return 200?
  Interval: 10s, Threshold: 2 failures before marking unhealthy
```

## Network Troubleshooting Workflow

```bash
# Step 1: Can I reach the host at all?
ping -c 4 api.example.com

# Step 2: Is the route correct?
traceroute api.example.com
mtr api.example.com               # Better — shows packet loss per hop

# Step 3: Is the port open?
nc -zv api.example.com 443
curl -v https://api.example.com

# Step 4: DNS resolution correct?
dig api.example.com
# Expected: ANSWER section with correct IP

# Step 5: SSL certificate valid?
echo | openssl s_client -connect api.example.com:443 2>/dev/null \
  | openssl x509 -noout -dates -subject

# Step 6: Capture traffic (last resort)
tcpdump -i eth0 host api.example.com -w capture.pcap
tcpdump -i eth0 port 443
wireshark capture.pcap             # Analyze in GUI

# Common issues:
# Connection refused → Service not running or wrong port
# Connection timed out → Firewall blocking or host unreachable
# Name not resolved → DNS issue
# SSL handshake failed → Cert expired or wrong hostname
```

## Kubernetes Networking Deep Dive

```
Every Pod gets unique IP (from CNI plugin: Calico, Flannel, Cilium)
Pods on same node: communicate directly via bridge
Pods on different nodes: CNI creates overlay or BGP routes

Service types and how they route:
ClusterIP:
  kube-proxy creates iptables rules
  ClusterIP → iptables DNAT → random pod IP
  
NodePort:
  Opens port 30000-32767 on EVERY node
  Traffic: node:port → iptables → pod
  
LoadBalancer:
  Creates cloud LB (ELB/ALB/Azure LB)
  Cloud LB → NodePort on node → iptables → pod

DNS in cluster:
  CoreDNS resolves service names
  my-service.my-namespace.svc.cluster.local
  Within same namespace: just use my-service
  Cross-namespace: my-service.other-namespace
```

## Interview Questions

**What happens when you curl https://api.example.com?**
1. DNS resolution: OS checks /etc/hosts, then DNS server, gets IP
2. TCP connection: 3-way handshake to port 443
3. TLS handshake: server presents certificate, client verifies, negotiate cipher, exchange keys
4. HTTP request sent encrypted over established TLS session
5. Server processes, sends encrypted response
6. Client decrypts, renders/parses response

**What is NAT and why does Kubernetes need it?**
Network Address Translation maps private IPs to public IPs. Your home router does NAT — your laptop has 192.168.1.x but internet sees your router's public IP. Kubernetes uses NAT (via iptables MASQUERADE) when pods communicate with external services — pod IP gets translated to node's IP. This is why pods can reach the internet but external systems can't directly reach pod IPs without a Service.
