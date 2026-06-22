# Network Security Interview Questions

## Core Concepts

**Q: Defense in depth — network security layers.**

```
Layer 1 — Perimeter:    Firewall (block all by default, allow explicitly)
Layer 2 — DMZ:          Web servers in demilitarised zone (separate from internal)
Layer 3 — Internal:     IDS/IPS (detect/prevent intrusions), network segmentation
Layer 4 — Endpoint:     EDR, host firewall, patch management
Layer 5 — Application:  WAF, input validation, authentication
Layer 6 — Data:         Encryption at rest/transit, DLP
Layer 7 — Monitoring:   SIEM, flow analysis, anomaly detection
```

No single control = security. Multiple layers mean attackers must defeat each.

---

**Q: Firewalls — types.**

**Packet filter (L3/L4)**: Match by IP, port, protocol. Simple, fast. No state.
**Stateful inspection (L4)**: Track connection state. Auto-allow return traffic.
**Application-aware (L7/NGFW)**: Deep packet inspection. Identify apps by behaviour, not just port. Decrypt SSL for inspection.
**WAF**: HTTP-specific. Block OWASP attacks (SQLi, XSS, CSRF). Rules + ML.

---

**Q: IDS vs IPS.**

| | IDS | IPS |
|---|---|---|
| Mode | Monitor and alert | Inline, block threats |
| Response | Alert only | Drop malicious traffic |
| Risk | No false-block risk | False positive = blocked legitimate traffic |
| Placement | Out-of-band (mirror port) | Inline (in traffic path) |

Detection methods:
- **Signature-based**: Match known attack patterns (fast, misses 0-days)
- **Anomaly-based**: Deviation from baseline (catches unknowns, more false positives)

---

**Q: TLS/SSL — key concepts.**

TLS = Transport Layer Security. Provides: encryption (confidentiality), integrity (MACs), authentication (certificates).

**Certificate chain of trust:**
```
Root CA (self-signed, built into browsers/OS)
  └── Intermediate CA
        └── Server Certificate (issued to synfracore.com)
```

Browser validates: cert issued by trusted CA? domain matches? not expired? not revoked (OCSP)?

**Certificate pinning**: App explicitly trusts only specific certificate/key. Prevents MitM even with compromised CA.

**TLS 1.3** improvements over 1.2: 1-RTT handshake (vs 2-RTT), mandatory forward secrecy (ECDHE), removed weak ciphers.

---

**Q: Network segmentation and zero trust.**

**VLAN**: Layer 2 segmentation. Logically separate broadcast domains. Traffic between VLANs goes through router/firewall — enforces policies.

**Micro-segmentation**: Fine-grained policies between individual workloads (not just VLANs). Often software-defined (NSX, Kubernetes NetworkPolicy, security groups).

**Zero Trust Network Access (ZTNA)**: Replace VPN. Users authenticate per-application. No implicit trust from network location. Works for remote/hybrid.

## Revision Notes
```
DEFENSE IN DEPTH: Perimeter → DMZ → IDS → Endpoint → App → Data → Monitor
Multiple layers — attacker must breach each

FIREWALL TYPES:
Packet filter: IP/port matching | Stateful: connection tracking
NGFW: L7 app-aware, SSL inspection | WAF: HTTP-specific, OWASP protection

IDS: alert only (out-of-band) | IPS: inline blocking
Signature: known patterns | Anomaly: deviation from baseline

TLS:
Certificate chain: Root CA → Intermediate → Server cert
Browser validates: trusted CA + domain match + not expired
TLS 1.3: 1-RTT + mandatory ECDHE + removed weak ciphers

SEGMENTATION:
VLAN: L2 separation | Micro-segmentation: per-workload policies
ZTNA: replace VPN, per-app auth, no implicit trust
```
