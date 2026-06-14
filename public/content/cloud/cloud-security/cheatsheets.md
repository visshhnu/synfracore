# Cloud Security — Cheatsheet

```bash
# ── ENABLE CORE SECURITY SERVICES ────────────────────────
# GuardDuty (threat detection)
aws guardduty create-detector --enable
aws guardduty list-detectors
aws guardduty get-findings --detector-id $ID \
  --finding-ids $(aws guardduty list-findings --detector-id $ID --query 'FindingIds[*]' --output text)

# Security Hub (aggregate findings)
aws securityhub enable-security-hub --enable-default-standards
aws securityhub get-findings \
  --filters '{"SeverityLabel":[{"Value":"CRITICAL","Comparison":"EQUALS"}]}' \
  --query 'Findings[*].[Title,AwsAccountId]' --output table

# AWS Config (compliance)
aws config describe-config-rules --output table
aws config get-compliance-summary-by-config-rule
aws config get-compliance-details-by-config-rule --config-rule-name $RULE

# CloudTrail (audit logs)
aws cloudtrail list-trails
aws cloudtrail get-trail-status --name $TRAIL
aws cloudtrail lookup-events --lookup-attributes AttributeKey=EventName,AttributeValue=ConsoleLogin

# ── FIND SECURITY ISSUES ──────────────────────────────────
# Public S3 buckets
aws s3api list-buckets --query 'Buckets[*].Name' --output text | \
  xargs -I{} aws s3api get-bucket-acl --bucket {}

# Unused IAM credentials (rotate or delete)
aws iam generate-credential-report
aws iam get-credential-report --query Content --output text | base64 -d

# Access Advisor: unused permissions
aws iam get-service-last-accessed-details \
  --job-id $(aws iam generate-service-last-accessed-details --arn $ARN --query JobId --output text)

# Security groups with 0.0.0.0/0 ingress
aws ec2 describe-security-groups \
  --filters "Name=ip-permission.cidr,Values=0.0.0.0/0" \
  --query 'SecurityGroups[*].[GroupId,GroupName,IpPermissions]'

# ── QUICK HARDENING CHECKLIST ─────────────────────────────
# MFA on root account: Console → Security Credentials
aws iam get-account-summary  # Check MFADevices count

# Block public S3 at account level
aws s3control put-public-access-block --account-id $ACCT \
  --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true"

# Enable EBS encryption by default
aws ec2 enable-ebs-encryption-by-default

# Check for old access keys (rotate if > 90 days)
aws iam list-access-keys --user-name $USER \
  --query 'AccessKeyMetadata[*].[AccessKeyId,Status,CreateDate]'
```
