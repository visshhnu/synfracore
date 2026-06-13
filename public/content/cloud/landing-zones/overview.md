# Cloud Landing Zones — Multi-Account Architecture

A landing zone is a well-architected, multi-account environment that serves as the foundation for your cloud deployment. It establishes security baselines, network architecture, identity, and governance before you deploy any workloads.

## Why Landing Zones

```
Without landing zone:              With landing zone:
  Single AWS account                Multiple accounts (isolation)
  Shared access for all teams       Each team/environment isolated
  No baseline security policies     Enforced guardrails via SCPs
  No cost visibility by team        Cost allocation by account/tag
  Ad-hoc networking                 Consistent VPC architecture
  Manual compliance checks          Automated compliance
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

# Enroll existing accounts
aws controltower register-organizational-unit --organizational-unit-id ou-xxx

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
