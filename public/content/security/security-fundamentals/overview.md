# Security Fundamentals — Cybersecurity for Engineers

Security is no longer just the security team's job. Every DevOps, cloud, and platform engineer needs foundational security knowledge to build and operate secure systems.

## The CIA Triad

The foundation of information security:

**Confidentiality** — Information is accessible only to authorized parties. Encryption, access controls, and authentication protect confidentiality. Breached by: data exfiltration, eavesdropping, unauthorized access.

**Integrity** — Data is accurate and hasn't been tampered with. Hash functions, digital signatures, and audit logs protect integrity. Breached by: SQL injection, man-in-the-middle, insider modification.

**Availability** — Systems are accessible when needed. Redundancy, backups, and DDoS protection maintain availability. Breached by: DDoS attacks, ransomware, infrastructure failures.

## Threat Modeling

Before building anything, ask: **STRIDE**

| Threat | Description | Example |
|--------|-------------|---------|
| **S**poofing | Impersonating another entity | Stolen credentials |
| **T**ampering | Modifying data or code | SQL injection |
| **R**epudiation | Denying performed actions | No audit logs |
| **I**nformation Disclosure | Exposing sensitive data | Unencrypted PII |
| **D**enial of Service | Disrupting availability | DDoS, resource exhaustion |
| **E**levation of Privilege | Gaining unauthorized access | Privilege escalation |

## Defense in Depth

Never rely on a single security control. Layer defenses:

```
External Users
      │
[WAF / DDoS Protection]
      │
[CDN / Load Balancer]
      │
[Firewall / Security Groups]
      │
[Authentication (MFA)]
      │
[Authorization (RBAC / ABAC)]
      │
[Application Security (input validation)]
      │
[Encryption (TLS, at-rest)]
      │
[Database Access Controls]
      │
[Audit Logging & SIEM]
      │
[Backup & Recovery]
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
