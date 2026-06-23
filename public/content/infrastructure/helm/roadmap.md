# Helm Learning Roadmap

**Goal**: From kubectl apply to templated, versioned Kubernetes deployments

## Learning Phases

### Phase 1: Helm Basics (1 week)

- What Helm is and why: templates + values
- helm install/upgrade/rollback/uninstall
- Chart structure: Chart.yaml, templates/, values.yaml
- Using public charts: Artifact Hub

### Phase 2: Chart Development (2 weeks)

- helm create: starter chart
- Go template syntax: {{ .Values }}, {{ if }}, {{ range }}
- Named templates: _helpers.tpl
- Built-in objects: .Release, .Chart, .Capabilities

### Phase 3: Advanced Templating (2 weeks)

- Hooks: pre-install, post-upgrade, pre-delete
- Chart tests with helm test
- Dependencies: Chart.yaml dependencies, conditions, tags
- Schema validation: values.schema.json

### Phase 4: Distribution (1 week)

- OCI registries for charts
- Chart Releaser for GitHub-hosted repos
- Versioning: SemVer for charts
- Private chart repositories

### Phase 5: Production (1 week)

- Helmfile: manage multiple charts
- ArgoCD + Helm for GitOps
- Secret management: Helm Secrets plugin
- Diff plugin for pre-upgrade preview

## Job Roles This Enables

- Platform Engineer
- DevOps Engineer
- Kubernetes Administrator

## Target Certifications

- CKAD covers Helm deployment tasks

## How to Use This Roadmap

1. Work through phases in order — each builds on the previous
2. Complete the labs section for each phase before moving on
3. Build a project after each phase to cement learning
4. Use the interview section to test understanding regularly
5. Track progress: revisit earlier sections as concepts compound

## Prerequisites

See `prerequisites.md` in this section for what you should know before starting.

## Revision Notes
```
Total time: 10-15 weeks (part-time)
Daily practice more effective than weekend marathons
Build real things — theory alone not enough for these tools
Join communities: CNCF Slack, relevant subreddits, Discord servers
```
