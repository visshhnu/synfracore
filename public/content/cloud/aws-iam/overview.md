# AWS IAM — Identity and Access Management

**Before you start:** basic AWS familiarity (what a Region and an AWS account are — see the AWS Core Services Overview if you haven't yet) is assumed. No prior identity/access-management experience is needed.

IAM is the security foundation of AWS. Every API call to AWS goes through IAM for authentication and authorization. Getting IAM right is the difference between a secure cloud environment and a breach.

## Why This Exists (The Hook)

Anyone who can reach AWS's API can, in principle, ask it to do anything — launch servers, read every S3 bucket, delete a database. Without a gatekeeper checking "who is asking, and are they allowed to do this specific thing," a cloud account is just an open door. IAM is that gatekeeper: it sits in front of every single API call AWS receives, checks the identity making the request against a set of written rules (policies), and only lets the request through if a rule explicitly allows it.

**Analogy** — Think of IAM like a building's badge-access security desk. A **user** is a permanent employee badge — it exists indefinitely and opens whatever doors it's been granted. A **role** is a visitor badge issued at the front desk for the duration of one visit — it expires and is reissued fresh each time, which is exactly why AWS services (which come and go) should use roles, not permanent employee badges. A **policy** is the actual access list taped to each door, naming which badges may open it. The security desk (IAM's policy evaluation engine) checks every single door attempt against that list, every time — no badge gets to just walk in because it looks legitimate.

**Try it (2 minutes)** — Reason through IAM's deny-wins evaluation logic without needing console access: imagine a user is a member of two IAM groups. Group A's policy explicitly **allows** `s3:DeleteObject` on a bucket. Group B's policy explicitly **denies** `s3:DeleteObject` on the same bucket. The user makes a delete request — does it succeed? Now imagine Group B's policy is removed entirely, and no policy anywhere mentions `s3:DeleteObject` for this user. Does the request succeed this time? (The two answers are different, and the reason is the "implicit deny" rule below.)

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

```conceptgrid
{
  "boxes": [
    { "title": "IAM Users", "description": "Permanent identities with long-term credentials. Avoid for applications", "color": "blue" },
    { "title": "IAM Groups", "description": "Collection of users, policies attached at the group level. No nesting", "color": "purple" },
    { "title": "IAM Roles", "description": "Temporary identity, no permanent credentials. Right way to grant AWS services access", "color": "green" },
    { "title": "IAM Policies", "description": "JSON permission documents -- AWS managed, customer managed, or inline", "color": "amber" }
  ]
}
```

**IAM Users** — Long-term identities for humans or applications. Have permanent credentials (password + access keys). Avoid creating users for applications — use roles instead.

**IAM Groups** — Collection of users. Attach policies to groups, add users to groups. Cannot nest groups. Makes permission management scalable.

**IAM Roles** — Temporary identity assumed by AWS services, EC2 instances, Lambda functions, or federated users. No permanent credentials — STS issues temporary tokens. This is the right way to give AWS services permissions.

**IAM Policies** — JSON permission documents. Types:
- **AWS Managed** — Created by AWS, updated by AWS
- **Customer Managed** — You create and manage
- **Inline** — Embedded directly in user/group/role (avoid this)

## Policy Evaluation Logic

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "Explicit DENY?", "sublabel": "Always wins, checked first", "color": "red" },
    { "label": "Explicit ALLOW?", "sublabel": "Only reached if no deny matched", "color": "green" },
    { "label": "No statement", "sublabel": "Implicit DENY -- the default", "color": "slate" }
  ]
}
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
