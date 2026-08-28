# Harbor / Nexus / Artifactory

> **Artifact and container registries — store, scan, sign, replicate**

**Category:** DevOps  
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

---

**Before you start:** basic Docker comfort (what an image is, `docker push`/`pull`) is assumed. No prior registry-administration experience is needed.

## What is Harbor / Nexus / Artifactory?

A **registry** is where built container images (and other build artifacts) actually live between being built and being deployed — the same role a package repository plays for a programming language, just for whole container images instead of code libraries. Cloud-native registries (ECR, ACR, GCR) are simple and managed — zero ops overhead. Harbor is open-source, cloud-agnostic, and adds features cloud registries lack: built-in CVE scanning, image replication across clouds, content trust (signed images only), RBAC per project, and retention policies. Choose Harbor when: air-gapped environments, multi-cloud, need scan-and-block policies, or cost at high pull volume.

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
```

```flow
{
  "title": "Three-Layer Scanning — Catch a Vulnerable Image at Every Stage",
  "layout": "flow",
  "steps": [
    { "label": "Build time", "sublabel": "Trivy in the CI pipeline", "color": "blue" },
    { "label": "Push time", "sublabel": "Harbor auto-scans on push", "color": "purple" },
    { "label": "Deploy time", "sublabel": "Kyverno/OPA checks the scan result", "color": "green" }
  ]
}
```

```bash
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

**PSR Formula:** Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

**Q1. What is Harbor / Nexus / Artifactory and why would you use it in production?**

**A:** **Problem:** cloud-native registries (ECR, ACR, GCR) are simple and fully managed, but lack built-in CVE scanning with block policies, cross-cloud replication, content trust, and per-project RBAC — and pulling straight from Docker Hub in production hits rate limits (100 pulls/6 hours unauthenticated) and ties every build to Docker Hub's own uptime. **Solution:** Harbor is a self-hosted, cloud-agnostic registry adding exactly those missing pieces — built-in Trivy scanning with configurable block-on-CVE policies, image replication across clouds/regions, content trust for signed-image-only pulls, and per-project RBAC; Nexus/Artifactory extend the same idea beyond containers to Maven/npm/PyPI artifacts, letting a build depend on an internal proxy instead of the public internet. **Result:** air-gapped environments, multi-cloud deployments, and orgs needing enforceable scan-and-block policy all need one of these — cloud-native registries alone can't satisfy those requirements regardless of budget.

---

**Q2. How does Harbor / Nexus / Artifactory work internally? Explain the architecture.**

**A:** **Problem:** without knowing the internal flow, "why did my push get rejected" is unclear — is it auth, RBAC, or a scan policy? **Solution:** Harbor organizes images into Projects (namespace-like isolation units), each with its own RBAC, scan policy, and retention rules; a `docker push` authenticates against the project's RBAC, then — if `prevent_vul` is configured — Trivy scans the image before it's accepted, rejecting anything above the configured CVE severity threshold; replication rules (configured per-project, triggered on-push) then asynchronously sync accepted images to other registries. **Result:** a rejected push is either an auth/RBAC failure (wrong credentials or insufficient project role) or a scan-policy block (a CRITICAL CVE tripped `prevent_vul`) — the Harbor UI's project activity log distinguishes the two immediately, rather than needing to be inferred from the CLI error alone.

---

**Q3. What are the main components of Harbor / Nexus / Artifactory?**

**A:** **Problem:** these three tools get lumped together as "registries" but solve overlapping-but-different scopes. **Solution:** Harbor is container-image-focused with Projects (RBAC boundary), built-in Trivy scanning, content trust, and replication; Nexus and Artifactory are universal artifact managers spanning Docker images, Maven JARs, npm packages, and PyPI — each operating in two modes, as a *proxy* (caching external repos like Maven Central or the npm registry so builds don't depend on internet availability) and as *hosted* storage for your own artifacts. **Result:** a real platform often runs both — Harbor (or a Nexus/Artifactory Docker-format repo) for container images specifically, and Nexus/Artifactory's proxy mode in front of every language-package ecosystem the org's builds depend on.

---

**Q4. How do you handle failures in Harbor / Nexus / Artifactory?**

**A:** **Problem:** a failed push or pull could be a credentials problem, a scan-policy rejection, a storage/PVC-full problem, or a replication lag — each needs a different fix. **Solution:** check the specific error first — `unauthorized` is a credentials/RBAC problem, a rejection referencing vulnerability severity is the `prevent_vul` scan policy working as configured (not a bug); for storage issues, Harbor's own persistence PVC (sized at install, e.g. the 100Gi in the Helm example) filling up blocks new pushes entirely, caught via standard Kubernetes PVC-usage monitoring; for a replication rule that isn't syncing, the Administration > Replications UI shows per-rule execution history and the specific sync error. **Result:** most real incidents are the scan policy correctly blocking a genuinely vulnerable image (not a failure to fix, a policy working) or a full PVC — both are visible directly in Harbor's own UI/logs without needing to guess.

---

**Q5. What is your production experience with Harbor / Nexus / Artifactory?**

**A:** This is a genuinely personal question — answer with a real incident using the Problem → Solution → Result structure: what broke (a full registry PVC blocking all pushes during a release, a retention policy misconfigured and deleting a tag still in use, a replication rule silently failing to sync to a DR registry), your actual diagnostic sequence, and what the root cause turned out to be. Interviewers are listening for whether you have real operational experience, not textbook recall.

---

**Q6. How do you monitor and observe Harbor / Nexus / Artifactory in production?**

**A:** **Problem:** a registry that's "up" but silently failing scans, replication, or retention can go unnoticed until a much bigger incident (a vulnerable image slipping through, or a DR registry that's been stale for weeks). **Solution:** monitor storage/PVC usage proactively (a full disk blocks all pushes with no graceful degradation), check the Administration > Replications execution history on a schedule rather than assuming on-push triggers always fire successfully, and treat scan-policy rejections in the activity log as a signal worth tracking in aggregate (a spike in rejected pushes often means an upstream base image just got a new CVE, not that something is broken). **Result:** the registry's own audit/activity log is the primary signal — most registry-specific incidents (storage, replication, scan policy) don't show up in generic infrastructure monitoring at all.

---

**Q7. What are the security considerations for Harbor / Nexus / Artifactory?**

**A:** **Problem:** the registry is the last checkpoint before a potentially-vulnerable image reaches production, and a misconfigured or bypassed registry defeats that entirely. **Solution:** configure `prevent_vul` to actually block (not just report) CRITICAL-severity CVEs on push and pull, not just scan after the fact; use content trust so only signed images are pullable, preventing an attacker with registry write access from silently swapping a tag; scope project RBAC narrowly so a compromised CI credential for one team's project can't push to or read another team's; for Nexus/Artifactory's proxy mode, remember that proxied public packages are still an untrusted-supply-chain risk — proxying doesn't itself vet package contents, it just adds availability and an audit trail of what was pulled. **Result:** the actual security value comes from the block-on-CVE policy being enforced, not merely configured — a scan policy set to "report only" provides visibility but not the control that "choose Harbor for scan-and-block policies" (this guide's own stated reason to use it) actually requires.

---

**Q8. How does Harbor / Nexus / Artifactory compare to alternatives?**

**A:** **Problem:** the real choice is rarely "self-hosted vs. nothing" — it's which self-hosted option, or whether a cloud-native registry is actually sufficient. **Solution:** vs. ECR/ACR/GCR — those win on zero ops overhead and native IAM integration for single-cloud, single-registry-type workloads, but lack CVE block policies, cross-cloud replication, and universal artifact support; Harbor vs. Nexus/Artifactory — Harbor is purpose-built for containers with the deepest scan/replication/content-trust feature set for that use case, while Nexus/Artifactory trade some of that container-specific depth for being one registry across every artifact type (Docker, Maven, npm, PyPI) instead of running several tools; Nexus OSS vs. Artifactory — Nexus OSS is the budget-friendly free option, Artifactory Enterprise wins on CI/CD integration depth and Xray security scanning. **Result:** multi-cloud or air-gapped with container-specific scanning needs points at Harbor; a polyglot artifact estate (Java + npm + Python + Docker) with a security budget points at Artifactory; the same estate on a tighter budget points at Nexus OSS.

---

**Q9. Why might a team choose a self-hosted registry over a fully-managed cloud one, even with the added operational burden?**

**A:** **Problem:** ECR/ACR/GCR require zero operational effort, so choosing to self-host looks like extra work without an obvious payoff unless the specific missing capabilities are named. **Solution:** four concrete gaps drive the decision — air-gapped environments with no path to a cloud API at all; genuine multi-cloud deployments where a single-cloud-native registry can't serve every cluster equally; a hard requirement for enforceable scan-and-block policy (not just scan-and-report, which some cloud registries only offer as an add-on); and cost at very high pull volume, where a self-hosted registry's fixed infrastructure cost can undercut a cloud registry's per-pull or egress pricing at scale. **Result:** each of these is a specific, checkable requirement — a team should be able to name which one applies to them, not choose self-hosting on general principle, since the operational cost is real and only worth paying for a genuine gap.

---

**Q10. Walk through Harbor's core production-readiness features — Projects, scanning, retention, and replication — and how they fit together.**

**A:** **Problem:** installing Harbor with defaults gives a working registry, but none of its actual value over a cloud-native registry is realized until these four features are configured deliberately. **Solution:** Projects provide the RBAC boundary (which teams can push/pull where); scanning (Trivy, built in) with `prevent_vul` set to block, not just report, is what turns "we scan images" into an enforced gate; retention policies (e.g. keep only the last 10 tags per repo) prevent unbounded storage growth from every CI build pushing a new tag; replication rules sync accepted images to a DR registry or another cloud/region on-push, so availability doesn't depend on a single Harbor instance. **Result:** a Harbor install that skips retention fills its own storage within weeks under real CI volume, and a Harbor install that skips replication is a single point of failure — both are Module 02's actual point: setup alone isn't "production-ready," these four pieces configured together are.

---

## Official Resources

- [Harbor Documentation](https://goharbor.io/docs/)
- [Nexus Repository Documentation](https://help.sonatype.com/en/nexus-repository.html)
- [JFrog Artifactory Documentation](https://jfrog.com/help/r/jfrog-artifactory-documentation)

---

