# GCP — Fundamentals

## What is GCP?

| AWS | Azure | GCP | Purpose |
|---|---|---|---|
| EC2 | VM | Compute Engine | Virtual machines |
| S3 | Blob Storage | Cloud Storage (GCS) | Object storage |
| EKS | AKS | GKE | Managed Kubernetes |
| RDS | Azure SQL | Cloud SQL / AlloyDB | Managed database |
| Lambda | Functions | Cloud Functions | Serverless compute |
| IAM Role | Managed Identity | Workload Identity | App authentication |
| CloudWatch | Azure Monitor | Cloud Monitoring | Observability |
| CloudTrail | Activity Log | Cloud Audit Logs | API audit trail |
| Redshift | Synapse | BigQuery | Data warehouse |

```bash
# gcloud CLI basics
gcloud auth login
gcloud config set project my-project-id
gcloud config list
gcloud projects list
```

## IAM & Workload Identity

GCP IAM is more granular than AWS — roles can be assigned at the organisation, folder, project, or individual resource level. The most-restrictive-ancestor rule applies: a deny at the org level cannot be overridden at the project level.

```bash
# Create a service account and bind a role
gcloud iam service-accounts create payment-svc \
  --display-name="Payment Service Account"

gcloud projects add-iam-policy-binding my-project-id \
  --member="serviceAccount:payment-svc@my-project-id.iam.gserviceaccount.com" \
  --role="roles/storage.objectAdmin"

# Workload Identity — link a GCP service account to a Kubernetes service account
kubectl annotate serviceaccount payment-k8s-sa \
  iam.gke.io/gcp-service-account=payment-svc@my-project-id.iam.gserviceaccount.com

gcloud iam service-accounts add-iam-policy-binding \
  payment-svc@my-project-id.iam.gserviceaccount.com \
  --role roles/iam.workloadIdentityUser \
  --member "serviceAccount:my-project-id.svc.id.goog[production/payment-k8s-sa]"
```

## GKE — Kubernetes

Google invented Kubernetes. GKE gets new K8s versions first, has the tightest integration with GCP services, and Autopilot mode offers true serverless Kubernetes — GKE is widely considered the best managed K8s experience.

```bash
# Standard mode — you manage node pools
gcloud container clusters create my-cluster \
  --region us-central1 --num-nodes 3 --machine-type e2-standard-4 \
  --enable-autoscaling --min-nodes 1 --max-nodes 10 \
  --workload-pool=my-project.svc.id.goog

gcloud container clusters get-credentials my-cluster --region us-central1

# Autopilot mode — Google manages all nodes, you only define pods
gcloud container clusters create-auto my-autopilot-cluster --region us-central1
```

**Standard vs. Autopilot:** in Standard mode you choose VM types and sizes, and the Cluster Autoscaler adds/removes nodes — same as AKS node pools, full control, you pay for nodes. In Autopilot mode, Google manages all nodes; you only define pods, Google provisions the right resources, and you pay per pod CPU/memory request rather than per node — zero node management, best for teams who want Kubernetes without operational overhead.

## Storage Options

```bash
# Cloud Storage — object storage
gsutil mb -l us-central1 gs://my-bucket
gsutil lifecycle set lifecycle.json gs://my-bucket  # auto-tier/delete old objects

# Cloud SQL — managed PostgreSQL/MySQL
gcloud sql instances create my-instance \
  --database-version=POSTGRES_15 --tier=db-custom-2-7680 --region=us-central1
```

## Networking

Unlike AWS, where a VPC is regional, a GCP VPC is global — one VPC can have subnets in Mumbai, London, and US-East simultaneously, which significantly simplifies multi-region architectures.

```bash
# VPC, firewall rule, and a global load balancer
gcloud compute networks create my-vpc --subnet-mode=custom
gcloud compute networks subnets create my-subnet \
  --network=my-vpc --region=us-central1 --range=10.0.0.0/24

gcloud compute firewall-rules create allow-https \
  --network=my-vpc --allow=tcp:443 --source-ranges=0.0.0.0/0

# Cloud Armor — WAF/DDoS protection attached to the load balancer
gcloud compute security-policies create my-policy
gcloud compute security-policies rules create 1000 \
  --security-policy=my-policy --action=deny-403 \
  --src-ip-ranges="203.0.113.0/24"
```

## GKE — Deep Dive

|  | GKE | AKS | EKS |
|---|---|---|---|
| Control plane cost | Free (Standard), $0.10/hr (Autopilot) | Free | $0.10/hr per cluster |
| Autopilot mode | Yes — fully managed nodes, pay per pod | No equivalent | Fargate (partial) |
| Upgrade strategy | Node auto-upgrade, surge upgrade | Node pool upgrade | Managed Node Group update |
| Networking | VPC-native, Alias IPs | Azure CNI | VPC CNI |
| Identity for pods | Workload Identity (GKE) | Azure Workload Identity | IRSA |

## GCP IAM and Workload Identity

| Concept | GCP | AWS equivalent | Azure equivalent |
|---|---|---|---|
| Organisation unit | Project | AWS Account | Subscription |
| Human identity | Google Account / Workspace user | IAM User | Azure AD User |
| Service identity | Service Account | IAM Role / Instance Profile | Managed Identity |
| Permissions group | IAM Role | IAM Policy | Azure Role |
| Pod identity | Workload Identity (SA ↔ K8s SA federation) | IRSA | Azure Workload Identity |

## Core GCP Services

| Service | What it is | AWS equivalent | Azure equivalent |
|---|---|---|---|
| GKE | Managed Kubernetes | EKS | AKS |
| Cloud Run | Serverless containers — deploy a container, Google manages everything | ECS Fargate / Lambda containers | Azure Container Apps |
| GCS (Cloud Storage) | Object storage — buckets and objects | S3 | Azure Blob Storage |
| Cloud SQL | Managed PostgreSQL/MySQL/SQL Server | RDS | Azure Database |
| Artifact Registry | Container and artifact registry (replaces GCR) | ECR | ACR |
| Cloud Build | Managed CI/CD — build, test, deploy | CodeBuild | Azure Pipelines |
| Cloud Pub/Sub | Managed message queue | SQS/SNS | Azure Service Bus |
| Cloud Monitoring | Metrics, alerts, dashboards | CloudWatch | Azure Monitor |
| Secret Manager | Managed secrets storage | AWS Secrets Manager | Azure Key Vault |
| VPC | Global virtual private network | VPC (per-region) | VNet (per-region) |

## Interview Questions

**What is GCP Workload Identity and why is it better than service account keys?**
Service account keys are JSON files containing long-lived credentials for a GCP service account — they never expire by default, if leaked they give permanent access, they must be manually rotated, and storing them in Kubernetes secrets means anyone who can read that secret has them too. Workload Identity solves this by letting GKE pods authenticate as GCP service accounts using short-lived tokens automatically issued by Google. The pod has a Kubernetes service account annotated with a GCP service account; when the pod calls GCP APIs, the GKE metadata server intercepts the call and returns a short-lived OIDC token that GCP accepts as authentication. There's nothing to store, nothing to rotate, tokens expire in one hour, and if a pod is compromised the blast radius is limited to what that specific service account is scoped to — not a permanent, broadly-reusable credential sitting in a secret.
