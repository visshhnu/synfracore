# Cloud Landing Zones — Learning Roadmap

## Estimated Time to Job-Ready
**6-9 weeks** of consistent learning (2-3 hours/day), assuming solid foundational cloud knowledge already (IAM, networking, at least one provider's account/subscription model) — landing zones sit at the intersection of several disciplines (identity, networking, governance), so this is genuinely more architectural than any single-service topic on this site.

## Phase 1: Foundation (Week 1-2)

- Why a landing zone exists: the real problem of one shared account/subscription becoming one shared blast radius once a second team or production workload arrives
- Multi-account/multi-subscription strategy as the core structural decision — separate accounts per team, environment, or workload, rather than one account with internal separation by convention alone
- Centralized identity (a single identity provider federated across all accounts) as the foundation everything else builds on
- The core landing zone components at a conceptual level: account structure, network topology, identity, guardrails, and centralized logging

**Checkpoint:** can you explain, in concrete terms, what "blast radius" means in the context of a single shared account, and why splitting into separate accounts actually contains it?

## Phase 2: Account Structure and Guardrails (Week 2-4)

- Account/subscription hierarchy design (AWS Organizations OUs, Azure Management Groups, GCP folders) and organizing accounts by function (security, shared services, workload environments) rather than ad hoc
- Guardrails: Service Control Policies (AWS), Azure Policy, GCP Organization Policies — preventive controls that apply uniformly regardless of which team or account is affected
- The distinction between a guardrail (blocks an action outright) and a detective control (flags a violation after the fact) — and why both matter, not just one
- Baseline security requirements applied consistently across every account from the start, rather than retrofitted after an incident

**Checkpoint:** can you explain why an SCP/Azure Policy guardrail is a stronger control than a written policy document that teams are simply expected to follow?

## Phase 3: Networking and Shared Services (Week 4-6)

- Hub-and-spoke network topology as the standard landing zone networking pattern, and why centralizing shared network resources (transit gateway, firewall, DNS) in a hub account makes sense
- Centralized logging and monitoring across every account, aggregated to a security/audit account that individual workload teams don't have write access to
- Shared services accounts (CI/CD tooling, container registries, shared DNS) as a deliberate architectural choice, distinct from workload accounts
- Landing zone automation (AWS Control Tower, Azure Landing Zone accelerator, GCP's landing zone blueprints) versus fully custom Infrastructure-as-Code — the real tradeoff between speed-to-standard-baseline and custom-fit control

**Checkpoint:** can you explain why centralized logging specifically needs to live in an account that workload teams don't have write access to — what does that separation actually protect against?

## Phase 4: Governance at Scale and Interview Readiness (Week 6-9)

- Account vending (a repeatable, automated process for provisioning new accounts that already comply with the landing zone's baseline) as the mechanism that keeps guardrails from eroding as the organization scales
- Cost allocation and tagging enforcement built into the landing zone itself, not bolted on afterward
- Compliance mapping — how a landing zone's guardrails map to real regulatory/compliance requirements (SOC 2, HIPAA, etc.) an organization might need to satisfy
- Review this course's Interview Q&A material, particularly the account-structure-design and guardrail-vs-policy-document questions

## Common Pitfalls Specific to Landing Zones

- **Treating a landing zone as a one-time setup rather than an evolving structure** — account vending, guardrail updates, and new shared services all need to keep happening as the organization grows
- **Applying guardrails inconsistently across accounts** — a landing zone's entire value proposition depends on guardrails actually applying uniformly, not just to the accounts someone remembered to configure
- **Centralizing everything into one account instead of using a genuine hub-and-spoke or shared-services pattern** — this recreates the original blast-radius problem the landing zone was meant to solve, just with extra steps
- **Retrofitting a landing zone after significant workloads already exist in an unstructured account** — this is real, disruptive migration work; a landing zone is far cheaper to establish before that point than after

## Getting Your First Landing-Zone-Focused Role

1. **Portfolio:** a project demonstrating a real multi-account structure (even a small 3-4 account setup) with actual guardrails (SCPs/Azure Policy) enforced and tested, not just diagrammed
2. **Resume:** be specific — "designed and implemented a 12-account AWS Organizations landing zone with centralized logging and SCP guardrails, reducing cross-team blast radius for a 40-engineer organization" is far stronger than "experience with cloud governance"
3. **Know the guardrail-vs-policy-document distinction cold:** this is a genuinely common interview question for cloud architecture and platform engineering roles specifically
4. **This is architecture-level knowledge:** landing zone design questions show up more in Solutions Architect and Cloud Security interviews than in a dedicated "landing zones" certification track — this course's Cloud Security and IAM material is directly complementary
