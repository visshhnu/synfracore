# AWS IAM — Learning Roadmap

## Estimated Time to Job-Ready
**5-7 weeks** of consistent learning (2-3 hours/day) — IAM's core concepts (principal, policy, effect/action/resource) are quick to learn; the real depth is in policy evaluation logic, roles vs. users, and cross-account patterns that show up constantly in real production environments.

## Phase 1: Foundation (Week 1-2)

- Core concepts: principal (who), authentication (verifying identity), authorization (verifying permissions via policy evaluation)
- Policy anatomy: Effect/Action/Resource/Condition, and writing a policy that's actually scoped to specific resource ARNs rather than wildcards
- IAM users vs. IAM roles — and why roles (with temporary, auto-expiring credentials) are the correct default for applications and services, not long-lived user access keys
- Groups for organizing user permissions at scale, distinct from roles

**Checkpoint:** can you explain why an application running on EC2/Lambda should use an IAM role rather than an IAM user's access keys embedded in its configuration?

## Phase 2: Policy Evaluation Logic (Week 2-3)

- The actual evaluation order: implicit deny by default, explicit Allow grants access, explicit Deny anywhere always overrides any Allow — this exact rule is one of the most commonly tested IAM concepts
- Identity-based policies (attached to a user/role) vs. resource-based policies (attached to a resource like an S3 bucket) and how they combine when both apply
- Permission boundaries as a guardrail that caps what a role's own policies can ever grant, distinct from Service Control Policies at the organization level
- Policy conditions (`aws:SourceIp`, `aws:MultiFactorAuthPresent`, etc.) for scoping access beyond simple action/resource matching

**Checkpoint:** given a role with an identity-based policy allowing an action and a resource-based policy on the target resource that doesn't mention that role at all, can you reason through whether access is actually granted?

## Phase 3: Roles, Federation, and Cross-Account Access (Week 3-5)

- `sts:AssumeRole` and trust policies — the mechanism that lets one identity temporarily become another, and why a trust policy and a permission policy are two distinct, both-required layers
- Cross-account access patterns, and external IDs as the specific defense against the confused deputy problem in third-party AssumeRole scenarios
- IAM Identity Center (formerly AWS SSO) for centralized human access across an AWS Organization, distinct from individual IAM users in each account
- IRSA (IAM Roles for Service Accounts) for Kubernetes-native workloads assuming IAM roles without stored credentials — a pattern worth knowing even outside a dedicated EKS deep-dive

**Checkpoint:** can you explain, precisely, what problem an external ID in a cross-account trust policy solves, and construct a concrete scenario where omitting it would be exploitable?

## Phase 4: Auditing and Interview Readiness (Week 5-7)

- IAM Access Analyzer for identifying resources shared outside your account/organization, and Access Advisor's last-accessed data for evidence-based permission tightening
- Service Control Policies (SCPs) as an organization-wide outer guardrail — capping what even an account's own root user can ever be granted, distinct from account-level IAM policies
- Credential hygiene: rotating access keys, enabling MFA, and why unused long-lived credentials are a genuine, common finding in real security audits
- Review this course's Interview Q&A material, particularly the policy-evaluation-order and roles-vs-users questions

## Common Pitfalls Specific to IAM

- **Reaching for wildcard resources (`"Resource": "*"`) instead of scoping to specific ARNs** — this defeats the actual point of least-privilege design, even when the action list itself looks appropriately narrow
- **Using long-lived IAM user access keys for an application instead of a role** — a leaked role credential expires on its own; a leaked user access key stays dangerous until someone actively notices and rotates it
- **Forgetting that a resource-based policy alone doesn't grant access without a corresponding identity-based allow (in most cases)** — the interaction between the two policy types is a common source of "why is this still denied" confusion
- **Treating SCPs and IAM policies as the same mechanism** — SCPs are a ceiling on what's ever grantable in an account; IAM policies are the actual grant, and both matter together

## Getting Your First IAM-Heavy Role

1. **Portfolio:** the 3 projects in this course's Projects section, each demonstrating a different core IAM skill (least-privilege design, cross-account AssumeRole, evidence-based security auditing)
2. **Resume:** be specific — "audited and remediated 40+ over-permissioned IAM roles using Access Advisor last-accessed data, removing unused wildcard permissions" is far stronger than "experience with AWS IAM"
3. **Know the policy evaluation order cold:** explicit-deny-always-wins is one of the single most commonly tested IAM concepts in real interviews, precisely because getting it wrong has real security consequences
4. **Certifications, if pursuing one:** IAM is foundational across nearly every AWS certification, especially Security Specialty — see this course's own Certification Guide for current format and pricing
