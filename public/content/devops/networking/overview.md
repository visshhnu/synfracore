# Networking for DevOps

> **OSI model, DNS, SSL/TLS, load balancing, VPC design — production networking**

**Category:** Networking  
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

**Before you start:** you need basic Linux command-line comfort (see the Linux course if that's new) and a rough sense of what an IP address and a "port" are. No prior networking-specific knowledge is assumed — this page starts from first principles.

---

## What is Networking for DevOps?

Every application that talks to anything else — a browser talking to a web server, one microservice calling another, a Kubernetes node reaching the control plane — does it over a network, and the way that communication is organized follows a shared mental model called the **OSI model**: seven layers, each responsible for one part of getting data from one machine to another. You don't need to memorize all seven to work in DevOps, but three come up constantly: **Layer 7 (Application)** — the actual protocols apps use, like HTTP, DNS, SMTP; **Layer 4 (Transport)** — TCP or UDP, which decide how reliably data gets delivered; **Layer 3 (Network)** — IP addressing and routing, how a packet finds its way from one machine to another at all. A load balancer, for example, can work "at L4" (routing raw TCP/UDP traffic, fast but blind to what's inside it) or "at L7" (reading the actual HTTP request to route based on URL path — slower, but far more capable).

**TCP** guarantees reliable, in-order delivery (a handshake to set up the connection, retransmission if something's lost) — the right choice when every byte matters, like a database connection. **UDP** skips all that overhead for speed, accepting that some data might be lost — the right choice for things like DNS lookups or video streaming, where a dropped packet just means a retry or a tiny glitch, not corrupted data.

## Why Networking for DevOps?

Application code assumes the network "just works," but as a DevOps/platform engineer, you're the one who has to know *why* it doesn't when it doesn't — and a huge share of production incidents that look like "the app is broken" are actually a networking problem one layer down (DNS not resolving, a certificate that expired, a load balancer routing to the wrong place, a Kubernetes NetworkPolicy silently blocking traffic). A concrete example worth understanding end to end: when a browser looks up `myapp.example.com`, it checks its own cache first, then the OS's cache, then asks a recursive resolver, which — if it doesn't already know the answer — walks the DNS hierarchy itself (a root nameserver, then the `.com` registry, then the domain's own authoritative nameserver) before finally getting an answer back. How long that answer gets cached is controlled by **TTL** (Time To Live) — a low TTL means you can change where a domain points quickly (useful during a migration) at the cost of more DNS queries; a high TTL means fewer queries but slower propagation if you need to change something. Inside a Kubernetes cluster, this same idea shows up as **CoreDNS**, which gives every internal Service its own hostname so Pods can reach each other by name instead of a constantly-changing IP.

---

## Learning Modules

### Module 01 — OSI Model & TCP/IP
*Layers 1-7, protocols, ports*

**Topics covered:**

- OSI 7 layers and what happens at each — 🟢 Beginner
- TCP vs UDP — when to use each — 🟢 Beginner
- Common ports every DevOps must know — 🟢 Beginner
- TCP handshake and connection states — 🟡 Intermediate

```bash
# Must-know ports for DevOps
22    SSH
80    HTTP
443   HTTPS
53    DNS (UDP + TCP)
6443  Kubernetes API Server
2379  etcd client port
2380  etcd peer port
9090  Prometheus
3000  Grafana
9200  Elasticsearch
5601  Kibana
9092  Kafka
5432  PostgreSQL
3306  MySQL
6379  Redis
8080  Common app port
8443  Common HTTPS alt
27017 MongoDB

# TCP handshake (SYN → SYN-ACK → ACK)
# Why it matters: half-open connections waste resources
# Time-wait state: connection stays for 2 × MSL after close
# Check connection states:
ss -tn | awk '{print $1}' | sort | uniq -c | sort -rn
# Many TIME-WAIT = normal for high-traffic servers
# Many CLOSE-WAIT = app not closing connections (bug)
# SYN-RECV flood = possible SYN DDoS attack
```

### Module 02 — DNS — Deep Understanding
*Resolution, records, TTL, troubleshooting*

**Topics covered:**

- DNS resolution chain — 🟡 Intermediate
- A, AAAA, CNAME, MX, TXT, SRV records — 🟢 Beginner
- TTL and propagation — 🟢 Beginner
- CoreDNS in Kubernetes — 🟡 Intermediate
- DNS troubleshooting tools — 🟡 Intermediate

```bash
# DNS record types
# A record: hostname → IPv4
myapp.example.com.  300  IN  A  192.0.2.1

# CNAME: alias → canonical name (cannot be apex/root)
www.example.com.    300  IN  CNAME  myapp.example.com.

# TXT: text data (used for SPF, DKIM, domain verification)
example.com.  300  IN  TXT  "v=spf1 include:sendgrid.net ~all"

# SRV: service discovery (_service._proto.name TTL IN SRV priority weight port target)
_https._tcp.example.com.  300  IN  SRV  10 5 443 myapp.example.com.

# DNS troubleshooting toolkit
dig example.com                    # Basic lookup
dig example.com +short             # IP only
dig @8.8.8.8 example.com          # Query specific resolver
dig example.com +trace             # Full resolution path
dig -x 192.0.2.1                  # Reverse lookup (PTR)
nslookup example.com              # Alternative tool

# Kubernetes DNS
# Service: myapp in namespace production
# Internal FQDN: myapp.production.svc.cluster.local
# Short form (same namespace): myapp
# Cross-namespace: myapp.production

kubectl exec -it mypod -- nslookup myapp.production.svc.cluster.local
kubectl exec -it mypod -- cat /etc/resolv.conf
# search production.svc.cluster.local svc.cluster.local cluster.local
# nameserver 10.96.0.10   ← CoreDNS service IP
```

### Module 03 — SSL/TLS
*Certificates, handshake, cert-manager*

TLS encrypts data in transit and authenticates the server. TLS 1.3 is current standard (1.2 is acceptable, never 1.0/1.1). Certificate chain: Root CA → Intermediate CA → Server cert. In Kubernetes, cert-manager automates certificate issuance and renewal using Let's Encrypt (free) or internal PKI. Never let certificates expire in production — automate renewal.

**Topics covered:**

- TLS handshake (what happens) — 🟡 Intermediate
- Certificate types (DV/OV/EV/wildcard) — 🟢 Beginner
- openssl commands for cert inspection — 🟡 Intermediate
- cert-manager in Kubernetes — 🟡 Intermediate

```bash
# SSL/TLS inspection commands
# Check certificate from command line
echo | openssl s_client \
  -connect myapp.example.com:443 \
  -servername myapp.example.com 2>/dev/null \
  | openssl x509 -noout -dates -subject

# Check cert expiry (returns days until expiry)
echo | openssl s_client -connect myapp.example.com:443 2>/dev/null \
  | openssl x509 -noout -enddate \
  | awk -F= '{print $2}' \
  | xargs -I{} date -d {} +%s \
  | xargs -I{} sh -c 'echo $(( ({} - $(date +%s)) / 86400 )) days remaining'

# cert-manager — automatic TLS in Kubernetes
# Install cert-manager
helm install cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --set installCRDs=true

# ClusterIssuer — use Let's Encrypt
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-prod
spec:
  acme:
    server: https://acme-v02.api.letsencrypt.org/directory
    email: ops@company.com
    privateKeySecretRef:
      name: letsencrypt-prod
    solvers:
    - http01:
        ingress:
          class: nginx

# Certificate — auto-issued and renewed
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: myapp-tls
  namespace: production
spec:
  secretName: myapp-tls-secret
  issuerRef:
    name: letsencrypt-prod
    kind: ClusterIssuer
  dnsNames:
  - myapp.example.com
  - www.myapp.example.com
```

### Module 04 — IP Addressing & CIDR
*Subnetting, VPC design, NAT*

CIDR (Classless Inter-Domain Routing) notation: IP/prefix-length. /24 = 256 addresses (254 usable). /16 = 65,536 addresses. /32 = single host. Private ranges: 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16. Plan VPC CIDRs carefully — overlapping ranges prevent VPC peering and VPN connections. Kubernetes needs separate CIDRs for nodes, pods, and services.

**Topics covered:**

- CIDR notation and subnetting — 🟡 Intermediate
- Private IP ranges (RFC 1918) — 🟢 Beginner
- VPC CIDR planning — 🔴 Advanced
- NAT and PAT — 🟡 Intermediate
- Kubernetes pod/service CIDR — 🟡 Intermediate

```bash
# CIDR quick reference
10.0.0.0/32   = 1 host    (single IP)
10.0.0.0/30   = 4 IPs     (2 usable — point-to-point)
10.0.0.0/28   = 16 IPs    (14 usable)
10.0.0.0/24   = 256 IPs   (254 usable — typical subnet)
10.0.0.0/22   = 1024 IPs  (1022 usable)
10.0.0.0/20   = 4096 IPs  (typical large subnet)
10.0.0.0/16   = 65536 IPs (entire VPC range)
10.0.0.0/8    = 16M IPs   (largest private range)

# Non-overlapping VPC CIDR plan (multi-cloud/peering)
# Production VPC:    10.0.0.0/16   (65k addresses)
#   Public subnet:   10.0.1.0/24   (load balancers, NAT)
#   Private subnet:  10.0.10.0/22  (application servers)
#   DB subnet:       10.0.20.0/24  (databases, isolated)
# Staging VPC:       10.1.0.0/16   (different /16 block)
# Dev VPC:           10.2.0.0/16

# Kubernetes CIDR planning (must not overlap with VPC)
# Node CIDR:    10.0.0.0/16  (VPC range)
# Pod CIDR:     172.16.0.0/16  (separate range)
# Service CIDR: 172.20.0.0/16  (separate range)

# Check routing table
ip route show
route -n

# Test connectivity
ping -c 3 10.0.0.1
traceroute 10.0.0.1
mtr 10.0.0.1    # Continuous traceroute
```

### Module 05 — Load Balancers & Reverse Proxy
*L4 vs L7, NGINX, HAProxy*

L4 (TCP/UDP) load balancers route based on IP:port — fast, no content inspection. L7 (HTTP/HTTPS) load balancers route based on URL path, headers, cookies — can do path-based routing, session stickiness, SSL termination. NGINX is the most common reverse proxy and L7 LB. HAProxy is the go-to for very high-performance TCP/HTTP load balancing.

**Topics covered:**

- L4 vs L7 load balancing — 🟡 Intermediate
- NGINX as reverse proxy and LB — 🟡 Intermediate
- HAProxy for high-performance LB — 🔴 Advanced
- Health checks and connection draining — 🟡 Intermediate
- SSL termination at LB — 🟡 Intermediate

```bash
# NGINX production config — reverse proxy with SSL termination
upstream app_servers {
  least_conn;    # Route to least busy server
  server app1:8080 weight=3 max_fails=3 fail_timeout=30s;
  server app2:8080 weight=2 max_fails=3 fail_timeout=30s;
  server app3:8080 backup;    # Only if others fail
  keepalive 32;               # Persistent connections
}

server {
  listen 80;
  return 301 https://$host$request_uri;  # Force HTTPS
}

server {
  listen 443 ssl http2;
  server_name myapp.example.com;

  ssl_certificate     /etc/ssl/certs/myapp.crt;
  ssl_certificate_key /etc/ssl/private/myapp.key;
  ssl_protocols       TLSv1.2 TLSv1.3;
  ssl_session_cache   shared:SSL:10m;

  # Rate limiting (protect from abuse)
  limit_req_zone $binary_remote_addr zone=api:10m rate=10r/s;

  location /api/ {
    limit_req zone=api burst=20 nodelay;
    proxy_pass         http://app_servers;
    proxy_set_header   Host $host;
    proxy_set_header   X-Real-IP $remote_addr;
    proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_connect_timeout  5s;
    proxy_read_timeout    30s;
  }

  location /health {
    return 200 "ok";
    add_header Content-Type text/plain;
  }
}

# HAProxy frontend + backend
frontend https_front
  bind *:443 ssl crt /etc/ssl/myapp.pem
  default_backend app_servers
  option forwardfor
  http-request set-header X-Forwarded-Proto https

backend app_servers
  balance roundrobin
  option httpchk GET /health
  server app1 10.0.1.10:8080 check inter 5s fall 3 rise 2
  server app2 10.0.1.11:8080 check inter 5s fall 3 rise 2
```

### Module 06 — Kubernetes Networking
*CNI, Network Policies, Ingress*

Kubernetes networking is flat — every pod gets its own IP, every pod can reach every other pod by default. CNI plugins implement this. Calico adds Network Policies. Cilium uses eBPF for better performance. Network Policies are a whitelist — if any policy selects a pod, ALL unmatched traffic is blocked. Ingress controllers (NGINX, Traefik) route external HTTP traffic to services.

**Topics covered:**

- Pod networking — flat network model — 🟡 Intermediate
- CNI plugins (Calico, Cilium, Flannel) — 🔴 Advanced
- Network Policies — K8s firewall — 🔴 Advanced
- Ingress controllers — 🟡 Intermediate
- CoreDNS configuration — 🔴 Advanced

```bash
# Network Policy — zero-trust: deny all, allow specific
# 1. Deny all ingress by default for production namespace
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: deny-all-ingress
  namespace: production
spec:
  podSelector: {}     # Applies to ALL pods
  policyTypes:
  - Ingress           # Blocks all inbound traffic

# 2. Allow only payment service to reach database
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-payment-to-db
  namespace: production
spec:
  podSelector:
    matchLabels:
      app: postgresql
  policyTypes:
  - Ingress
  ingress:
  - from:
    - podSelector:
        matchLabels:
          app: payment-api   # Only payment pods
    ports:
    - protocol: TCP
      port: 5432

# 3. Allow ingress controller to reach all app pods
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-from-ingress
  namespace: production
spec:
  podSelector: {}
  ingress:
  - from:
    - namespaceSelector:
        matchLabels:
          name: ingress-nginx
    ports:
    - protocol: TCP
      port: 8080
```

---

## Production Example

```bash
# Networking Troubleshooting — Production Runbook

# ── CONNECTIVITY ISSUE ────────────────────────────────────
# Step 1: Can the pod reach anything?
kubectl exec -it <pod> -- ping 8.8.8.8
kubectl exec -it <pod> -- curl -s https://google.com

# Step 2: Can it reach the service?
kubectl exec -it <pod> -- nslookup myservice.production
kubectl exec -it <pod> -- curl -v http://myservice.production:8080/health

# Step 3: Are endpoints populated?
kubectl get endpoints myservice -n production
# If empty → pod labels don't match Service selector
kubectl describe svc myservice -n production | grep Selector
kubectl get pods --show-labels -n production | grep myapp

# Step 4: Network Policy blocking?
kubectl get networkpolicy -n production
# If any NP exists: traffic is blocked by default unless explicitly allowed
kubectl describe networkpolicy <name>

# ── DNS NOT RESOLVING ─────────────────────────────────────
kubectl exec -it <pod> -- nslookup kubernetes.default
# If fails: CoreDNS problem
kubectl get pods -n kube-system | grep coredns
kubectl logs -n kube-system <coredns-pod> | tail -20

# ── SSL CERTIFICATE EXPIRED ───────────────────────────────
# Check cert-manager certificates
kubectl get certificate -A
kubectl describe certificate myapp-tls -n production
# Status should be: Ready = True

# Check when cert expires
kubectl get secret myapp-tls-secret -n production \
  -o jsonpath='{.data.tls\.crt}' \
  | base64 -d | openssl x509 -noout -dates
```

---

## Interview Prep

**PSR Formula:** Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

**Q1. What is Networking for DevOps and why does it matter in production?**

**A:** **Problem:** application code assumes the network "just works" — but as the engineer responsible for the systems underneath it, a huge share of incidents that look like "the app is broken" actually turn out to be a networking problem: DNS not resolving, an expired certificate, a load balancer routing to the wrong place. **Solution:** knowing the actual mechanics (how DNS resolution works, what TCP vs. UDP trade off, how a load balancer decides where traffic goes) turns "something's wrong with the network" into a specific, checkable hypothesis instead of a guess. **Result:** most networking incidents get isolated to one specific layer (DNS, TLS, routing, or the load balancer) within minutes once you know which tool checks which layer.

---

**Q2. Explain the OSI model, concretely, not just as a list of layer names.**

**A:** **Problem:** reciting "Layer 1 through 7" without a real mental model of what each one *does* doesn't actually help debug anything. **Solution:** in DevOps work, three layers matter most: Layer 3 (IP addressing/routing — does a packet know how to get from A to B at all), Layer 4 (TCP/UDP — is delivery reliable or best-effort), and Layer 7 (the actual application protocol — HTTP, DNS — where content-aware routing happens). **Result:** this is exactly why a load balancer can operate "at L4" (fast, just forwards TCP/UDP packets, blind to what's inside) or "at L7" (slower, but can route based on URL path or add features like SSL termination) — the layer tells you what information that piece of infrastructure can and can't see.

---

**Q3. What are the main components involved in a request reaching a production service?**

**A:** **Problem:** "the network" isn't one thing — a single request touches DNS, TLS, routing, and the application layer, each of which can fail independently. **Solution:** DNS resolves a hostname to an IP; TCP (or UDP) establishes the actual connection; TLS encrypts and authenticates it if it's HTTPS; a load balancer or Ingress decides which backend instance actually handles it; the application itself processes the request. **Result:** knowing this chain is what makes triage fast — "DNS is fine, TLS handshake succeeds, but the app times out" already rules out three of the five components before you've opened a single application log.

---

**Q4. How do you handle a networking failure in production — what's your actual diagnostic order?**

**A:** **Problem:** treating every "can't connect" report as a fresh mystery doesn't scale. **Solution:** work outward-in: can the client resolve DNS at all (`dig`/`nslookup`)? Can it establish a TCP connection (`curl -v`, or `nc -zv host port`)? Does the TLS handshake succeed if it's HTTPS? Is the load balancer/Ingress actually routing to a healthy backend? **Result:** this ordered sequence is exactly what the Production Example runbook above walks through — it isolates which of DNS, connectivity, or the application itself is actually the problem, rather than guessing.

---

**Q5. What is your production experience with networking issues?**

**A:** This is a genuinely personal question — answer with a real incident using Problem → Solution → Result: what broke (DNS not resolving after a migration, a certificate that silently expired, a Kubernetes NetworkPolicy blocking traffic that used to work), your actual diagnostic sequence, and what the root cause turned out to be. Interviewers are listening for a real methodology, not textbook recall of OSI layers.

---

**Q6. How do you monitor and observe networking in production?**

**A:** **Problem:** networking failures are often silent until they cause an outage — a certificate expiring, DNS TTL misconfiguration, or a slowly growing connection-leak aren't visible unless you're watching for them. **Solution:** track certificate expiry proactively (don't wait for `curl` to fail with a TLS error), monitor DNS query latency/failure rates, and watch connection states (`ss`/`netstat` — a growing `CLOSE-WAIT` count signals an application-level leak, not a network bug). **Result:** these catch problems while there's still time to fix them — an expiring certificate caught a week out is a scheduled task; one caught by a customer report is an outage.

---

**Q7. What are the security considerations for networking?**

**A:** **Problem:** an open, unencrypted, unrestricted network is a direct path for an attacker who reaches any single machine on it. **Solution:** encrypt in transit (TLS everywhere, not just at the edge), restrict what can talk to what (firewalls, security groups, Kubernetes NetworkPolicies with a default-deny baseline), and never let certificates or DNS records silently drift out of date. **Result:** these are the same defense-in-depth principles used at the container/orchestration layer (see Docker and Kubernetes' own security material), applied one level below, at the network layer itself.

---

**Q8. TCP vs. UDP — how do you decide which one a given system should use?**

**A:** **Problem:** picking the wrong one either wastes performance (using TCP where occasional loss is fine) or breaks correctness (using UDP where every byte matters). **Solution:** ask whether losing or reordering a small amount of data is acceptable — if yes (video streaming, a DNS query, a metrics scrape where the next sample arrives in seconds anyway), UDP's lower overhead wins; if no (a database connection, an API call, an SSH session), TCP's guaranteed in-order delivery is worth the extra overhead. **Result:** this is exactly why DNS uses UDP by default (a lost query just gets retried immediately) but falls back to TCP for large responses, and why every database driver you'll ever use is built on TCP, never UDP.

---

**Q9. Walk through what actually happens when a browser looks up a domain name.**

**A:** **Problem:** "DNS resolves the domain" hides several distinct steps, each a separate potential failure point. **Solution:** the browser checks its own cache, then the OS's cache; if neither has it, it asks a recursive resolver (often your ISP's or a public one like 8.8.8.8), which — if it doesn't already know — walks the hierarchy itself: a root nameserver points it to the right TLD server (e.g. `.com`), which points it to the domain's own authoritative nameserver, which finally returns the actual answer. **Result:** this is why `dig +trace` (which shows this exact chain) is the right tool when DNS "isn't working" — it shows you precisely which step in that chain is returning a wrong or missing answer, rather than treating "DNS is broken" as one undifferentiated problem.

---

**Q10. How does TLS/SSL actually protect a connection, and what goes wrong when a certificate is misconfigured?**

**A:** **Problem:** "HTTPS is on" doesn't automatically mean the connection is actually trustworthy — a misconfigured or expired certificate can silently break clients or, worse, get silently ignored by a client that isn't validating properly. **Solution:** TLS does two separate jobs — it encrypts the data in transit, and it authenticates the server via a certificate chain (the server's cert, signed by an intermediate CA, ultimately signed by a root CA your browser already trusts). An expired, wrong-hostname, or untrusted-chain certificate fails that second job even if encryption itself would still technically work. **Result:** this is why automating renewal (via something like cert-manager in Kubernetes) matters more than getting the initial setup right once — a correctly-issued certificate that's allowed to expire causes the exact same outage as never having one.

---

## Official Resources

- [Kubernetes Networking Docs](https://kubernetes.io/docs/concepts/services-networking/)
- [cert-manager Documentation](https://cert-manager.io/docs/)
- [Network Policies Guide](https://kubernetes.io/docs/concepts/services-networking/network-policies/)
- [NGINX Documentation](https://nginx.org/en/docs/)

---

## OSI Model — Reference Table

| Layer | Number | Name | Key Protocols | DevOps Relevance |
|-------|--------|------|---------------|-----------------|
| Application | 7 | Application | HTTP, HTTPS, DNS, SMTP, SSH | All web traffic, APIs, kubectl |
| Presentation | 6 | Presentation | TLS/SSL, JPEG, JSON | TLS termination at load balancer |
| Session | 5 | Session | NetBIOS, RPC | Connection management |
| Transport | 4 | Transport | TCP, UDP | Load balancer L4, port-based routing |
| Network | 3 | Network | IP, ICMP, BGP | Routing, VPC, subnet design |
| Data Link | 2 | Data Link | Ethernet, MAC, ARP | Switch-level, overlay networks |
| Physical | 1 | Physical | Copper, Fiber, WiFi | Data center cabling |

**Remember:** "All People Seem To Need Data Processing" (7 → 1)

---

## TCP vs UDP — Comparison Table

| Property | TCP | UDP |
|----------|-----|-----|
| Connection | Connection-oriented (3-way handshake) | Connectionless |
| Reliability | Guaranteed delivery (retransmit on loss) | Best-effort (may drop packets) |
| Order | In-order delivery | No ordering guarantee |
| Speed | Slower (ACK overhead) | Faster (no ACK wait) |
| Use cases | HTTP, HTTPS, SSH, databases, email | DNS, streaming video, VoIP, gaming |
| K8s relevance | Most services (API server, databases) | CoreDNS queries, monitoring UDP |

### Concrete Scenarios

1. **Video streaming (YouTube/Netflix)** → UDP: slight packet loss = minor glitch. Waiting for retransmit = freezing.
2. **Bank payment API** → TCP: every byte must arrive in order. Cannot lose a transaction.
3. **DNS query** → UDP: single packet, fast response. If lost, client retries immediately.
4. **SSH session** → TCP: guaranteed in-order delivery of keystrokes matters.
5. **Kubernetes liveness probe (HTTP)** → TCP: kubelet opens TCP connection, checks response.
6. **Prometheus scrape** → TCP/HTTP: reliable metric collection matters for alerting accuracy.

---

## Kubernetes Networking Quick Reference

```
Pod → Service (ClusterIP) → kube-proxy (iptables/IPVS) → Pod
External → LoadBalancer Service → NodePort → ClusterIP → Pod
External → Ingress Controller → ClusterIP Service → Pod
Pod ↔ Pod (same node): directly via CNI (Flannel/Calico/Cilium)
Pod ↔ Pod (different node): via overlay network (VXLAN/BGP)
```

DNS pattern: `<service>.<namespace>.svc.cluster.local`
Example: `postgres.production.svc.cluster.local`
