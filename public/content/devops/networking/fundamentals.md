# Networking — Fundamentals

## OSI Model & TCP vs. UDP

| Layer | Name | What it does | Examples |
|---|---|---|---|
| 7 | Application | User-facing protocols | HTTP, DNS, SMTP, gRPC |
| 6 | Presentation | Encryption, encoding | TLS/SSL |
| 5 | Session | Session management | (rarely a distinct implementation today) |
| 4 | Transport | End-to-end communication | TCP, UDP, ports |
| 3 | Network | Routing between networks | IP, ICMP, routing |
| 2 | Data Link | Node-to-node transfer | Ethernet, MAC |
| 1 | Physical | Raw bits over a medium | Cables, Wi-Fi signals |

```bash
# TCP connection states — worth recognizing directly in ss/netstat output
# LISTEN, SYN_SENT, SYN_RECV, ESTABLISHED, FIN_WAIT, TIME_WAIT, CLOSED

ss -tulpn                      # all listening TCP/UDP sockets with process names
ss -tan state established      # only established TCP connections
ss -s                          # summary counts by state — useful for spotting
                                # a TIME_WAIT pileup (common under high connection churn)
```

## DNS — Domain Name System

```bash
# Resolution flow: browser cache → OS cache → resolver (ISP/8.8.8.8) →
# root servers → TLD servers (.com) → authoritative nameserver

dig example.com                 # basic lookup
dig example.com +short          # just the IP
dig @8.8.8.8 example.com        # query a specific resolver directly
dig example.com +trace          # show the full resolution path, step by step
dig -x 192.0.2.1                # reverse lookup (PTR record)

# Common record types: A (IPv4), AAAA (IPv6), CNAME (alias), MX (mail),
# TXT (verification/SPF), NS (nameserver), SOA (zone authority)
```

**Kubernetes DNS:**
```bash
# Every Service gets a DNS name automatically via CoreDNS:
# <service>.<namespace>.svc.cluster.local

kubectl exec -it mypod -- nslookup myservice.production
kubectl exec -it mypod -- cat /etc/resolv.conf  # confirms the search domains
```

## HTTP/HTTPS & TLS

**HTTP status codes — know these cold:**

| Code | Meaning | DevOps context |
|---|---|---|
| 200 | OK | Health check passing |
| 301/302 | Redirect | HTTP→HTTPS redirect |
| 401 | Unauthorized | Missing or invalid token |
| 403 | Forbidden | Valid token, no permission |
| 429 | Too Many Requests | Rate limiting triggered |
| 502 | Bad Gateway | Upstream returned garbage |
| 503 | Service Unavailable | No healthy backends |
| 504 | Gateway Timeout | Upstream too slow |

```bash
# The TLS handshake, verified manually
echo | openssl s_client -connect example.com:443 -servername example.com \
  2>/dev/null | openssl x509 -noout -dates -subject

# curl for real debugging — see the raw request/response and timing
curl -v https://example.com                    # verbose — headers both ways
curl -w "@curl-format.txt" -o /dev/null -s https://example.com
# curl-format.txt breaks down DNS lookup, TCP connect, TLS handshake,
# and time-to-first-byte separately — essential for isolating WHERE
# latency actually comes from, rather than guessing
```
HTTP/2 multiplexes many requests over a single TCP connection (versus HTTP/1.1 opening a new connection per request, or reusing one serially) — this is why HTTP/2 meaningfully reduces page load time for sites with many small assets, without needing domain sharding tricks HTTP/1.1 relied on.

## Load Balancers

```
L4 (Transport layer) — routes based on IP + port only, protocol-agnostic,
  fast. Example: a Network Load Balancer.
L7 (Application layer) — routes based on HTTP content (path, headers,
  cookies), can do SSL termination, path-based routing, session
  stickiness. Example: an Application Load Balancer, NGINX.
```

```conceptgrid
{
  "boxes": [
    { "title": "L4 — Transport Layer", "description": "Routes on IP + port only, protocol-agnostic, fast. e.g. a Network Load Balancer", "color": "blue" },
    { "title": "L7 — Application Layer", "description": "Routes on HTTP content — path, headers, cookies. SSL termination, session stickiness. e.g. an ALB, NGINX", "color": "purple" }
  ]
}
```

```yaml
# Kubernetes Service types
apiVersion: v1
kind: Service
metadata: { name: web }
spec:
  type: LoadBalancer   # ClusterIP (internal only), NodePort, or LoadBalancer
  selector: { app: web }
  ports: [{ port: 80, targetPort: 8080 }]
```
```nginx
# NGINX as an L7 reverse proxy with basic load balancing
upstream backend {
    least_conn;                 # send to the backend with fewest active connections
    server 10.0.1.10:8080;
    server 10.0.1.11:8080;
}
server {
    listen 443 ssl;
    location / {
        proxy_pass http://backend;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

## Troubleshooting

```bash
# Basic connectivity
ping -c 4 example.com                        # ICMP reachability
traceroute example.com                       # hop-by-hop path
telnet example.com 443                       # is the port even open?
nc -zv example.com 443                       # same, more scriptable

# Kubernetes network debugging
kubectl exec -it mypod -- curl -v http://myservice.production
kubectl get networkpolicy -A                 # a NetworkPolicy could be silently blocking traffic

# Packet capture — for genuinely hard-to-diagnose issues
tcpdump -i eth0 host 10.0.1.10 and port 443 -w capture.pcap

# Firewall/Security Group check (cloud-agnostic pattern)
# confirm the SPECIFIC rule allows the SPECIFIC source, not just "a rule exists"

# TLS-specific issues
openssl s_client -connect example.com:443 -servername example.com
# check for: expired cert, wrong CN/SAN, incomplete chain (missing intermediate)
```

## Interview Questions

**Explain the difference between TCP and UDP. When would you use each?**
TCP (Transmission Control Protocol) is connection-oriented and reliable — before sending data it establishes a connection via a 3-way handshake, every packet is acknowledged, lost packets are retransmitted, and packets arrive in order, at the cost of that overhead making it slower. Use TCP for HTTP/HTTPS, SSH, database connections, and any application where data correctness matters more than raw speed. UDP (User Datagram Protocol) is connectionless and fast — no handshake, no acknowledgment, no ordering guarantee; packets can arrive out of order or be lost entirely, and the application has to handle that itself if it matters. Use UDP for DNS lookups (a single small request/response where retry logic lives at the application layer), video/voice streaming (a dropped frame is preferable to the delay retransmission would cause), and online gaming (latency matters more than guaranteed delivery of every single update).
