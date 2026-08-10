# Security Fundamentals — Revision Notes

Condensed reference for quick review. Consolidated from this course's interview and certification material, de-duplicated, and corrected where source files were out of date (each correction marked inline).

---

## CIA Triad

```
Confidentiality: only authorized parties access data
  Controls: encryption, access control, MFA, least privilege
Integrity: data is accurate and untampered
  Controls: hashing (SHA-256), digital signatures, checksums, audit logs
Availability: systems accessible when needed
  Controls: redundancy, backups, DDoS protection, failover, rate limiting

AAA (extends CIA into operational terms):
  Authentication: WHO are you (password, biometric, certificate, OTP)
  Authorization:  WHAT can you do (RBAC, ABAC, ACL)
  Accounting:      WHAT WAS DONE (logs, audit trails) — this is what makes
                   an incident investigable after the fact
```

## Authentication vs. Authorization — Protocols

```
OAuth 2.0: authorization framework (delegated access) — NOT authentication
OIDC:      authentication LAYER built on top of OAuth 2.0
SAML 2.0:  enterprise SSO, XML-based, legacy but still common in enterprise
JWT:       a token FORMAT, not a protocol — stateless, self-contained claims

MFA factors: know (password) + have (OTP/hardware key) + are (biometric)
  MFA bypass patterns worth knowing (see this course's FAQ for detail):
  push-bombing/MFA fatigue, SIM swap (SMS-based MFA weakest), session
  token theft (steals an already-authenticated session, skips MFA entirely)
```

## OWASP Top 10 — CORRECTED: 2025 edition is current (2021 list is outdated)

```
This course's own overview.md and fundamentals.md present the 2021 list as
current. OWASP released the Top 10:2025 (finalized January 2026) — the
first major revision since 2021. Two categories are entirely new, and
SSRF is no longer standalone:

A01:2025  Broken Access Control        (was A01:2021 — stable at #1,
                                         now ABSORBS SSRF)
A02:2025  Security Misconfiguration    (was A05:2021 — jumped #5 → #2)
A03:2025  Software Supply Chain Failures  (NEW — expands "Vulnerable
                                         & Outdated Components")
A04:2025  Cryptographic Failures       (was A02:2021)
A05:2025  Injection                    (was A03:2021)
A06:2025  Insecure Design              (was A04:2021)
A07:2025  Authentication Failures      (was A07:2021 — stable)
A08:2025  Software/Data Integrity Failures (was A08:2021 — stable)
A09:2025  Security Logging & Alerting Failures (renamed from
                                         "...Monitoring Failures")
A10:2025  Mishandling of Exceptional Conditions (NEW — replaces the
                                         old standalone SSRF slot)

IMPORTANT: SSRF is NOT less dangerous or less relevant now — it's just
categorized under Broken Access Control instead of standing alone. Don't
read the re-categorization as "SSRF matters less."
```

## Common Attacks — Quick Reference

```
SQL Injection:  ' OR 1=1 --  → parameterized queries / ORM, never string-
                concatenate user input into a query
XSS:            inject JS into pages viewed by others → output encoding,
                CSP headers, httpOnly cookies
CSRF:           trick an authenticated browser into an unintended request
                → CSRF tokens, SameSite=Strict cookies, check Origin
IDOR:           /api/orders/1234 → /api/orders/5678 (someone else's data)
                → authz check EVERY request, use GUIDs not sequential IDs
SSRF:           trick server into fetching internal resources (cloud
                metadata endpoint is the classic target) → allowlist
                destinations, don't just blocklist private IP ranges
                (DNS rebinding bypasses naive blocklists); IMDSv2 on AWS
                specifically hardens against basic GET-only SSRF

Password spray: many usernames, few passwords, one source IP — evades
                per-account lockout; needs cross-account correlation
                (SIEM-level), not a local lockout policy, to catch
```

## Encryption

```
Symmetric (AES-256-GCM): same key both ways, fast, key EXCHANGE is the
  hard problem it doesn't solve on its own. NEVER reuse a nonce/IV.
Asymmetric (RSA-2048+, ECC/ECDSA P-256): public encrypts/verifies,
  private decrypts/signs. Slower, solves key exchange. ECC preferred
  for TLS/JWTs (smaller, faster than equivalent-strength RSA).
Hashing (SHA-256 for integrity, bcrypt/argon2 for PASSWORDS ONLY):
  one-way, no key. NEVER encrypt passwords — hash them. Password hashes
  are DELIBERATELY slow (resists brute force at scale); integrity
  hashes are deliberately fast — different jobs, different algorithms.

TLS 1.3 (current standard): asymmetric handshake exchanges a symmetric
  session key, then symmetric encryption handles bulk data transfer —
  uses each algorithm type for what it's actually good at.

"Never roll your own crypto": the algorithm (AES) being public isn't the
risk — nonce reuse, timing side-channels, padding bugs, and key
management mistakes are where custom implementations actually fail,
and vetted libraries have had years of community scrutiny finding those.
```

## Access Control Models

```
DAC (Discretionary): resource OWNER sets permissions — standard Linux/
  Windows file permissions are the textbook example
MAC (Mandatory): SYSTEM enforces fixed labels, owner can't override —
  government/military systems, SELinux adds this on top of Linux's DAC
RBAC (Role-Based): permissions by job role — most common in enterprise
ABAC (Attribute-Based): policy based on user/resource attributes —
  more flexible/granular than RBAC, more complex to manage
```

## Zero Trust

```
"Never trust, always verify" — assume breach, verify every request
regardless of network location (internal ≠ automatically trusted)

Pillars: Identity (MFA everywhere) + Device (health checks) + Network
  (micro-segmentation) + Application (per-app access, not network-wide)
  + Data (classify + encrypt)

Implementation building blocks: Identity Provider + MFA, mTLS for
  service-to-service (Istio/Linkerd), Kubernetes network policies,
  SPIFFE/SPIRE for workload identity, CONTINUOUS authorization
  (not just checked once at login)
```

## Secrets Management

```
NEVER: hardcode in code, commit to git, pass via env vars baked into
  container IMAGES, log secrets anywhere

DO: HashiCorp Vault (dynamic, short-lived, auto-rotating secrets) |
  AWS Secrets Manager (managed rotation + KMS) | External Secrets
  Operator (K8s, syncs from Vault/AWS) | SOPS (encrypt secret files
  before git commit) | gitleaks (pre-commit hook AND full-history scan
  — "fixed in a later commit" does NOT remove a secret from git
  history; ROTATE the credential, that's the only step that actually
  neutralizes an already-exposed secret)
```

## Container/Cloud Security

```
K8s pod security: runAsNonRoot, drop ALL capabilities (add back only
  what's needed), readOnlyRootFilesystem, seccompProfile RuntimeDefault

Cloud misconfigurations behind most real breaches (customer-side, not
  provider-side — shared responsibility model):
  public S3 buckets | no MFA on IAM | security groups open to 0.0.0.0/0
  on 22 | no encryption at rest | root account access keys in active use
  | no CloudTrail logging | overly permissive IAM roles

DevSecOps pipeline stages: SAST (Semgrep/SonarQube, static code scan) →
  SCA (Snyk/Dependabot, dependency CVEs) → container scan (Trivy) →
  DAST (OWASP ZAP, tests the RUNNING app) → gate: fail build on
  critical findings, don't just warn
```

## Risk Management

```
Risk = Threat × Vulnerability × Impact
Vulnerability: the weakness | Threat: potential exploiter of it |
  Risk: likelihood × impact of actual exploitation

Response strategies: Accept (documented, deliberate, cost of fixing
  exceeds impact) | Transfer (insurance/vendor contract — shifts WHO
  PAYS, doesn't change the underlying vulnerability) | Mitigate (reduce
  likelihood/impact) | Avoid (eliminate the risk entirely, e.g. don't
  offer the risky feature at all)

RTO (Recovery Time Objective): max tolerable DOWNTIME
RPO (Recovery Point Objective): max tolerable DATA LOSS, measured in time
  → a transactional database needs a small RPO (every transaction is
  irreplaceable); a rarely-changed static site can tolerate a much
  larger one
```

## Certifications — CORRECTED (both entries in this course's own
## certification.md were out of date)

```
CompTIA Security+ — CURRENT VERSION IS SY0-701 (launched Nov 2023,
  still the only active version as of mid-2026; SY0-801 in preview
  ~Oct 2026, expect real transition window after that, not before).
  90 questions max, 90 min, 750/900 passing.
  Domains (this course's own material didn't list these explicitly —
  adding for completeness): General Security Concepts 12%, Threats/
  Vulnerabilities/Mitigations 22%, Security Architecture 18%, Security
  Operations 28% (largest, most PBQ-heavy), Security Program Management
  & Oversight 20%.
  CORRECTED price: ~$425 (course listed $392 — verify current price at
  CompTIA's site before purchasing; regional/academic pricing varies).

ISC² CC (Certified in Cybersecurity) — CORRECTED: course listed this as
  "free (2024 promo)." The free program (One Million Certified in
  Cybersecurity) actually ran through May 20, 2026 for new enrollments
  and is now CLOSED — CC is a standard paid exam again: $199 + $50/year
  maintenance. Also worth flagging: ISC² has announced the CC exam
  OUTLINE itself changes September 1, 2026 — check for further drift
  if referencing this cert again after that date.
  5 domains: Security Principles (26%, largest) | BC/DR/IR Concepts
  (10%, smallest — don't skip it, questions can still come from it) |
  Access Controls | Network Security | Security Operations.
```

## Incident Response (PICERL) — see this course's SOC/incident-response
## material for the full version; summary here for cross-reference

```
Preparation → Identification → Containment (isolate, do NOT power off —
  preserves volatile memory evidence) → Eradication → Recovery →
  Lessons Learned (blameless — see this course's FAQ for why blameless
  framing is an operational requirement, not just a culture preference)
```
