# Platform Engineering — Fundamentals

## What is Platform Engineering?

Platform Engineering is the discipline of building and operating Internal Developer Platforms (IDPs) — self-service products that let development teams deploy, manage, and operate their services without needing deep expertise in Kubernetes, Terraform, or CI/CD internals.

Instead of every team learning Kubernetes, writing their own Jenkinsfiles, setting up monitoring, and managing compliance individually, the platform team builds a product that gives every developer all of this through a simple interface — fill a form, click Create, get a fully working service with CI/CD, K8s deployment, monitoring, and a runbook, without touching a single YAML file.

| Traditional DevOps | Platform Engineering |
|---|---|
| Each team manages its own CI/CD, K8s config, monitoring | The platform team owns the infrastructure — devs consume it via self-service |
| Dev teams must be experts in K8s and Terraform | Developers use templates and get K8s without needing to know it |
| Ops team is a bottleneck for new environment provisioning | Self-service — a new environment is ready in minutes, no ticket |
| Different tools per team — inconsistent security | A paved road — a standardised toolchain with built-in compliance |
| Difficult to measure impact | DORA metrics — deployment frequency, lead time, MTTR |

**Why Platform Engineering is growing:** DevOps culture broke the wall between dev and ops — developers now own their services end-to-end. But this created a new problem: every developer must now be an expert in Kubernetes, Terraform, CI/CD, security policies, and compliance simultaneously, which is too much cognitive load for application developers whose actual job is building features. Platform Engineering solves this by treating the platform itself as a product — the platform team absorbs the complexity, developers get a simple interface to consume it.

## Golden Paths & Self-Service

```yaml
# Crossplane — self-service infrastructure provisioning via a
# Kubernetes-native API a developer can use without touching Terraform
apiVersion: database.example.org/v1alpha1
kind: PostgreSQLInstance
metadata: { name: my-service-db }
spec:
  parameters:
    storageGB: 20
    version: "16"
  compositionSelector:
    matchLabels: { environment: production }
# A developer applies this simple manifest; Crossplane's composition
# translates it into the full underlying Terraform-equivalent resources
# (VPC subnet, security group, RDS instance) behind the scenes.
```
```yaml
# Tekton — a standard, reusable CI/CD pipeline template every service
# uses via a golden path, rather than each team writing its own
apiVersion: tekton.dev/v1
kind: Pipeline
metadata: { name: standard-service-pipeline }
spec:
  tasks:
    - name: test
      taskRef: { name: run-tests }
    - name: security-scan
      taskRef: { name: trivy-scan }
      runAfter: [test]
    - name: build-and-push
      taskRef: { name: build-image }
      runAfter: [security-scan]
    - name: deploy
      taskRef: { name: argocd-sync }
      runAfter: [build-and-push]
```
A "golden path" is this exact idea — the standard, supported, secure way to do something (deploy a service, provision a database), made so much easier than the alternative that teams choose it by default, not because they're forced to.

## Backstage — Building Your IDP

Backstage is an open-source Internal Developer Platform framework created by Spotify, donated to CNCF in 2020, and now the most widely-adopted IDP foundation — companies including Spotify, Expedia, American Airlines, LinkedIn, and HPE use it. It's not an IDP out of the box — it's a framework for building your own.

**Four core capabilities:**

| Capability | What developers get |
|---|---|
| Software Catalog | A registry of all services, APIs, libraries, infrastructure — search and find any service, see its owner, documentation, dependencies, health status, and recent incidents |
| Software Templates | Click-to-create a new service — fill a form (name, team, language) and get a Git repo, a configured CI/CD pipeline, generated K8s manifests, a pre-built monitoring dashboard, and a runbook template |
| TechDocs | Documentation-as-code — docs in Markdown next to code in Git, rendered and searchable in Backstage, always up to date with the code |
| Plugins | Integrate everything — Kubernetes (pod status), ArgoCD (sync status), GitHub (PRs, CI runs), PagerDuty (incidents), Grafana (dashboards), SonarQube (code quality) |

```yaml
# catalog-info.yaml — register any service in Backstage by
# committing this file to the root of its Git repo
apiVersion: backstage.io/v1alpha1
kind: Component
metadata:
  name: payment-service
  description: Handles payment processing for all transactions
  annotations:
    github.com/project-slug: company/payment-service
    backstage.io/techdocs-ref: dir:.
    prometheus.io/alert: "payment-service-slo"
spec:
  type: service
  lifecycle: production
  owner: payments-team
  system: payment-platform
  dependsOn:
    - component:order-service
    - resource:payment-database
  providesApis: [payment-api-v2]
```

## DORA Metrics

DORA (DevOps Research and Assessment) identified four key metrics that distinguish elite DevOps teams from low performers — these are the standard metrics platform teams track and report to leadership.

| Metric | What it measures | Elite | High | Medium | Low |
|---|---|---|---|---|---|
| Deployment Frequency | How often you deploy to production | Multiple/day | Daily | Weekly | Monthly |
| Lead Time for Changes | Commit to production time | < 1 hour | 1 day | 1 week | 1 month |
| Change Failure Rate | % of deployments causing incidents | 0-5% | 5-10% | 10-15% | 15%+ |
| MTTR | Time to restore service after an incident | < 1 hour | < 1 day | < 1 week | > 1 week |

**Platform team goals — improving developer experience:**

| Goal | What it means | How to measure |
|---|---|---|
| Reduce cognitive load | Developers shouldn't need to know K8s, Terraform, or CI/CD internals | Time to deploy a new service from scratch |
| Self-service provisioning | Any resource available in minutes without a ticket | Time from request to environment ready |
| Golden path adoption | Percentage of teams using standard templates | % of services using platform templates |
| Paved road reliability | The platform itself must be more reliable than what teams would build alone | Platform SLO — 99.9%+ availability |

```
Backstage's "tech-insights" plugin can build a scorecard measuring
platform adoption per service (0-100):
  - Does the service have a catalog-info.yaml? (catalog registered)
  - Does it have a runbook linked? (documentation)
  - Is it using the standard CI/CD template? (golden path adoption)
  - Does it have SLOs defined? (reliability)
  - Is it owned by a team? (accountability)
The platform team tracks the org-wide average score as a single,
trackable measure of platform adoption over time.
```

## Interview Questions

**What is Platform Engineering and how is it different from DevOps and SRE?**
DevOps is a culture — break the wall between development and operations, share responsibility, automate everything possible. Everyone deploys their own code, everyone participates in on-call. SRE is a discipline — Google's approach to applying software engineering to operations problems, focused on reliability, error budgets, and eliminating toil. Platform Engineering is a product discipline — the platform team treats internal developers as customers and builds actual products (internal developer platforms, golden paths, self-service tools) that make the DevOps and SRE principles achievable at scale without every single developer needing deep infrastructure expertise. The relationship between the three: DevOps sets the cultural goal (developers own their services), SRE provides the operational rigor for reliability, and Platform Engineering provides the actual tooling and abstraction layer that makes both achievable without every developer becoming a Kubernetes and Terraform expert individually — Platform Engineering is, in a real sense, how DevOps and SRE principles scale past the point where every team can realistically build their own infrastructure tooling from scratch.
