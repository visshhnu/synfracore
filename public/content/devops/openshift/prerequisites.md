# OpenShift OCP 4.x — Prerequisites

## What to Know Before Starting OpenShift

OpenShift is Kubernetes, plus a genuinely large layer of Red Hat-specific tooling and constraints on top — solid vanilla Kubernetes knowledge is the real prerequisite, since most of this guide is framed as "how OCP differs from what you already know."

## Required (Must Have)

### 1. Solid Kubernetes Fundamentals
```bash
kubectl get pods, kubectl apply -f, kubectl describe
```
Every module in this guide is a direct comparison to standard Kubernetes (Routes vs. Ingress, SCC vs. PodSecurityPolicy, `oc` vs. `kubectl`, DeploymentConfig vs. Deployment) — without solid vanilla K8s knowledge first, the comparisons have nothing to anchor to.

### 2. Basic Enterprise/Compliance Context Awareness
- Why an organization might choose a supported, vendor-backed Kubernetes distribution over self-managed vanilla Kubernetes
- Basic awareness that licensing/support models exist and factor into infrastructure decisions at enterprise scale

### 3. Comfort With CLI-Driven Workflows
The `oc` CLI is a superset of `kubectl` — you'll be typing commands, not click-driving a UI, for most of this guide's hands-on material.

## Nice to Have (Speeds Up Learning)

### Prior Exposure to a Managed Kubernetes Platform (EKS/GKE/AKS)
Having seen how a managed platform layers its own tooling and constraints on top of vanilla Kubernetes (IAM integration, managed node groups) makes OCP's own layering (SCCs, Routes, the Operator framework) feel like a familiar pattern rather than an entirely new paradigm.

### Basic Operator Pattern Understanding
OLM (Operator Lifecycle Manager) and the broader Operator framework are central to how OCP manages both itself and installed applications — prior exposure to the Kubernetes Operator pattern generally (even outside OpenShift) speeds this up significantly.

### Red Hat/Enterprise Linux Familiarity (Optional)
Not required, but OCP's underlying node OS (RHEL CoreOS) and the Machine Config Operator's role managing it will connect to real concepts faster with any RHEL background.

## What You Do NOT Need

- Prior OpenShift-specific experience
- A paid OpenShift subscription — the Red Hat Developer Sandbox and `crc` (OpenShift Local) provide free ways to practice hands-on
- Deep Ansible or bare-metal installation expertise — this guide focuses on OCP as a platform, not writing your own installer automation

## Time Estimate

If you have the prerequisites above:
- Fundamentals: 2-3 days
- Intermediate + Advanced: 1-2 weeks
- Job-ready (comfortable with SCCs, Routes, the Operator framework, and day-2 operations): 3-4 weeks

## Start Here

Go to the **Installation** section to set up a practice OpenShift environment, then proceed to **Fundamentals**.
