# Landing Zones — Intermediate

## AWS Control Tower Setup

```bash
# AWS Control Tower sets up a multi-account landing zone automatically
# Prerequisites: new AWS account or existing with minimal config

# Control Tower creates:
# - Management account (root of organization)
# - Log Archive account (centralized S3 for CloudTrail/Config logs)
# - Audit account (read-only access for security tools)
# - Core OUs: Security, Sandbox

# Enroll existing accounts
aws controltower register-organizational-unit --organizational-unit-id ou-xxxx

# Account Factory: self-service account creation
# Configured via Service Catalog in Control Tower console
# Outputs a new account with: SSO access, CloudTrail, Config, GuardDuty, Security Hub

# Guardrails (preventive SCPs + detective Config rules)
aws controltower list-enabled-controls \
  --target-identifier arn:aws:organizations::$MGMT_ACCT:ou/$OU_ID

# Add custom Control Tower controls
aws controltower enable-control \
  --control-identifier arn:aws:controltower:us-east-1::control/AWS-GR_AUDIT_BUCKET_ENCRYPTION_ENABLED \
  --target-identifier arn:aws:organizations::$MGMT_ACCT:ou/$OU_ID
```

## Service Control Policies (SCPs) — Core Guardrails

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PreventLeavingOrg",
      "Effect": "Deny",
      "Action": ["organizations:LeaveOrganization"],
      "Resource": "*"
    },
    {
      "Sid": "RestrictRegions",
      "Effect": "Deny",
      "NotAction": [
        "iam:*", "organizations:*", "support:*", "budgets:*",
        "route53:*", "cloudfront:*", "waf:*", "sts:*"
      ],
      "Resource": "*",
      "Condition": {
        "StringNotEquals": {
          "aws:RequestedRegion": ["ap-south-1", "us-east-1"]
        }
      }
    },
    {
      "Sid": "PreventDisablingSecurityServices",
      "Effect": "Deny",
      "Action": [
        "cloudtrail:StopLogging", "cloudtrail:DeleteTrail",
        "guardduty:DeleteDetector", "config:DeleteConfigRule",
        "securityhub:DisableSecurityHub"
      ],
      "Resource": "*"
    }
  ]
}
```
