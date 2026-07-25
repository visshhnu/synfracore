# Azure Entra ID — Learning Roadmap

## Estimated Time to Job-Ready
**6-8 weeks** of consistent learning (2-3 hours/day) — Entra ID's basic user/group management is quick to learn; the real depth (and the real interview differentiator) is in Conditional Access design, Managed Identity patterns, and Privileged Identity Management.

## Phase 1: Foundation (Week 1-2)

- Core objects: Tenant, Users, Groups, Service Principals, and Managed Identities — and why a Managed Identity is specifically "a badge for automation," not a person
- Authentication vs. authorization in Entra ID terms: verifying who's making a request versus what they're allowed to do once verified
- App registrations vs. enterprise applications, and the practical difference between registering an app your org builds versus consuming a third-party SaaS app
- Basic RBAC role assignments at the subscription/resource-group/resource level

**Checkpoint:** can you explain the difference between a Service Principal with a client secret and a Managed Identity, and why Managed Identity is generally the safer default for Azure-hosted workloads?

## Phase 2: Managed Identity and Least-Privilege Access (Week 2-4)

- System-assigned vs. user-assigned Managed Identities, and when each fits (a 1:1 identity tied to one resource's lifecycle, versus a shared identity reused across several resources)
- `DefaultAzureCredential`/`ManagedIdentityCredential` in the Azure SDK as the actual code pattern for keyless authentication — no `az login`, no stored client secret
- RBAC least-privilege scoping: granting a role at the narrowest scope that actually satisfies the requirement (a specific storage account, not the whole subscription)
- Complete Portfolio Project 1 (keyless automation with Managed Identity) from this course's Projects section

**Checkpoint:** can you explain why granting "Storage Blob Data Reader" scoped to one storage account is meaningfully different from granting "Contributor" on the whole resource group, even if the automation only ever touches that one account?

## Phase 3: Conditional Access and Governance (Week 4-6)

- Conditional Access as policy-based access control beyond simple username/password — conditions like location, device compliance, and sign-in risk driving MFA requirements or outright blocks
- Report-only mode as the mandatory-in-practice first step before enforcing any new Conditional Access policy, and why skipping it risks locking out real users
- Break-glass emergency access accounts — excluded from every policy, with credentials stored securely outside Entra ID itself, specifically for the scenario where a policy misconfiguration locks out normal admin access
- Complete Portfolio Project 2 (Conditional Access rollout) with a genuine report-only → pilot → enforce staged rollout

**Checkpoint:** can you explain, concretely, what could go wrong if a new Conditional Access policy were enforced immediately instead of run in report-only mode first?

## Phase 4: Privileged Access and Interview Readiness (Week 6-8)

- Privileged Identity Management (PIM): converting standing (permanently active) admin role assignments into eligible assignments requiring explicit, time-boxed activation
- Access Reviews for periodically re-justifying eligible/active role assignments, rather than letting them accumulate indefinitely
- The real audit value of PIM: activation requires justification and can require approval, creating a genuine record of who had elevated access and when, and why
- Complete Portfolio Project 3 (PIM just-in-time access) and review this course's Interview Q&A material, particularly the Managed Identity and Conditional Access rollout questions

## Common Pitfalls Specific to Entra ID

- **Using a Service Principal with a client secret when a Managed Identity would work** — the client secret is a long-lived credential that needs rotation and can leak; Managed Identity avoids that entire class of risk
- **Enforcing a new Conditional Access policy without a report-only period first** — this is a real, common way to accidentally lock out legitimate users, including admins
- **Not having break-glass accounts excluded from every Conditional Access policy** — without one, a misconfigured policy can lock everyone out simultaneously, including the person who'd normally fix it
- **Leaving admin roles as standing assignments instead of PIM-eligible** — a permanently active Global Administrator assignment is a much larger standing attack surface than one requiring explicit, logged activation

## Getting Your First Entra ID-Heavy Role

1. **Portfolio:** the 3 projects in this course's Projects section, each demonstrating a different core skill (keyless Managed Identity automation, staged Conditional Access rollout, PIM just-in-time access)
2. **Resume:** be specific — "migrated 15 standing Global Administrator assignments to PIM-eligible roles requiring justified, time-boxed activation" is far stronger than "experience with Azure Entra ID"
3. **Know the report-only-first discipline cold:** this specific Conditional Access rollout practice is one of the most commonly probed real-world judgment questions in identity-focused interviews
4. **Certifications, if pursuing one:** Entra ID is central to Azure Identity and Access Administrator and Security Engineer Associate — see this course's own Certification Guide for current format and pricing
