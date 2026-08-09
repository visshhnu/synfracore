# Tekton — Revision Notes

Condensed reference for quick review. Consolidated from this guide's Overview, Intermediate, Advanced, and Troubleshooting material.

---

## Core Object Model

```
Task         — a reusable unit of work (like a function), runs as
               one or more steps in containers
Pipeline     — chains Tasks together, with parameters passing between
PipelineRun  — one actual EXECUTION of a Pipeline (creates real pods)
Trigger      — webhook event -> PipelineRun (event-driven invocation)
ClusterTask  — a Task reusable ACROSS namespaces (vs. namespace-scoped Task)
Workspace    — shared filesystem between Tasks — WITHOUT this, Tasks
               (separate pods) have NO visibility into each other's
               filesystem at all
```

## No Central Server — the Defining Architecture Point

```
Every Tekton execution IS a real Kubernetes pod, scheduled by the
standard Kubernetes scheduler — same resource model as any workload.
Debugging = kubectl describe/kubectl logs on the actual pod, not a
separate CI-server-specific debugging tool.
```

## Sequencing Mechanisms

```
runAfter:  — explicit sequencing when Tasks have NO data dependency
             Tekton can infer automatically
Workspace  — implicit dependency via shared data (e.g., git-clone's
             output feeding into a build Task)
matrix:    — fans ONE Task definition into N parallel TaskRuns, one
             per parameter combination (e.g., testing across 3.10/
             3.11/3.12 without duplicating YAML)
finally:   — tasks that run REGARDLESS of pipeline outcome (cleanup,
             notification) — NOT guaranteed by a regular task in the
             main list
```

## Advanced Production Concerns

```
Tekton Chains  — generates + signs in-toto provenance attestations
                 for build outputs automatically, on TaskRun completion
                 (supply-chain security — verify via cosign)
Affinity Assistant / pod templates — performance tuning for
                 Workspace-sharing pod scheduling
Tekton Operator — lifecycle management (install/upgrade Tekton itself)
Tekton Results — queryable historical run data (beyond live PipelineRuns)
```

## Common Troubleshooting Entry Points

```
TaskRun/PipelineRun pods never start -> kubectl describe taskrun/
  pipelinerun — check Workspace bindings + ServiceAccount RBAC first
Trigger never fires PipelineRun -> check EventListener's Service is
  actually reachable from the webhook source
Dashboard shows nothing -> confirm correct namespace selected (PipelineRuns
  are namespace-scoped, Dashboard doesn't default to all-namespaces)
```

## Terminology Cross-Reference

```
Tekton term        | Jenkins/GitHub Actions equivalent
---------------------|------------------------------------
Task                  | Job step / composite action
Pipeline               | Pipeline / Workflow
PipelineRun             | A specific pipeline execution
Trigger + EventListener  | Webhook trigger
Workspace                | Shared workspace / artifact passing
ClusterTask               | Shared Library (cross-namespace reuse)
```
