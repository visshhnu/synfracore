# Cloud Security Intermediate Topics

## IAM Security Best Practices

```
ACCESS KEY HYGIENE:
  Never use root account access keys (delete them)
  Rotate IAM access keys every 90 days
  Delete unused access keys and inactive users
  Use IAM Access Analyzer to find over-privileged policies
  
  # Check for old access keys
  aws iam generate-credential-report
  aws iam get-credential-report --query Content --output text | base64 -d

  # List access keys and age
  aws iam list-access-keys --user-name alice
  
PERMISSION BOUNDARIES:
  Limit max permissions an IAM entity can have
  Useful for: delegating IAM permission creation to dev teams safely
  Even if policy grants *, boundary restricts to boundary permissions

CONDITION KEYS FOR SECURITY:
  aws:MultiFactorAuthPresent: true (require MFA)
  aws:SourceIp: restrict to office IPs
  aws:RequestedRegion: lock to specific regions
  aws:CalledVia: restrict to specific services
  
  # Example: require MFA for console operations
  {
    "Effect": "Deny",
    "Action": "*",
    "Resource": "*",
    "Condition": {"BoolIfExists": {"aws:MultiFactorAuthPresent": "false"}}
  }
```

## Network Security Deep Dive

```
SECURITY GROUP BEST PRACTICES:
  No 0.0.0.0/0 on SSH (22) or RDP (3389) — use Bastion/SSM instead
  Separate security groups per tier (web, app, database)
  Reference security groups by ID, not IP ranges (dynamic IPs)
  Outbound: restrict to known destinations where possible
  
  # Scan for open SSH/RDP
  aws ec2 describe-security-groups \
    --filters Name=ip-permission.from-port,Values=22 \
              Name=ip-permission.cidr,Values=0.0.0.0/0

BASTION ALTERNATIVES:
  AWS Systems Manager Session Manager:
    No SSH key management needed
    No open inbound ports required
    All sessions logged to CloudWatch/S3
    aws ssm start-session --target i-1234567890abcdef0
  
  Azure Bastion:
    Managed PaaS bastion host (no public IP on VMs)
    RDP/SSH through browser via Azure portal
    No agent required on target VM

WAF CONFIGURATION:
  AWS WAF: attach to CloudFront, ALB, API Gateway, AppSync
    Managed rule groups: AWS, F5, Imperva, Fortinet
    Custom rules: rate-based (DDoS), IP reputation, geoblocking
  Azure WAF: attach to App Gateway or Front Door
  Cloud Armor: GCP WAF, DDoS protection for external LBs
```

## Logging and Monitoring

```
ESSENTIAL LOGS TO ENABLE:
  AWS:
    CloudTrail: ALL regions, ALL events, S3 bucket + CloudWatch Logs destination
    VPC Flow Logs: ALL VPCs (reject traffic especially valuable)
    S3 server access logging: who accessed what object
    RDS: slow query, error, general logs
    GuardDuty: always on, all regions
  
  Azure:
    Activity Log: diagnostic settings → Log Analytics Workspace
    Azure Monitor: resource-level metrics and logs
    Microsoft Defender for Cloud: auto-provisioned agents
    NSG Flow Logs: traffic analysis
  
  GCP:
    Cloud Audit Logs: admin activity (default on), data access (must enable)
    VPC Flow Logs: subnet-level traffic
    Security Command Center: asset inventory, vulnerabilities, threats

SIEM INTEGRATION:
  Centralise logs from all accounts/subscriptions/projects
  AWS: Security Lake (standardised OCSF format) or CloudWatch → SIEM
  Azure: Sentinel workbooks, analytics rules, automation playbooks
  GCP: Chronicle (Google SIEM), or export to BigQuery/third-party
```

## Study Resources
- **AWS Security Fundamentals** (aws.amazon.com/training) — free digital training
- **Microsoft Learn Security Fundamentals** — free, covers Azure and Defender
- **NIST SP 800-53** — comprehensive security controls catalog
- **CIS Controls** (cisecurity.org) — prioritised security controls, cloud companion guides
