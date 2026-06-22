# Security Engineering Interview Questions

## Core Concepts

**Q: What is the CIA triad? Give examples.**

**Confidentiality**: Only authorised parties can access data.
Examples: Encryption at rest/transit, access controls, MFA, least privilege.

**Integrity**: Data is accurate and unmodified.
Examples: Hash functions (SHA-256), digital signatures, checksums, audit logs.

**Availability**: Systems are accessible when needed.
Examples: DDoS protection, redundancy, failover, backups, rate limiting.

**Additional AAA:**
- Authentication: Verify who you are (passwords, MFA, certificates)
- Authorisation: What you're allowed to do (RBAC, ABAC)
- Accounting/Audit: Track what was done (logs, audit trails)

---

**Q: Explain common attack types and defences.**

**SQL Injection**:
```sql
-- Attack: username = "admin'--"
SELECT * FROM users WHERE username = 'admin'--' AND password = '...'
-- '--' comments out password check

-- Defence: Parameterised queries
cursor.execute("SELECT * FROM users WHERE username = %s", (username,))
```

**XSS (Cross-Site Scripting)**:
Attack: Inject JavaScript into web pages viewed by other users.
Defence: Output encoding, Content Security Policy (CSP) headers, `httpOnly` cookies.

**CSRF (Cross-Site Request Forgery)**:
Attack: Trick authenticated user's browser to make unintended request.
Defence: CSRF tokens, `SameSite=Strict` cookies, check Origin header.

**IDOR (Insecure Direct Object Reference)**:
Attack: `GET /api/orders/1234` → change to `/api/orders/5678` (other user's order).
Defence: Authorisation check per request, use GUIDs instead of sequential IDs.

**SSRF (Server-Side Request Forgery)**:
Attack: Trick server into making requests to internal services.
Defence: Allowlist of permitted URLs, block internal IPs (169.254.x.x, 10.x.x.x).

---

**Q: What is Zero Trust? How do you implement it?**

Zero Trust: "Never trust, always verify." Assume breach. Verify every request regardless of network location.

Traditional: Inside network = trusted. VPN = trusted.
Zero Trust: Even internal traffic must be authenticated and authorised per request.

**Pillars:**
1. **Identity**: Strong authentication (MFA). Every request has verified identity.
2. **Device**: Device health checks. Only compliant devices allowed.
3. **Network**: Micro-segmentation. East-west traffic monitored and filtered.
4. **Application**: Per-application access control, not network-wide.
5. **Data**: Classify and protect data. Encryption at rest and transit.

**Implementation:**
- Identity Provider (Okta, Azure AD) + MFA everywhere
- Service mesh with mTLS for service-to-service (Istio, Linkerd)
- Network policies in Kubernetes
- SPIFFE/SPIRE for workload identity
- Continuous authorisation (not just at login)

---

**Q: Secrets management best practices.**

**Never:**
- Hardcode secrets in code
- Commit secrets to Git
- Pass secrets via environment variables in container images
- Log secrets

**Do:**
- HashiCorp Vault: Dynamic secrets, auto-rotation, fine-grained access
- AWS Secrets Manager: Managed rotation, KMS integration
- External Secrets Operator (K8s): Sync secrets from Vault/AWS to K8s secrets
- SOPS: Encrypt secrets files before Git commit
- 1Password/Bitwarden: Human credential management

```bash
# Vault dynamic secrets — DB credentials that auto-expire
vault read database/creds/my-role
# Key           Value
# username      v-role-xxxxx
# password      xxxxxxxx
# lease_duration 1h
# Vault auto-rotates after lease expires
```

---

**Q: DevSecOps — shift security left.**

Integrate security throughout CI/CD, not just at the end.

**SAST (Static Application Security Testing)**: Scan source code for vulnerabilities before build.
Tools: SonarQube, Semgrep, Bandit (Python), ESLint security rules.

**DAST (Dynamic Application Security Testing)**: Test running application for vulnerabilities.
Tools: OWASP ZAP, Burp Suite.

**SCA (Software Composition Analysis)**: Scan dependencies for known CVEs.
Tools: Snyk, Dependabot, OWASP Dependency-Check.

**Container security:**
```bash
# Scan image with Trivy
trivy image myapp:latest
# Reports: CVEs in OS packages, libraries, misconfigurations

# Kubernetes security scanning
trivy k8s --report summary cluster
```

**CI/CD pipeline security gates:**
```yaml
stages:
  - sast:        # Semgrep/SonarQube
  - dependency:  # Snyk
  - build:       # Docker build
  - scan:        # Trivy image scan
  - test:
  - dast:        # OWASP ZAP against staging
  - deploy:      # Only if all gates pass
```

## Revision Notes
```
CIA TRIAD: Confidentiality (encryption) | Integrity (hashing/signatures) | Availability (redundancy)
AAA: Authentication + Authorisation + Accounting

COMMON ATTACKS:
SQLi: parameterised queries | XSS: CSP + output encoding
CSRF: tokens + SameSite | IDOR: auth checks per request | SSRF: URL allowlisting

ZERO TRUST: Never trust, always verify. Identity + Device + Network + App + Data.
mTLS for service-to-service | MFA everywhere | Micro-segmentation | Workload identity (SPIFFE)

SECRETS MANAGEMENT:
Never: hardcode, git commit, ENV vars in images, log secrets
Use: HashiCorp Vault (dynamic) | AWS Secrets Manager | External Secrets Operator (K8s)
SOPS: encrypt secret files for Git

DEVSECOPS (shift left):
SAST: static code scan (Semgrep, SonarQube)
SCA: dependency CVEs (Snyk, Dependabot)
DAST: test running app (OWASP ZAP)
Container: Trivy image scan
CI gates: fail build on critical CVEs
```
