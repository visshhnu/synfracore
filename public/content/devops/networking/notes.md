# Networking for DevOps — Revision Notes

Condensed reference for quick review. Consolidated from this course's certification and interview material.

**One thing worth flagging directly:** the original content gap audit for this technology pointed to `devops/networking/interview.md`'s "Key Takeaways" section as reusable raw material for this Notes file. On inspection, that section turned out to be entirely generic boilerplate ("Understand the core architecture and design decisions," "Practice the commands hands-on") with zero networking-specific content — it was the same kind of unfilled template found elsewhere in this repo, not real notes. This file is built instead from the genuine technical content in `infrastructure/networking/certification.md`'s and `interview.md`'s Revision Notes sections, which held up on inspection.

---

## OSI Model — Quick Reference

```
7 Application   HTTP, HTTPS, DNS, SMTP, SSH        "All People"
6 Presentation  TLS/SSL, encoding                   "Seem To"
5 Session       connection mgmt (rarely distinct today) "Need Data"
4 Transport ⭐  TCP, UDP — PORTS live here          "Processing"
3 Network ⭐    IP, ICMP, routing, BGP
2 Data Link     MAC, Ethernet, ARP, switches
1 Physical      cables, fiber, radio

⭐ = where most DevOps tooling actually operates (load balancers,
    NetworkPolicies, VPC/subnet design)
```

## TCP vs. UDP

```
TCP: 3-way handshake (SYN→SYN-ACK→ACK), reliable (retransmits),
     ordered, flow control, SLOWER (overhead)
     Use: HTTP/S, SSH, databases, file transfer

UDP: connectionless, no ACKs, no retransmission, no ordering, FASTER
     Use: DNS, video streaming, gaming, VoIP, NTP

Key insight: TCP's guarantee is CORRECTNESS over TIME — for latency-
sensitive use cases (video, gaming) waiting for a guaranteed-correct
retransmission can be worse than tolerating occasional loss, which is
exactly why those use cases pick UDP instead (see this course's FAQ).
```

## IP Addressing / CIDR — Memorize These Cold

```
/32 = 1 host          /28 = 16 (14 usable, 11 on AWS after reservations)
/31 = 2 (RFC 3021)     /27 = 32 (30 usable)
/30 = 4 (2 usable)     /26 = 64 (62 usable)
/29 = 8 (6 usable)     /24 = 256 (254 usable) ← MOST COMMON
                       /16 = 65,536 ← typical whole VPC
                       /8  = 16.7M ← largest private range

Formula: usable hosts = 2^(32-prefix) - 2

Private ranges (RFC 1918, not internet-routable):
  10.0.0.0/8       172.16.0.0/12       192.168.0.0/16
                   (Docker default bridge: 172.17.0.0/16)

AWS subnet gotcha: AWS reserves 5 addresses per subnet (network,
router, DNS, future-use, broadcast) — a /28 has 14 usable by classic
subnetting rules but only 11 usable on AWS specifically.

VLSM example (largest allocation first, to avoid fragmentation):
  192.168.1.0/24 → 50 hosts: /26 → 192.168.1.0/26
                 → 25 hosts: /27 → 192.168.1.64/27
                 → 10 hosts: /28 → 192.168.1.96/28
```

## DNS

```
Resolution chain: local cache → OS cache → recursive resolver
  (ISP/8.8.8.8) → root nameserver → TLD nameserver (.com) →
  authoritative nameserver → answer, cached per TTL

TTL: LOW = flexible, more queries (use before planned migrations)
     HIGH = fewer queries, slower propagation of changes

Record types: A(IPv4) AAAA(IPv6) CNAME(alias, not usable at apex)
  MX(mail) TXT(SPF/DKIM/verification) NS(nameserver) PTR(reverse)
  SRV(service discovery) SOA(zone authority)

Kubernetes: CoreDNS provides <service>.<namespace>.svc.cluster.local
  automatically for every Service. DNS failing INSIDE a cluster →
  check CoreDNS pod health first, not the public DNS chain.

dig example.com +trace    → full resolution path, step by step
dig @8.8.8.8 example.com  → query a specific resolver directly
```

## TLS / Certificates

```
TLS 1.3 (current standard) vs 1.2:
  1-RTT handshake (vs 2-RTT)          faster
  0-RTT resumption for repeat conns   faster still
  Forward secrecy MANDATORY (ECDHE)   more secure by default
  Removed weak ciphers                more secure

Certificate chain: Root CA → Intermediate CA → Server cert
Verification checks: trusted CA + domain match (CN/SAN) + not expired

cert-manager (Kubernetes): automates issuance + renewal via Let's
  Encrypt or internal PKI. NEVER let certs expire manually — automate
  renewal AND alert on expiry independently as defense-in-depth (see
  this course's Real World Scenarios — automation itself can fail
  silently).

openssl s_client -connect host:443 -servername host 2>/dev/null | \
  openssl x509 -noout -dates -subject       ← check expiry + who it's for
```

## Load Balancing

```
L4 (Transport): routes on IP+port only, protocol-agnostic, FAST,
  no content inspection — can't do path-based routing at all,
  regardless of configuration (structural limit, not a missing feature)
  Tools: NLB, HAProxy (TCP mode)

L7 (Application): routes on HTTP content (path, headers, cookies),
  can do SSL termination, path-based routing, sticky sessions
  Tools: ALB, NGINX, Azure Application Gateway, Traefik, Kong

Algorithms:
  Round Robin:       simple, even, ignores load
  Least Connections: best for long-lived conns (WebSocket, streaming)
  IP Hash:           sticky without cookies; BREAKS under shared NAT
                      (many real users share one IP → uneven load)
  Weighted:           canary deployments (90/10 split)
  Random-of-2:        pick 2 random, send to less-loaded of the two

Health checks: ACTIVE (probe /health periodically) vs PASSIVE (infer
  from real traffic errors). A SHALLOW health check (process merely
  responds) is NOT the same guarantee as a DEEP one (actual
  dependencies verified) — see this course's Real World Scenarios for
  the specific failure mode this causes.
```

## Firewalls

```
iptables chains: INPUT (to this host) | OUTPUT (from this host) |
  FORWARD (routed through this host) | PREROUTING (before routing,
  DNAT) | POSTROUTING (after routing, SNAT/masquerade)

Order matters: ACCEPT rules must come BEFORE the default DROP rule.
Stateful (most Security Groups, most host firewalls) vs Stateless
  (AWS NACLs): stateless needs EXPLICIT rules for BOTH directions —
  a common real mistake is allowing inbound on a NACL and forgetting
  the matching outbound rule, so responses never make it back.

ufw / firewalld are simplified front-ends OVER iptables/nftables —
  not a separate underlying mechanism.
```

## Kubernetes Networking

```
Default: FLAT network — every pod can reach every other pod, no
  restriction, until a NetworkPolicy says otherwise.

NetworkPolicy: WHITELIST-based. The moment ANY policy selects a pod,
  that pod becomes default-deny for whatever traffic type the policy
  covers — unmatched traffic is blocked, only explicit allows get
  through. Test what gets BLOCKED, not just what you intended to allow
  (see this course's Real World Scenarios — egress rules are easy to
  forget until an incident needs them).

Traffic flow:
  External → LoadBalancer/Ingress → ClusterIP Service → kube-proxy
    (iptables/IPVS) → Pod
  Pod↔Pod (same node): direct via CNI
  Pod↔Pod (different node): overlay (VXLAN) or native routing (BGP)

CNI capability varies: basic Flannel doesn't enforce NetworkPolicies
  at all; Calico/Cilium do. Cilium uses eBPF (faster than iptables,
  same conceptual model).

Liveness vs Readiness — DIFFERENT questions, different consequences:
  Liveness fails  → pod RESTARTS (only right if the process is broken)
  Readiness fails → pod REMOVED FROM ROTATION, no restart (right for
                     "temporarily can't serve" — restarting doesn't fix
                     a downstream dependency being briefly overloaded)
  Using a DEEP dependency check as LIVENESS can cause cascading restart
  loops when a downstream hiccups — the pod itself was fine.
```

## Advanced: eBPF, Service Mesh, BGP

```
eBPF (Cilium): sandboxed programs IN the kernel, replaces iptables —
  faster, adds NetworkPolicy + observability (Hubble) + WireGuard encryption

Service Mesh (Istio): mTLS + traffic management WITHOUT app code changes
  — real operational complexity cost (sidecar per pod), worth it for
  canary deployments / mTLS enforcement, overkill for small clusters

BGP: internet's routing protocol, between Autonomous Systems (AS).
  Shows up in cloud/DevOps via: AWS Direct Connect / Azure ExpressRoute
  (on-prem ↔ cloud route exchange), MetalLB (bare-metal K8s LoadBalancer),
  Calico BGP mode (advertises pod CIDR to physical routers, no overlay
  needed). Private ASN range: 64512-65534.

Direct Connect vs VPN: Direct Connect = dedicated physical connection,
  consistent low latency, higher cost/setup time. VPN = tunnels over
  public internet, faster/cheaper to set up, more latency variability.
  Pick based on whether the workload needs CONSISTENT latency (DB
  replication) or can tolerate variability.
```

## Certifications — Quick Reference

```
Network+ (N10-009): vendor-neutral entry point. 90 questions/90 min,
  720/900 passing. Verified current pricing: ~$369-390 (this course's
  own certification.md lists $358 — has drifted upward, correct before
  relying on it).

CCNA (200-301): Cisco-specific. 120 min, 825/1000 passing, $330
  (verified accurate). Domains: IP Connectivity 25% (largest) | Network
  Fundamentals 20% | Network Access 20% | Security Fundamentals 15% |
  IP Services 10% | Automation/Programmability 10% (smallest, still
  tested — covers exactly the "NetworkPolicy is declarative" concept
  in this course's PYQ).

AWS ANS-C01: $300, 170 min, 750/1000. Covers Direct Connect, Transit
  Gateway, Route 53, VPC deep-dive specifically.

AZ-700: $165, 120 min, 700/1000. Covers Azure VNet, VPN Gateway,
  ExpressRoute, Application Gateway (the L7 tool — NOT the same as the
  basic L4 Azure Load Balancer, a common naming-confusion trap).
```

## Troubleshooting — Standard Order (don't skip steps)

```
1. DNS resolving?         dig +short <host>
2. Route reachable?       traceroute / mtr
3. Port open?             nc -zv <host> <port>
4. TLS handshake OK?      openssl s_client -connect <host>:443
5. HTTP response correct? curl -v <url>
6. Packet capture (last resort, hardest to read): tcpdump

If curl hangs with NO TLS output at all (not even a failed attempt) →
problem is likely BELOW TLS, at TCP/routing/firewall level — check
port reachability before assuming a TLS-specific issue.

Kubernetes-specific: empty `kubectl get endpoints` → Service selector
doesn't match any pod's labels (check `kubectl describe svc` for the
selector, `kubectl get pods --show-labels` to compare) — a very common
real cause of "the Service exists but nothing reaches the pod."
```
