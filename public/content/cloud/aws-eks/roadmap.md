# AWS EKS — Learning Roadmap

## Estimated Time to Job-Ready
**6-8 weeks** of consistent learning (2-3 hours/day), assuming baseline Kubernetes fluency already — without that baseline, expect closer to 9-11 weeks since you're learning Kubernetes itself and EKS's specific AWS integration simultaneously.

## Phase 1: Foundation (Week 1-2)

- What AWS actually manages: the control plane (API server, etcd, scheduler) runs across multiple AZs, patched and upgraded by AWS on a schedule you approve — you're billed a per-cluster control-plane fee plus worker node costs
- Creating a cluster and connecting via `kubectl` — the same client tooling as any Kubernetes cluster, since EKS doesn't change the client-facing API
- EC2 managed node groups vs. Fargate profiles — the real tradeoff between managing worker node infrastructure yourself and running pods with no node management at all
- `aws-auth` ConfigMap (or the newer EKS access entries) for mapping IAM identities to Kubernetes RBAC — the bridge between AWS identity and in-cluster authorization

**Checkpoint:** can you explain what AWS actually operates for you in EKS versus what you're still responsible for — where exactly does "managed" stop?

## Phase 2: Identity and Networking (Week 2-4)

- IRSA (IAM Roles for Service Accounts): how a pod assumes a specific IAM role scoped to its Kubernetes ServiceAccount via OIDC federation, with no long-lived AWS credentials ever stored in the cluster
- VPC CNI: pods get real VPC IP addresses (unlike some other Kubernetes networking models), and why this means genuine VPC IP address planning matters for cluster sizing
- Load balancer integration: the AWS Load Balancer Controller provisioning real ALBs/NLBs from Kubernetes Ingress/Service resources
- Security groups for pods, as a more granular alternative to node-level security groups for genuinely sensitive workloads

**Checkpoint:** can you explain why IRSA is preferred over storing an IAM user's access keys as a Kubernetes Secret, and what OIDC federation is actually doing to make that possible?

## Phase 3: Scaling and Operations (Week 4-6)

- Cluster Autoscaler (adding/removing nodes based on unschedulable pods) vs. Horizontal Pod Autoscaler (adding/removing pod replicas) — genuinely different scaling dimensions, and Karpenter as the increasingly common modern alternative to Cluster Autoscaler
- EKS version upgrades: the real operational discipline of staying current, since AWS only supports a limited window of Kubernetes versions at a time
- Fargate vs. managed node groups for a given workload — cost, cold-start, and operational-overhead tradeoffs, not a default choice
- Complete Portfolio Project 1 (cluster with IRSA) and Project 2 (Fargate autoscaling API)

**Checkpoint:** given a workload with unpredictable, spiky traffic, can you reason through whether Fargate or a managed node group with Cluster Autoscaler fits better, and why?

## Phase 4: Production Readiness and Interview Readiness (Week 6-8)

- Multi-AZ node group design for genuine high availability, not just running in one AZ and calling it done
- Observability: Container Insights or a self-managed logging/metrics stack, and what EKS surfaces automatically versus what needs application-level instrumentation
- Cost optimization: Spot node groups for interruption-tolerant workloads, right-sizing based on real utilization, and the per-cluster control plane fee as a fixed cost independent of node count
- Complete Portfolio Project 3 (multi-AZ platform with Cluster Autoscaler) and review this course's Interview Q&A material, particularly IRSA and Fargate-vs-node-group questions

## Common Pitfalls Specific to EKS

- **Storing AWS credentials in a Kubernetes Secret instead of using IRSA** — this is one of the most commonly flagged EKS security anti-patterns in real interviews and real audits
- **Running everything in a single AZ node group** — this defeats the actual availability benefit of AWS's multi-AZ control plane
- **Letting EKS version upgrades lapse** — AWS's supported-version window is real and limited; falling too far behind compounds into a much riskier single upgrade later
- **Choosing Fargate or managed node groups by default without comparing cost/latency for the actual workload** — each fits genuinely different workload shapes

## Getting Your First EKS-Heavy Role

1. **Portfolio:** the 3 projects in this course's Projects section, each demonstrating a different core EKS skill (IRSA-based identity, Fargate serverless pods, multi-AZ production operations)
2. **Resume:** be specific — "migrated pod-to-AWS-service authentication from stored access keys to IRSA across 12 microservices, eliminating long-lived credentials" is far stronger than "experience with EKS"
3. **Know Kubernetes fundamentals independently of EKS:** interviewers will test general Kubernetes knowledge (pods, deployments, services) alongside EKS-specific AWS integration questions
4. **Certifications, if pursuing one:** EKS is covered in AWS Solutions Architect and DevOps Engineer certifications; CKA (vendor-neutral) is also highly relevant — see this course's own Certification Guide for current format and pricing
