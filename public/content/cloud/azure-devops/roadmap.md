# Azure DevOps — Learning Roadmap

## Estimated Time to Job-Ready
**5-7 weeks** of consistent learning (2-3 hours/day), assuming basic CI/CD concepts already — Azure DevOps's individual pieces (pipelines, boards, repos) are each quick to learn; the real value and real learning curve is in how they integrate as one traceable suite.

## Phase 1: Foundation (Week 1-2)

- The integrated-suite model: Boards (work tracking), Repos (source control), Pipelines (CI/CD), Artifacts (package management), Test Plans — and how a single work item ID threads through all of them
- YAML pipelines as the current standard (version-controlled alongside code) versus the legacy Classic visual editor, which older material may still show
- Basic pipeline structure: triggers, jobs, steps, and running a simple build-and-test pipeline end to end
- Work item linking: committing with a work item reference (`AB#1234`) and confirming the commit auto-links back to the board

**Checkpoint:** can you explain why YAML pipelines are generally preferred over the Classic editor for a real team, beyond just "it's newer"?

## Phase 2: Multi-Stage Pipelines and Environments (Week 2-4)

- Stages, jobs, and dependencies (`dependsOn`) for building genuinely multi-step pipelines, not just a single flat job
- Environments as the mechanism for tracking deployment history and applying approval gates per target (dev/staging/production)
- Approval gates and checks — manual approvals, and automated gates like a post-deployment health check that can halt a pipeline before it reaches production
- Deployment strategies within a pipeline (rolling, canary) and what each actually changes about how a new version reaches users

**Checkpoint:** can you explain the difference between a manual approval gate and an automated deployment gate (like a health check), and give a real scenario where you'd want both on the same environment?

## Phase 3: Reusability and Secrets (Week 4-5)

- Pipeline templates for extracting shared steps into a reusable, parameterized YAML file consumed by multiple pipelines — and why this matters once you have more than one or two real pipelines to maintain
- Variable groups, optionally backed by Azure Key Vault, for centralizing configuration and secrets rather than duplicating them per pipeline
- Service connections for authenticating a pipeline to external systems (Azure subscriptions, container registries) without embedding credentials directly in YAML
- Self-hosted agents vs. Microsoft-hosted agents, and a real justification for choosing one over the other for a given workload

**Checkpoint:** given the same deployment steps duplicated across 4 different application pipelines, can you explain how a shared template would change what happens when that deployment pattern needs to change?

## Phase 4: Governance and Interview Readiness (Week 5-7)

- Branch policies for enforcing PR review, build validation, and status checks before code reaches a protected branch
- Azure Artifacts for versioned package/artifact management, distinct from just publishing build outputs as pipeline artifacts
- Auditability: confirming an approval, a deployment, and the work item behind it are all traceable after the fact, not just during the pipeline run
- Review this course's Interview Q&A material, particularly the YAML-vs-Classic and Environments/approval-gate questions

## Common Pitfalls Specific to Azure DevOps

- **Using the Classic pipeline editor for new work** — it's a legacy pattern; YAML pipelines are the current standard and the only way to get pipelines-as-code review benefits
- **Duplicating the same deployment steps across every application pipeline** — this is exactly what pipeline templates exist to solve, and duplicated steps drift out of sync over time
- **Embedding secrets directly in pipeline YAML instead of using variable groups/Key Vault** — a real, avoidable security exposure
- **Treating an approval gate as sufficient without also testing the automated-gate failure path** — a gate that's never been triggered to actually block a bad deployment hasn't really been proven to work

## Getting Your First Azure DevOps-Heavy Role

1. **Portfolio:** the 3 projects in this course's Projects section, each demonstrating a different core skill (traceable work-item-to-deployment pipelines, multi-environment approval gates, reusable pipeline templates)
2. **Resume:** be specific — "reduced pipeline duplication across 6 microservices by extracting a shared deployment template, cutting a 200-line YAML file to 20 lines per service" is far stronger than "experience with Azure DevOps"
3. **Know the integrated-suite value proposition:** interviewers often probe whether a candidate understands why Azure DevOps is more than "just another CI tool" — the Boards-to-Pipelines traceability is the actual differentiator
4. **Certifications, if pursuing one:** Azure DevOps is covered in the Azure DevOps Engineer Expert certification — see this course's own Certification Guide for current format and pricing
