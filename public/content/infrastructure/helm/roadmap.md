# Helm — Learning Roadmap

## Time to Job-Ready: 4 weeks (2 hours/day)

**Goal:** Package Kubernetes applications as distributable, configurable Helm charts.

## Phase 1 — Using Charts (Week 1-2)
- What is Helm: package manager for Kubernetes
- `helm repo add`, `helm repo update`, `helm search repo`
- `helm install`, `helm upgrade`, `helm rollback`, `helm uninstall`
- Override values: `--set key=value` and `-f custom-values.yaml`
- `helm list`, `helm status`, `helm history`
- Explore Artifact Hub (artifacthub.io) for public charts

## Phase 2 — Building Charts (Week 2-3)
- `helm create myapp` — scaffold a new chart
- Chart structure: `Chart.yaml`, `values.yaml`, `templates/`
- Template syntax: `{{ .Values.replicaCount }}`, `{{ .Release.Name }}`
- Template functions: `include`, `toYaml`, `tpl`, `required`, `default`
- Named templates (`_helpers.tpl`) and `NOTES.txt`
- Chart dependencies (subcharts): `Chart.yaml` dependencies section

## Phase 3 — Production (Week 3-4)
- `helm lint` and `helm template` for validation
- Chart testing: `helm test` with test pods
- Publish to OCI registry: `helm push`
- Helm Secrets plugin: encrypt sensitive values
- CI/CD integration: lint → test → package → publish → deploy
- Helmfile: manage multiple releases declaratively

## Key Concepts to Master
- Difference between `helm install` and `helm upgrade --install`
- Release lifecycle and how Helm tracks state in Kubernetes Secrets
- When to use `--atomic`, `--wait`, `--timeout`
- `lookup` function to reference existing K8s resources

## Jobs After Helm Mastery
Kubernetes Engineer · Platform Engineer · DevOps Engineer

## Resources
- **helm.sh/docs** — complete reference
- **Artifact Hub** — browse 10,000+ public charts
