# AWS IAM — Portfolio Projects

Build these projects to demonstrate real skills to employers. Each project is designed to be interview-worthy — something you can walk through in detail.

## Project 1: Least-Privilege Policy Design for a Real Application

**Level:** Beginner-Intermediate | **Time:** 2 days

Design IAM roles and policies for a realistic small application (e.g. an app writing to S3 and reading from DynamoDB), starting from actual least-privilege reasoning, not `AdministratorAccess`.

### Steps

1. List every AWS API call the application genuinely needs to make — no more
2. Write a scoped IAM policy granting exactly those actions on exactly those resources (specific bucket ARNs and table ARNs, not wildcards)
3. Attach the policy to a role (not a user with access keys), and explain in your README why a role is the correct choice for an application identity
4. Deliberately attempt an action outside the policy's scope and confirm it's denied — don't just assume the policy is correctly scoped
5. Use IAM Access Analyzer or the policy simulator to validate the policy before considering it done

### Skills Demonstrated

- Real least-privilege policy design, not copy-pasted broad permissions
- Understanding why roles (not long-lived user credentials) are the correct pattern for application identities
- Validating a policy's actual effect, not just its intent

### GitHub Repo Name

`iam-least-privilege-design`

---

## Project 2: Cross-Account Access with AssumeRole

**Level:** Intermediate | **Time:** 2-3 days

Build a real cross-account access pattern — a common enterprise requirement that trips up people who've only worked in a single AWS account.

### Steps

1. Set up two AWS accounts (or use org units if you have access to an AWS Organization) — one as the "trusted" account, one as the resource-owning account
2. Create a role in the resource account with a trust policy allowing a specific principal from the trusted account to assume it
3. Assume the role from the trusted account using `sts:AssumeRole` and confirm the resulting temporary credentials only grant what the role's permission policy allows
4. Add an external ID to the trust policy and explain in your README what specific attack (the confused deputy problem) this defends against
5. Document the full request flow: which account's policy is evaluated at which step

### Skills Demonstrated

- Real cross-account IAM architecture, not just single-account policy writing
- Understanding trust policies vs. permission policies as two distinct, both-required layers
- The confused deputy problem and why external IDs exist to prevent it

### GitHub Repo Name

`iam-cross-account-assumerole`

---

## Project 3: IAM Policy Audit and Remediation

**Level:** Advanced | **Time:** 4-5 days

Simulate a real security audit: find overly-permissive IAM configurations in a test AWS account and fix them with evidence, not guesses.

### Steps

1. Seed a test AWS account with deliberately over-permissioned roles/users (wildcard resources, unused permissions, long-unused access keys)
2. Use IAM Access Analyzer and Access Advisor (last-accessed data) to identify genuinely unused permissions, not just theoretically risky ones
3. Write a remediation plan: which permissions to actually remove, backed by the last-accessed evidence, not assumption
4. Implement Service Control Policies (if using AWS Organizations) as an account-level guardrail on top of individual IAM policies
5. Write an audit report documenting what was found, what was fixed, and how you'd prevent the same over-permissioning from recurring (e.g. permission boundaries on human-created roles)

### Skills Demonstrated

- Real IAM security auditing using AWS's own analysis tools, not manual guesswork
- Evidence-based permission removal (last-accessed data) rather than assumption-based tightening
- Understanding SCPs as an outer guardrail distinct from individual IAM policies

### GitHub Repo Name

`iam-security-audit`

---

## Tips for Great IAM Projects

**Show least-privilege reasoning, not just working policies.** "I granted exactly these 4 actions on this specific bucket ARN because the app only needs to read and write these object keys" is a real answer; "I attached PowerUserAccess because it worked" is not.

**Test the deny path, not just the allow path.** A policy that grants access, confirmed by successfully doing the allowed thing, has only been half-tested — confirm the policy also correctly denies what it shouldn't allow.

**Understand the difference between authentication and authorization.** A strong project can clearly explain which IAM mechanism handles "who is this" versus "what can they do here."

## Portfolio Checklist

- [ ] At least one project demonstrates least-privilege policy design with explicit, resource-scoped ARNs (not wildcards)
- [ ] At least one project involves real cross-account or role-assumption architecture
- [ ] At least one project includes evidence-based permission auditing (Access Analyzer/Access Advisor), not just manual review
- [ ] Each README explains the reasoning, not just the final policy JSON
- [ ] You can walk through any of these projects for 5+ minutes without notes
