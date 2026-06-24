# Cloud Security Cheatsheet

## Security Commands Reference

```bash
# AWS — Check public S3 buckets
aws s3api list-buckets --query 'Buckets[].Name' --output text | \
  xargs -I {} aws s3api get-bucket-acl --bucket {}

# AWS — Enable GuardDuty all regions
for region in $(aws ec2 describe-regions --query 'Regions[].RegionName' --output text); do
  aws guardduty create-detector --enable --region $region
done

# AWS — CloudTrail status check
aws cloudtrail describe-trails --include-shadow-trails false
aws cloudtrail get-trail-status --name myTrail

# AWS — IAM password policy check
aws iam get-account-password-policy

# AWS — Find over-permissive security groups
aws ec2 describe-security-groups \
  --filters "Name=ip-permission.cidr,Values=0.0.0.0/0" \
  --query 'SecurityGroups[].{ID:GroupId,Name:GroupName,Ports:IpPermissions[].FromPort}'

# Azure — Defender for Cloud secure score
az security secure-score-controls list

# Azure — Enable Defender for Storage
az security pricing create -n StorageAccounts --tier Standard

# GCP — List overly permissive IAM bindings
gcloud projects get-iam-policy PROJECT_ID --format=json | \
  python3 -c "import json,sys; p=json.load(sys.stdin); [print(b) for b in p['bindings'] if 'allUsers' in b.get('members',[]) or 'allAuthenticatedUsers' in b.get('members',[])]"

# GCP — Enable Security Command Center
gcloud services enable securitycenter.googleapis.com
```

## Security Checklist (Quick Audit)
```
☐ Root / Global Admin MFA enabled
☐ No root access keys (AWS) — delete them
☐ CloudTrail / Activity Log / GCP Audit Logs enabled ALL regions
☐ GuardDuty / Defender for Cloud / SCC enabled
☐ No 0.0.0.0/0 on port 22 or 3389
☐ No public S3 buckets with sensitive data
☐ Encryption at rest on all storage and databases
☐ Secrets in Secrets Manager / Key Vault (not env vars or code)
☐ MFA required for all human users
☐ Access keys rotated in last 90 days
☐ Unused IAM users/service principals disabled
☐ VPC Flow Logs enabled
☐ Budget alerts configured
☐ Backup tested (can you restore?)
☐ Incident response runbook exists
```

## Key Security Tools by Cloud
| Tool | AWS | Azure | GCP |
|------|-----|-------|-----|
| Threat detection | GuardDuty | Defender for Cloud | SCC |
| SIEM | Security Lake + partner | Sentinel | Chronicle |
| Vuln scan | Inspector | Defender for Servers | SCC Premium |
| Posture mgmt | Security Hub | Defender CSPM | SCC |
| Secrets | Secrets Manager | Key Vault | Secret Manager |
| Key mgmt | KMS | Key Vault | Cloud KMS |
| WAF | AWS WAF | Azure WAF | Cloud Armor |
| Identity | IAM + STS | Entra ID | Cloud IAM |
