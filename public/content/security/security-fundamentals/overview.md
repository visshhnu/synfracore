# Security Fundamentals — Cybersecurity for Engineers

**Before you start:** no prior security background is assumed — this is the entry point for the whole Security academy. Basic familiarity with how a web request reaches a server (client → network → server) helps for the later examples, but isn't required.

Imagine a bank vault. It isn't protected by one lock — there's a guard at the door, a vault door itself, a time lock, cameras, an alarm tied to a monitoring center, and a safe deposit box inside that. Any single one of those failing (a guard falls asleep, a camera goes offline) doesn't mean the bank gets robbed, because the other layers are still there. A secure computer system works the same way: no single protection is ever assumed to be perfect, so real systems stack several independent defenses, and a failure in one layer is a warning, not a catastrophe. Security engineering is the discipline of designing and reasoning about those layers deliberately, instead of hoping nothing ever goes wrong.

## The CIA Triad

Every security decision traces back to protecting one (or more) of three properties:

```conceptgrid
{
  "boxes": [
    { "title": "Confidentiality", "description": "Only authorized people can see the information. Protected by encryption (scrambling data so only someone with the right key can read it), access controls (rules about who's allowed to see what), and authentication (proving you are who you claim to be).", "color": "blue" },
    { "title": "Integrity", "description": "The data is accurate and hasn't been secretly changed. Protected by hash functions (a fingerprint of data that changes if the data changes) and audit logs (a record of who did what, so tampering can be traced).", "color": "green" },
    { "title": "Availability", "description": "The system is actually reachable when someone needs it. Protected by redundancy (more than one copy, so no single failure takes the whole thing down) and backups.", "color": "amber" }
  ]
}
```

Each is broken differently — data exfiltration (data being stolen and copied out) breaks confidentiality; SQL injection (an attack that sneaks database commands into a form field) breaks integrity by letting an attacker alter data directly; a DDoS attack (flooding a system with fake traffic until it can't respond to real users) breaks availability.

## Threat Modeling

**Threat modeling** means deliberately asking "what could go wrong here, before it actually happens" — walking through a system on paper and identifying its weak points, rather than waiting to find out the hard way. **STRIDE** is one structured way to do this — a checklist of 6 categories of things that can go wrong with any system:

| Threat | Description | Example |
|--------|-------------|---------|
| **S**poofing | Impersonating another entity | Stolen credentials |
| **T**ampering | Modifying data or code | SQL injection |
| **R**epudiation | Denying performed actions | No audit logs |
| **I**nformation Disclosure | Exposing sensitive data | Unencrypted PII (Personally Identifiable Information — data that could identify a specific person, like a name or SSN) |
| **D**enial of Service | Disrupting availability | DDoS, resource exhaustion |
| **E**levation of Privilege | Gaining unauthorized access | Privilege escalation (a user or process getting access rights beyond what it was supposed to have) |

```flow
{
  "title": "Threat Modeling in Practice",
  "layout": "flow",
  "steps": [
    { "label": "Identify the asset", "sublabel": "What are we actually protecting?", "color": "blue" },
    { "label": "Apply STRIDE", "sublabel": "Which of the 6 categories could hit it?", "color": "purple" },
    { "label": "Assess real impact", "sublabel": "How bad, how likely?", "color": "amber" },
    { "label": "Design a mitigation", "sublabel": "A specific control for that specific threat", "color": "green" }
  ]
}
```

## Defense in Depth

Never rely on a single security control — the vault-with-many-layers idea from the opening, applied to a real web system. Each layer below assumes every layer above it could fail:

```flow
{
  "layout": "stack",
  "steps": [
    { "label": "External Users", "color": "slate" },
    { "label": "WAF / DDoS Protection", "sublabel": "Filters malicious traffic before it reaches anything else", "color": "red" },
    { "label": "CDN / Load Balancer", "sublabel": "Spreads traffic, absorbs spikes", "color": "blue" },
    { "label": "Firewall / Security Groups", "sublabel": "Only allows expected traffic through", "color": "blue" },
    { "label": "Authentication (MFA)", "sublabel": "Proves who's connecting", "color": "purple" },
    { "label": "Authorization (RBAC / ABAC)", "sublabel": "Controls what an authenticated user can actually do", "color": "purple" },
    { "label": "Application Security", "sublabel": "Input validation — rejects malformed/malicious input", "color": "green" },
    { "label": "Encryption (TLS, at-rest)", "sublabel": "Protects data in transit and in storage", "color": "green" },
    { "label": "Database Access Controls", "color": "amber" },
    { "label": "Audit Logging & SIEM", "sublabel": "Records what happened, for after-the-fact investigation", "color": "amber" },
    { "label": "Backup & Recovery", "sublabel": "The last resort if everything else fails", "color": "slate" }
  ]
}
```

## Common Attack Vectors

**OWASP Top 10 (Web Applications):**
1. Broken Access Control
2. Cryptographic Failures
3. Injection (SQL, Command, LDAP)
4. Insecure Design
5. Security Misconfiguration
6. Vulnerable & Outdated Components
7. Identification & Authentication Failures
8. Software & Data Integrity Failures
9. Security Logging & Monitoring Failures
10. Server-Side Request Forgery (SSRF)

**Cloud Security Misconfigurations (most breaches):**
- S3 buckets publicly accessible
- EC2 instances with no MFA on IAM
- Security groups open to 0.0.0.0/0 on port 22
- No encryption at rest for databases
- Root account access keys in use
- No CloudTrail logging enabled
- Overly permissive IAM roles

## Encryption Fundamentals

**Symmetric Encryption** — Same key for encryption and decryption. Fast. AES-256 is the standard. Problem: secure key exchange.

**Asymmetric Encryption** — Public key encrypts, private key decrypts. RSA, ECC. Slower but solves key exchange. Used in TLS handshake, SSH, digital signatures.

**Hashing** — One-way function, produces fixed-length digest. SHA-256, bcrypt (passwords). Used for integrity verification, password storage.

**TLS (Transport Layer Security)** — Combines asymmetric (handshake) + symmetric (data transfer). TLS 1.3 is current standard. Provides: authentication, confidentiality, integrity.

```bash
# Check TLS certificate
openssl s_client -connect synfracore.com:443 -showcerts 2>/dev/null | openssl x509 -noout -text

# Check expiry
echo | openssl s_client -connect example.com:443 2>/dev/null \
  | openssl x509 -noout -dates

# Generate self-signed cert (dev only)
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout server.key -out server.crt
```

## Identity and Authentication

**Multi-Factor Authentication (MFA):**
- Something you know (password)
- Something you have (phone, hardware token)
- Something you are (biometrics)

**Always enable MFA for:** AWS root account, cloud consoles, VPN access, admin SSH, code repositories.

**Zero Trust Model:** "Never trust, always verify." Assume the network is compromised. Verify every request regardless of origin. Least-privilege access. Micro-segmentation.

## Incident Response — PICERL

1. **Preparation** — IR plan, runbooks, SIEM, backups
2. **Identification** — Detect the incident (alerts, anomalies)
3. **Containment** — Limit blast radius (isolate affected systems)
4. **Eradication** — Remove threat (patch, clean, rebuild)
5. **Recovery** — Restore from known-good state
6. **Lessons Learned** — Post-mortem, improve defenses
