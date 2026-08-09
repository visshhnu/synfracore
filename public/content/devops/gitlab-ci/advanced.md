# GitLab CI/CD — Advanced

## Multi-Project Pipelines — Triggering Across Repositories

A microservices architecture where a shared library change needs to trigger downstream builds in every consuming service can't be expressed within a single project's pipeline — GitLab supports triggering pipelines in other projects directly, with status propagation back to the parent:

```yaml
trigger-downstream:
  stage: deploy
  trigger:
    project: mygroup/consuming-service
    branch: main
    strategy: depend   # parent pipeline reflects the downstream pipeline's actual result
```

The downstream project can read variables passed from the upstream trigger via `CI_PIPELINE_SOURCE == "pipeline"` and any explicitly forwarded variables — this is the mechanism behind "shared library changed, rebuild every consumer automatically" workflows that a monorepo would handle differently but a multi-repo architecture needs explicit wiring for.

## Runner Fleet Management and Autoscaling

A shared runner pool that doesn't scale with demand becomes the bottleneck at exactly the moments a team needs CI most — a release day with many concurrent pipelines. The Kubernetes executor scales naturally with cluster capacity (each job is a pod, scheduled like any workload), but tuning it for real fleet-scale use requires deliberate configuration:

```toml
# /etc/gitlab-runner/config.toml — Kubernetes executor tuning for scale
[[runners]]
  executor = "kubernetes"
  [runners.kubernetes]
    namespace = "gitlab-runner"
    cpu_request = "500m"
    memory_request = "512Mi"
    cpu_limit = "2"
    memory_limit = "4Gi"
    poll_timeout = 600            # how long to wait for a job pod to become ready
    [runners.kubernetes.node_selector]
      "workload-type" = "ci"      # dedicate specific nodes to CI workloads,
                                    # isolating CI resource usage from production
```

Dedicating a node pool specifically to CI workloads (via `node_selector` plus a matching cluster autoscaler node group) is the concrete mechanism that prevents a burst of CI jobs from starving production workloads for cluster resources — the two compete for the same underlying compute unless deliberately separated.

## DAG Optimization at Real Scale

`needs:` (covered in Intermediate/Overview) turns a linear pipeline into a DAG, but a pipeline with dozens of jobs and a naively-constructed dependency graph can still have an accidental bottleneck — one job with many downstream dependents that itself depends on something slow, serializing far more of the pipeline than necessary:

```yaml
# A dependency graph review question worth asking at scale:
# does any single job have an unusually large number of `needs:` pointing
# TO it? That job is a serialization bottleneck regardless of how well
# everything else is parallelized — every one of those dependents waits
# on it specifically.

lint:
  stage: build
  needs: []          # genuinely independent — should start immediately, not wait on build

unit-test:
  stage: test
  needs: [build]      # only needs build's output, not the full build stage

integration-test:
  stage: test
  needs: [build, migrate-test-db]   # explicit, minimal real dependencies
```

The practical discipline: `needs:` should list the *minimum* real dependencies, not "everything logically before this stage" — an unnecessarily broad `needs:` list re-introduces the exact serialization DAG pipelines exist to remove.

## CI/CD Catalog Components — Versioned Reuse at Organization Scale

Beyond `include:` for shared templates, GitLab's CI/CD Catalog packages **components** — versioned, parameterized pipeline building blocks distributed like a package, with semantic versioning so consumers can pin to a specific major version and receive compatible updates deliberately:

```yaml
include:
  - component: gitlab.com/my-org/ci-components/security-scan@2.1.0
    inputs:
      scan_level: strict
      target_branch: main
```

This is a structural improvement over copy-pasted `include:` templates specifically because of the versioning — a breaking change to a shared component bumps its major version, and consuming pipelines keep working on their pinned version until they deliberately opt into the upgrade, rather than a shared template change silently breaking every pipeline that includes it simultaneously.

## Self-Hosted GitLab at Scale — HA Considerations

A single-node self-hosted GitLab instance is a single point of failure for an organization's entire CI/CD and source control — a real HA deployment separates and scales components independently: multiple GitLab application nodes behind a load balancer, a dedicated PostgreSQL cluster (often with Patroni for automated failover), Gitaly (Git repository storage) configured with replication across multiple nodes, and Redis for session/cache state, also clustered. The specific operational risk worth naming: Gitaly replication lag during a primary-node failure can mean a failover briefly serves slightly stale repository data — a real, non-obvious tradeoff between failover speed and consistency that a single-node deployment never has to make, since a single-node setup can't fail over at all.
