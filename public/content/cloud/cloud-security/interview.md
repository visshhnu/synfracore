# Cloud Security Interview Questions

## Core Concepts

**Q: What is the Shared Responsibility Model?**

Security responsibility is divided between cloud provider and customer.

**AWS/Azure/GCP handles (security OF the cloud):**
- Physical security of data centres
- Hardware (servers, networking, storage)
- Hypervisor and virtualisation layer
- Managed service software (e.g., RDS patching)

**Customer handles (security IN the cloud):**
- Data (classification, encryption, access control)
- Identity and access management (IAM, MFA)
- Operating systems on VMs (patching, hardening)
- Network configuration (security groups, NACLs, firewalls)
- Application security (OWASP Top 10, secure coding)

**More managed service = more provider responsibility** (S3 vs EC2 vs Lambda).

---

**Q: Cloud security posture management (CSPM).**

CSPM continuously monitors cloud resources for security misconfigurations.

**Common misconfigurations detected:**
- S3 buckets with public access
- Security groups allowing 0.0.0.0/0 on port 22 or 3389
- Root account without MFA
- Encryption disabled on EBS/RDS
- CloudTrail logging disabled
- IAM users with admin permissions
- VPC without flow logs

**Tools:** AWS Security Hub, Azure Defender for Cloud, GCP Security Command Center, Prisma Cloud, Wiz, Orca Security.

```bash
# AWS Security Hub: aggregates findings from GuardDuty, Inspector, Config, Macie
aws securityhub get-findings --filters '{"SeverityLabel": [{"Value":"CRITICAL","Comparison":"EQUALS"}]}'

# AWS Config: detect non-compliant resources
aws configservice describe-compliance-by-config-rule   --compliance-types NON_COMPLIANT
```

---

**Q: Cloud identity security best practices.**

```
1. Root/Admin account:
   - Enable MFA (hardware key preferred)
   - No access keys (delete them)
   - Use only for billing + account recovery
   
2. IAM/RBAC:
   - Least privilege (only permissions required)
   - Use groups/roles, not direct user policies
   - Regular access review (quarterly minimum)
   - Just-in-time (JIT) access for privileged actions
   
3. Service identities:
   - Managed identities (AWS: IAM Roles / Azure: Managed Identity / GCP: Workload Identity)
   - No long-lived access keys for services
   - Rotate keys if service principals must use them
   
4. Monitoring:
   - AWS CloudTrail / Azure Activity Log / GCP Audit Logs: log all API calls
   - Alert on: root login, policy changes, cross-account assumes, console login without MFA
```

---

**Q: Data security in the cloud.**

**Encryption at rest:**
- AWS: SSE-S3, SSE-KMS, client-side | Azure: SSE with platform key or CMK | GCP: default AES-256

**Encryption in transit:**
- TLS 1.2+ for all APIs
- Enforce HTTPS-only (S3 bucket policy, Azure policy, GCP org policy)
- mTLS for service-to-service within VPC

**Key management:**
- AWS KMS: managed key service, audit via CloudTrail, supports CMKs and AWS-managed keys
- Azure Key Vault: keys, secrets, certificates + HSM option
- GCP Cloud KMS: similar, Cloud HSM for compliance
- **Bring your own key (BYOK)**: Customer creates and manages key material

**Data classification:** Identify sensitive data (PII, PCI, PHI) with:
- AWS Macie (S3 PII scanning)
- Azure Purview
- GCP Cloud DLP (Data Loss Prevention)

---

**Q: Cloud network security — key controls.**

```
Defense in depth:
1. VPC/VNet: private network, no internet by default
2. Security Groups / NSGs: instance-level firewall (allow rules, stateful)
3. NACLs / Subnet NSGs: subnet-level (allow+deny, stateless)
4. WAF (Web Application Firewall): HTTP-level (AWS WAF, Azure WAF, Cloud Armor)
   - Block OWASP Top 10, rate limiting, IP blocking
5. DDoS Protection: AWS Shield, Azure DDoS Protection, GCP Cloud Armor
6. VPC Flow Logs: network traffic logging for forensics
7. Private endpoints: access services without internet traversal
8. Bastion/Jump host or VPN for admin access (no public SSH/RDP)
```

## Revision Notes
```
SHARED RESPONSIBILITY:
Provider: physical, hardware, hypervisor, managed service software
Customer: data, IAM, OS patching, network config, app security
More managed = more provider responsibility

CSPM: continuous misconfiguration detection
Common findings: public S3, open 0.0.0.0/0, no MFA on root, unencrypted volumes
Tools: Security Hub (AWS), Defender for Cloud (Azure), SCC (GCP), Wiz, Orca

IDENTITY:
Root/Admin: MFA only, no access keys, emergency use only
Least privilege | JIT access for privileged | Regular access review
Services: managed identities > long-lived keys

ENCRYPTION:
At rest: KMS/CMK (all major providers) | In transit: TLS 1.2+
BYOK: customer owns key material | Cloud DLP/Macie: find sensitive data

NETWORK DEFENSE IN DEPTH:
VPC → SG/NSG → NACL → WAF → DDoS → Flow Logs → Private Endpoints → Bastion
No public SSH/RDP — use Bastion or VPN
```
