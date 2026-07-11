# Multi-Cloud Strategy — Intermediate

## The tools that actually make multi-cloud manageable

Multi-cloud's real operational cost (Overview) is mitigated, not eliminated, by a specific set of abstraction tools:

- **Terraform**: abstracts cloud APIs behind one common configuration language — a team learns HCL and Terraform's workflow once, then applies that same skill set across AWS, Azure, and GCP, rather than needing deep native tooling fluency (CloudFormation, ARM/Bicep, Deployment Manager) in each separately.
- **Kubernetes**: the same manifests deploy to EKS, AKS, or GKE with minimal, provider-specific changes (mostly around storage classes and load balancer annotations) — the workload definition itself is portable in a way a cloud-specific compute service (Lambda, Azure Functions, Cloud Functions) fundamentally isn't.
- **Crossplane**: extends Kubernetes further, letting you provision actual cloud resources (a managed database, a message queue) using Kubernetes-native YAML and the same GitOps/reconciliation model you already use for application workloads — infrastructure provisioning and application deployment through one consistent control plane.
- **Unified observability** (Datadog, or Prometheus federation across clusters): without this, you're maintaining separate monitoring stacks and separate on-call runbooks per cloud, which compounds the operational overhead multi-cloud already introduces.

## Good reasons to actually go multi-cloud

- **Avoiding vendor lock-in for genuinely critical infrastructure** — a defensible reason specifically when the cost of being fully dependent on one provider's availability/pricing/roadmap decisions is high enough to justify the real complexity multi-cloud adds.
- **Best-of-breed service selection** — using GCP's BigQuery for analytics while running primary infrastructure on Azure/AKS, because BigQuery is genuinely the strongest option for that specific need, not out of a generic desire to "not depend on one vendor."
- **Regulatory data-residency requirements** — when a legal/compliance requirement mandates certain data stay within a specific provider's regions in a specific jurisdiction, and no single provider covers every required jurisdiction.

## The bad reason, stated directly: "just in case"

Adopting multi-cloud without one of the above concrete drivers — purely as generic risk hedging — trades a real, ongoing operational cost (multiple platforms to secure, monitor, and staff for) against a hypothetical, unquantified future benefit. This is a genuinely common, real mistake: the complexity cost is certain and immediate; the risk it hedges against is often speculative. A defensible multi-cloud decision should be able to name the specific risk or requirement driving it, not just gesture at "resilience" abstractly.

## Consistency vs. best-of-breed: the actual tradeoff to navigate

Standardizing on one provider's native services (deep AWS integration, for instance) gets you tighter integration, often lower cost (egress fees alone can be significant for cross-cloud data movement), and one platform's worth of expertise to build deeply rather than spreading thin. Multi-cloud's best-of-breed approach trades that consistency for access to each provider's individually strongest offerings — worth it specifically when a particular service's capability gap between providers is large enough to matter for your actual workload, not as a default philosophy applied uniformly.

## Data egress costs: the multi-cloud tax that's easy to underestimate

Moving data *between* cloud providers (not just within one) incurs real, often substantial egress charges that don't apply to same-provider, same-region traffic. A multi-cloud architecture that frequently moves data across provider boundaries (rather than keeping data locality aligned with where it's actually processed) can accumulate meaningful, recurring cost that's easy to miss in initial architecture planning and only becomes visible once real production traffic volume hits it — worth modeling explicitly before committing to a cross-cloud data flow pattern, not discovering after the first real bill.
