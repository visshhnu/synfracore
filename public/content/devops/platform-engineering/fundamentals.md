# Platform Engineering

SRE & Platform Eng › Platform Engineering
🏗️**Platform Engineering**
BeginnerEngineerArchitectInternal Developer Platforms, Backstage catalog, DORA metrics, golden paths
[What is Platform Eng](#sec-what-pe)[Backstage](#sec-backstage)[DORA Metrics](#sec-dora)[Q&A](#sec-interview)


## 🏗️ What is Platform Engineering?›


#### What is Platform Engineering?

Platform Engineering is the discipline of building and operating **Internal Developer Platforms (IDPs)** — self-service products that enable development teams to deploy, manage, and operate their services without needing deep expertise in Kubernetes, Terraform, or CI/CD internals.


Instead of every team learning Kubernetes, writing their own Jenkinsfiles, setting up monitoring, and managing compliance — the platform team builds a product that gives every developer all of this through a simple interface. Developer fills a form, clicks Create, gets a fully working service with CI/CD, K8s deployment, monitoring, and runbook — without touching a single YAML file.


#### Platform Engineering vs traditional DevOps
| Traditional DevOps | Platform Engineering |
|---|---|
| Each team manages their own CI/CD, K8s config, monitoring | Platform team owns the infrastructure — devs consume it via self-service |
| Dev teams must be expert in K8s and Terraform | Developers use templates and get K8s without knowing it |
| Ops team bottleneck for new environment provisioning | Self-service — new environment ready in minutes, no ticket |
| Different tools per team — inconsistent security | Paved road — standardised toolchain with built-in compliance |
| Difficult to measure impact | DORA metrics — deployment frequency, lead time, MTTR |


#### Why Platform Engineering is growing

DevOps culture broke the dev/ops wall — developers now own their services end-to-end. But this created a new problem: every developer must now be expert in Kubernetes, Terraform, CI/CD, security policies, and compliance. That is too much cognitive load for application developers. Platform Engineering solves this by treating the platform as a product — the platform team handles the complexity, developers get a simple interface to consume it.


## 🛤️ Golden Paths & Self-Service›


Crossplane self-service + Tekton standard pipelinesCopy

```

```


## 🎭 Backstage — Building Your IDP›


#### What is Backstage?

Backstage is an open-source Internal Developer Platform framework created by Spotify, donated to CNCF in 2020, and now the most widely-adopted IDP foundation. Companies including Spotify, Expedia, American Airlines, LinkedIn, and HPE use Backstage. It is not an IDP out of the box — it is a framework for building your IDP.


#### Four core capabilities
| Capability | What developers get |
|---|---|
| Software Catalog | Registry of all services, APIs, libraries, infrastructure. Search and find any service, see its owner, documentation, dependencies, health status, and recent incidents. |
| Software Templates | Click-to-create new service. Fill a form: service name, team, language. Get: Git repo created, CI/CD pipeline configured, K8s manifests generated, monitoring dashboard pre-built, runbook template added. |
| TechDocs | Documentation-as-code. Docs in Markdown next to code in Git. Rendered and searchable in Backstage. Always up-to-date with the code. |
| Plugins | Integrate everything: Kubernetes (pod status), ArgoCD (sync status), GitHub (PRs, CI runs), PagerDuty (incidents), Grafana (dashboards), SonarQube (code quality). |

```
# catalog-info.yaml — register any service in Backstage
# Commit this file to the root of any Git repo
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
providesApis:
- payment-api-v2
```


## 📊 DORA Metrics›

#### DORA metrics — measuring DevOps performance
DORA (DevOps Research and Assessment) identified four key metrics that distinguish elite DevOps teams from low performers. These are the standard metrics platform teams track and report to leadership.

| Metric | What it measures | Elite | High | Medium | Low |
|---|---|---|---|---|---|
| Deployment Frequency | How often you deploy to production | Multiple/day | Daily | Weekly | Monthly |
| Lead Time for Changes | Commit to production time | < 1 hour | 1 day | 1 week | 1 month |
| Change Failure Rate | % deployments causing incidents | 0-5% | 5-10% | 10-15% | 15%+ |
| MTTR | Time to restore service after incident | < 1 hour | < 1 day | < 1 week | > 1 week |

#### Platform team goals — improving developer experience
| Goal | What it means | How to measure |
|---|---|---|
| Reduce cognitive load | Developers should not need to know K8s, Terraform, or CI/CD internals | Time to deploy a new service from scratch |
| Self-service provisioning | Any resource available in minutes without tickets | Time from request to environment ready |
| Golden path adoption | Percentage of teams using standard templates | % services using platform templates |
| Paved road reliability | The platform itself must be more reliable than what teams would build alone | Platform SLO — 99.9%+ availability |

#### Backstage score — measure adoption
```
# Backstage plugin: tech-insights
# Define scorecards to measure platform adoption:
# - Does the service have a catalog-info.yaml? (catalog registered)
# - Does it have a runbook linked? (documentation)
# - Is it using the standard CI/CD template? (golden path)
# - Does it have SLOs defined? (reliability)
# - Is it owned by a team? (accountability)
# Score per service: 0-100. Platform team tracks org-wide average.
```


## 🎯 Interview Questions›


All
Architect
Engineer
Production


PLATFORM ENG · ARCHITECT
What is Platform Engineering and how is it different from DevOps and SRE?
DevOps is a culture — break the wall between development and operations, share responsibility, automate. Everyone deploys their own code, everyone participates in on-call. SRE is a discipline — Google's approach to applying software engineering to operations problems. Focus on reliability, error budgets, eliminating toil. Platform Engineering is a product discipline — the platform team treats internal developers as customers and builds products (internal developer platforms, golden paths, self-service tools) that make t
