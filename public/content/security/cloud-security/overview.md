# Cloud Security — Overview

## Cloud Security for Security Engineers

Cloud security covers the policies, technologies, and controls deployed to protect cloud data, applications, and infrastructure from threats.

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
