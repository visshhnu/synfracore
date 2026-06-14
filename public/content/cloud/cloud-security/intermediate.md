# Cloud Security — Intermediate

## AWS GuardDuty Advanced

```bash
# GuardDuty findings and automated response
# Enable in ALL regions (critical — threats don't stay in one region)
for region in $(aws ec2 describe-regions --query 'Regions[].RegionName' --output text); do
  aws guardduty create-detector --enable --region $region \
    --features '[{"Name":"S3_DATA_EVENTS","Status":"ENABLED"},{"Name":"EKS_AUDIT_LOGS","Status":"ENABLED"}]'
done

# Auto-remediate high-severity findings with EventBridge + Lambda
cat > guardduty-response.json << 'EOF'
{
  "source": ["aws.guardduty"],
  "detail-type": ["GuardDuty Finding"],
  "detail": {
    "severity": [7, 7.1, 7.2, 7.3, 7.4, 7.5, 7.6, 7.7, 7.8, 7.9, 8, 8.9, 9, 10]
  }
}
EOF

aws events put-rule --name high-severity-findings \
  --event-pattern file://guardduty-response.json

# Lambda that isolates a compromised EC2 instance
# 1. Detach from security groups
# 2. Attach to quarantine SG (deny all ingress/egress)
# 3. Create forensic snapshot
# 4. Send alert to security team
```

## CSPM: Detect Misconfigurations at Scale

```bash
# AWS Security Hub — aggregates findings from 60+ services
aws securityhub enable-security-hub --enable-default-standards

# Enable all AWS-native integrations
aws securityhub enable-import-findings-for-product \
  --product-arn arn:aws:securityhub:us-east-1::product/aws/guardduty
aws securityhub enable-import-findings-for-product \
  --product-arn arn:aws:securityhub:us-east-1::product/aws/inspector

# Query findings
aws securityhub get-findings \
  --filters '{"SeverityLabel":[{"Value":"CRITICAL","Comparison":"EQUALS"}],"RecordState":[{"Value":"ACTIVE","Comparison":"EQUALS"}]}' \
  --query 'Findings[*].[Title, AwsAccountId, UpdatedAt]' \
  --output table

# Suppress known false positives
aws securityhub batch-update-findings \
  --finding-identifiers Id=$FINDING_ID,ProductArn=$PRODUCT_ARN \
  --workflow '{"Status":"SUPPRESSED"}' \
  --note '{"Text":"Known false positive — dev account","UpdatedBy":"security-team"}'
```
