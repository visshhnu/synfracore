# Landing Zones — Portfolio Projects

Build these to prove you can actually design multi-account governance, not just describe an OU diagram. Each project maps to a real landing-zone-admin task.

## Project 1: Multi-Account Foundation with Terraform

**Level:** Beginner | **Time:** 2-3 days

Build the minimum real landing zone: a small OU structure (Security, Workloads, Sandbox), a dedicated Log Archive account receiving CloudTrail from every other account, and one baseline SCP applied at the OU level — entirely as Terraform, not clicked through the console.

### Steps

1. Use `aws_organizations_organizational_unit` to create Security/Workloads/Sandbox OUs under the root
2. Provision a dedicated Log Archive account (or a stand-in account if you only have one real AWS account available) and configure an organization-wide CloudTrail trail delivering logs to it
3. Write one real SCP — e.g. deny leaving the AWS Organization, or deny disabling CloudTrail — and attach it at the OU level, not per-account
4. Confirm the SCP actually blocks the denied action by attempting it (in a sandbox account) and capturing the AccessDenied error as evidence in your README
5. Document why the SCP is attached at the OU level rather than per-account: what happens when a new account joins that OU later, with zero extra configuration?

### Skills Demonstrated

- Terraform-managed AWS Organizations structure
- Centralized, cross-account log aggregation
- Preventive guardrails (SCPs) as enforced infrastructure, not documented policy

### GitHub Repo Name

`terraform-landing-zone-foundation`

---

## Project 2: Reusable Guardrail Library (SCPs + Config Rules)

**Level:** Intermediate | **Time:** 3 days

Build a small, reusable library of preventive (SCP) and detective (AWS Config Rule) guardrails that could be attached to any new OU — the kind of "guardrail catalog" a platform team actually maintains and versions over time.

### Steps

1. Write at least 3 preventive SCPs as Terraform modules: block public S3 bucket creation, require MFA for IAM actions, restrict allowed regions
2. Write at least 2 detective AWS Config Rules (managed or custom) that flag violations of things an SCP can't fully prevent (e.g. an S3 bucket policy that's technically not "public" but is overly permissive)
3. Parameterize each module (which OU/account to attach to, which regions are allowed) so the same guardrail can be reused across different landing zones, not hand-copied
4. Test each guardrail against both a compliant and a deliberately non-compliant resource, documenting the actual enforcement/detection behavior observed
5. Write a short "when to use SCP vs. Config Rule" decision doc based on what you actually learned building both — preventive vs. detective isn't just a vocabulary distinction, it changes what's actually possible to enforce

### Skills Demonstrated

- Guardrail-as-code, versioned and reusable rather than console-configured per account
- The real, practical difference between preventive and detective controls
- Testing security controls against both compliant and non-compliant cases

### GitHub Repo Name

`aws-guardrail-library`

---

## Project 3: Self-Service Account Vending Pipeline

**Level:** Advanced | **Time:** 5 days

Build a simplified version of what Account Factory for Terraform (AFT) does: a GitOps pipeline where a team requests a new account (via a config file in a PR) and, on merge, a new account is provisioned with the standard guardrails, network baseline, and tagging already applied — no manual console work per account.

### Steps

1. Define an account-request schema (team name, environment, cost-center tag) as a config file format (YAML/JSON) submitted via pull request
2. Build a CI pipeline that, on merge, provisions a new account (via AWS Organizations' `CreateAccount` API or Control Tower's Account Factory, depending on what you have access to test with)
3. Automatically attach the account to the correct OU (so it inherits that OU's SCPs immediately, with no gap where the account exists but is unguarded)
4. Apply baseline Terraform (VPC, required tags, a default IAM permission boundary) to the new account as part of the same pipeline, not a manual follow-up step
5. Document the actual time-to-provisioned-and-guarded-account, before and after this pipeline — this is the concrete metric that justifies the automation's existence

### Skills Demonstrated

- GitOps-driven infrastructure provisioning at the account level, not just resource level
- Ensuring guardrails apply from account creation, with no unguarded gap
- Quantifying automation's actual value (time saved, consistency gained)

### GitHub Repo Name

`self-service-account-vending`

---

## Tips for Great Projects

**Make it real.** Even a 2-account demo (root + one member account) proves the mechanics work — you don't need a 20-account enterprise setup to demonstrate the same guardrail-enforcement pattern a real one uses.

**Capture the enforcement evidence.** A guardrail you claim works but never actually tested against a violation is a documentation claim, not a demonstrated skill — screenshot or log the actual AccessDenied/Config-rule-violation output.

**Explain the blast-radius reasoning.** In interviews, "why is this account separate from that one" is the actual question being probed — have a specific answer tied to what could go wrong if they were combined, not just "best practice says so."

## Portfolio Checklist

- [ ] All 3 projects on GitHub with clear READMEs and actual enforcement evidence (not just "should work")
- [ ] At least one project is fully Terraform/IaC-driven, not console-configured
- [ ] At least one project demonstrates a guardrail actually blocking or flagging a real violation
- [ ] Each project's README explains the specific blast-radius/governance reasoning behind the design, not just the steps taken
