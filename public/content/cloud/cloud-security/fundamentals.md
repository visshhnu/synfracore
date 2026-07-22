# Cloud Security — Fundamentals

## The hook: a leaked root access key is a worse incident than a leaked application bug

An application bug is scoped to what that application can touch. A leaked root or admin-equivalent access key with no MFA is scoped to *everything in the account* — every S3 bucket, every database, every IAM policy, including the ability to create new admin users to maintain access even after the original key is revoked. The commands and practices below aren't abstract hygiene — they're specifically about making sure the worst-case blast radius of a single leaked credential is small, not "the entire account."

## Analogy

Think of IAM roles versus long-lived access keys like a hotel key card versus a house key you had copied for a contractor. A hotel key card (an IAM role, assumed temporarily) expires automatically, can be deactivated instantly from the front desk, and only opens the specific rooms it was issued for. A copied house key (a long-lived access key) works forever until someone remembers to change the locks, opens every door you didn't specifically remove it from, and there's no central log of who copied it further. Every practice below is really just "prefer key cards over copied house keys, and if you must use a house key, know exactly which doors it opens and check regularly that it hasn't been copied again."

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

## Try it yourself (2 minutes)

If you have (or can create) a free-tier AWS/Azure/GCP account, run the equivalent of `aws iam generate-credential-report` followed by `aws iam get-credential-report --query Content --output text | base64 -d` (or check the IAM console's credential report directly) and look at just two columns: MFA status and access-key age, for every user listed. Even in a brand-new sandbox account, this is the exact report a real security review starts with — the goal of this exercise is to internalize that "who has console access without MFA" and "how old is this access key" are not abstract audit-checklist items, they're two columns in one real report you can generate in under a minute.
