# Harbor / Nexus / Artifactory — Prerequisites

## What to Know Before Starting Harbor

Harbor is a registry — the prerequisites are almost entirely about understanding container images and Docker workflows, since that's what Harbor stores, scans, and replicates.

## Required (Must Have)

### 1. Docker/Container Image Basics
```bash
docker build, docker push, docker pull, docker tag
```
You need to understand what an image tag is, what pushing/pulling actually does, and basic Docker registry authentication (`docker login`) — Harbor is a registry you interact with using these exact same commands, just pointed at a different host.

### 2. Basic Kubernetes Awareness (For the Deployment Path)
```bash
kubectl get pods -n harbor
helm install / helm upgrade
```
Harbor itself is typically deployed via Helm onto Kubernetes for production use — you don't need deep K8s expertise, just enough to deploy and inspect a Helm-installed application.

### 3. Basic Understanding of Vulnerability Scanning Concepts
- What a CVE is, at a conceptual level
- Why "scan before deploy" is a meaningful security practice, not just a checkbox

## Nice to Have (Speeds Up Learning)

### Cloud Registry Experience (ECR/ACR/GCR)
Overview's own framing is the fastest on-ramp: if you've used a cloud-native registry before, Harbor's Projects (namespaces with their own RBAC/scanning/retention) map to a familiar mental model — you're learning what Harbor adds on top, not registries from scratch.

### Terraform Basics (Optional)
Advanced's API-automation-at-scale material uses Harbor's Terraform provider for project provisioning — prior Terraform exposure (this site's Terraform section) makes that module immediately familiar syntax.

### CI/CD Pipeline Experience
Webhooks (Intermediate) are most useful in the context of a CI pipeline reacting to a scan-complete event — prior exposure to any CI/CD tool (GitLab CI, GitHub Actions, Jenkins) makes that pattern click faster.

## What You Do NOT Need

- Prior Harbor, Nexus, or Artifactory experience
- Deep vulnerability-scanning tool internals (Trivy, which Harbor uses, is covered as a built-in feature, not something you configure from scratch)
- Multi-cloud infrastructure experience — the concepts apply even learning on a single local cluster

## Time Estimate

If you have the prerequisites above:
- Fundamentals: 1 day
- Intermediate + Advanced: 4-5 days
- Job-ready (comfortable with RBAC, scanning policy, replication, and HA deployment concepts): 2 weeks

## Start Here

Go to the **Installation** section to deploy Harbor, then proceed to **Fundamentals**.
