# AWS IAM Quick Reference

## CLI Commands
```bash
# Users
aws iam create-user --user-name alice
aws iam create-access-key --user-name alice
aws iam delete-access-key --user-name alice --access-key-id AKIAXXXXXXXX
aws iam list-users
aws iam get-user --user-name alice

# Groups
aws iam create-group --group-name developers
aws iam add-user-to-group --user-name alice --group-name developers
aws iam attach-group-policy --group-name developers \
  --policy-arn arn:aws:iam::aws:policy/ReadOnlyAccess

# Roles
aws iam create-role --role-name LambdaRole \
  --assume-role-policy-document file://trust-policy.json
aws iam attach-role-policy --role-name LambdaRole \
  --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole
aws iam list-attached-role-policies --role-name LambdaRole

# Policies
aws iam create-policy --policy-name MyPolicy --policy-document file://policy.json
aws iam get-policy --policy-arn arn:aws:iam::123456789:policy/MyPolicy
aws iam get-policy-version --policy-arn arn:... --version-id v1

# Auth testing
aws iam simulate-principal-policy \
  --policy-source-arn arn:aws:iam::123:user/alice \
  --action-names s3:GetObject \
  --resource-arns arn:aws:s3:::my-bucket/*

aws sts get-caller-identity     # Who am I?
aws sts assume-role --role-arn arn:aws:iam::123:role/MyRole --role-session-name test
```

## Policy Evaluation Quick Reference
```
Evaluation order (first match wins for Deny, all must Allow for Allow):
  1. Explicit Deny (anywhere) → DENIED
  2. SCP (Service Control Policy) deny → DENIED
  3. Resource-based policy Allow → ALLOWED (cross-account: also needs identity policy)
  4. Identity-based policy Allow → ALLOWED
  5. No explicit Allow → DENIED (implicit deny)

Common policy conditions:
  aws:SourceIp      → restrict to IP range
  aws:RequestedRegion → restrict to regions
  aws:MultiFactorAuthPresent → require MFA
  s3:prefix         → S3 key prefix restriction
  kms:ViaService    → only via specific service
```
