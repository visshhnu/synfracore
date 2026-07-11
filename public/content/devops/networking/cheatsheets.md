# Networking for DevOps — Quick Reference

## OSI model — the 7 layers, DevOps-relevant

| Layer | Name | Protocols | DevOps relevance |
|---|---|---|---|
| 7 | Application | HTTP, DNS, SSH | All web traffic, APIs, `kubectl` |
| 4 | Transport | TCP, UDP | L4 load balancing, port-based routing |
| 3 | Network | IP, ICMP, BGP | Routing, VPC/subnet design |
| 2 | Data Link | Ethernet, MAC, ARP | Switch-level, overlay networks |
| 1 | Physical | Copper, Fiber, WiFi | Data center cabling |

Mnemonic: "All People Seem To Need Data Processing" (Layer 7 → 1).

## TCP vs. UDP, quick comparison

| Property | TCP | UDP |
|---|---|---|
| Connection | 3-way handshake, connection-oriented | Connectionless |
| Reliability | Guaranteed delivery, retransmits | Best-effort, may drop |
| Ordering | Guaranteed in-order | No ordering guarantee |
| Typical use | HTTP/S, SSH, databases | DNS, video streaming, VoIP |

## Common ports worth knowing cold

| Port | Service |
|---|---|
| 22 | SSH |
| 80 / 443 | HTTP / HTTPS |
| 53 | DNS (UDP + TCP) |
| 5432 | PostgreSQL |
| 3306 | MySQL |
| 6379 | Redis |
| 9090 | Prometheus |
| 3000 | Grafana |
| 6443 | Kubernetes API server |

## DNS record types

| Record | Purpose |
|---|---|
| A | Hostname → IPv4 |
| AAAA | Hostname → IPv6 |
| CNAME | Alias → canonical name (not usable at apex/root domain) |
| TXT | Text data — SPF, DKIM, domain verification |
| SRV | Service discovery (`_service._proto.name`) |

## DNS troubleshooting commands

```bash
dig example.com                 # basic lookup
dig example.com +short          # IP only
dig @8.8.8.8 example.com        # query a specific resolver
dig example.com +trace          # full resolution path
dig -x 192.0.2.1                # reverse lookup (PTR)
```

## Kubernetes DNS quick reference

```
<service>.<namespace>.svc.cluster.local
```
```bash
kubectl exec -it mypod -- nslookup myservice.production
kubectl exec -it mypod -- cat /etc/resolv.conf
```

## CIDR quick reference

| CIDR | Addresses | Typical use |
|---|---|---|
| /32 | 1 | Single host |
| /30 | 4 (2 usable) | Point-to-point link |
| /24 | 256 (254 usable) | Typical subnet |
| /16 | 65,536 | Entire VPC range |
| /8 | 16M | Largest private range |

Private ranges (RFC 1918): `10.0.0.0/8`, `172.16.0.0/12`, `192.168.0.0/16`.

## L4 vs. L7 load balancing

| | L4 | L7 |
|---|---|---|
| Operates on | IP + port | HTTP content (path, headers, cookies) |
| Can do | Fast, protocol-agnostic routing | Path-based routing, SSL termination, session stickiness |
| Common tools | Network LB (NLB), HAProxy (TCP mode) | NGINX, Application LB (ALB), HAProxy (HTTP mode) |

## TLS certificate inspection

```bash
echo | openssl s_client -connect example.com:443 -servername example.com 2>/dev/null | openssl x509 -noout -dates -subject
```

## Kubernetes Network Policy — deny-all baseline

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata: { name: deny-all-ingress, namespace: production }
spec:
  podSelector: {}
  policyTypes: [Ingress]
```
Network Policies are whitelist-based — once any policy selects a pod, all unmatched ingress traffic to it is blocked by default; explicit `allow` rules are then layered on top for exactly the traffic that should be permitted.
