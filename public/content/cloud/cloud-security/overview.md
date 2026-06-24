# Cloud Security Overview

## Why Cloud Security is Different

Cloud environments introduce unique security challenges: shared responsibility, dynamic infrastructure, identity-centric access, and API-driven operations. Traditional perimeter security is insufficient.

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
