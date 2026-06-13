# Cloud Security — Intermediate

## GuardDuty and Security Hub

```bash
# GuardDuty — ML-powered threat detection
# Analyzes CloudTrail, VPC flow logs, DNS logs automatically

# Enable in all regions (critical!)
for region in $(aws ec2 describe-regions --query 'Regions[].RegionName' --output text); do
    aws guardduty create-detector --enable --region $region
done

# Findings types to watch:
# UnauthorizedAccess:IAMUser/ConsoleLoginSuccess.B  - Login from unusual location
# CryptoCurrency:EC2/BitcoinTool.B                  - Crypto mining on EC2
# Trojan:EC2/PhishingDomainRequest.B               - EC2 calling phishing domain
# Recon:IAMUser/MaliciousIPCaller                  - Recon from known bad IP

# Auto-remediate GuardDuty findings with EventBridge + Lambda
aws events put-rule \
    --name GuardDutyFindings \
    --event-pattern '{"source":["aws.guardduty"],"detail-type":["GuardDuty Finding"],"detail":{"severity":[7,8,9]}}' \
    --state ENABLED

# Security Hub — aggregate all findings
aws securityhub enable-security-hub \
    --enable-default-standards  # CIS, AWS Foundational

# Enable integrations
aws securityhub enable-import-findings-for-product \
    --product-arn arn:aws:securityhub:us-east-1::product/aws/guardduty
```

## AWS Config — Compliance as Code

```json
// Config rule: no S3 buckets with public access
{
    "ConfigRuleName": "s3-bucket-public-read-prohibited",
    "Source": {
        "Owner": "AWS",
        "SourceIdentifier": "S3_BUCKET_PUBLIC_READ_PROHIBITED"
    }
}

// Custom Config rule: all EC2 must have specific tags
{
    "ConfigRuleName": "required-tags",
    "Source": {"Owner": "AWS", "SourceIdentifier": "REQUIRED_TAGS"},
    "InputParameters": "{\"tag1Key\":\"Environment\",\"tag2Key\":\"Owner\"}"
}
```

```bash
# Auto-remediate non-compliant resources
aws configservice put-remediation-configurations \
    --remediation-configurations '[{
        "ConfigRuleName": "s3-bucket-public-read-prohibited",
        "TargetType": "SSM_DOCUMENT",
        "TargetId": "AWS-DisableS3BucketPublicReadWrite",
        "Automatic": true,
        "MaximumAutomaticAttempts": 5,
        "RetryAttemptSeconds": 60
    }]'
```
