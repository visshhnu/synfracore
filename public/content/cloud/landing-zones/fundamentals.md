# Cloud Landing Zones Fundamentals

## What is a Cloud Landing Zone?

A cloud landing zone is a pre-configured, scalable cloud environment based on best practices that serves as a starting point for enterprise cloud adoption. It implements multi-account/subscription structures, security guardrails, networking foundations, and governance before workloads are deployed.

Think of it as building a city before people move in: roads (networking), laws (policies), districts (account/subscription structure), utilities (logging, monitoring), and security (IAM, guardrails) are all established first.

## Why Landing Zones Matter

```
WITHOUT A LANDING ZONE:
  Each team creates their own AWS accounts or Azure subscriptions
  Inconsistent security configurations across the organization
  No centralized logging or visibility
  Difficult to enforce compliance (HIPAA, PCI, SOC2)
  Cost sprawl: no unified billing view
  Security incidents are harder to detect and contain

WITH A LANDING ZONE:
  Consistent security baseline across all environments
  Centralized logging (all CloudTrail, activity logs in one place)
  Guardrails prevent common mistakes (public S3, no MFA)
  Clear account/subscription structure (platform vs workload accounts)
  Simplified compliance: controls applied at management group/OU level
  Unified cost visibility and tagging enforcement
```

## Account/Subscription Structure

```
AWS ORGANISATIONS RECOMMENDED STRUCTURE:
  Root
  ├── Security OU
  │   ├── Log Archive account (centralised logs)
  │   └── Audit account (security tooling, read-only access)
  ├── Infrastructure OU
  │   ├── Network account (Transit Gateway, VPNs, DNS)
  │   └── Shared Services account (Active Directory, tooling)
  ├── Sandbox OU (loose controls for experimentation)
  ├── Workloads OU
  │   ├── Production OU
  │   │   └── App1-Prod account
  │   └── Non-Production OU
  │       └── App1-Dev/Test account
  └── Suspended OU (decommissioned accounts)

AZURE MANAGEMENT GROUP HIERARCHY:
  Tenant Root Group
  └── Company (top-level MG)
      ├── Platform MG
      │   ├── Connectivity subscription (hub VNet, ExpressRoute)
      │   ├── Identity subscription (AD DS, PIM)
      │   └── Management subscription (Log Analytics, automation)
      ├── Landing Zones MG
      │   ├── Corp MG (corporate network connected)
      │   │   └── App1 subscription
      │   └── Online MG (internet-facing, no corp network)
      └── Sandbox MG (experimentation, loose policy)
```

## Landing Zone Tools

```
AWS:
  Control Tower: managed landing zone service (recommended for most)
  AWS Organizations: account management, SCPs
  Account Factory for Terraform (AFT): GitOps-based account vending
  
AZURE:
  Azure Landing Zone (ALZ) reference: Microsoft's recommended pattern
  ALZ Bicep: github.com/Azure/ALZ-Bicep
  Enterprise Scale Terraform: Terraform modules for ALZ

GCP:
  Google Cloud Foundation Fabric: open-source landing zone
  Google Cloud Setup Checklist: foundation best practices
  Fabric FAST: Terraform-based landing zone

MULTI-CLOUD:
  Terraform Cloud + CDK: manage landing zones as code
  Pulumi: alternative IaC for landing zone deployment
```

## Study Resources
- **AWS Control Tower documentation** — official landing zone guide
- **AWS Whitepaper: Establishing Your Cloud Foundation** — free PDF
- **Azure Landing Zone docs** (learn.microsoft.com/azure/cloud-adoption-framework/ready/landing-zone)
- **Cloud Adoption Framework (AWS, Azure, GCP)** — all three have free published frameworks
