# Cloud Security — Fundamentals

## IAM Security Best Practices

```bash
# Principle of Least Privilege
# Never use root account except for initial setup
# Use IAM roles for services, not long-term access keys for humans
# Use AWS SSO / IAM Identity Center for human access

# Audit IAM regularly
aws iam generate-credential-report
aws iam get-credential-report --query Content --output text | base64 -d | grep -v "false,false,false"
# Look for: console access + no MFA, old access keys, root account activity

# Access Analyzer — find unintended external access
aws accessanalyzer create-analyzer --analyzer-name account-analyzer --type ACCOUNT
aws accessanalyzer list-findings --analyzer-name account-analyzer

# Detective controls — know when things change
aws cloudtrail create-trail \
    --name all-events \
    --s3-bucket-name cloudtrail-logs \
    --is-multi-region-trail \
    --enable-log-file-validation  # Detect tampering with logs

# Alert on root account usage
aws cloudwatch put-metric-alarm \
    --alarm-name RootAccountUsage \
    --metric-name RootAccountUsage \
    --namespace CloudTrailMetrics \
    --statistic Sum --period 300 --threshold 1 \
    --comparison-operator GreaterThanOrEqualToThreshold \
    --alarm-actions arn:aws:sns:us-east-1:123:security-alerts
```

## Encryption Everywhere

```bash
# KMS — manage encryption keys
aws kms create-key --description "prod-data-key" \
    --key-policy file://key-policy.json

# Enable encryption on existing S3 bucket
aws s3api put-bucket-encryption \
    --bucket prod-data \
    --server-side-encryption-configuration '{
        "Rules":[{"ApplyServerSideEncryptionByDefault":{
            "SSEAlgorithm":"aws:kms",
            "KMSMasterKeyID":"alias/prod-data-key"
        },"BucketKeyEnabled":true}]
    }'

# Enforce TLS everywhere — bucket policy
{
    "Effect": "Deny",
    "Principal": "*",
    "Action": "s3:*",
    "Resource": ["arn:aws:s3:::bucket","arn:aws:s3:::bucket/*"],
    "Condition": {"Bool": {"aws:SecureTransport": "false"}}
}

# Secrets Manager — no hardcoded secrets
aws secretsmanager create-secret \
    --name prod/db/password \
    --secret-string "$(openssl rand -base64 32)"

# Auto-rotate secrets
aws secretsmanager rotate-secret \
    --secret-id prod/db/password \
    --rotation-lambda-arn arn:aws:lambda:...
```
