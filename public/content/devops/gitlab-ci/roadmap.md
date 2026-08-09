# GitLab CI/CD Learning Roadmap

**Goal**: From zero CI/CD experience to production-grade GitLab pipeline design

## Learning Phases

### Phase 1: GitLab CI Fundamentals (2-3 days)

- `.gitlab-ci.yml` structure — stages, jobs, script blocks
- Variables and environment injection
- Artifacts vs. cache — what persists between stages vs. between pipeline runs
- Shared vs. specific runners

### Phase 2: Pipeline Design Patterns (3-4 days)

- `rules:` replacing deprecated `only:`/`except:`
- `needs:` — DAG pipelines, removing stage-bottleneck waiting
- `include:` for shared pipeline templates
- `extends:` for job template inheritance
- `trigger:` for child pipelines

### Phase 3: Runners and Execution Environments (3-4 days)

- Shell vs. Docker vs. Kubernetes executors — tradeoffs of each
- Runner tags and job routing
- Self-managed runner registration and scaling

### Phase 4: Security Scanning and DevSecOps (3-4 days)

- SAST, DAST, dependency scanning, and secret detection via built-in templates
- Reading results in the Merge Request security widget and Security Dashboard
- Configuring pipeline failure on critical vulnerabilities

### Phase 5: Advanced Pipeline Engineering (1-2 weeks)

- Dynamic child pipelines, merge trains, review apps
- Matrix jobs and variable scoping
- Multi-project pipelines and Runner fleet autoscaling
- DAG optimization and CI/CD Catalog components
- Self-hosted GitLab HA considerations

## Job Roles This Enables

- CI/CD Engineer
- DevOps Engineer
- Platform Engineer
- Release Engineer

## Target Certifications

`(needs verification — recheck against current source for GitLab's current certification offerings, if any are actively maintained)`

## How to Use This Roadmap

1. Work through phases in order — Phase 2's `needs:`-based DAG pipelines assume Phase 1's stage/job model is already solid, and Phase 5's advanced patterns build directly on Phase 2 and Phase 3
2. This technology doesn't have a separate Labs tab — the Fundamentals/Intermediate/Advanced code blocks and a real GitLab.com repo (free shared runners, no installation needed to start) are the hands-on material
3. Build the portfolio projects in `projects.md` after Phase 3 — a real multi-stage pipeline with a self-managed runner demonstrates far more than shared-runner-only experience
4. Use the Troubleshooting section's real scenarios (stuck-pending jobs, artifacts-vs-cache confusion, `needs:` stage-ordering issues) as active study material once you've built your first few pipelines
5. Don't treat Phase 4's security scanning as optional — it's one of GitLab's biggest differentiators from Jenkins and is a frequent interview topic for this guide

## Prerequisites

See `prerequisites.md` in this section for what you should know before starting.

## Revision Notes
```
Total time: 3-4 weeks (part-time)
YAML indentation errors are the single most common early-stage source
of confusing pipeline failures — when a pipeline fails in a way that
doesn't match your mental model of the YAML, check indentation first
GitLab.com's free shared runners are sufficient for Phases 1-2; a
self-managed runner (Phase 3) is worth setting up before claiming
production-readiness
```
