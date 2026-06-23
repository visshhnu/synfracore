# Cloud Security Quick Reference

## AWS Security Commands
```bash
# Security Hub (CSPM)
aws securityhub get-findings --filters '{"SeverityLabel":[{"Value":"CRITICAL","Comparison":"EQUALS"}]}'
aws securityhub enable-security-hub --enable-default-standards

# GuardDuty (threat detection)
aws guardduty create-detector --enable
aws guardduty list-findings --detector-id xxx
aws guardduty get-findings --detector-id xxx --finding-ids yyy

# Config (compliance)
aws configservice describe-compliance-by-config-rule --compliance-types NON_COMPLIANT
aws configservice get-compliance-details-by-resource --resource-type AWS::S3::Bucket --resource-id my-bucket

# CloudTrail
aws cloudtrail lookup-events --lookup-attributes AttributeKey=Username,AttributeValue=alice
aws cloudtrail get-trail-status --name my-trail

# Secrets Manager
aws secretsmanager create-secret --name db/password --secret-string 'mysecret'
aws secretsmanager get-secret-value --secret-id db/password
aws secretsmanager rotate-secret --secret-id db/password
```

## Quick Security Checklist
```
IAM:
  ☐ MFA enabled for root and all privileged users
  ☐ No active root access keys
  ☐ Least privilege for all roles and users
  ☐ Access Analyzer enabled (find external access)

Network:
  ☐ No 0.0.0.0/0 on port 22 or 3389 in security groups
  ☐ VPC Flow Logs enabled
  ☐ Resources in private subnets (no direct internet)

Data:
  ☐ S3 Block Public Access enabled account-wide
  ☐ EBS/RDS encryption enabled
  ☐ CloudTrail enabled in all regions
  ☐ KMS for sensitive data with CMKs

Monitoring:
  ☐ Security Hub + GuardDuty enabled
  ☐ Config rules for compliance monitoring
  ☐ CloudWatch alarms for root login, policy changes
```
