# Networking Interview Questions

## Core Concepts

**Q: Explain the OSI model layers and what operates at each.**

| Layer | Name | What Operates Here |
|---|---|---|
| 7 | Application | HTTP, HTTPS, DNS, FTP, SMTP, SSH |
| 6 | Presentation | SSL/TLS encryption, data encoding |
| 5 | Session | Session management (RPC, NetBIOS) |
| 4 | Transport | TCP, UDP — ports, flow control, reliability |
| 3 | Network | IP routing, ICMP, routers |
| 2 | Data Link | Ethernet, MAC addresses, switches |
| 1 | Physical | Cables, signals, NICs |

**TCP vs UDP:**

| | TCP | UDP |
|---|---|---|
| Connection | 3-way handshake | Connectionless |
| Reliability | Guaranteed delivery, retransmission | Fire and forget |
| Order | In-order delivery | No ordering |
| Speed | Slower (overhead) | Faster |
| Use case | HTTP, SSH, databases | DNS, video streaming, gaming, VoIP |

---

**Q: How does DNS resolution work?**

```
Browser: "What's the IP for api.synfracore.com?"

1. Check local cache (OS/browser)
2. Query recursive resolver (ISP or 8.8.8.8)
3. Resolver → Root nameserver (.) → "Ask .com TLD"
4. Resolver → .com TLD nameserver → "Ask synfracore.com nameserver"
5. Resolver → synfracore.com nameserver → "api.synfracore.com = 1.2.3.4"
6. Resolver returns 1.2.3.4, caches it (per TTL)
7. Browser connects to 1.2.3.4
```

**DNS record types:**
- `A`: Domain → IPv4 (api.synfracore.com → 1.2.3.4)
- `AAAA`: Domain → IPv6
- `CNAME`: Alias (www → synfracore.com)
- `MX`: Mail server
- `TXT`: Text (SPF, DKIM, domain verification)
- `NS`: Name server records
- `PTR`: Reverse DNS (IP → domain)
- `SOA`: Start of Authority (primary NS, serial, TTL)

**TTL**: Lower TTL = more DNS queries (higher load) but faster propagation of changes.

---

**Q: Explain TCP handshake and TLS handshake.**

**TCP 3-way handshake:**
```
Client → SYN → Server
Client ← SYN-ACK ← Server
Client → ACK → Server
(Connection established)
```

**TLS 1.3 handshake (simplified):**
```
Client → ClientHello (supported cipher suites, key share) → Server
Client ← ServerHello (chosen cipher, server key share, certificate) ← Server
Client: verifies certificate (trusted CA? domain match? not expired?)
Client → Finished (encrypted with derived session key)
(Session key derived from key shares — no server's private key in key exchange)
```

**TLS 1.3 improvements over 1.2:**
- 1-RTT handshake (vs 2-RTT in TLS 1.2) — faster
- 0-RTT resumption for repeat connections
- Forward secrecy mandatory (ECDHE)
- Removed weak ciphers

---

**Q: What is BGP? How does routing work?**

BGP (Border Gateway Protocol): The routing protocol of the internet. Used between Autonomous Systems (AS) — networks run by different organisations.

```
AS1 (Your company) ←── BGP ──→ AS2 (ISP)
AS2 ←── BGP ──→ AS3 (Google)
```

BGP advertisements: "I can reach 10.0.0.0/24 through this path."
Path selection: BGP prefers routes based on attributes — local preference, AS path length, MED, etc.

**Internal routing (within a company/cloud):**
- OSPF: Link-state, fast convergence, complex
- EIGRP: Cisco proprietary, balanced
- Static routes: For simple predictable topologies

**Cloud VPN/ExpressRoute/Direct Connect**: Extend BGP into cloud — on-prem networks advertise their routes to cloud, cloud advertises its ranges back.

---

**Q: Load balancing — types and algorithms.**

**Layer 4 (L4 / Network):** Routes based on IP + port. No packet inspection.
- Fast, simple. Can't route by URL path or headers.
- Example: AWS NLB, HAProxy (TCP mode)

**Layer 7 (L7 / Application):** Routes based on HTTP content (URL, headers, cookies).
- URL-based routing, SSL termination, sticky sessions, health checks
- Example: AWS ALB, nginx, Traefik, Kong

**Algorithms:**
- **Round Robin**: Requests distributed equally in order
- **Least Connections**: Send to server with fewest active connections
- **IP Hash**: Same client IP always → same server (session sticky)
- **Weighted**: Allocate traffic proportionally (canary: 90%/10% split)
- **Random**: Random selection

**Health checks**: Remove unhealthy backends from rotation automatically.

---

**Q: Common network troubleshooting commands.**

```bash
# Connectivity
ping 8.8.8.8 -c 4
traceroute google.com     # Linux | tracert on Windows
mtr google.com            # Combined ping + traceroute (live)

# DNS
dig synfracore.com        # Full DNS query
dig @8.8.8.8 synfracore.com  # Query specific resolver
nslookup synfracore.com
host synfracore.com

# Ports and connections
ss -tuln                  # Listening ports (modern, replaces netstat)
ss -tunp                  # With process names
lsof -i :443              # What process is using port 443
nc -zv hostname 443       # Test if port is open (netcat)
telnet hostname 443       # Alternative port test
curl -v https://api.example.com  # Full HTTP connection debug

# Packet capture
tcpdump -i eth0 port 443 -w capture.pcap
tcpdump -i eth0 host 1.2.3.4 -n    # Filter by IP
wireshark capture.pcap    # GUI analysis

# Bandwidth
iperf3 -s                 # Server mode
iperf3 -c server-ip       # Client — measure throughput
```

## Revision Notes
```
OSI LAYERS: 7=App(HTTP) 4=Transport(TCP/UDP) 3=Network(IP) 2=Data Link(MAC) 1=Physical

TCP vs UDP: TCP=reliable+ordered (HTTP,SSH,DB) | UDP=fast+no guarantee (DNS,video,gaming)
TCP HANDSHAKE: SYN → SYN-ACK → ACK

DNS RESOLUTION: Local cache → Recursive resolver → Root → TLD → Auth NS → IP
RECORD TYPES: A(IPv4) AAAA(IPv6) CNAME(alias) MX(mail) TXT(SPF/DKIM) NS(nameserver)

TLS 1.3: 1-RTT (vs 2-RTT in 1.2) | Mandatory forward secrecy | Removed weak ciphers
Certificate verification: trusted CA + domain match + not expired

BGP: Internet routing protocol between Autonomous Systems
Path selection: local-pref > AS-path length > MED

LOAD BALANCING:
L4: IP+port routing (fast, simple) | L7: HTTP content routing (URL, headers)
Algorithms: Round Robin | Least Connections | IP Hash (sticky) | Weighted (canary)

TOOLS: ping/mtr(connectivity) | dig/nslookup(DNS) | ss/lsof(ports) | tcpdump(packets)
```
