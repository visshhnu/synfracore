# Cloud Security — Overview

**Before you start:** basic cloud fundamentals (what IAM, VPCs, and storage buckets are) and the concepts in [Network Security](/academies/security/network-security/overview) are assumed.

## Cloud Security for Security Engineers

Cloud security covers the policies, technologies, and controls deployed to protect cloud data, applications, and infrastructure from threats.

## Why This Exists (The Hook)

On-prem, a misconfiguration usually stays contained behind a physical firewall — an unlocked door in a building nobody outside the office can reach. In the cloud, a single misconfigured setting — an S3 bucket left public, a security group open to 0.0.0.0/0 — is instantly reachable by anyone on the internet, not just someone already inside your network. Cloud security exists because the traditional perimeter (a firewall around a building) doesn't exist anymore; every resource is potentially internet-facing by default, so the controls that used to be physical (a locked server room) now have to be configuration (an IAM policy, a security group rule) — and configuration is far easier to get wrong silently.

**Analogy** — Think of a cloud account like a hotel with hundreds of rooms, where every room's lock is a setting you configure yourself, not a lock the building installs for you. A traditional data center is like an office building with one guarded front door — get past that, you're still in a hallway of individually locked offices. A cloud account is closer to a hotel where each room's door lock, guest list, and alarm system are configured independently by whoever set up that room — get one room's lock wrong (a public S3 bucket, an open security group) and it's directly exposed to the street, regardless of how secure every other room is.

**Try it (2 minutes)** — Reason through why "0.0.0.0/0 inbound on port 22" shows up on every CSPM misconfiguration list, without looking anything up: `0.0.0.0/0` means "any IP address on the internet," and port 22 is SSH (remote server login). If a security group allows that combination, what can literally anyone on the internet attempt against that server, with no other access required first — and why would that be true even if the server has a strong password?

**Key domains for Security Engineers:**
- Identity and Access Management (IAM) in cloud
- Network security (security groups, NACLs, VPC design)
- Data protection (encryption at rest, in transit)
- Threat detection (AWS GuardDuty, Azure Defender, GCP SCC)
- Compliance and governance (SOC2, ISO27001, PCI-DSS in cloud)
- CSPM (Cloud Security Posture Management)

---

## AWS Security Fundamentals

### Identity — Zero Trust Architecture
```
Principle: Least privilege for every identity
- Users: Human identities (use MFA, no long-term keys)
- Roles: Machine identities (EC2, Lambda, ECS tasks)
- Groups: Collection of user permissions

IAM Policy evaluation:
1. Explicit Deny → DENY (always wins)
2. Explicit Allow → ALLOW
3. Implicit Deny (default) → DENY
```

### AWS Security Services

```conceptgrid
{
  "boxes": [
    { "title": "GuardDuty", "description": "ML-based threat detection -- compromised instances, crypto mining", "color": "red" },
    { "title": "Security Hub", "description": "Aggregated security findings -- central SIEM for AWS", "color": "purple" },
    { "title": "Config", "description": "Configuration compliance -- detects drift from security baseline", "color": "blue" },
    { "title": "CloudTrail", "description": "API audit log -- who did what, when", "color": "amber" }
  ]
}
```

| Service | Purpose | Key Use |
|---------|---------|---------|
| AWS GuardDuty | Threat detection (ML-based) | Detect compromised instances, crypto mining |
| AWS Security Hub | Aggregated security findings | Central SIEM for AWS |
| AWS Config | Configuration compliance | Detect drift from security baseline |
| AWS Inspector | Vulnerability scanning | CVEs in EC2, containers, Lambda |
| AWS Macie | S3 data classification | Find PII in S3 buckets |
| AWS CloudTrail | API audit log | Who did what, when |
| AWS WAF | Web application firewall | Block OWASP Top 10 at the edge |
| AWS Shield | DDoS protection | L3/L4 DDoS mitigation |

---

## Azure Security Fundamentals

### Microsoft Defender for Cloud
- **Secure Score**: Percentage of recommendations implemented
- **CSPM**: Cloud Security Posture Management — identify misconfigurations
- **CWPP**: Cloud Workload Protection — runtime threat detection for VMs, containers

### Key Azure Security Controls

```flow
{
  "layout": "stack",
  "steps": [
    { "label": "Network Security Groups (NSG)", "sublabel": "L4 stateful firewall per subnet/NIC", "color": "blue" },
    { "label": "Azure Firewall", "sublabel": "L7 FQDN filtering, TLS inspection, threat intelligence", "color": "purple" },
    { "label": "Azure DDoS Protection", "sublabel": "L3/L4/L7 protection, automatic mitigation", "color": "red" },
    { "label": "Azure Private Link", "sublabel": "Private connectivity to PaaS without internet exposure", "color": "green" },
    { "label": "Microsoft Entra ID", "sublabel": "Identity provider, Conditional Access, just-in-time PIM access", "color": "amber" }
  ]
}
```

```
Network Security Groups (NSG): L4 stateful firewall per subnet/NIC
Azure Firewall: L7 FQDN filtering, TLS inspection, threat intelligence
Azure DDoS Protection: L3/L4/L7 protection, automatic mitigation
Azure Private Link: Private connectivity to PaaS without internet exposure
Microsoft Entra ID: Identity provider, Conditional Access, PIM for just-in-time access
```

---

## CSPM — Cloud Security Posture Management

Common misconfigurations CSPM detects:
1. S3 bucket / Blob storage publicly readable
2. Security groups with 0.0.0.0/0 inbound on port 22/3389
3. Root AWS account has no MFA
4. CloudTrail not enabled in all regions
5. Encryption not enabled on RDS / EBS volumes
6. IAM users with access keys older than 90 days
7. No password policy (min length, rotation)
8. Public RDS instances

**Tools**: AWS Security Hub, Azure Defender, Prisma Cloud, Wiz, Orca Security, Lacework

---

## Cloud Security Checklist (Production)

- [ ] MFA enabled on all privileged accounts
- [ ] No hardcoded credentials in code / environment variables
- [ ] Secrets in dedicated vault (AWS Secrets Manager, Azure Key Vault)
- [ ] All storage encrypted at rest (AES-256)
- [ ] All traffic encrypted in transit (TLS 1.2+)
- [ ] Least privilege IAM — no wildcard permissions in production
- [ ] VPC Flow Logs enabled
- [ ] CloudTrail / Activity Log enabled and exported to SIEM
- [ ] GuardDuty / Defender for Cloud enabled
- [ ] Security group audit — no 0.0.0.0/0 on sensitive ports
- [ ] Patch management schedule defined
