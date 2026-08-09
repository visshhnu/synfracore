# GitLab CI/CD — Revision Notes

Condensed reference for quick review. Consolidated from this guide's Overview, Intermediate, Advanced, and Troubleshooting material.

---

## Core Pipeline Model

```
.gitlab-ci.yml — entire pipeline definition, lives at repo root
Stages run SEQUENTIALLY; jobs WITHIN a stage run in PARALLEL
Artifacts — persist files BETWEEN STAGES of the same pipeline run
Cache — persist dependencies BETWEEN PIPELINE RUNS (speed, not correctness)
  Conflating artifacts and cache is a common early mistake.
```

## Modern Pipeline Design (rules: over only:/except:)

```
rules:      — modern conditional job execution, REPLACES deprecated
              only:/except:
needs:      — enables DAG pipelines; job depends on SPECIFIC other
              jobs, not the full previous stage — removes stage-
              bottleneck waiting
include:    — pulls shared pipeline templates from another repo
              (Jenkins Shared Libraries equivalent)
extends:    — job template inheritance
trigger:    — invokes a CHILD pipeline (possibly in another project)
```

## Runner Executors — Tradeoffs

```
Shell      — runs directly on runner VM, fast, environment pollutes
             between jobs (state can leak job-to-job)
Docker     — fresh container per job, clean, MOST COMMON choice
Kubernetes — each job = a K8s pod, autoscales to zero, best for
             production cost control
Tags route specific jobs to specific runners (tags: in job + runner
registration tags must match)
```

## Security Scanning (built-in, via include:)

```
include:
  - template: Security/SAST.gitlab-ci.yml
  - template: Security/Dependency-Scanning.gitlab-ci.yml
SAST, DAST, Container Scanning (Trivy), Dependency Scanning, Secret
Detection — results in MR security widget + Security Dashboard.
Can be configured to FAIL pipeline on critical vulnerabilities.
```

## Advanced Patterns

```
Dynamic child pipelines — generate .gitlab-ci.yml at runtime, trigger
  as a child pipeline
Merge trains — serialize merges to a protected branch, testing each
  against the state AFTER prior queued merges (not just current main)
Review apps — ephemeral per-MR deployment environments
Multi-project pipelines — trigger: project with strategy: depend
  makes the PARENT pipeline reflect the CHILD's actual status, not
  just fire-and-forget
Runner fleet autoscaling — Kubernetes executor scaling to zero when idle
```

## Troubleshooting Quick Reference

```
Stuck-pending jobs           -> check runner tags match, runner online
Artifacts vs cache confusion -> artifacts = same-run, cache = cross-run
YAML lint failures            -> indentation, always check first
needs: stage-ordering issues  -> confirm DAG dependency, not stage order
Protected-variable scoping    -> variable only available on protected
                                  branches/tags if marked Protected
Docker-in-Docker issues       -> separate from job's own Docker usage
K8s-executor OOMKill           -> resource requests/limits per job
Manual-gate "green but stale" -> a manual approval job can sit approved
                                  while upstream state has since changed
SAST/Secret-Detection false
  positives                    -> allowlisting mechanism, not disabling
```

## Terminology Cross-Reference

```
GitLab CI term      | Jenkins equivalent
----------------------|---------------------------------
include:                | Shared Library
Runner                  | Agent/Node
Pipeline                 | Build/Job (Jenkins terminology overlap)
needs: (DAG)              | (no direct native equivalent)
CI/CD Catalog component   | Shared Library function (loosely)
```
