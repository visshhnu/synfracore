# Tekton Learning Roadmap

**Goal**: From zero Tekton experience to production-grade Kubernetes-native CI/CD

## Learning Phases

### Phase 1: Tekton Fundamentals (2-3 days)

- Core objects — `Task`, `Pipeline`, `PipelineRun`, `Trigger`
- Tekton vs. Jenkins vs. GitHub Actions — the no-central-server distinction
- `ClusterTask` for cross-namespace reuse
- `Workspace` for sharing data between Tasks

### Phase 2: Triggers and Event-Driven Pipelines (2-3 days)

- Installing and configuring Tekton Triggers
- `EventListener`, `TriggerBinding`, `TriggerTemplate`
- Webhook-driven `PipelineRun` creation

### Phase 3: Intermediate Pipeline Design (3-4 days)

- Matrix strategy for parameterized fan-out execution
- Timeouts and cancellation
- `finally` tasks for cleanup/notification regardless of outcome
- Tekton Results for querying historical run data
- Sidecars for auxiliary containers alongside a Task's steps

### Phase 4: Advanced Production Operations (1 week)

- Tekton Chains for supply-chain provenance and signing
- Multi-tenant RBAC design
- Affinity Assistant and pod-template performance tuning
- Tekton Operator for lifecycle management

### Phase 5: Troubleshooting and Interview Readiness (ongoing)

- Diagnosing failed `TaskRun`/`PipelineRun` pods with `kubectl describe`
- Practice explaining the "no central server, every step is a pod" architecture clearly — this is Tekton's single biggest differentiator and a near-certain interview topic

## Job Roles This Enables

- CI/CD Engineer (Kubernetes-native focus)
- Platform Engineer building internal CI/CD on Kubernetes
- DevOps Engineer, especially in OpenShift environments

## Target Certifications

`(needs verification — recheck against current source for CNCF's current Tekton-relevant certification offerings, if any)`

## How to Use This Roadmap

1. Work through phases in order — Phase 3's matrix/`finally`/Results features assume Phase 1's core object model and Phase 2's trigger mechanics are already solid
2. This technology doesn't have a separate Labs tab — the Fundamentals/Intermediate/Advanced code blocks and a real cluster (local kind/minikube works) are the hands-on material
3. Build the portfolio projects in `projects.md` after Phase 3 — a real webhook-triggered pipeline with matrix execution demonstrates meaningfully more than a manually-invoked single Task
4. Since every Tekton execution is a real Kubernetes pod, practice debugging failed runs with `kubectl describe`/`kubectl logs` directly rather than relying on the optional Dashboard — this mirrors how you'd actually debug it in a cluster without the Dashboard installed
5. Phase 4's Tekton Chains (supply-chain provenance) is increasingly relevant to security-conscious interviews — don't treat it as optional advanced trivia

## Prerequisites

See `prerequisites.md` in this section for what you should know before starting.

## Revision Notes
```
Total time: 3-4 weeks (part-time)
Because there's no central CI server, "where do I look when something
fails" always resolves to a specific pod — internalizing that mental
model early makes every later troubleshooting scenario faster
```
