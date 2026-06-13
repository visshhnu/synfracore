# Cloud Security — Overview

Cloud security is shared responsibility: the provider secures the infrastructure, you secure your data, applications, identity, and configuration.

## Shared Responsibility Model

```
AWS/Azure/GCP Responsible For:       YOU Responsible For:
  Physical data centers               ├─ Identity & Access Management
  Network infrastructure              ├─ Data classification & encryption
  Hypervisor security                 ├─ Network configuration (VPC, SGs)
  Managed service patching            ├─ Application security
  Global infrastructure HA            ├─ OS patching (for IaaS)
                                      └─ Regulatory compliance
```

## Cloud Security Pillars

| Pillar | What It Means | Tools |
|---|---|---|
| **Identity** | Who can access what | IAM, SSO, MFA, RBAC |
| **Data** | Encrypt everything, classify sensitivity | KMS, Macie, DLP |
| **Network** | Segment, filter, monitor | VPC, SGs, NACLs, WAF |
| **Workload** | Secure VMs, containers, serverless | Security groups, patch mgmt |
| **Detection** | Find threats fast | CloudTrail, GuardDuty, SIEM |
| **Response** | React and recover | IR playbooks, automated response |

## Quick Wins (Do These First)

```bash
# 1. Enable MFA on root/admin accounts
# 2. Turn on CloudTrail in all regions
aws cloudtrail create-trail --name all-regions --s3-bucket-name audit-logs \
    --is-multi-region-trail --enable-log-file-validation

# 3. Enable GuardDuty (threat detection)
aws guardduty create-detector --enable

# 4. Block public S3 at account level
aws s3control put-public-access-block \
    --account-id 123456789 \
    --public-access-block-configuration \
    "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true"

# 5. Enable Security Hub (aggregates findings)
aws securityhub enable-security-hub
```
