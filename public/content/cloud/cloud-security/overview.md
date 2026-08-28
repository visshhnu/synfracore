# Cloud Security Overview

**Before you start:** basic IAM and VPC/VNet familiarity on at least one cloud provider (see that platform's own courses and the Cloud Networking & Security course first if those are new) is assumed — this page builds directly on those primitives rather than re-teaching them. No prior dedicated security background is required.

## Why Cloud Security is Different

Cloud environments introduce unique security challenges: shared responsibility, dynamic infrastructure, identity-centric access, and API-driven operations. Traditional perimeter security is insufficient.

## Why this exists (the hook)

Capital One's 2019 breach exposed over 100 million customers' data. The cause wasn't a sophisticated exploit against AWS's infrastructure — it was a misconfigured web application firewall combined with an over-permissive IAM role that let a single compromised credential reach far more than it should have been able to. AWS's own infrastructure was never breached; the customer's configuration was. That's the entire premise of cloud security as a discipline: the provider secures a very solid floor, and almost every real incident happens because of what gets built on top of it, not because the floor gave way.

## Analogy

Traditional, on-premise security is like guarding a single building with one perimeter wall and one gate — control the gate, and you've controlled access to everything inside. Cloud security is like securing a sprawling campus where every single door, on every building, can be opened by an API call from anywhere in the world, and new buildings get constructed automatically whenever someone requests one. There's no single perimeter wall to defend — identity (who's allowed to open which door) has to replace the wall as the primary control, which is exactly why IAM, not network firewalls alone, sits at the center of cloud security.

## How it fits together (diagram)

```conceptgrid
{
  "boxes": [
    { "title": "Provider Secures OF the Cloud", "description": "Physical DCs, hardware, hypervisor, managed-service internals -- fixed floor, doesn't move", "color": "blue" },
    { "title": "You Secure IN the Cloud", "description": "IAM, network config, encryption, OS patching (IaaS), app code, data -- most real breaches happen here", "color": "red" }
  ]
}
```

This line is the same in IaaS/PaaS/SaaS — only the SIZE of the "you" box shrinks; "data + access control" never leaves it.

## Try it yourself (2 minutes)

Look up the actual public summary of the Capital One 2019 breach (widely documented, safe to search). Identify which specific line of the shared responsibility diagram above it falls into — was it the provider's infrastructure, or a customer-side WAF/IAM misconfiguration? Then do the same for one more publicized cloud breach you can recall or find. Notice the pattern: this exercise is genuinely hard to fail, because nearly every well-known cloud breach lands in the "you secure IN the cloud" box, which is exactly why that's where this course spends most of its time.

## Shared Responsibility Model

```
AWS / AZURE / GCP RESPONSIBILITY:
  Physical security of datacenters
  Hardware, networking infrastructure
  Hypervisor and virtualisation layer
  Managed service security (e.g. RDS patches, managed Kubernetes control plane)

CUSTOMER RESPONSIBILITY:
  Data encryption (at rest and in transit)
  Identity and access management (IAM)
  Network configuration (security groups, firewalls)
  Operating system patching (for IaaS VMs)
  Application security
  Compliance obligations

THE BOUNDARY SHIFTS BY SERVICE TYPE:
  IaaS (EC2, Azure VM): customer manages OS upward
  PaaS (RDS, App Service): customer manages application and data
  SaaS (Microsoft 365): customer manages data and user access only
```

## Security Pillars

```conceptgrid
{
  "boxes": [
    { "title": "Identity & Access", "description": "Least privilege, MFA everywhere, roles over long-lived credentials", "color": "blue" },
    { "title": "Network Security", "description": "Subnet segmentation, Security Groups/NSGs, WAF, DDoS protection", "color": "purple" },
    { "title": "Data Protection", "description": "Encryption at rest and in transit, key management, classification", "color": "green" },
    { "title": "Threat Detection", "description": "GuardDuty/Defender/Security Command Center, SIEM", "color": "red" },
    { "title": "Vulnerability Management", "description": "OS patching, container image scanning, IaC scanning", "color": "amber" },
    { "title": "Compliance", "description": "CSPM, CIS Benchmarks, NIST/ISO 27001/SOC 2/GDPR/HIPAA", "color": "slate" }
  ]
}
```

```
1. IDENTITY AND ACCESS MANAGEMENT:
   Least privilege: grant only permissions required for the job
   MFA everywhere: especially for root/admin accounts
   Use roles, not long-lived credentials
   Rotate access keys regularly
   Audit via CloudTrail / Azure Monitor / GCP Audit Logs

2. NETWORK SECURITY:
   VPC / VNet segmentation (public vs private subnets)
   Security Groups / NSGs: allow-list inbound, restrict outbound
   WAF: protect web apps from OWASP Top 10
   DDoS protection: AWS Shield, Azure DDoS, Cloud Armor
   Private endpoints: keep PaaS traffic off public internet

3. DATA PROTECTION:
   Encryption at rest: S3/EBS/RDS encryption, Azure Disk Encryption
   Encryption in transit: TLS 1.2+ everywhere
   Key management: AWS KMS, Azure Key Vault, Cloud KMS
   Data classification: know what you have and where it lives

4. THREAT DETECTION:
   AWS: GuardDuty (AI threat detection), Security Hub (aggregation)
   Azure: Defender for Cloud (CSPM + CWPP)
   GCP: Security Command Center
   SIEM: Splunk, Microsoft Sentinel, Chronicle

5. VULNERABILITY MANAGEMENT:
   Patch OS promptly (Systems Manager Patch Manager, Azure Update Manager)
   Scan container images: Amazon Inspector, Azure Container Registry, Artifact Registry
   Infrastructure scanning: Checkov, KICS, tfsec for IaC

6. COMPLIANCE:
   CSPM (Cloud Security Posture Management): detect misconfigurations
   Frameworks: CIS Benchmarks, NIST CSF, ISO 27001, SOC 2, GDPR, HIPAA
```

## Top Cloud Security Misconfigurations
```
1. Public S3 buckets / Azure Blob containers / GCS buckets
2. Overly permissive IAM policies (AdministratorAccess on all users)
3. No MFA on root/admin accounts
4. Open security groups (0.0.0.0/0 on port 22/3389)
5. Unencrypted databases and storage
6. No logging enabled (CloudTrail, Azure Activity Log off)
7. Secrets in source code or environment variables (use Secrets Manager)
8. No GuardDuty / Defender for Cloud / SCC enabled
9. Default VPC usage for production
10. No incident response plan or tested runbooks
```

## Study Resources
- **AWS Security Specialty (SCS-C02)** — deep AWS security certification
- **AZ-500 (Azure Security Engineer)** — Azure security certification
- **CCSP (Certified Cloud Security Professional)** — vendor-neutral cloud security
- **CIS Benchmarks** (cisecurity.org) — free hardening guides for all major clouds
