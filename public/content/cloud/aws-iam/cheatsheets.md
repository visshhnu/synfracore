# AWS IAM Cheatsheet

## Core Concepts
```
IDENTITY TYPES:
  IAM User:   human or service identity with credentials
  IAM Group:  collection of users, attach policies to group
  IAM Role:   assumed temporarily; no permanent credentials
  Root user:  created with account; avoid using; MFA mandatory

POLICY TYPES:
  Identity-based:   attached to user/group/role
  Resource-based:   attached to resource (S3, SQS, Lambda, etc.)
  Permission boundary: max permissions an identity can have
  SCP (Service Control Policy): applied at Org level (limits all members)
  Session policy:   passed when assuming role; further restricts session

POLICY EVALUATION (all must allow):
  Explicit DENY anywhere → DENY
  SCP ALLOW required
  Permission boundary ALLOW required
  Identity policy ALLOW required
  Resource policy ALLOW required (cross-account)
```

## Policy JSON Structure
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowS3Read",
      "Effect": "Allow",
      "Principal": {"AWS": "arn:aws:iam::123456789:user/alice"},
      "Action": ["s3:GetObject", "s3:ListBucket"],
      "Resource": ["arn:aws:s3:::my-bucket", "arn:aws:s3:::my-bucket/*"],
      "Condition": {
        "StringEquals": {"s3:prefix": "home/${aws:username}/"},
        "IpAddress": {"aws:SourceIp": "192.168.1.0/24"}
      }
    }
  ]
}
```

## CLI Commands
```bash
# Users
aws iam create-user --user-name alice
aws iam create-access-key --user-name alice
aws iam attach-user-policy --user-name alice \
  --policy-arn arn:aws:iam::aws:policy/ReadOnlyAccess
aws iam list-attached-user-policies --user-name alice

# Roles
aws iam create-role --role-name MyRole \
  --assume-role-policy-document file://trust-policy.json
aws iam attach-role-policy --role-name MyRole \
  --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess

# Assume role
aws sts assume-role --role-arn arn:aws:iam::123456789:role/MyRole \
  --role-session-name my-session

# Groups
aws iam create-group --group-name Developers
aws iam add-user-to-group --user-name alice --group-name Developers
```

## Key Patterns
| Pattern | Use Case |
|---------|----------|
| Least privilege | Start with no permissions, add as needed |
| Role chaining | Assume role → assume another role (max 1hr) |
| Cross-account | Trust policy allows external account ID |
| Service role | Allow AWS service to act on your behalf |
| Instance profile | Attach role to EC2 instance |
| Conditions | IP, MFA, time, resource tag restrictions |

## Common Managed Policies
```
AdministratorAccess    — full access (avoid; use for break-glass)
ReadOnlyAccess         — read all resources
PowerUserAccess        — everything except IAM
AmazonS3FullAccess     — all S3 operations
AmazonEC2ReadOnlyAccess— describe/list EC2 resources
AWSLambdaBasicExecutionRole — Lambda CloudWatch logs
```
