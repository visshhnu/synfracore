# Azure Kubernetes Service (AKS) — Learning Roadmap

## Estimated Time to Job-Ready
**6-8 weeks** of consistent learning (2-3 hours/day), assuming baseline Kubernetes fluency already — AKS-specific material is genuinely quick to add on top of core Kubernetes knowledge; without that baseline, expect closer to 9-11 weeks since you're learning Kubernetes itself and Azure's specific integration simultaneously.

## Phase 1: Foundation (Week 1-2)

- What AKS actually manages for you: the control plane (API server, etcd, scheduler) is free and Microsoft-operated; you bring and pay for worker nodes
- Creating a cluster via CLI/Portal and connecting with `kubectl` — the same tooling as any Kubernetes cluster, since AKS doesn't change the client-facing API
- Node pools: system node pools (running cluster-critical components) vs. user node pools (running your workloads), and why separating them is standard practice
- Microsoft Entra ID integration for cluster authentication, distinct from Kubernetes' own RBAC for in-cluster authorization

**Checkpoint:** can you explain what Microsoft actually operates for you in AKS versus what you're still responsible for — where exactly does "managed" stop?

## Phase 2: Networking and Identity (Week 2-4)

- Network models: kubenet (simpler, NAT-based) vs. Azure CNI (pods get real VNet IPs) — and the real tradeoff each makes in IP address consumption vs. networking simplicity
- Azure Container Registry (ACR) integration for pulling images without managing separate registry credentials
- Workload Identity (the current recommended pattern) for letting pods authenticate to Azure services without embedded credentials, and why this replaced the older pod-identity approaches
- Ingress options (Application Gateway Ingress Controller, NGINX ingress) for routing external traffic into the cluster

**Checkpoint:** can you explain the real tradeoff between kubenet and Azure CNI in terms of IP address planning, not just "CNI is more advanced"?

## Phase 3: Scaling and Operations (Week 4-6)

- Cluster Autoscaler (adding/removing nodes) vs. Horizontal Pod Autoscaler (adding/removing pod replicas) — genuinely different scaling dimensions that are often confused
- AKS upgrade strategy: node image upgrades vs. Kubernetes version upgrades, and why staying current matters for both security and supported-version constraints
- Azure Monitor for containers as the standard observability integration, and what it actually surfaces versus what still needs application-level instrumentation
- Multiple node pools for workload isolation (e.g. a GPU node pool for ML workloads separate from general application node pools)

**Checkpoint:** given a cluster under memory pressure where existing pods are being evicted, can you reason about whether Cluster Autoscaler or HPA (or both) is the relevant fix?

## Phase 4: Security and Interview Readiness (Week 6-8)

- Azure Policy for AKS (governance/compliance guardrails applied to the cluster) as the Azure-native equivalent to Kubernetes admission controllers
- Private clusters (API server not exposed to the public internet) for workloads with genuine network-isolation requirements
- Cost management: node pool right-sizing, spot node pools for interruption-tolerant workloads, and the real tradeoff spot nodes make
- Review this course's Interview Q&A material, particularly the managed-vs-self-managed control plane and networking model questions

## Common Pitfalls Specific to AKS

- **Choosing kubenet by default without considering IP exhaustion at scale** — Azure CNI's real IP-per-pod consumption needs genuine VNet address space planning that kubenet avoids, but Azure CNI is often required for certain networking features
- **Running everything in the default system node pool** — mixing cluster-critical components with arbitrary application workloads makes both harder to reason about and scale independently
- **Treating cluster upgrades as optional** — falling behind on both node image and Kubernetes version upgrades compounds into a much riskier, harder single upgrade later
- **Using older pod-identity patterns instead of Workload Identity** — the ecosystem has moved to Workload Identity as the current recommended approach; older material may still show deprecated patterns

## Getting Your First AKS-Heavy Role

1. **Portfolio:** a project demonstrating real multi-node-pool design (e.g. separating system and application workloads) with a documented autoscaling test, not just a default single-pool cluster
2. **Resume:** be specific — "migrated pod-to-Azure-service authentication from embedded service principal credentials to Workload Identity, eliminating a long-lived credential" is far stronger than "experience with AKS"
3. **Know Kubernetes fundamentals independently of AKS:** interviewers will often test general Kubernetes knowledge (pods, deployments, services) alongside AKS-specific integration questions
4. **Certifications, if pursuing one:** AKS is covered in Azure Administrator Associate and Kubernetes-focused certifications (CKA is vendor-neutral but highly relevant) — see this course's own Certification Guide for current format and pricing
