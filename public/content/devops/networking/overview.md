# Networking for DevOps

> **OSI model, DNS, SSL/TLS, load balancing, VPC design — production networking**

**Category:** Networking  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is Networking for DevOps?

The OSI model is asked in every DevOps interview. Layer 7 (Application: HTTP/DNS/SMTP), Layer 4 (Transport: TCP/UDP), Layer 3 (Network: IP/routing), Layer 2 (Data Link: MAC/switches), Layer 1 (Physical). Load balancers work at L4 (TCP) or L7 (HTTP). Network policies in Kubernetes work at L3/L4. Service meshes add L7 capabilities. TCP is reliable (handshake, retransmit), UDP is fast (DNS, video streaming).

## Why Networking for DevOps?

DNS resolution: browser cache → OS cache → Recursive resolver → Root nameserver → TLD (.com) → Authoritative nameserver → answer. TTL controls how long resolvers cache the answer. Low TTL = flexible (good for migrations) but more DNS queries. High TTL = fewer queries but slow propagation. In Kubernetes, CoreDNS provides cluster DNS — every service gets a hostname: service-name.namespace.svc.cluster.local.

---

## Learning Modules

### Module 01 — OSI Model & TCP/IP
*Layers 1-7, protocols, ports*

The OSI model is asked in every DevOps interview. Layer 7 (Application: HTTP/DNS/SMTP), Layer 4 (Transport: TCP/UDP), Layer 3 (Network: IP/routing), Layer 2 (Data Link: MAC/switches), Layer 1 (Physical). Load balancers work at L4 (TCP) or L7 (HTTP). Network policies in Kubernetes work at L3/L4. Service meshes add L7 capabilities. TCP is reliable (handshake, retransmit), UDP is fast (DNS, video streaming).

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

DNS resolution: browser cache → OS cache → Recursive resolver → Root nameserver → TLD (.com) → Authoritative nameserver → answer. TTL controls how long resolvers cache the answer. Low TTL = flexible (good for migrations) but more DNS queries. High TTL = fewer queries but slow propagation. In Kubernetes, CoreDNS provides cluster DNS — every service gets a hostname: service-name.namespace.svc.cluster.local.

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
echo | openssl s_client \\\\
  -connect myapp.example.com:443 \\\\
  -servername myapp.example.com 2>/dev/null \\\\
  | openssl x509 -noout -dates -subject

# Check cert expiry (returns days until expiry)
echo | openssl s_client -connect myapp.example.com:443 2>/dev/null \\\\
  | openssl x509 -noout -enddate \\\\
  | awk -F= '{print $2}' \\\\
  | xargs -I{} date -d {} +%s \\\\
  | xargs -I{} sh -c 'echo $(( ({} - $(date +%s)) / 86400 )) days remaining'

# cert-manager — automatic TLS in Kubernetes
# Install cert-manager
helm install cert-manager jetstack/cert-manager \\\\
  --namespace cert-manager \\\\
  --create-namespace \\\\
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
  return 301 https://\\$host\\$request_uri;  # Force HTTPS
}

server {
  listen 443 ssl http2;
  server_name myapp.example.com;

  ssl_certificate     /etc/ssl/certs/myapp.crt;
  ssl_certificate_key /etc/ssl/private/myapp.key;
  ssl_protocols       TLSv1.2 TLSv1.3;
  ssl_session_cache   shared:SSL:10m;

  # Rate limiting (protect from abuse)
  limit_req_zone \\$binary_remote_addr zone=api:10m rate=10r/s;

  location /api/ {
    limit_req zone=api burst=20 nodelay;
    proxy_pass         http://app_servers;
    proxy_set_header   Host \\$host;
    proxy_set_header   X-Real-IP \\$remote_addr;
    proxy_set_header   X-Forwarded-For \\$proxy_add_x_forwarded_for;
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
kubectl get secret myapp-tls-secret -n production \\\\
  -o jsonpath='{.data.tls\\\\.crt}' \\\\
  | base64 -d | openssl x509 -noout -dates
```

---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is Networking for DevOps and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Networking for DevOps work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of Networking for DevOps?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in Networking for DevOps?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with Networking for DevOps?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe Networking for DevOps in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for Networking for DevOps?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Networking for DevOps compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain OSI Model & TCP/IP in Networking for DevOps."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain DNS — Deep Understanding in Networking for DevOps."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [Kubernetes Networking Docs](https://kubernetes.io/docs/concepts/services-networking/)
- [cert-manager Documentation](https://cert-manager.io/docs/)
- [Network Policies Guide](https://kubernetes.io/docs/concepts/services-networking/network-policies/)
- [NGINX Documentation](https://nginx.org/en/docs/)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*