# AWS IAM — Intermediate

## Attribute-Based Access Control (ABAC)

```json
// ABAC: Use tags to dynamically control access
// Engineers can only access EC2 instances tagged with their team

{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Action": ["ec2:StartInstances", "ec2:StopInstances", "ec2:RebootInstances"],
    "Resource": "arn:aws:ec2:*:*:instance/*",
    "Condition": {
      "StringEquals": {
        // IAM principal must have team tag matching instance's team tag
        "ec2:ResourceTag/team": "${aws:PrincipalTag/team}",
        "ec2:ResourceTag/environment": "${aws:PrincipalTag/environment}"
      }
    }
  }]
}

// Tag the IAM user/role
aws iam tag-user --user-name alice --tags Key=team,Value=backend Key=environment,Value=prod

// Tag the EC2 instances
aws ec2 create-tags --resources i-1234567890 \
    --tags Key=team,Value=backend Key=environment,Value=prod

// Now Alice can manage backend-prod instances but not other teams
```

## Service Control Policies (SCPs)

```json
// SCPs apply to ALL accounts in an AWS Organization
// They don't grant permissions — they set maximum permissions

// Prevent leaving the organization
{
  "Effect": "Deny",
  "Action": ["organizations:LeaveOrganization"],
  "Resource": "*"
}

// Restrict to specific regions (data residency)
{
  "Effect": "Deny",
  "NotAction": [
    "iam:*", "organizations:*", "support:*",
    "aws-portal:*", "budgets:*"  // Global services — always allow
  ],
  "Resource": "*",
  "Condition": {
    "StringNotEquals": {
      "aws:RequestedRegion": ["ap-south-1", "us-east-1"]
    }
  }
}

// Require MFA for sensitive operations
{
  "Effect": "Deny",
  "Action": ["iam:DeletePolicy", "iam:DetachRolePolicy", "s3:DeleteBucket"],
  "Resource": "*",
  "Condition": {
    "BoolIfExists": {"aws:MultiFactorAuthPresent": "false"}
  }
}

// Prevent disabling CloudTrail (audit trail protection)
{
  "Effect": "Deny",
  "Action": ["cloudtrail:StopLogging", "cloudtrail:DeleteTrail"],
  "Resource": "*"
}
```

## IAM Identity Center (SSO)

```bash
# Modern approach: use IAM Identity Center for human access
# No long-term credentials for humans

# Enable IAM Identity Center
aws sso-admin create-instance

# Permission Sets = what access people get when they log in
aws sso-admin create-permission-set \
    --instance-arn arn:aws:sso:::instance/xxx \
    --name "DeveloperAccess" \
    --description "Read-only + EC2 start/stop" \
    --session-duration PT8H  # 8 hour sessions

# Attach AWS managed policies to the permission set
aws sso-admin attach-managed-policy-to-permission-set \
    --instance-arn arn:aws:sso:::instance/xxx \
    --permission-set-arn arn:aws:sso:::permissionSet/xxx/yyy \
    --managed-policy-arn arn:aws:iam::aws:policy/ReadOnlyAccess

# Assign users/groups to accounts with permission sets
aws sso-admin create-account-assignment \
    --instance-arn arn:aws:sso:::instance/xxx \
    --target-id 123456789012 \  # AWS Account ID
    --target-type AWS_ACCOUNT \
    --permission-set-arn arn:aws:sso:::permissionSet/xxx/yyy \
    --principal-type GROUP \
    --principal-id group-id-from-identity-store

# Users log in via: https://my-org.awsapps.com/start
# Get temporary credentials, never long-term access keys
```
