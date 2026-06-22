# AWS IAM Interview Questions

## Core Concepts

**Q: Explain IAM components — Users, Roles, Policies, Groups.**

**User**: Long-term identity for a person or application. Has permanent credentials (access keys or password). Avoid for applications — use Roles instead.

**Group**: Collection of users. Attach policies to group, not individual users.

**Role**: Temporary identity assumed by AWS services, EC2 instances, Lambda functions, or cross-account access. No permanent credentials — uses temporary tokens (STS).

**Policy**: JSON document defining permissions (Allow/Deny + Actions + Resources + Conditions).

**Best practices:**
- Root account: only for initial setup, then lock away
- Use Groups + Policies for human users
- Use Roles for applications (EC2 instance profile, Lambda execution role)
- Least privilege: grant only required permissions
- Enable MFA for privileged users

---

**Q: How does IAM policy evaluation work?**

Evaluation order (key to memorise):
1. **Explicit Deny** (anywhere) — always wins
2. **SCPs (Service Control Policies)** — org-level guardrails
3. **Resource-based policies** — bucket policies, etc.
4. **Identity-based policies** — IAM policies attached to user/role
5. **Default Deny** — if no explicit allow, deny

**Implicit deny**: No policy exists → Denied.
**Explicit deny**: Policy exists that denies → Always denied (even with allow elsewhere).

---

**Q: What is IRSA (IAM Roles for Service Accounts)?**

IRSA allows Kubernetes pods (on EKS) to assume IAM roles without storing credentials in pods.

```bash
# Create OIDC provider for EKS cluster
eksctl utils associate-iam-oidc-provider --cluster my-cluster --approve

# Create IAM role with trust policy referencing K8s service account
aws iam create-role --role-name s3-reader   --assume-role-policy-document file://trust-policy.json

# Annotate K8s service account
kubectl annotate serviceaccount my-sa   eks.amazonaws.com/role-arn=arn:aws:iam::123456789:role/s3-reader
```

Trust policy allows the specific Kubernetes service account to assume the IAM role. Pods using that service account automatically get temporary AWS credentials via projected volume.

---

**Q: What are permission boundaries?**

Permission boundaries set the maximum permissions an IAM entity (user/role) can have. Even if the entity has a policy that allows more, the boundary caps it.

```json
// Permission boundary: max S3 and EC2 only
{
  "Effect": "Allow",
  "Action": ["s3:*", "ec2:*"],
  "Resource": "*"
}
```

Use case: Allow developers to create IAM roles, but prevent privilege escalation — their boundary ensures any role they create can't exceed their own permissions.

---

**Q: What is AWS STS? Common use cases?**

STS (Security Token Service) issues temporary security credentials (up to 36 hours).

Common uses:
- `AssumeRole`: Cross-account access, temporary elevated access
- `AssumeRoleWithWebIdentity`: Social login (Google/Facebook) → AWS access
- `AssumeRoleWithSAML`: Enterprise SSO (AD) → AWS access
- `GetFederationToken`: Legacy federation

```bash
# Assume cross-account role
aws sts assume-role   --role-arn arn:aws:iam::OTHER_ACCOUNT:role/ReadOnly   --role-session-name my-session
# Returns: AccessKeyId, SecretAccessKey, SessionToken (expires in 1hr default)
```

## Revision Notes
```
IAM HIERARCHY: User/Group/Role + Policies
Users: humans (avoid for apps) | Roles: temporary (EC2, Lambda, cross-account)
Groups: collection of users | Policies: JSON permissions

EVALUATION: Explicit Deny > SCP > Resource Policy > Identity Policy > Implicit Deny

IRSA: K8s service accounts assume IAM roles via OIDC. No credentials stored.
Permission Boundaries: cap maximum permissions (prevent escalation)
STS: temporary credentials. AssumeRole for cross-account access.

BEST PRACTICES:
Lock root account | MFA on privileged users
Least privilege | Use roles for EC2/Lambda
Rotate access keys | Use CloudTrail for audit
```
