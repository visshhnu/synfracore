# EKS — Portfolio Projects

Build these projects to demonstrate real skills to employers. Each project is designed to be interview-worthy — something you can walk through in detail.

## Project 1: EKS Architecture Design

**Level:** Beginner | **Time:** 2 days

Design and deploy a basic 3-tier application using EKS services. Includes networking, compute, database, and basic security.

### Steps

1. Draw the architecture diagram first (use draw.io or Excalidraw)
2. Set up EKS environment with IaC (Terraform or CloudFormation)
3. Deploy the networking layer (VPC/VNet, subnets, security groups)
4. Add compute resources and deploy a sample web app
5. Configure a managed database service
6. Apply security best practices (IAM, encryption, no public access)

### Skills Demonstrated

- EKS core services
- IaC
- Cloud security basics

### GitHub Repo Name

`aws-eks-3tier-architecture`

---

## Project 2: Autoscaling API on EKS Fargate

**Level:** Intermediate | **Time:** 3 days

Build a REST API deployed to EKS running entirely on Fargate — no EC2 worker nodes to manage, pods scale on demand, and you're billed per-pod vCPU/memory rather than per idle node.

### Steps

1. Design the API: endpoints, request/response formats
2. Create a Fargate profile scoped to the API's namespace (`aws eks create-fargate-profile`)
3. Deploy the app as a standard Kubernetes Deployment + Service — no node group required for these pods
4. Add a managed database/storage backend (RDS or DynamoDB) reached via IRSA, not stored credentials
5. Configure Horizontal Pod Autoscaler (HPA) so pod count scales with real traffic
6. Load test and compare cost against an equivalent EC2-managed-node-group deployment

### Skills Demonstrated

- Fargate profiles and serverless Kubernetes pods
- IRSA for database access
- Cost/autoscaling tradeoffs vs managed node groups

### GitHub Repo Name

`aws-eks-fargate-api`

---

## Project 3: Cost-Optimized EKS Platform

**Level:** Advanced | **Time:** 5 days

Design and implement a production platform on EKS optimized for both reliability and cost. Implement HA, DR, monitoring, and cost management.

### Steps

1. Analyze requirements: availability target, RTO/RPO, budget
2. Design multi-AZ/region architecture for high availability
3. Implement auto-scaling for all compute tiers
4. Set up centralized logging, monitoring, and alerting
5. Implement backup and disaster recovery automation
6. Track costs with budgets and alerts
7. Optimize: use Reserved Instances/Savings Plans, right-size

### Skills Demonstrated

- HA/DR design
- Cost optimization
- Enterprise operations

### GitHub Repo Name

`aws-eks-production-platform`

---

## Tips for Great Projects

**Make it real.** Solve an actual problem, even a small one. "Built a Kubernetes cluster to deploy my personal blog" is more impressive than a tutorial clone.

**Document everything.** A repo with a great README beats one with better code but no explanation. Include: what it does, why you built it, how to run it, what you learned.

**Show your thinking.** In interviews, you'll be asked: "Why did you choose X over Y?" Have a reason. Architecture decisions matter.

**Iterate publicly.** Make commits regularly. Employers look at commit history. 10 commits over a week shows real work; 1 commit with everything shows you copied it.

## Portfolio Checklist

- [ ] 3+ projects on GitHub with clear READMEs  
- [ ] At least 1 project with CI/CD (GitHub Actions pipeline)
- [ ] At least 1 project that solves a real problem
- [ ] Each project has an architecture diagram
- [ ] Projects are pinned on your GitHub profile
