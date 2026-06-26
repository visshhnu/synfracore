# AWS Complete Guide

Cloud › AWS
**AWS**
BeginnerEngineerProductionArchitectAmazon Web Services — core services, VPC, IAM, EKS, cost optimisation
[Regions & AZs](#sec-regions)[IAM](#sec-iam)[VPC](#sec-vpc)[EC2](#sec-ec2)[S3](#sec-s3)[EKS](#sec-eks)[Cost](#sec-cost)[Interview Q&A](#sec-interview)[Roadmap](#sec-roadmap)


## 🌍 AWS Global Infrastructure›


#### What is a Region and Availability Zone?

AWS has 33+ Regions globally. Each Region is an independent geographic area with its own electricity, cooling, and networking. Each Region contains 2-6 **Availability Zones (AZs)**. An AZ is one or more physical data centres with independent power and connectivity, connected to other AZs in the same region via private high-bandwidth links.


**Why this matters for architecture:** Deploying across 2+ AZs gives you automatic resilience. If one AZ goes down (fire, power failure), your application keeps running in the others. Deploying across 2+ Regions protects against regional failures and lets you serve users with lower latency.


| Region | Code | Common use |
|---|---|---|
| Mumbai | ap-south-1 | Indian companies, low latency for India |
| N. Virginia | us-east-1 | Default, cheapest, all services available first |
| Singapore | ap-southeast-1 | Southeast Asia |
| Ireland | eu-west-1 | Europe, GDPR-compliant |


Regions and AZ commandsCopy

```

```


## 🔐 IAM — Identity and Access Management›


#### The Most Important AWS Concept

IAM controls who can do what to which AWS resources. Every API call to AWS is authenticated (who are you?) and authorised (are you allowed to do this?). Getting IAM wrong is the #1 cause of AWS security incidents.


#### IAM Concepts

| Concept | What it is | When to use |
|---|---|---|
| User | Long-term identity with permanent credentials | Only when roles impossible. Always enforce MFA. |
| Role | Temporary credentials assumed by services or users | EC2, Lambda, EKS pods, cross-account — everything |
| Group | Collection of users | Organise humans by team. Attach policies to group. |
| Policy | JSON document: what actions on what resources | Attach to user, group, or role |
| IRSA | IAM role for Kubernetes service account (EKS) | Give pods AWS access without stored keys |


#### Policy Evaluation Logic

By default: everything is DENIED. An explicit DENY always overrides an ALLOW (even from another policy). Only an explicit ALLOW grants access. For cross-account: BOTH the resource policy and the identity policy must allow the action.


IAM policies, roles, and IRSACopy

```

```


## 🌐 VPC — Virtual Private Cloud›


#### What is a VPC?

A VPC is your private network inside AWS. All AWS resources (EC2, RDS, EKS) run inside a VPC. You control: IP address ranges, subnets, routing, and firewalls. Nothing is reachable from the internet unless you explicitly allow it.


#### Key Components

| Component | Purpose |
|---|---|
| Subnet | Subdivision of VPC in one AZ. Public = has internet route. Private = no direct internet. |
| Internet Gateway | Allows public subnets to reach internet. One per VPC. |
| NAT Gateway | Allows private subnets to initiate internet connections (for updates etc) without being reachable from internet. |
| Security Group | Stateful firewall at instance level. Allow rules only. |
| NACL | Stateless firewall at subnet level. Allow and deny rules. |
| VPC Peering | Connect two VPCs privately (no internet). Non-transitive. |
| VPC Endpoint | Access AWS services (S3, DynamoDB) without internet traffic. Saves NAT cost. |


Production VPC designCopy

```

```


## 💻 EC2 — Compute›


#### Choosing the Right Instance Type

Instance family tells you what it is optimised for. Size (small/medium/large/xlarge) tells you how much. Always start with general purpose (m6i), then right-size based on metrics after 2 weeks in production.


EC2 launch + Spot + SSMCopy

```

```


## 🪣 S3 — Object Storage›


#### S3 Fundamentals

S3 is object storage — you store objects (files) identified by a key (path). Not a filesystem. Infinitely scalable, 11 nines durability (99.999999999%). Used for: backups, static websites, data lakes, application artifacts, logs, container images (ECR), Terraform state.


#### S3 vs EBS vs EFS

|  | S3 | EBS | EFS |
|---|---|---|---|
| Type | Object storage | Block storage | File system |
| Access | HTTP API | One EC2 at a time | Multiple instances |
| Use for | Backups, static files, data lake | OS disk, databases | Shared content across instances |
| Latency | ms (network) | Sub-ms (local) | ms (network) |


S3 best practices + securityCopy

```

```


## ☸️ EKS — Kubernetes on AWS›


#### What is EKS?

EKS is AWS's managed Kubernetes service. AWS manages the control plane (API server, etcd, scheduler) — you never touch master nodes. You manage worker nodes (EC2 instances or Fargate). The same kubectl commands work on EKS as on any Kubernetes cluster.


#### EKS vs ECS vs Fargate

|  | EKS | ECS | Fargate |
|---|---|---|---|
| What it is | Managed Kubernetes | AWS-native container orchestration | Serverless containers (no node management) |
| Learning curve | High (K8s knowledge needed) | Medium (AWS-specific) | Low |
| Use when | Team knows K8s, multi-cloud, complex | AWS-only, simpler needs | No node management wanted |


EKS setup + storage + load balancersCopy

```

```


## 💰 Cost Optimisation›


#### Where AWS Cost Goes — and How to Reduce It

| Cost Driver | Savings Strategy | Typical Saving |
|---|---|---|
| EC2 (on-demand) | Spot for stateless, Savings Plans, Graviton instances | 40-70% |
| RDS | Reserved instances (1-year), right-size, stop dev instances overnight | 30-50% |
| NAT Gateway | VPC endpoints for S3/DynamoDB traffic | 20-40% |
| S3 | Lifecycle policies to Glacier, S3 Intelligent-Tiering | 50-80% |
| Data Transfer | CloudFront for CDN, same-region replication, compress payloads | 30-60% |


Cost optimisation commandsCopy

```

```


## ☸️ EKS — Deep Dive for Production›


#### EKS architecture vs AKS — key differences to know

|  | AWS EKS | Azure AKS |
|---|---|---|
| Control plane cost | $0.10/hr per cluster ($73/month) — you pay for it | Free — Azure manages for free |
| Node identity | IAM Roles for Service Accounts (IRSA) | Workload Identity (Azure AD federation) |
| Node types | Managed Node Groups, Self-managed, Fargate | Node Pools (system + user) |
| Networking | VPC CNI — pods get VPC IPs | Azure CNI — pods get VNet IPs |
| Load Balancer | AWS Load Balancer Controller creates ALB/NLB | AGIC creates Application Gateway |
| Storage | EBS CSI driver, EFS CSI driver | Azure Disk CSI, Azure Files CSI |


#### IRSA — IAM Roles for Service Accounts

IRSA is the AWS equivalent of Azure Workload Identity. It links a Kubernetes ServiceAccount to an IAM Role, allowing pods to access AWS services (S3, DynamoDB, Secrets Manager) without any stored credentials.


```
# 1. Create IAM OIDC provider for the EKS cluster
eksctl utils associate-iam-oidc-provider --cluster myeks --approve

# 2. Create IAM role with trust policy for the ServiceAccount
eksctl create iamserviceaccount   --name payment-service-sa   --namespace production   --cluster myeks   --attach-policy-arn arn:aws:iam::123456789:policy/PaymentServicePolicy   --approve

# 3. Pod uses the ServiceAccount — gets AWS credentials automatically
# No access keys stored anywhere
```


#### Fargate for EKS — serverless nodes

Fargate eliminates node management — each pod runs on a dedicated micro-VM. You define Fargate profiles: which namespaces/labels use Fargate vs managed node groups. Best for: burst workloads, batch jobs, dev/test environments where you don't want to manage nodes. Not suitable for: DaemonSets (cannot run on Fargate), privileged pods, GPU workloads.


#### EKS add-ons — managed cluster components

| Add-on | What it does |
|---|---|
| CoreDNS | DNS for service discovery inside cluster |
| kube-proxy | Network rules on each node |
| VPC CNI | Pod networking with VPC IPs |
| EBS CSI Driver | Dynamic persistent volume provisioning with EBS |
| AWS Load Balancer Controller | Creates ALB for Ingress, NLB for Service type LoadBalancer |


## ⚡ AWS Lambda and Serverless Architecture›


#### Lambda — the key concepts

Lambda runs your code in response to events without you managing any servers. You deploy a function (Python, Node.js, Java, Go, etc.), configure what triggers it, and AWS scales it from 0 to thousands of instances automatically.


| Concept | Explanation |
|---|---|
| Trigger | What invokes the function: API Gateway (HTTP), S3 event (file upload), SQS message, EventBridge schedule (cron), DynamoDB stream |
| Execution environment | Isolated container, 512MB-10GB memory, up to 15 minutes runtime, ephemeral /tmp storage |
| Cold start | First invocation after idle period: container initialised = 100ms-3s latency. Mitigate with Provisioned Concurrency. |
| Concurrency | Each concurrent request gets its own execution environment. Default limit: 1000 concurrent per region. |
| Pricing | Pay per invocation ($0.20 per million) + duration (per GB-second). First 1 million requests/month free. |


#### Lambda in DevOps — common uses


- **Automated remediation** — CloudWatch alarm triggers Lambda which restarts an ECS service or scales up capacity

- **CI/CD webhook processor** — API Gateway receives GitHub webhook, Lambda triggers CodePipeline

- **Scheduled maintenance** — EventBridge cron triggers Lambda to stop dev environments at night

- **Log processing** — S3 event triggers Lambda to process and forward logs to Elasticsearch

- **Slack/Teams bot** — API Gateway + Lambda handles slash commands from your ops chat


## 🔄 AWS CI/CD — CodePipeline and GitHub Actions›


#### AWS native CI/CD stack

| Service | Role | Equivalent |
|---|---|---|
| CodeCommit | Managed Git repository | GitHub, Azure Repos |
| CodeBuild | Managed build service — run tests, build Docker images | Jenkins, GitHub Actions runner |
| CodeDeploy | Deployment service — rolling, canary, blue/green deployments to EC2, ECS, Lambda | Octopus Deploy, Spinnaker |
| CodePipeline | Orchestrates the full CI/CD workflow — source → build → test → deploy | Azure DevOps, Jenkins Pipeline |
| ECR | Private Docker image registry | ACR, Docker Hub |


#### GitHub Actions to EKS — OIDC authentication (no stored credentials)

```
name: Deploy to EKS
on:
push:
branches: [main]

permissions:
id-token: write   # REQUIRED for OIDC
contents: read

jobs:
deploy:
runs-on: ubuntu-latest
steps:
- uses: actions/checkout@v3

- name: Configure AWS credentials (OIDC — no secrets stored)
uses: aws-actions/configure-aws-credentials@v4
with:
role-to-assume: arn:aws:iam::123456789:role/GitHubActionsEKSRole
aws-region: us-east-1

- name: Login to ECR
run: aws ecr get-login-password | docker login --username AWS --password-stdin 123456789.dkr.ecr.us-east-1.amazonaws.com

- name: Build and push
run: |
docker build -t myapp:${{ github.sha }} .
docker push 123456789.dkr.ecr.us-east-1.amazonaws.com/myapp:${{ github.sha }}

- name: Deploy to EKS
run: |
aws eks update-kubeconfig --name myeks --region us-east-1
helm upgrade --install myapp ./charts/myapp           --set image.tag=${{ github.sha }} --atomic --wait
```


## 🛡️ AWS High Availability and Disaster Recovery›


#### HA design principles on AWS

| Pattern | What it means | AWS implementation |
|---|---|---|
| Multi-AZ | Run across multiple Availability Zones in one region | RDS Multi-AZ, ALB across AZs, EKS nodes in multiple AZs |
| Multi-Region Active-Passive | Primary region active, secondary on standby. Failover on disaster. | Route53 health checks + failover routing, RDS read replica in secondary region |
| Multi-Region Active-Active | Both regions serve traffic simultaneously | Route53 latency routing, DynamoDB Global Tables, S3 Cross-Region Replication |


#### RTO and RPO — the two DR metrics


- **RTO** (Recovery Time Objective) — how long can the business be down? "We must be back online within 4 hours." Drives: how fast your failover automation must work.

- **RPO** (Recovery Point Objective) — how much data can we lose? "We cannot lose more than 15 minutes of transactions." Drives: how frequently you must backup/replicate.


#### DR strategies by cost and RTO

| Strategy | RTO | Cost | How |
|---|---|---|---|
| Backup & Restore | Hours | Low | S3 backups, restore from scratch when disaster strikes |
| Pilot Light | 30-60 min | Medium | Core DB running in secondary region, scale out compute on failover |
| Warm Standby | Minutes | High | Scaled-down running copy in secondary, scale up on failover |
| Active-Active | Seconds | 2x | Full capacity in both regions, instant failover via DNS |


## 🎯 Interview Questions›


All
Architect
Engineer
Production


AWS · ARCHITECT
Design a production-grade VPC architecture for a 3-tier application on AWS.
Three-tier VPC with public, private-app, and private-data subnets across 3 AZs. VPC CIDR 10.0.0.0/16 giving 65,536 IPs. Public subnets host: Application Load Balancer (inbound 443 from 0.0.0.0/0), NAT Gateways (one per AZ for HA), Bastion host (if needed). Private app subnets host EKS nodes and EC2 — they route outbound traffic through NAT Gateway. Priv
