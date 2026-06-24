# Cloud Security Advanced Topics

## Zero Trust Architecture

```
ZERO TRUST PRINCIPLES:
  Never trust, always verify: authenticate and authorize every request
  Assume breach: design systems assuming adversary is already inside
  Least privilege access: just-in-time, just-enough access
  Verify explicitly: use all available signals (identity, device, location, behaviour)

ZERO TRUST COMPONENTS:
  Identity: strong MFA, risk-based adaptive auth, privileged access workstations
  Device: device compliance, EDR, certificate-based auth
  Network: micro-segmentation, no implicit trust based on network location
  Application: HTTPS everywhere, WAF, API gateway with auth
  Data: classify, encrypt, apply DLP policies
  Visibility: logging, SIEM, UEBA (User and Entity Behaviour Analytics)

CLOUD IMPLEMENTATION:
  AWS: IAM + SCPs + VPC + GuardDuty + Security Hub + Macie
  Azure: Entra ID + Conditional Access + PIM + Defender for Cloud + Sentinel
  GCP: BeyondCorp Enterprise + IAP + VPC Service Controls + SCC
```

## DevSecOps and Shift-Left Security

```
PIPELINE SECURITY:
  SAST (Static Application Security Testing): scan source code
    Tools: Semgrep, Snyk Code, SonarQube, Checkmarx
  DAST (Dynamic Application Security Testing): scan running app
    Tools: OWASP ZAP, Burp Suite
  SCA (Software Composition Analysis): scan dependencies for CVEs
    Tools: Snyk, Dependabot, OWASP Dependency-Check
  IaC Scanning: check Terraform/CloudFormation for misconfigs
    Tools: Checkov, tfsec, KICS, Terrascan

CONTAINER SECURITY:
  Image scanning: Amazon Inspector, Trivy, Snyk Container, Aqua
  Base image: use minimal base (distroless, Alpine) — fewer packages = less attack surface
  Non-root user: never run container as root
  Read-only filesystem: --read-only flag
  No privileged: avoid --privileged flag
  Network policies: restrict pod-to-pod communication in Kubernetes
  OPA/Gatekeeper: enforce policies at admission time

SECRETS MANAGEMENT:
  Never: hardcode secrets in code or environment variables in plain text
  Use: AWS Secrets Manager, Azure Key Vault, GCP Secret Manager, HashiCorp Vault
  Rotation: automatic secret rotation for DB credentials, API keys
  Least privilege: each service gets only secrets it needs
  Audit: log every secret access
```

## Incident Response in Cloud

```
PREPARATION:
  Enable all logging: CloudTrail/Activity Log/GCP Audit Log (all regions)
  Centralise logs: Security Lake, Microsoft Sentinel, Chronicle
  Define runbooks for: compromised IAM key, cryptomining, data exfil, ransomware

DETECTION:
  GuardDuty / Defender for Cloud / SCC alerts
  SIEM correlation rules
  Anomaly detection (unusual API calls, new region activity, large data egress)

CONTAINMENT:
  Compromised IAM: disable access key immediately, attach deny-all policy to user
  Compromised instance: isolate in security group (block all inbound/outbound)
  Data exfil: enable S3 block public access, check bucket policies

ERADICATION AND RECOVERY:
  Terminate compromised instances (golden AMI rebuild)
  Rotate all potentially exposed credentials
  Review and remediate IAM permissions that were exploited
  
POST-INCIDENT:
  Document timeline, root cause, and remediation
  Update detection rules to catch similar patterns
  Run table-top exercise for future scenarios
```

## Study Resources
- **AWS re:Inforce** (reinforce.awsevents.com) — recorded security sessions free
- **OWASP Cloud Security** — free best practices
- **Hacking the Cloud** (hackingthe.cloud) — offensive techniques for defenders
- **Cloud Security Alliance** (cloudsecurityalliance.org) — frameworks and guidance
