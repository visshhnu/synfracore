# Cloud Security — Prerequisites

Cloud security is applied security knowledge layered onto cloud infrastructure knowledge — you need a working foundation in both before the cloud-specific controls (IAM policies, CSPM, GuardDuty) mean anything beyond vocabulary.

## What you need first

- **Core cloud infrastructure basics** — what a VPC is, what an IAM role vs. an IAM user is, what a security group does. You cannot reason about securing infrastructure you don't understand the normal operation of.
- **General security fundamentals** — the CIA triad (confidentiality, integrity, availability), the concept of least privilege, and basic networking security (what a firewall actually filters on, the difference between L3/L4 and L7 controls). This page assumes these as background, not something it teaches from zero.
- **Comfort with the specific cloud provider(s) you're securing** — cloud security controls are heavily provider-specific in implementation (AWS IAM policies look nothing like Azure RBAC syntax, even though the underlying concept — least privilege — is the same). Pick one provider to go deep on first rather than spreading thin across all three simultaneously.
- **Basic command-line and scripting comfort** — most real cloud security work (auditing configurations, responding to findings, writing detection rules) involves CLI tools and scripts, not just a security dashboard's UI.

## Helpful but not strictly required

- **Prior general IT/sysadmin experience** — useful context for *why* certain misconfigurations are dangerous, but not a hard blocker to starting.
- **Compliance framework familiarity** (SOC2, ISO 27001, PCI-DSS) — relevant once you're working in a regulated environment, but the technical security controls this page covers are the same regardless of which compliance framework is driving the requirement.

## A note on scope

This page is applied cloud security engineering — securing real cloud infrastructure with real controls (IAM, network security, CSPM, threat detection). It is not penetration testing/offensive security methodology, though the two fields share real overlap (understanding attacker techniques makes you a better defender, and vice versa) — if your actual goal is offensive security specifically, that's a related but distinct track worth pursuing separately.
