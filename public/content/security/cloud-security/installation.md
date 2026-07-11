# Cloud Security — Getting Set Up

Cloud security tooling is mostly configuration within an existing cloud account, not separate software installation — the main setup is provisioning a safe practice environment and the CLI tools to audit it.

## AWS security tooling setup

```bash
aws configure   # a dedicated practice account, not production — see the note below

# Enable the core security services Overview references — most have a real free tier
aws guardduty create-detector --enable
aws securityhub enable-security-hub
aws cloudtrail create-trail --name security-audit-trail --s3-bucket-name <your-log-bucket>
```

**Use a dedicated, isolated practice account.** Cloud security learning inherently involves deliberately creating misconfigurations to understand how detection tools catch them (an intentionally-public S3 bucket, an overly-permissive security group) — doing this in a shared or production account, even briefly, is a real risk you don't need to take on to learn.

## Open-source security auditing tools worth having installed

```bash
# ScoutSuite — multi-cloud security auditing, open source
pip install scoutsuite
scout aws   # generates an HTML report of misconfigurations in the target account

# Prowler — AWS-specific security best-practice auditing
pip install prowler
prowler aws
```

Running one of these against your own practice account early is a genuinely good learning exercise — it surfaces real findings against real (if small-scale) infrastructure, which is more concrete than reading a checklist of misconfiguration types without seeing any of them flagged for real.

## Setting a billing/usage guardrail before you start

Some security services (GuardDuty, Security Hub, CloudTrail with expanded logging) have real, if modest, ongoing costs once enabled at scale — set a billing alert on your practice account before enabling everything in Overview's checklist, so a forgotten-and-left-running service doesn't produce a surprise bill weeks later.
