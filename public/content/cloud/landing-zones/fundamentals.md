# Landing Zones — Fundamentals

## What is a Cloud Landing Zone?

A landing zone is a pre-configured, secure multi-account environment that establishes the foundation for all your cloud workloads. Think of it as the foundation you pour before building a house — getting it right saves enormous rework later.

## Why Landing Zones Matter

Without a landing zone:
- Development teams create ad-hoc accounts with inconsistent security
- No centralized logging or monitoring
- Compliance requirements broken by default
- Security incidents are hard to detect and contain

With a landing zone:
- Every account gets security controls automatically
- Centralized logging and monitoring from day one
- Compliance guardrails prevent violations
- Clear network architecture and access patterns

## Core Components

**Management Account**: The root of your AWS Organization. Only used for organizational management — no workloads.

**Log Archive Account**: Centralized S3 bucket receiving CloudTrail, Config, and VPC Flow Logs from all accounts. Write-once storage (no deletion).

**Audit Account**: Security team's read-only access to all accounts. GuardDuty admin, Security Hub aggregator.

**OUs (Organizational Units)**: Group accounts into hierarchies. Apply SCPs at OU level.

## AWS Organizations Basics

```bash
# Create organization
aws organizations create-organization --feature-set ALL

# List accounts
aws organizations list-accounts --output table

# Create an OU
ROOT=$(aws organizations list-roots --query 'Roots[0].Id' --output text)
aws organizations create-organizational-unit --parent-id $ROOT --name Production

# Get OU structure
aws organizations list-organizational-units-for-parent --parent-id $ROOT
```

## AWS Control Tower

Control Tower automates landing zone setup:
1. Creates Management, Log Archive, Audit accounts
2. Sets up AWS SSO (IAM Identity Center)
3. Enables CloudTrail, Config, GuardDuty in all accounts
4. Creates foundational SCPs and guardrails
5. Provides Account Factory for self-service account creation

Enable via AWS Console: Control Tower service → Set up landing zone
