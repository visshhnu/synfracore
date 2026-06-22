# Cloud Landing Zones Interview Questions

## Core Concepts

**Q: What is a cloud landing zone?**

A landing zone is a pre-configured cloud environment that follows security, compliance, and operational best practices — the foundation on which workloads are deployed.

It establishes guardrails, governance, and baseline architecture so teams can self-service cloud resources safely.

**Key components:**
- **Account/subscription structure**: Separate accounts per environment/team
- **Identity and access**: Centralised IAM, SSO, least privilege
- **Networking**: Hub-spoke topology, VPN/ExpressRoute, DNS
- **Security baselines**: Logging, monitoring, CSPM, encryption defaults
- **Guardrails**: Policies that prevent non-compliant resources
- **Cost management**: Tagging standards, budgets, cost allocation

---

**Q: Multi-account/subscription strategy.**

```
Management Account (root) — billing, org policies only
  ├── Security OU
  │   └── Log Archive account (all logs shipped here)
  │   └── Security Tooling account (SIEM, GuardDuty, Security Hub)
  ├── Infrastructure OU
  │   └── Shared Services (DNS, AD, Transit Gateway, CI/CD)
  ├── Workloads OU
  │   ├── Dev account
  │   ├── Staging account
  │   └── Prod account (strict controls)
  └── Sandbox OU
      └── Developer sandboxes (time-limited, isolated)
```

**Why separate accounts?**
- Blast radius containment (compromise of dev ≠ prod)
- Fine-grained billing and cost attribution
- Independent security boundaries
- Easier compliance scoping (prod accounts for PCI/SOC2)

---

**Q: Guardrails — preventive vs detective.**

**Preventive**: Block non-compliant actions before they happen.
- AWS SCPs (Service Control Policies): deny specific API actions org-wide
- Azure Policy (deny effect): block resource creation without required tags
- GCP Org Policies: disable external IPs, restrict VM machine types

```json
// AWS SCP: prevent disabling CloudTrail
{
  "Effect": "Deny",
  "Action": ["cloudtrail:DeleteTrail", "cloudtrail:StopLogging"],
  "Resource": "*"
}
```

**Detective**: Detect and alert on non-compliant resources.
- AWS Config Rules: detect unencrypted S3 buckets, SGs open to internet
- Azure Policy (audit effect): flag resources without tags
- GCP Security Command Center: misconfigurations, vulnerabilities

---

**Q: AWS Control Tower / Azure Landing Zone accelerators.**

**AWS Control Tower**: Pre-built landing zone. Sets up account structure, guardrails, SSO, logging automatically. Built on AWS Organizations + SCPs.

**Azure Landing Zone (CAF)**: Microsoft's Cloud Adoption Framework. ARM/Bicep/Terraform templates for enterprise Azure. Management groups, policies, networking.

**Terraform modules**: Most enterprises customise landing zones with Terraform — version controlled, repeatable, multi-cloud.

## Revision Notes
```
LANDING ZONE: Pre-configured cloud foundation. Guardrails + governance + baseline architecture.
NOT optional for enterprise — defines security/compliance/cost posture from day 1.

ACCOUNT STRUCTURE:
Management (billing/org policy) | Security (logs, SIEM) | Shared Services (DNS, VPN)
Workloads OU: Dev | Staging | Prod | Sandbox (isolated)

WHY SEPARATE ACCOUNTS: blast radius | billing | security boundary | compliance scoping

GUARDRAILS:
Preventive: SCPs, Azure Policy deny, GCP Org Policies (block non-compliant actions)
Detective: Config Rules, Azure Policy audit, SCC (alert on violations)

TOOLS:
AWS: Control Tower (pre-built) + Organizations + SCPs
Azure: CAF + Management Groups + Azure Policy
All: Terraform modules (customised, version-controlled)
```
