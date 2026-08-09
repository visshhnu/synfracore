# FluxCD Learning Roadmap

**Goal**: From zero GitOps experience to production-grade multi-tenant Flux operations

## Learning Phases

### Phase 1: FluxCD Fundamentals (2-3 days)

- Pull-based GitOps — the core reconciliation principle
- FluxCD vs. ArgoCD — no UI, pure CRD-driven, when to choose Flux specifically
- Core components — source-controller, kustomize-controller, helm-controller, notification-controller
- Bootstrap process and the GitOps loop: Git change → source-controller detects → kustomize-controller applies

### Phase 2: Notifications and Image Automation (3-4 days)

- Provider/Alert CRDs for the notification-controller
- `postBuild` variable substitution
- Full image-automation pipeline — automatically updating image tags in Git
- `dependsOn` ordering between Kustomizations

### Phase 3: Multi-Tenancy and Observability (4-5 days)

- Multi-tenancy sharding and bootstrapping patterns
- Prometheus integration for reconciliation metrics
- Disaster recovery via Git-as-source-of-truth
- Flagger progressive delivery integration

### Phase 4: Notes, Reference, and Real-World Patterns (2-3 days)

- Common gotchas and operational notes (see `notes.md`)
- Real-world scenario patterns for GitOps at scale

### Phase 5: Interview and Certification Readiness (ongoing)

- Practice explaining the pull-based vs. push-based GitOps distinction clearly and concisely
- `(needs verification — recheck against current source)` for any current CNCF/Flux-specific certification offerings

## Job Roles This Enables

- GitOps/Platform Engineer
- DevOps Engineer (Kubernetes-focused)
- Site Reliability Engineer maintaining GitOps-managed fleets

## Target Certifications

`(needs verification — recheck against current source for CNCF's current Flux-relevant certification offerings, if any)`

## How to Use This Roadmap

1. Work through phases in order — Phase 2's image automation and notification patterns assume Phase 1's core reconciliation loop is already solid
2. This technology doesn't have a separate Labs tab — the Fundamentals/Intermediate/Advanced code blocks and a real bootstrapped cluster (kind/minikube is sufficient) are the hands-on material
3. Build the portfolio projects in `projects.md` after Phase 2 — a real image-automation pipeline is the single most impressive thing to demonstrate for this guide
4. Since Flux has no UI, get comfortable with `flux get`/`flux check`/`kubectl describe` as your primary debugging toolkit early — this isn't optional the way glancing at a dashboard might be with ArgoCD
5. Use the Troubleshooting section's real scenarios as active study material — debugging a UI-less, CRD-only tool is a genuinely different skill from debugging one with a dashboard to lean on

## Prerequisites

See `prerequisites.md` in this section for what you should know before starting.

## Revision Notes
```
Total time: 3-4 weeks (part-time)
The absence of a UI is the single biggest adjustment coming from ArgoCD
or a dashboard-driven tool — budget real time to build fluency with
flux get/flux check/kubectl describe as primary debugging tools, not
just secondary ones
```
