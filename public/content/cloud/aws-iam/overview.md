# AWS IAM — Identity and Access Management

IAM is the security foundation of AWS. Every API call to AWS goes through IAM for authentication and authorization. Getting IAM right is the difference between a secure cloud environment and a breach.

## Core Concepts

**Principal** — Who is making the request. Can be an IAM user, IAM role, AWS service, or federated identity.

**Authentication** — Verifying identity (who are you?). Done via access keys, passwords, or temporary credentials.

**Authorization** — Verifying permissions (what can you do?). Done via IAM policies evaluated at request time.

**Policy** — JSON document defining permissions. Attached to users, groups, or roles.

**Effect/Action/Resource** — The core of every policy statement:
```json
{
  "Effect": "Allow",           // Allow or Deny
  "Action": "s3:GetObject",    // What API calls
  "Resource": "arn:aws:s3:::my-bucket/*"  // On what resources
}
```

## IAM Entities

**IAM Users** — Long-term identities for humans or applications. Have permanent credentials (password + access keys). Avoid creating users for applications — use roles instead.

**IAM Groups** — Collection of users. Attach policies to groups, add users to groups. Cannot nest groups. Makes permission management scalable.

**IAM Roles** — Temporary identity assumed by AWS services, EC2 instances, Lambda functions, or federated users. No permanent credentials — STS issues temporary tokens. This is the right way to give AWS services permissions.

**IAM Policies** — JSON permission documents. Types:
- **AWS Managed** — Created by AWS, updated by AWS
- **Customer Managed** — You create and manage
- **Inline** — Embedded directly in user/group/role (avoid this)

## Policy Evaluation Logic

```
Explicit DENY → DENY (always wins)
    ↓
Explicit ALLOW → ALLOW
    ↓
No statement → IMPLICIT DENY
```

With multiple policies, all are evaluated together. Any explicit deny overrides any allow. No allow = implicit deny.

## IAM Best Practices

**1. Never use root account** — Create an admin IAM user immediately after account creation. Enable MFA on root. Lock away root credentials.

**2. Least privilege** — Start with minimal permissions, add as needed. Use IAM Access Analyzer to find unused permissions.

**3. Use roles, not users for applications** — EC2 instance roles, Lambda execution roles, ECS task roles. Never hardcode access keys.

**4. Enable MFA everywhere** — Virtual MFA (Google Authenticator) at minimum. Hardware keys for privileged accounts.

**5. Rotate access keys** — If you must use access keys, rotate them regularly. Use IAM credential report to find old keys.

**6. Use permission boundaries** — Limit max permissions a role/user can have, even if more permissive policies are attached.

**7. Use Service Control Policies (SCPs)** — In AWS Organizations, SCPs are guardrails at the account or OU level that even override admin permissions.
