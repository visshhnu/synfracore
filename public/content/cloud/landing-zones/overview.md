# Cloud Landing Zones — Multi-Account Architecture

**Before you start:** basic familiarity with at least one cloud provider's account/subscription model and IAM (see Cloud Fundamentals and that platform's own courses first if new) is assumed. No prior enterprise-governance experience is required — the account-structure and guardrail concepts here are explained from scratch.

## Why this exists (the hook)

A single AWS/Azure/GCP account with everyone in it works fine for a small team's first project — until a second team joins, or the first one hits production. At that point, one shared account means one shared blast radius: a dev team's mistake can touch prod resources, there's no clean way to see which team is spending what, and a security incident in one project can potentially reach everything else. A landing zone is the answer built *before* that second team shows up, not scrambled together after the first incident makes the problem obvious.

## Analogy

A landing zone is like the foundation and utility infrastructure of an office building, built before any tenant moves in — separate floors (accounts) for separate tenants, a shared but access-controlled lobby and elevator system (shared services), building-wide fire code and security requirements enforced on every floor (guardrails/SCPs), and a single building management office that knows what's happening on every floor (centralized logging/monitoring). No tenant gets to skip the fire code because they're "just a small startup" — the guardrails apply uniformly, which is exactly the point.

A landing zone is a well-architected, multi-account environment that serves as the foundation for your cloud deployment. It establishes security baselines, network architecture, identity, and governance before you deploy any workloads.

## Why Landing Zones

```conceptgrid
{
  "boxes": [
    { "title": "Without a Landing Zone", "description": "Single shared account, no baseline policies, no cost visibility, ad-hoc networking", "color": "red" },
    { "title": "With a Landing Zone", "description": "Isolated multi-account, enforced guardrails, cost allocation by account, automated compliance", "color": "green" }
  ]
}
```

## AWS Control Tower

```bash
# AWS Control Tower — managed landing zone service
# Sets up: AWS Organizations, SCPs, CloudTrail, Config, SSO

# Account structure:
# Root
# ├── Security OU
# │   ├── Log Archive account    (centralized logging)
# │   └── Audit account         (security tooling)
# ├── Sandbox OU
# │   └── Developer accounts    (experiments, no prod data)
# ├── Workload OU
# │   ├── Dev account
# │   ├── Staging account
# │   └── Prod account
# └── Shared Services OU
#     └── Shared services       (CI/CD, monitoring, DNS)
```

```conceptgrid
{
  "boxes": [
    { "title": "Security OU", "description": "Log Archive account (centralized logging), Audit account (security tooling)", "color": "red" },
    { "title": "Sandbox OU", "description": "Developer accounts -- experiments, no prod data", "color": "amber" },
    { "title": "Workload OU", "description": "Dev, Staging, Prod accounts", "color": "blue" },
    { "title": "Shared Services OU", "description": "CI/CD, monitoring, DNS", "color": "green" }
  ]
}
```

```bash
# Enrolling existing accounts and OUs into Control Tower is primarily a
# console/Account Factory workflow, not a single direct CLI subcommand
# *(needs verification — check the current AWS CLI controltower command
# reference for what's actually scriptable vs. console-only)*

# Account Factory — self-service account vending
# Configure in Control Tower console
# Teams request accounts → automatically provisioned with guardrails
```

## Landing Zone Best Practices

```
Account isolation:
  ✅ Separate account per environment (dev/staging/prod)
  ✅ Separate account per team or business unit
  ✅ Never share production and non-production in same account

Networking:
  ✅ Transit Gateway for inter-account connectivity
  ✅ Consistent VPC CIDR ranges (avoid overlap)
  ✅ Centralized egress (shared NAT Gateway in network account)
  ✅ PrivateLink for AWS service access

Security:
  ✅ SCPs at OU level (prevent leaving org, restrict regions)
  ✅ CloudTrail in all accounts and regions
  ✅ GuardDuty delegated admin from security account
  ✅ Config with conformance packs for compliance

Identity:
  ✅ IAM Identity Center (SSO) — one login for all accounts
  ✅ No long-term credentials for humans
  ✅ Permission sets per role (developer, admin, read-only)
```

## Try it yourself (2 minutes)

Sketch (on paper or in a text file) the OU structure from the Control Tower diagram above, but for a hypothetical company you know something about — even just "3 teams, one of which handles payment data." Where would each team's accounts sit? Would payment data need its own OU with stricter SCPs than the others? There's no single right answer, but doing this exercise once is what makes the abstract "Security OU / Workload OU / Sandbox OU" structure above click as an actual design decision rather than a diagram to memorize.
