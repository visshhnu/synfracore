# GCP Complete Guide

Cloud › GCP
**GCP**
BeginnerEngineerProductionArchitectGoogle Cloud Platform — GKE, IAM, Workload Identity, Cloud Storage
[What is GCP](#sec-what)[IAM & Identity](#sec-iam)[GKE](#sec-gke)[Storage](#sec-storage)[Networking](#sec-networking)[Interview Q&A](#sec-interview)


## 🟡 What is GCP?›


#### GCP vs AWS vs Azure — Service Mapping

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


GCP concepts + gcloud CLI basicsCopy

```

```


## 🔐 IAM & Workload Identity›


#### GCP IAM key concepts

GCP IAM is more granular than AWS. You can assign roles at the organisation, folder, project, or individual resource level. The most restrictive ancestor rule: a deny at org level cannot be overridden at project level.


Service accounts + Workload Identity + role bindingsCopy

```

```


## ☸️ GKE — Kubernetes›


#### Why GKE?

Google invented Kubernetes. GKE gets new K8s versions first, has the tightest integration with GCP services, and Autopilot mode offers true serverless Kubernetes. GKE is widely considered the best managed K8s experience.


GKE create (Autopilot + Standard) + featuresCopy

```

```


## 🪣 Storage Options›


Cloud Storage, Cloud SQL, lifecycle policiesCopy

```

```


## 🌐 Networking›


#### GCP networking is global by default

Unlike AWS where a VPC is regional, a GCP VPC is global. One VPC can have subnets in Mumbai, London, and US-East. This simplifies multi-region architectures significantly.


VPC, firewall, load balancers, Cloud ArmorCopy

```

```


## ☸️ GKE — Deep Dive›

#### GKE is Google's managed Kubernetes — the original managed K8s service
|  | GKE | AKS | EKS |
|---|---|---|---|
| Control plane cost | Free (Standard), $0.10/hr (Autopilot) | Free | $0.10/hr per cluster |
| Autopilot mode | Yes — fully managed nodes, pay per pod | No equivalent | Fargate (partial) |
| Upgrade strategy | Node auto-upgrade, surge upgrade | Node pool upgrade | Managed Node Group update |
| Networking | VPC-native, Alias IPs | Azure CNI | VPC CNI |
| Identity for pods | Workload Identity (GKE) | Azure Workload Identity | IRSA |

#### GKE modes — Standard vs Autopilot

**Standard mode**: you manage node pools — choose VM types, sizes, number of nodes. Cluster Autoscaler adds/removes nodes. Same as AKS node pools. Full control, you pay for nodes. **Autopilot mode**: Google manages all nodes. You only define pods. Google provisions the right resources. You pay per pod CPU/memory request, not per node. Zero node management. Best for teams who want Kubernetes without ops overhead.

```
# Create GKE cluster
gcloud container clusters create my-cluster   --region us-central1   --num-nodes 3   --machine-type e2-standard-4   --enable-autoscaling --min-nodes 1 --max-nodes 10   --workload-pool=my-project.svc.id.goog   # enable Workload Identity

# Get credentials
gcloud container clusters get-credentials my-cluster --region us-central1

# Autopilot cluster (no node management)
gcloud container clusters create-auto my-autopilot-cluster --region us-central1
```


## 🔐 GCP IAM and Workload Identity›

#### GCP IAM — projects, service accounts, roles
| Concept | GCP | AWS equivalent | Azure equivalent |
|---|---|---|---|
| Organisation unit | Project | AWS Account | Subscription |
| Human identity | Google Account / Workspace user | IAM User | Azure AD User |
| Service identity | Service Account | IAM Role / Instance Profile | Managed Identity |
| Permissions group | IAM Role | IAM Policy | Azure Role |
| Pod identity | Workload Identity (SA ↔ K8s SA federation) | IRSA | Azure Workload Identity |

```
# Create service account
gcloud iam service-accounts create payment-svc   --display-name="Payment Service Account"

# Grant it access to a GCS bucket
gsutil iam ch serviceAccount:payment-svc@myproject.iam.gserviceaccount.com:roles/storage.objectAdmin   gs://my-payment-bucket

# Workload Identity — link GCP SA to K8s SA
kubectl annotate serviceaccount payment-k8s-sa   iam.gke.io/gcp-service-account=payment-svc@myproject.iam.gserviceaccount.com

gcloud iam service-accounts add-iam-policy-binding   payment-svc@myproject.iam.gserviceaccount.com   --role roles/iam.workloadIdentityUser   --member "serviceAccount:myproject.svc.id.goog[production/payment-k8s-sa]"
```


## 🛠️ Core GCP Services›

#### Core GCP services every DevOps engineer should know
| Service | What it is | AWS equivalent | Azure equivalent |
|---|---|---|---|
| GKE | Managed Kubernetes | EKS | AKS |
| Cloud Run | Serverless containers — deploy container, Google manages everything | ECS Fargate / Lambda containers | Azure Container Apps |
| GCS (Cloud Storage) | Object storage — buckets and objects | S3 | Azure Blob Storage |
| Cloud SQL | Managed PostgreSQL/MySQL/SQL Server | RDS | Azure Database |
| Artifact Registry | Container and artifact registry (replaces GCR) | ECR | ACR |
| Cloud Build | Managed CI/CD — build, test, deploy | CodeBuild | Azure Pipelines |
| Cloud Pub/Sub | Managed message queue | SQS/SNS | Azure Service Bus |
| Cloud Monitoring | Metrics, alerts, dashboards | CloudWatch | Azure Monitor |
| Secret Manager | Managed secrets storage | AWS Secrets Manager | Azure Key Vault |
| VPC | Virtual private network — global (not per-region like AWS) | VPC (per-region) | VNet (per-region) |


## 🎯 Interview Questions›


All
Architect
Engineer
Production


GCP · ENGINEER
What is GCP Workload Identity and why is it better than service account keys?
Service account keys are JSON files containing long-lived credentials for a GCP service account. Problems: they never expire by default, if leaked they give permanent access, they must be manually rotated, and storing them in Kubernetes secrets means they are accessible to anyone who can read that secret. Workload Identity solves this by letting GKE pods authenticate as GCP service accounts using short-lived tokens automatically issued by Google. The pod has a Kubernetes service account annotated with a GCP service account. When the pod calls GCP APIs, the GKE metadata server intercepts the call and returns a short-lived OIDC token that GCP accepts as authentication. No credentials to store, no rotation, tokens expire in one hour, and if a pod is compromised the blast radius is limited to what that specific serv
