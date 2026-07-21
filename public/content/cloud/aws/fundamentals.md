# AWS — Fundamentals

## AWS Global Infrastructure

AWS has 30+ Regions globally *(needs verification — exact count changes as AWS opens new regions)* and each Region is an independent geographic area with its own electricity, cooling, and networking, and contains 2-6 Availability Zones (AZs) — one or more physical data centres with independent power and connectivity, connected to other AZs in the same region via private high-bandwidth links.

**Why this matters for architecture:** deploying across 2+ AZs gives automatic resilience — if one AZ goes down (fire, power failure), the application keeps running in the others. Deploying across 2+ Regions protects against regional failures and lets you serve users with lower latency.

| Region | Code | Common use |
|---|---|---|
| Mumbai | ap-south-1 | Indian companies, low latency for India |
| N. Virginia | us-east-1 | Default, cheapest, all services available first |
| Singapore | ap-southeast-1 | Southeast Asia |
| Ireland | eu-west-1 | Europe, GDPR-compliant |

```bash
# List regions and their AZs
aws ec2 describe-regions --query 'Regions[].RegionName' --output table
aws ec2 describe-availability-zones --region ap-south-1 \
  --query 'AvailabilityZones[].ZoneName'
```

## IAM — Identity and Access Management

IAM controls who can do what to which AWS resources. Every API call to AWS is authenticated (who are you?) and authorised (are you allowed to do this?) — getting IAM wrong is the #1 cause of AWS security incidents.

| Concept | What it is | When to use |
|---|---|---|
| User | Long-term identity with permanent credentials | Only when roles are impossible; always enforce MFA |
| Role | Temporary credentials assumed by services or users | EC2, Lambda, EKS pods, cross-account — everything |
| Group | Collection of users | Organise humans by team; attach policies to the group |
| Policy | JSON document defining what actions on what resources | Attach to a user, group, or role |
| IRSA | IAM role for a Kubernetes service account (EKS) | Give pods AWS access without stored keys |

**Policy evaluation logic:** by default, everything is DENIED. An explicit DENY always overrides an ALLOW, even from another policy. Only an explicit ALLOW grants access. For cross-account access, BOTH the resource policy and the identity policy must allow the action.

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject", "s3:PutObject"],
      "Resource": "arn:aws:s3:::my-app-bucket/*"
    }
  ]
}
```

## VPC — Virtual Private Cloud

A VPC is your private network inside AWS. All AWS resources (EC2, RDS, EKS) run inside a VPC — you control IP address ranges, subnets, routing, and firewalls, and nothing is reachable from the internet unless you explicitly allow it.

| Component | Purpose |
|---|---|
| Subnet | Subdivision of a VPC in one AZ; public has an internet route, private does not |
| Internet Gateway | Allows public subnets to reach the internet — one per VPC |
| NAT Gateway | Lets private subnets initiate outbound internet connections without being reachable from it |
| Security Group | Stateful firewall at the instance level; allow rules only |
| NACL | Stateless firewall at the subnet level; allow and deny rules |
| VPC Peering | Connects two VPCs privately with no internet involved; non-transitive |
| VPC Endpoint | Access to AWS services (S3, DynamoDB) without internet traffic — saves NAT cost |

```bash
# A minimal production VPC — one public + one private subnet
aws ec2 create-vpc --cidr-block 10.0.0.0/16
aws ec2 create-subnet --vpc-id vpc-xxx --cidr-block 10.0.1.0/24  # public
aws ec2 create-subnet --vpc-id vpc-xxx --cidr-block 10.0.2.0/24  # private
aws ec2 create-internet-gateway
aws ec2 attach-internet-gateway --vpc-id vpc-xxx --internet-gateway-id igw-xxx
```

## EC2 — Compute

Instance family tells you what an instance is optimised for; size (small/medium/large/xlarge) tells you how much. Always start with a general-purpose type (m6i), then right-size based on real metrics after ~2 weeks in production.

```bash
# Launch an on-demand instance
aws ec2 run-instances --image-id ami-xxx --instance-type m6i.large \
  --key-name my-key --subnet-id subnet-xxx

# Launch a Spot instance — up to 90% cheaper, can be reclaimed with 2 min notice
aws ec2 run-instances --instance-market-options '{"MarketType":"spot"}' \
  --image-id ami-xxx --instance-type m6i.large

# Connect without opening SSH ports — Session Manager
aws ssm start-session --target i-xxxxxxxxxxxx
```

## S3 — Object Storage

S3 is object storage — objects (files) identified by a key (path), not a filesystem. It's infinitely scalable with 11 nines of durability (99.999999999%), used for backups, static websites, data lakes, application artifacts, logs, container images (ECR), and Terraform state.

| | S3 | EBS | EFS |
|---|---|---|---|
| Type | Object storage | Block storage | File system |
| Access | HTTP API | One EC2 at a time | Multiple instances |
| Use for | Backups, static files, data lake | OS disk, databases | Shared content across instances |
| Latency | ms (network) | Sub-ms (local) | ms (network) |

```bash
# Enforce encryption + block public access on a bucket
aws s3api put-bucket-encryption --bucket my-bucket \
  --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}'
aws s3api put-public-access-block --bucket my-bucket \
  --public-access-block-configuration BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true
```

## EKS — Kubernetes on AWS

EKS is AWS's managed Kubernetes service. AWS manages the control plane (API server, etcd, scheduler) — you never touch master nodes. You manage worker nodes (EC2 instances or Fargate), and the same `kubectl` commands work on EKS as on any Kubernetes cluster.

|  | EKS | ECS | Fargate |
|---|---|---|---|
| What it is | Managed Kubernetes | AWS-native container orchestration | Serverless containers (no node management) |
| Learning curve | High (K8s knowledge needed) | Medium (AWS-specific) | Low |
| Use when | Team knows K8s, multi-cloud, complex | AWS-only, simpler needs | No node management wanted |

```bash
eksctl create cluster --name my-cluster --region ap-south-1 \
  --nodegroup-name standard-workers --node-type m6i.large \
  --nodes 3 --nodes-min 1 --nodes-max 5
aws eks update-kubeconfig --name my-cluster --region ap-south-1
```

## Cost Optimisation

| Cost driver | Savings strategy | Typical saving |
|---|---|---|
| EC2 (on-demand) | Spot for stateless, Savings Plans, Graviton instances | 40-70% |
| RDS | Reserved instances (1-year), right-size, stop dev overnight | 30-50% |
| NAT Gateway | VPC endpoints for S3/DynamoDB traffic | 20-40% |
| S3 | Lifecycle policies to Glacier, Intelligent-Tiering | 50-80% |
| Data Transfer | CloudFront for CDN, same-region replication, compress payloads | 30-60% |

```bash
# Find the largest cost drivers via Cost Explorer
aws ce get-cost-and-usage --time-period Start=2026-06-01,End=2026-07-01 \
  --granularity MONTHLY --metrics "UnblendedCost" \
  --group-by Type=DIMENSION,Key=SERVICE
```

## EKS — Deep Dive for Production

|  | AWS EKS | Azure AKS |
|---|---|---|
| Control plane cost | Charged per cluster-hour *(needs verification — exact rate)* | Historically no separate charge *(needs verification — confirm current pricing)* |
| Node identity | IAM Roles for Service Accounts (IRSA) | Workload Identity (Azure AD federation) |
| Node types | Managed Node Groups, Self-managed, Fargate | Node Pools (system + user) |
| Networking | VPC CNI — pods get VPC IPs | Azure CNI — pods get VNet IPs |
| Load Balancer | AWS Load Balancer Controller creates ALB/NLB | AGIC creates Application Gateway |

**IRSA — IAM Roles for Service Accounts** links a Kubernetes ServiceAccount to an IAM Role, letting pods access AWS services (S3, DynamoDB, Secrets Manager) without any stored credentials.

```bash
# 1. Create an IAM OIDC provider for the EKS cluster
eksctl utils associate-iam-oidc-provider --cluster myeks --approve

# 2. Create an IAM role with a trust policy for the ServiceAccount
eksctl create iamserviceaccount \
  --name payment-service-sa --namespace production --cluster myeks \
  --attach-policy-arn arn:aws:iam::123456789:policy/PaymentServicePolicy \
  --approve

# 3. The pod uses the ServiceAccount and gets AWS credentials automatically —
# no access keys stored anywhere
```

**Fargate for EKS** eliminates node management — each pod runs on a dedicated micro-VM. Fargate profiles define which namespaces/labels use Fargate vs managed node groups. Best for burst workloads, batch jobs, and dev/test environments; not suitable for DaemonSets, privileged pods, or GPU workloads.

| Add-on | What it does |
|---|---|
| CoreDNS | DNS for service discovery inside the cluster |
| kube-proxy | Network rules on each node |
| VPC CNI | Pod networking with VPC IPs |
| EBS CSI Driver | Dynamic persistent volume provisioning with EBS |
| AWS Load Balancer Controller | Creates an ALB for Ingress, NLB for Service type LoadBalancer |

## AWS Lambda and Serverless Architecture

Lambda runs code in response to events without managing any servers — deploy a function (Python, Node.js, Java, Go, etc.), configure what triggers it, and AWS scales it from 0 to thousands of instances automatically.

| Concept | Explanation |
|---|---|
| Trigger | What invokes the function: API Gateway (HTTP), S3 event (file upload), SQS message, EventBridge schedule (cron), DynamoDB stream |
| Execution environment | Isolated container, configurable memory, up to 15 minutes runtime, ephemeral `/tmp` storage *(needs verification — exact memory min/max against current AWS Lambda docs)* |
| Cold start | First invocation after idle: roughly 100ms-3s latency to initialise the container — mitigated with Provisioned Concurrency *(needs verification — range varies heavily by runtime)* |
| Concurrency | Each concurrent request gets its own execution environment *(needs verification — exact default unreserved concurrency limit per region/account)* |
| Pricing | Pay per invocation plus duration (per GB-second) *(needs verification — exact per-million-request price and free-tier allowance)* |

**Lambda in DevOps:** automated remediation, where a CloudWatch alarm triggers a Lambda that restarts an ECS service or scales up capacity; a CI/CD webhook processor, where API Gateway receives a GitHub webhook and Lambda triggers CodePipeline; scheduled maintenance, where an EventBridge cron triggers Lambda to stop dev environments at night; log processing, where an S3 event triggers Lambda to forward logs to Elasticsearch; and a Slack/Teams bot, where API Gateway plus Lambda handles slash commands from an ops chat.

## AWS CI/CD — CodePipeline and GitHub Actions

| Service | Role | Equivalent |
|---|---|---|
| CodeCommit | Managed Git repository | GitHub, Azure Repos |
| CodeBuild | Managed build service — run tests, build Docker images | Jenkins, GitHub Actions runner |
| CodeDeploy | Deployment service — rolling, canary, blue/green | Octopus Deploy, Spinnaker |
| CodePipeline | Orchestrates source → build → test → deploy | Azure DevOps, Jenkins Pipeline |
| ECR | Private Docker image registry | ACR, Docker Hub |

```yaml
# GitHub Actions to EKS — OIDC authentication, no stored credentials
name: Deploy to EKS
on:
  push:
    branches: [main]
permissions:
  id-token: write   # required for OIDC
  contents: read
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Configure AWS credentials (OIDC)
        uses: aws-actions/configure-aws-credentials@v4
        with:
          role-to-assume: arn:aws:iam::123456789:role/GitHubActionsEKSRole
          aws-region: ap-south-1
      - name: Build and push
        run: |
          docker build -t myapp:${{ github.sha }} .
          docker push 123456789.dkr.ecr.ap-south-1.amazonaws.com/myapp:${{ github.sha }}
      - name: Deploy to EKS
        run: |
          aws eks update-kubeconfig --name myeks --region ap-south-1
          helm upgrade --install myapp ./charts/myapp \
            --set image.tag=${{ github.sha }} --atomic --wait
```

## AWS High Availability and Disaster Recovery

| Pattern | What it means | AWS implementation |
|---|---|---|
| Multi-AZ | Run across multiple AZs in one region | RDS Multi-AZ, ALB across AZs, EKS nodes in multiple AZs |
| Multi-Region Active-Passive | Primary region active, secondary on standby | Route53 health checks + failover routing, RDS read replica in secondary region |
| Multi-Region Active-Active | Both regions serve traffic simultaneously | Route53 latency routing, DynamoDB Global Tables, S3 Cross-Region Replication |

**RTO and RPO — the two DR metrics:** RTO (Recovery Time Objective) is how long the business can tolerably be down — drives how fast the failover automation must work. RPO (Recovery Point Objective) is how much data can be lost — drives how frequently backups/replication must run.

| Strategy | RTO | Cost | How |
|---|---|---|---|
| Backup & Restore | Hours | Low | S3 backups, restore from scratch on disaster |
| Pilot Light | 30-60 min | Medium | Core DB running in secondary region, scale out compute on failover |
| Warm Standby | Minutes | High | Scaled-down running copy in secondary, scale up on failover |
| Active-Active | Seconds | 2x | Full capacity in both regions, instant DNS-based failover |

## Interview Questions

**Design a production-grade VPC architecture for a 3-tier application on AWS.**
A three-tier VPC with public, private-app, and private-data subnets spread across 3 AZs. VPC CIDR `10.0.0.0/16` gives 65,536 IPs. Public subnets host the Application Load Balancer (inbound 443 from `0.0.0.0/0`), one NAT Gateway per AZ for HA, and a bastion host if needed. Private app subnets host EKS nodes and EC2, routing outbound traffic through the NAT Gateway. Private data subnets host RDS with no direct route to the internet at all — reachable only from the app tier's security group. Each tier's Security Group only allows inbound traffic from the tier directly above it, and NACLs at the subnet level provide a coarse-grained additional layer beneath the per-instance Security Groups.
