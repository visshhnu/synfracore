# AWS IAM — Interview Questions

**What is the principle of least privilege and how do you implement it in AWS?**
Grant only the minimum permissions needed for a task — nothing more. In AWS: use IAM policies with specific actions and resources (not Action:* or Resource:*), use IAM roles instead of long-term access keys, use AWS Organizations SCPs to set maximum permissions across accounts, use Access Analyzer to find unused permissions, regularly audit with IAM credential reports and Access Advisor to remove unused access.

**What is the difference between an IAM user, role, and group?**
IAM User: a person or application with long-term credentials (username/password or access keys). IAM Group: a collection of users that share the same policies — assign policies to groups not individual users. IAM Role: an identity with temporary credentials that can be assumed by users, services, or external identities — no long-term credentials, uses STS to get temporary tokens. Best practice: humans use SSO/Identity Center, applications and services use roles.

**How does IAM policy evaluation work?**
Evaluation order: 1) Explicit DENY always wins, 2) If explicit Allow exists (in identity policy + resource policy + SCP + permissions boundary), allow. Implicit DENY is the default — everything is denied unless explicitly allowed. SCPs set maximum permissions for an account but don't grant permissions. Permissions boundaries limit the maximum permissions an IAM entity can have. If any of these restricts access, the request is denied even if a policy allows it.

**What are IAM conditions and how do you use them?**
Conditions restrict when a policy applies. Common examples: `aws:RequestedRegion` (restrict to specific regions), `aws:SourceIP` (restrict by IP range), `aws:MultiFactorAuthPresent` (require MFA), `s3:prefix` (restrict S3 path), `ec2:Region` (specific EC2 region). Example: allow S3 access only from corporate IPs and only with MFA — forces security controls.

**What is the difference between trust policy and permission policy?**
Permission policy: what the IAM entity (user/role) can DO — defines allowed/denied actions on resources. Trust policy (only for roles): WHO can assume this role — defines which principals (users, services, accounts) can call sts:AssumeRole. A role needs both: trust policy to say who can use it, permission policy to say what they can do when they use it.

**How do you secure the AWS root account?**
Enable MFA immediately (hardware MFA for maximum security). Generate and then delete root access keys (root should never have programmatic access). Don't use root for daily tasks — create an admin IAM user or use IAM Identity Center. Set up billing alerts and CloudTrail. Enable AWS Organizations and use root only for: changing account email, closing account, changing AWS support plan, or tasks that literally require root.
