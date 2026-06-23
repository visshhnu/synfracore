# Cloud Landing Zone Quick Reference

## AWS Control Tower Commands
```bash
# AWS Organizations
aws organizations create-organization
aws organizations create-organizational-unit --parent-id r-xxxx --name Workloads
aws organizations create-account --email new@company.com --account-name dev-account
aws organizations list-accounts

# Service Control Policies (preventive guardrails)
aws organizations create-policy --name deny-disable-cloudtrail \
  --type SERVICE_CONTROL_POLICY --content file://scp.json
aws organizations attach-policy --policy-id p-xxxx --target-id ou-xxxx

# AWS Config (detective guardrails)
aws configservice put-config-rule --config-rule file://rule.json
aws configservice describe-compliance-by-config-rule

# Control Tower — primarily managed via AWS Console
# aws controltower list-landing-zones  (preview API)
```

## Account Structure Reference
```
Root (Management Account)
├── Security OU
│   ├── Log Archive (S3 + CloudTrail logs)
│   └── Security Tooling (Security Hub, GuardDuty, SIEM)
├── Infrastructure OU
│   ├── Shared Services (DNS, AD, Transit Gateway, Artifactory)
│   └── Network (VPCs, Direct Connect, VPN hub)
├── Workloads OU
│   ├── Dev
│   ├── Staging
│   └── Prod
└── Sandbox OU (isolated developer accounts)

Key principles:
  1 environment = 1 account (blast radius isolation)
  Centralise security tooling in Security OU
  Centralise logging in Log Archive (immutable)
  Centralise egress in Network account
```
