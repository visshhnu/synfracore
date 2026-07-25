# AWS EKS — Portfolio Projects

Build these projects to demonstrate real skills to employers. Each project is designed to be interview-worthy — something you can walk through in detail.

## Project 1: EKS Cluster from Scratch with IRSA

**Level:** Beginner-Intermediate | **Time:** 2 days

Stand up a real EKS cluster and connect a pod to an AWS service the right way — no long-lived credentials.

### Steps

1. Provision an EKS cluster and a managed node group via Terraform or `eksctl` (not the console, so the setup is reproducible)
2. Deploy a simple application that needs to read from an S3 bucket or DynamoDB table
3. Set up IRSA (IAM Roles for Service Accounts) so the pod assumes a scoped IAM role via its Kubernetes ServiceAccount — no access keys stored anywhere
4. Confirm in the AWS console that the pod's actual permissions match exactly what IRSA granted, not more
5. Write a README explaining why IRSA is preferred over storing AWS credentials as a Kubernetes Secret

### Skills Demonstrated

- Real EKS cluster provisioning via IaC
- IRSA for credential-free pod-to-AWS-service authentication
- Understanding exactly what AWS manages (control plane) vs. what you manage (data plane)

### GitHub Repo Name

`eks-cluster-irsa`

---

## Project 2: Autoscaling API on EKS Fargate

**Level:** Intermediate | **Time:** 3 days

Build a REST API deployed to EKS running entirely on Fargate — no EC2 worker nodes to manage, pods scale on demand, billed per-pod vCPU/memory rather than per idle node.

### Steps

1. Design the API: endpoints, request/response formats
2. Create a Fargate profile scoped to the API's namespace (`aws eks create-fargate-profile`)
3. Deploy the app as a standard Kubernetes Deployment + Service — no node group required for these pods
4. Add a managed database/storage backend (RDS or DynamoDB) reached via IRSA, not stored credentials
5. Configure Horizontal Pod Autoscaler (HPA) so pod count scales with real traffic
6. Load test and compare cost against an equivalent EC2-managed-node-group deployment, with real numbers

### Skills Demonstrated

- Fargate profiles and serverless Kubernetes pods
- IRSA for database access
- Cost/autoscaling tradeoffs vs. managed node groups, backed by real measurement

### GitHub Repo Name

`eks-fargate-api`

---

## Project 3: Multi-AZ EKS Platform with Cluster Autoscaler

**Level:** Advanced | **Time:** 4-5 days

Design and implement a production-shaped EKS platform: real high availability, real autoscaling under load, real observability.

### Steps

1. Design a multi-AZ node group layout and explain why spreading nodes across AZs matters for actual availability, not just as a checkbox
2. Deploy the Cluster Autoscaler and configure it alongside HPA, then generate real load and document both scaling mechanisms actually triggering
3. Set up centralized logging (CloudWatch Container Insights or a self-managed EFK-style stack) and confirm logs from a pod restart are actually captured, not lost
4. Deliberately drain/terminate a node and confirm workloads reschedule correctly onto remaining capacity
5. Document cluster costs (control plane fee + node group costs) and one concrete optimization applied (Spot node group for interruption-tolerant workloads, right-sized instance types)

### Skills Demonstrated

- Real multi-AZ EKS architecture, not just a single-AZ demo cluster
- Cluster Autoscaler and HPA working together under genuine load
- Production-shaped observability and failure-recovery testing

### GitHub Repo Name

`eks-production-platform`

---

## Tips for Great EKS Projects

**Show what AWS manages vs. what you manage.** A strong EKS project makes clear which parts (control plane HA, etcd) are AWS's responsibility and which parts (node group design, IRSA, autoscaling config) are yours — conflating the two is a common sign of surface-level EKS knowledge.

**Use IRSA, not stored credentials.** Any project connecting a pod to another AWS service should demonstrate IRSA specifically — it's one of the most commonly checked EKS security practices in real interviews.

**Test failure, don't just configure it.** Draining a node or killing a pod and documenting what actually happened is far more convincing than a README claiming "highly available" with no evidence.

## Portfolio Checklist

- [ ] At least one project uses IRSA for pod-to-AWS-service authentication, with no stored credentials
- [ ] At least one project demonstrates real autoscaling (HPA and/or Cluster Autoscaler) triggered under actual load
- [ ] At least one project includes a documented failure-recovery test (node drain, pod kill)
- [ ] Each README explains the reasoning, not just the final configuration
- [ ] You can walk through any of these projects for 5+ minutes without notes
