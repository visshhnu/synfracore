# Harbor / Nexus / Artifactory

> **Artifact and container registries — store, scan, sign, replicate**

**Category:** DevOps  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is Harbor / Nexus / Artifactory?

Cloud-native registries (ECR, ACR, GCR) are simple and managed — zero ops overhead. Harbor is open-source, cloud-agnostic, and adds features cloud registries lack: built-in CVE scanning, image replication across clouds, content trust (signed images only), RBAC per project, and retention policies. Choose Harbor when: air-gapped environments, multi-cloud, need scan-and-block policies, or cost at high pull volume.

## Why Harbor / Nexus / Artifactory?

Harbor organises images into Projects (like namespaces). Each project has its own RBAC, scanning policy, and retention rules. Trivy is built-in for scanning — you can configure Harbor to block pushes and pulls of images with CRITICAL CVEs. Replication syncs images to other registries (ACR, ECR, another Harbor) for multi-cloud or DR.

---

## Learning Modules

### Module 01 — Why a Private Registry?
*Cloud registries vs self-hosted*

Cloud-native registries (ECR, ACR, GCR) are simple and managed — zero ops overhead. Harbor is open-source, cloud-agnostic, and adds features cloud registries lack: built-in CVE scanning, image replication across clouds, content trust (signed images only), RBAC per project, and retention policies. Choose Harbor when: air-gapped environments, multi-cloud, need scan-and-block policies, or cost at high pull volume.

**Topics covered:**

- ECR/ACR vs Harbor — trade-offs — 🟢 Beginner
- Air-gapped environments — 🟡 Intermediate
- Multi-cloud image availability — 🟡 Intermediate
- Cost at scale — 🟡 Intermediate

```bash
# When to use each registry:

# ECR (AWS) — use when:
# - All workloads on AWS
# - Want zero registry ops
# - Need IAM-based auth (no credentials to manage)
aws ecr create-repository --repository-name myapp --region us-east-1
aws ecr get-login-password | docker login --username AWS \\
  --password-stdin 123456789.dkr.ecr.us-east-1.amazonaws.com

# ACR (Azure) — use when:
# - All workloads on Azure
# - Deep integration with AKS (attach-acr, OIDC)
az acr create --name myacr --resource-group prod-rg --sku Standard
az aks update --attach-acr myacr -n prod-aks -g prod-rg

# Harbor — use when:
# - Multi-cloud or on-prem
# - Need built-in CVE scanning + block policy
# - Air-gapped (no internet access to cloud APIs)
# - Need image replication across locations
# - RBAC: different teams see different projects

# Docker Hub — avoid for production
# - Rate limiting (100 pulls/6 hours unauthenticated)
# - Outages affect all downstream builds
```

### Module 02 — Harbor — Setup and Core Features
*Helm install, projects, scanning, replication*

Harbor organises images into Projects (like namespaces). Each project has its own RBAC, scanning policy, and retention rules. Trivy is built-in for scanning — you can configure Harbor to block pushes and pulls of images with CRITICAL CVEs. Replication syncs images to other registries (ACR, ECR, another Harbor) for multi-cloud or DR.

**Topics covered:**

- Harbor Helm installation — 🟡 Intermediate
- Projects — RBAC isolation — 🟡 Intermediate
- Vulnerability scanning (Trivy built-in) — 🟡 Intermediate
- Retention policies — auto-delete old images — 🟡 Intermediate
- Image replication — sync to other registries — 🔴 Advanced
- Content trust — block unsigned images — 🔴 Advanced

```bash
# Install Harbor with Helm
helm repo add harbor https://helm.goharbor.io
helm install harbor harbor/harbor \\
  --namespace harbor --create-namespace \\
  --set expose.type=ingress \\
  --set expose.ingress.hosts.core=harbor.company.com \\
  --set externalURL=https://harbor.company.com \\
  --set harborAdminPassword=Admin12345 \\
  --set persistence.enabled=true \\
  --set persistence.persistentVolumeClaim.registry.size=100Gi

# Push image to Harbor
docker tag myapp:v1.2.3 harbor.company.com/production/myapp:v1.2.3
docker login harbor.company.com -u admin
docker push harbor.company.com/production/myapp:v1.2.3

# Block images with CRITICAL CVEs via Harbor API
curl -u admin:Admin12345 -X PUT \\
  https://harbor.company.com/api/v2.0/projects/production \\
  -H "Content-Type: application/json" \\
  -d '{"metadata":{"prevent_vul":"true","severity":"critical"}}'

# Retention policy — keep only last 10 tags per repo
curl -u admin:Admin12345 -X POST \\
  https://harbor.company.com/api/v2.0/projects/1/retentions \\
  -H "Content-Type: application/json" \\
  -d '{"rules":[{"action":"retain","params":{"latestK":10},"scope_selectors":{"repository":[{"kind":"doublestar","decoration":"repoMatches","pattern":"**"}]},"tag_selectors":[{"kind":"doublestar","decoration":"matches","pattern":"**"}]}]}'

# Replication rule — sync production project to DR Harbor
# Created in Harbor UI: Administration → Replications → New Rule
# Source: current harbor → Destination: dr-harbor.company.com
# Trigger: on-push
```

### Module 03 — Nexus and Artifactory
*Universal artifact managers — Maven, npm, Docker, PyPI*

Nexus and Artifactory are universal artifact managers — they handle not just Docker images but also Maven JARs, npm packages, Python PyPI, Helm charts, and more. Key use case: proxy external repos (Maven Central, npm registry) so your builds never depend on internet availability. Security bonus: you control exactly which packages enter your environment.

**Topics covered:**

- Nexus Repository OSS vs Pro — 🟢 Beginner
- JFrog Artifactory vs Nexus — 🟡 Intermediate
- Proxy repositories — cache public artifacts — 🟡 Intermediate
- Hosted repositories — store your own artifacts — 🟢 Beginner
- CI/CD integration — 🟡 Intermediate

```bash
# Nexus/Artifactory serve two purposes:
# 1. PROXY — cache external registries locally
#    Benefit: faster builds + offline capability + security audit
#    npm registry → your Nexus → developer machines
#    Maven Central → your Nexus → Jenkins agents

# 2. HOSTED — store YOUR artifacts
#    Your JARs, Docker images, npm packages

# Configure npm to use Nexus proxy:
npm config set registry https://nexus.company.com/repository/npm-group/

# Configure pip to use Nexus proxy:
pip install mypackage \\
  --index-url https://nexus.company.com/repository/pypi-proxy/simple/

# Configure Maven to use Nexus (settings.xml):
# <mirror>
#   <id>nexus</id>
#   <url>https://nexus.company.com/repository/maven-group/</url>
#   <mirrorOf>*</mirrorOf>
# </mirror>

# Docker registry via Nexus
docker tag myapp:latest nexus.company.com:5000/myapp:latest
docker push nexus.company.com:5000/myapp:latest

# Nexus vs Artifactory — quick comparison:
# Nexus OSS:        Free, Docker+Maven+npm+PyPI, community support
# Nexus Pro:        HA, smart proxy, staging repos
# Artifactory Free: Limited repos, community
# Artifactory Enterprise: Best CI/CD integration, Xray security
# CHOOSE: Nexus OSS for budget, Artifactory for enterprise
```

---

## Production Example

```bash
# Registry Security Best Practices

# 1. NEVER pull from Docker Hub in production
# Set imagePullPolicy and use internal registry
# In Kubernetes, use ImagePullSecret for private registries:
kubectl create secret docker-registry harbor-cred \\
  --docker-server=harbor.company.com \\
  --docker-username=ci-user \\
  --docker-password=token123 \\
  --namespace=production

# 2. ALWAYS scan before deploy (three-layer approach):
# Layer 1: Scan at build time (Trivy in CI pipeline)
# Layer 2: Scan at push time (Harbor auto-scan on push)
# Layer 3: Scan at deploy time (Kyverno/OPA checks Harbor scan result)

# 3. IMAGE SIGNING (supply chain security)
# Sign with Cosign:
cosign sign --key cosign.key harbor.company.com/production/myapp:v1.2.3
# Verify in Kubernetes admission:
cosign verify --key cosign.pub harbor.company.com/production/myapp:v1.2.3

# 4. RETENTION POLICIES — critical for disk management
# Keep: last 10 tags + all tags matching v[0-9]*.[0-9]*.[0-9]*
# Delete: all other tags older than 30 days
# Apply in Harbor per project

# 5. REPLICATION for HA
# Primary Harbor → DR Harbor (on push, 5min interval)
# Primary Harbor → ECR (for AWS workloads)
# Ensures images available even if primary Harbor is down
```

---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is Harbor / Nexus / Artifactory and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Harbor / Nexus / Artifactory work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of Harbor / Nexus / Artifactory?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in Harbor / Nexus / Artifactory?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with Harbor / Nexus / Artifactory?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe Harbor / Nexus / Artifactory in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for Harbor / Nexus / Artifactory?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Harbor / Nexus / Artifactory compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Why a Private Registry? in Harbor / Nexus / Artifactory."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Harbor — Setup and Core Features in Harbor / Nexus / Artifactory."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [Harbor Documentation](https://goharbor.io/docs/)
- [Nexus Repository Documentation](https://help.sonatype.com/en/nexus-repository.html)
- [JFrog Artifactory Documentation](https://jfrog.com/help/r/jfrog-artifactory-documentation)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*