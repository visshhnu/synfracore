# AWS IAM Fundamentals

## IAM Policies — Writing Them

```json
// Allow read-only S3 access to specific bucket
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowS3ReadOnSpecificBucket",
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:GetObjectVersion",
        "s3:ListBucket",
        "s3:GetBucketLocation"
      ],
      "Resource": [
        "arn:aws:s3:::my-app-bucket",
        "arn:aws:s3:::my-app-bucket/*"
      ]
    }
  ]
}
```

```json
// EC2 describe + start/stop (no terminate)
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:DescribeInstances",
        "ec2:DescribeInstanceStatus",
        "ec2:StartInstances",
        "ec2:StopInstances"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Deny",
      "Action": "ec2:TerminateInstances",
      "Resource": "*"
    }
  ]
}
```

```json
// Restrict actions to specific region (condition)
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "ec2:*",
      "Resource": "*",
      "Condition": {
        "StringEquals": {
          "aws:RequestedRegion": "us-east-1"
        }
      }
    }
  ]
}
```

## IAM Roles for EC2

```bash
# 1. Create a role for EC2
aws iam create-role \
  --role-name ec2-s3-read-role \
  --assume-role-policy-document '{
    "Version": "2012-10-17",
    "Statement": [{
      "Effect": "Allow",
      "Principal": {"Service": "ec2.amazonaws.com"},
      "Action": "sts:AssumeRole"
    }]
  }'

# 2. Attach a policy
aws iam attach-role-policy \
  --role-name ec2-s3-read-role \
  --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess

# 3. Create instance profile (needed to attach to EC2)
aws iam create-instance-profile \
  --instance-profile-name ec2-s3-read-profile

aws iam add-role-to-instance-profile \
  --instance-profile-name ec2-s3-read-profile \
  --role-name ec2-s3-read-role

# 4. Launch EC2 with this role
aws ec2 run-instances \
  --image-id ami-xxxx \
  --instance-type t3.micro \
  --iam-instance-profile Name=ec2-s3-read-profile \
  ...

# From inside the EC2 instance — no keys needed!
aws s3 ls s3://my-bucket  # Works via instance role
```

## Cross-Account Access

```json
// In Account B: Create role that Account A can assume
{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Principal": {
      "AWS": "arn:aws:iam::123456789012:root"  // Account A
    },
    "Action": "sts:AssumeRole",
    "Condition": {
      "Bool": {"aws:MultiFactorAuthPresent": "true"}
    }
  }]
}
```

```bash
# In Account A: Assume the role
aws sts assume-role \
  --role-arn arn:aws:iam::ACCOUNT_B:role/ReadOnlyRole \
  --role-session-name my-session

# Use temporary credentials
export AWS_ACCESS_KEY_ID=...
export AWS_SECRET_ACCESS_KEY=...
export AWS_SESSION_TOKEN=...
aws s3 ls  # Now acting as the role in Account B
```

## IAM Policy Simulator & Auditing

```bash
# Simulate a policy
aws iam simulate-principal-policy \
  --policy-source-arn arn:aws:iam::123456789012:user/alice \
  --action-names s3:GetObject ec2:DescribeInstances \
  --resource-arns arn:aws:s3:::my-bucket/*

# Credential report (all users, last used, key age)
aws iam generate-credential-report
aws iam get-credential-report --output text \
  --query Content | base64 -d | column -t -s ','

# Find unused roles (IAM Access Analyzer)
aws accessanalyzer list-findings \
  --analyzer-arn arn:aws:access-analyzer:us-east-1:123456789:analyzer/my-analyzer

# List all users with console access
aws iam list-users --query 'Users[?PasswordLastUsed!=`null`].[UserName,PasswordLastUsed]'

# Get all policies attached to a user
aws iam list-attached-user-policies --user-name alice
aws iam list-user-policies --user-name alice  # Inline policies
aws iam list-groups-for-user --user-name alice

# Check who can do what (policy evaluation)
aws iam get-account-authorization-details \
  --filter User > iam-dump.json
```

## Common IAM Interview Questions

**What is the difference between an IAM role and an IAM user?**
IAM users have permanent, long-term credentials (password and/or access keys). They represent a specific person or application. IAM roles have no permanent credentials — they issue temporary security credentials via STS when assumed. Roles are used by AWS services (EC2, Lambda), cross-account access, and federated users. Best practice: use roles for everything except humans needing console access.

**What happens when multiple IAM policies are attached to a user?**
All policies are evaluated together. The effective permissions are the union of all Allow statements, minus any explicit Deny statements. An explicit Deny in any policy always overrides an Allow anywhere. There is no "last wins" — denies always win.

**Explain IAM Permission Boundaries.**
A permission boundary is an advanced feature that sets the maximum permissions an IAM entity can have, regardless of what policies are attached. For example, if a role has AdministratorAccess policy but a permission boundary allowing only S3 access, the role can only do S3 operations. Used to delegate IAM management safely to developers without giving them the ability to escalate privileges.
