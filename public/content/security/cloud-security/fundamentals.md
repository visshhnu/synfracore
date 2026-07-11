# Cloud Security — Fundamentals

## The shared responsibility model — the single most important cloud security concept

Cloud providers secure the infrastructure *of* the cloud (physical data centers, the hypervisor, the underlying network); you're responsible for security *in* the cloud (your IAM configuration, your data encryption choices, your application code, your network security group rules). The exact split shifts by service model — for IaaS (raw compute) you own more of the stack (patching the OS, for example); for managed/PaaS services (a managed database), the provider owns more. Misunderstanding this split — assuming "the cloud provider handles security" broadly — is one of the most common real sources of cloud misconfiguration, not a theoretical distinction.

## IAM: the actual center of cloud security

More cloud security incidents trace back to IAM misconfiguration (over-permissioned roles, leaked credentials, missing MFA) than to any other single category — this is why Overview leads with it. Core principles worth internalizing precisely:

- **Least privilege** — grant exactly the permissions a role needs, not broader "just in case" access. A role that can do more than its actual job needs is a larger blast radius if that role's credentials are ever compromised.
- **Roles over long-lived credentials, wherever possible** — a role assumed temporarily (an EC2 instance role, a federated login) issues short-lived, auto-rotating credentials; a long-lived access key is a standing liability that exists until someone remembers to rotate or revoke it.
- **Explicit Deny always wins** in AWS's policy evaluation logic (see Overview) — this is a specific, testable detail worth knowing precisely: an explicit Allow elsewhere in a policy does not override an explicit Deny, which is a deliberate design choice enabling strong guardrail policies that can't be accidentally overridden by a permissive role policy.

## Network security layers, and what each actually filters

- **Security Groups (AWS) / NSGs (Azure)** — stateful, instance/subnet-level filtering. "Stateful" matters specifically: a rule allowing inbound traffic on a port automatically allows the corresponding outbound response, you don't need a matching outbound rule for replies.
- **NACLs (AWS)** — stateless, subnet-level filtering, evaluated in addition to (not instead of) security groups. Because they're stateless, you need explicit rules for both directions of traffic, which is a common source of "why can't this connection complete" confusion for people used to security groups' stateful behavior.
- **WAF (Web Application Firewall)** — operates at L7, inspecting actual HTTP request content (not just IP/port), which is what allows it to block application-layer attack patterns (a request payload that looks like a SQL injection attempt) that a security group's L3/L4 filtering has no visibility into at all.

## Encryption: at rest vs. in transit, and why both matter independently

Encryption at rest protects data stored on disk (in S3, in a database volume) from being readable if the underlying storage is somehow accessed directly, bypassing your application. Encryption in transit (TLS) protects data moving across a network from being readable if intercepted mid-transit. These are independent protections against different threat scenarios — encrypting data at rest does nothing to protect it while it's being transmitted, and vice versa; a real security posture needs both, not either.

## Detection vs. prevention — a distinction worth being precise about

Preventive controls (IAM policies, security groups, WAF rules) stop a bad action from happening in the first place. Detective controls (GuardDuty, CloudTrail-based alerting, Config rules) notice when something happened, often after the fact. Neither category alone is sufficient: prevention can't cover every possible misconfiguration or novel attack pattern in advance, and detection without a fast response process just means you find out about an incident, not that you're protected from one. Mature cloud security programs invest in both, deliberately, rather than treating either as sufficient alone.
