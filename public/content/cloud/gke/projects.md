# GKE — Portfolio Projects

Build these projects to demonstrate real skills to employers. Each project is designed to be interview-worthy — something you can walk through in detail.

## Project 1: GKE Architecture Design

**Level:** Beginner | **Time:** 2 days

Design and deploy a basic 3-tier application using GKE services. Includes networking, compute, database, and basic security.

### Steps

1. Draw the architecture diagram first (use draw.io or Excalidraw)
2. Set up the GKE environment with IaC (Terraform is the common choice on GCP)
3. Deploy the networking layer (VPC, subnets, firewall rules)
4. Add compute resources and deploy a sample web app
5. Configure a managed database service (e.g. Cloud SQL)
6. Apply security best practices (IAM, encryption, no public access)

### Skills Demonstrated

- GKE core services
- IaC
- Cloud security basics

### GitHub Repo Name

`gke-3tier-architecture`

---

## Project 2: REST API on GKE Autopilot

**Level:** Intermediate | **Time:** 3 days

Build a REST API deployed on GKE Autopilot mode — no node management, billed per Pod resource request rather than per idle VM. (Note: this is *not* the same billing/scaling model as Cloud Run's true pay-per-request, scale-to-zero serverless — see the Cloud Run academy for that comparison. Autopilot still keeps your Pods running continuously; it just removes node-level ops.)

### Steps

1. Design the API: endpoints, request/response formats
2. Deploy to a GKE Autopilot cluster with resource requests set on every container
3. Add a managed database/storage backend (e.g. Cloud SQL, Firestore)
4. Implement authentication and authorization
5. Set up CI/CD for automated deployments
6. Load test with the Horizontal Pod Autoscaler enabled and optimize for cost

### Skills Demonstrated

- Autopilot resource-request sizing
- API design
- Cost optimization

### GitHub Repo Name

`gke-autopilot-api`

---

## Project 3: Cost-Optimized GKE Platform

**Level:** Advanced | **Time:** 5 days

Design and implement a production platform on GKE optimized for both reliability and cost. Implement HA, DR, monitoring, and cost management.

### Steps

1. Analyze requirements: availability target, RTO/RPO, budget
2. Design multi-AZ/region architecture for high availability
3. Implement auto-scaling for all compute tiers
4. Set up centralized logging, monitoring, and alerting
5. Implement backup and disaster recovery automation
6. Track costs with budgets and alerts
7. Optimize: use Committed Use Discounts and Spot VMs where workloads tolerate interruption, right-size node pools

### Skills Demonstrated

- HA/DR design
- Cost optimization
- Enterprise operations

### GitHub Repo Name

`gke-production-platform`

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
