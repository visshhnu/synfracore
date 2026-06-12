# AWS IAM — Advanced

## Permissions Boundaries

```json
// Permissions boundary = max permissions a role can have
// Used to delegate IAM role creation without giving too much power

// Developer creates roles BUT only within the boundary
// The boundary policy:
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowedServices",
      "Effect": "Allow",
      "Action": ["s3:*", "dynamodb:*", "lambda:*", "logs:*", "xray:*"],
      "Resource": "*"
    },
    {
      "Sid": "DenyEscalation",
      "Effect": "Deny",
      "Action": ["iam:CreateRole", "iam:PutRolePolicy"],
      "Resource": "*",
      "Condition": {
        "StringNotEquals": {
          "iam:PermissionsBoundary": "arn:aws:iam::123:policy/DeveloperBoundary"
        }
      }
    }
  ]
}

// Developer can create roles but MUST attach the boundary
// Effective permissions = (identity policy) AND (boundary policy)
aws iam create-role --role-name my-lambda-role \
    --assume-role-policy-document file://trust.json \
    --permissions-boundary arn:aws:iam::123:policy/DeveloperBoundary
```

## IAM Access Analyzer

```bash
# Find unintended public access and external sharing
aws accessanalyzer create-analyzer \
    --analyzer-name account-analyzer \
    --type ACCOUNT

# List findings (resources accessible to external principals)
aws accessanalyzer list-findings \
    --analyzer-name account-analyzer \
    --filter '{"resourceType": {"eq": ["AWS::S3::Bucket"]}}'

# Validate IAM policies before deployment
aws accessanalyzer validate-policy \
    --policy-document file://policy.json \
    --policy-type IDENTITY_POLICY \
    --query 'findings[*].[findingType,findingDetails]' \
    --output table

# Generate policy from CloudTrail events (least privilege)
# Analyzes what actions a role ACTUALLY used in last 90 days
aws iam generate-service-last-accessed-details \
    --arn arn:aws:iam::123:role/my-role

# Wait and get report
aws iam get-service-last-accessed-details \
    --job-id xxx \
    --query 'ServicesLastAccessed[?TotalAuthenticatedEntities>`0`]'
```

## IAM Cheatsheet

```bash
# ── USERS ─────────────────────────────────────────────────
aws iam list-users --query 'Users[*].[UserName,CreateDate]' --output table
aws iam list-access-keys --user-name alice
aws sts get-caller-identity                    # Who am I?

# ── ROLES ─────────────────────────────────────────────────
aws iam list-roles --query 'Roles[*].[RoleName,CreateDate]' --output table
aws iam get-role --role-name MyRole
aws iam list-attached-role-policies --role-name MyRole
aws iam list-role-policies --role-name MyRole   # Inline policies
aws sts assume-role --role-arn arn:... --role-session-name test

# ── POLICIES ─────────────────────────────────────────────
aws iam list-policies --scope Local             # Your custom policies
aws iam get-policy-version --policy-arn arn:... --version-id v3
aws iam create-policy --policy-name P --policy-document file://p.json
aws iam simulate-principal-policy \
    --policy-source-arn arn:aws:iam::123:role/MyRole \
    --action-names s3:GetObject s3:DeleteObject \
    --resource-arns "arn:aws:s3:::bucket/*" \
    --query 'EvaluationResults[*].[EvalActionName,EvalDecision]' --output table

# ── AUDIT ─────────────────────────────────────────────────
aws iam generate-credential-report
aws iam get-credential-report --query Content --output text | base64 -d | column -ts,
aws accessanalyzer list-findings --analyzer-name my-analyzer
```
