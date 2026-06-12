# AWS IAM — Cheatsheet

```bash
# ── USERS ─────────────────────────────────────────────────────
aws iam list-users
aws iam create-user --user-name alice
aws iam delete-user --user-name alice
aws iam get-user --user-name alice

# Access keys (avoid for humans — use SSO instead)
aws iam create-access-key --user-name alice
aws iam list-access-keys --user-name alice
aws iam update-access-key --user-name alice --access-key-id AKIA... --status Inactive
aws iam delete-access-key --user-name alice --access-key-id AKIA...

# ── GROUPS ────────────────────────────────────────────────────
aws iam create-group --group-name developers
aws iam add-user-to-group --user-name alice --group-name developers
aws iam attach-group-policy --group-name developers --policy-arn arn:aws:iam::aws:policy/ReadOnlyAccess

# ── ROLES ─────────────────────────────────────────────────────
aws iam list-roles
aws iam create-role --role-name MyRole --assume-role-policy-document file://trust-policy.json
aws iam attach-role-policy --role-name MyRole --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess
aws iam put-role-policy --role-name MyRole --policy-name inline-policy --policy-document file://policy.json
aws iam get-role --role-name MyRole

# Assume role (cross-account or testing)
aws sts assume-role --role-arn arn:aws:iam::123456789:role/MyRole --role-session-name test-session

# ── POLICIES ─────────────────────────────────────────────────
aws iam list-policies --scope Local              # Your custom policies
aws iam get-policy --policy-arn arn:aws:iam::123:policy/MyPolicy
aws iam get-policy-version --policy-arn arn:... --version-id v1
aws iam create-policy --policy-name MyPolicy --policy-document file://policy.json
aws iam delete-policy --policy-arn arn:aws:iam::123:policy/MyPolicy

# Simulate policy (test without doing)
aws iam simulate-principal-policy \
  --policy-source-arn arn:aws:iam::123:role/MyRole \
  --action-names s3:GetObject s3:DeleteObject \
  --resource-arns "arn:aws:s3:::my-bucket/*"

# ── ACCOUNT ───────────────────────────────────────────────────
aws iam get-account-summary
aws iam generate-credential-report
aws iam get-credential-report --query Content --output text | base64 -d
aws sts get-caller-identity                      # Who am I?
```

## Policy Skeleton Templates

```json
// EC2 read-only with tag condition
{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Action": ["ec2:Describe*"],
    "Resource": "*",
    "Condition": {"StringEquals": {"ec2:Region": "us-east-1"}}
  }]
}

// S3 full access to specific bucket
{
  "Version": "2012-10-17",
  "Statement": [
    {"Effect":"Allow","Action":"s3:ListBucket","Resource":"arn:aws:s3:::my-bucket"},
    {"Effect":"Allow","Action":"s3:*Object*","Resource":"arn:aws:s3:::my-bucket/*"}
  ]
}

// Trust policy for EC2 instance role
{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Principal": {"Service": "ec2.amazonaws.com"},
    "Action": "sts:AssumeRole"
  }]
}
```
