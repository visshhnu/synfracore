# AWS IAM — Fundamentals

## Core Components

```
User:   Person with long-term credentials (access key + secret)
Group:  Collection of users with shared permissions
Role:   Temporary credentials assumed by services or users
Policy: JSON document defining permissions (Allow/Deny actions on resources)

Best practices:
  Never use root account except for initial setup
  Never create long-term access keys for humans (use SSO/roles)
  Use roles for EC2, Lambda, ECS — never embed access keys in code
  Grant least privilege — only what is needed
```

## Policy Structure

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowS3ReadOnSpecificBucket",
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::my-bucket",
        "arn:aws:s3:::my-bucket/*"
      ],
      "Condition": {
        "StringEquals": {
          "aws:RequestedRegion": "us-east-1"
        }
      }
    },
    {
      "Sid": "DenyDeleteEverywhere",
      "Effect": "Deny",
      "Action": "s3:DeleteObject",
      "Resource": "*"
    }
  ]
}
```

## Roles for EC2 and Lambda

```bash
# Create role for EC2 to read from S3
aws iam create-role \
  --role-name EC2S3ReadRole \
  --assume-role-policy-document '{
    "Version":"2012-10-17",
    "Statement":[{
      "Effect":"Allow",
      "Principal":{"Service":"ec2.amazonaws.com"},
      "Action":"sts:AssumeRole"
    }]
  }'

aws iam attach-role-policy \
  --role-name EC2S3ReadRole \
  --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess

# Create instance profile (needed to attach role to EC2)
aws iam create-instance-profile --instance-profile-name EC2S3Profile
aws iam add-role-to-instance-profile \
  --instance-profile-name EC2S3Profile \
  --role-name EC2S3ReadRole

# Attach to running instance
aws ec2 associate-iam-instance-profile \
  --instance-id i-12345678 \
  --iam-instance-profile Name=EC2S3Profile
```

## Cross-Account Access

```json
// In Account A (trusted) — role that Account B can assume
{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Principal": {
      "AWS": "arn:aws:iam::ACCOUNT_B_ID:root"
    },
    "Action": "sts:AssumeRole",
    "Condition": {
      "StringEquals": {"sts:ExternalId": "unique-external-id"}
    }
  }]
}

// In Account B — allow specific user to assume the role
{
  "Effect": "Allow",
  "Action": "sts:AssumeRole",
  "Resource": "arn:aws:iam::ACCOUNT_A_ID:role/CrossAccountRole"
}
```

```python
# Assume role in Python
import boto3

sts = boto3.client('sts')
assumed = sts.assume_role(
    RoleArn='arn:aws:iam::123456789:role/CrossAccountRole',
    RoleSessionName='my-session',
    ExternalId='unique-external-id',
    DurationSeconds=3600
)

session = boto3.Session(
    aws_access_key_id=assumed['Credentials']['AccessKeyId'],
    aws_secret_access_key=assumed['Credentials']['SecretAccessKey'],
    aws_session_token=assumed['Credentials']['SessionToken']
)

s3 = session.client('s3', region_name='us-east-1')
```

## IAM Policy Evaluation Logic

```
Evaluation order:
1. Explicit DENY — always wins, regardless of allows
2. SCP (Service Control Policy) — org-level guardrails
3. Permissions boundary — max permissions a role can have
4. Identity-based policies — role/user/group policies
5. Resource-based policies — bucket policy, role trust policy
6. Session policies — passed when assuming role

Default: DENY everything not explicitly allowed

Common mistake: Adding Allow but forgetting the Deny override
  "Allow s3:*" + "Deny s3:DeleteBucket" — the Deny wins ✓
  "Deny s3:*" + "Allow s3:GetObject" — the Deny wins, GetObject BLOCKED ✗
```
