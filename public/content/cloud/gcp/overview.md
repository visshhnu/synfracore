# Google Cloud Platform

> **GKE, Cloud Run, GCS, Pub/Sub, BigQuery — Google Cloud core services**

**Category:** Cloud  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is Google Cloud Platform?

GCP organizes resources in a hierarchy: Organization → Folders → Projects → Resources. Everything belongs to a Project (billing unit). IAM uses Service Accounts for workloads — attach a Service Account to a VM or GKE pod and it inherits permissions. Workload Identity Federation lets GKE pods assume IAM roles without key files — the right way in production. gcloud is the CLI for everything.

## Why Google Cloud Platform?

GKE is the most mature managed Kubernetes — Google invented Kubernetes. Two modes: Standard (you manage node pools, pay for nodes) and Autopilot (Google manages nodes, you pay per pod — serverless K8s). Autopilot enforces security best practices automatically. GKE has the best integration with GCP services: Cloud Logging, Cloud Monitoring, Artifact Registry, Cloud Armor.

---

## Learning Modules

### Module 01 — GCP Fundamentals
*Projects, IAM, gcloud CLI*

GCP organizes resources in a hierarchy: Organization → Folders → Projects → Resources. Everything belongs to a Project (billing unit). IAM uses Service Accounts for workloads — attach a Service Account to a VM or GKE pod and it inherits permissions. Workload Identity Federation lets GKE pods assume IAM roles without key files — the right way in production. gcloud is the CLI for everything.

**Topics covered:**

- GCP resource hierarchy (Org → Folder → Project) — 🟢 Beginner
- IAM: roles, service accounts, workload identity — 🟡 Intermediate
- gcloud CLI essentials — 🟢 Beginner
- GCP vs AWS vs Azure comparison — 🟡 Intermediate

```bash
# GCP IAM essentials
# Create service account for app
gcloud iam service-accounts create myapp-sa \\\\
  --display-name="MyApp Service Account" \\\\
  --project=my-project

# Grant role to service account
gcloud projects add-iam-policy-binding my-project \\\\
  --member="serviceAccount:myapp-sa@my-project.iam.gserviceaccount.com" \\\\
  --role="roles/storage.objectViewer"

# Workload Identity — GKE pod assumes GCP IAM role (no key files)
# 1. Enable Workload Identity on cluster
gcloud container clusters update prod-cluster \\\\
  --workload-pool=my-project.svc.id.goog

# 2. Annotate K8s ServiceAccount
kubectl annotate serviceaccount myapp-ksa \\\\
  --namespace production \\\\
  iam.gke.io/gcp-service-account=myapp-sa@my-project.iam.gserviceaccount.com

# 3. Bind K8s SA to GCP SA
gcloud iam service-accounts add-iam-policy-binding \\\\
  myapp-sa@my-project.iam.gserviceaccount.com \\\\
  --role roles/iam.workloadIdentityUser \\\\
  --member "serviceAccount:my-project.svc.id.goog[production/myapp-ksa]"
```

### Module 02 — GKE — Google Kubernetes Engine
*Managed K8s, node pools, Autopilot*

GKE is the most mature managed Kubernetes — Google invented Kubernetes. Two modes: Standard (you manage node pools, pay for nodes) and Autopilot (Google manages nodes, you pay per pod — serverless K8s). Autopilot enforces security best practices automatically. GKE has the best integration with GCP services: Cloud Logging, Cloud Monitoring, Artifact Registry, Cloud Armor.

**Topics covered:**

- Standard vs Autopilot mode — 🟡 Intermediate
- Node pools and taints — 🟡 Intermediate
- GKE Autopilot — serverless K8s — 🟡 Intermediate
- Workload Identity integration — 🔴 Advanced
- GKE upgrade strategy — 🔴 Advanced

```bash
# Create GKE Autopilot cluster (recommended for new projects)
gcloud container clusters create-auto prod-cluster \\\\
  --region us-central1 \\\\
  --release-channel regular \\\\
  --workload-pool=my-project.svc.id.goog

# Create GKE Standard cluster with node pools
gcloud container clusters create prod-cluster \\\\
  --region us-central1 \\\\
  --release-channel regular \\\\
  --enable-ip-alias \\\\
  --enable-private-nodes \\\\
  --master-ipv4-cidr 172.16.0.0/28 \\\\
  --workload-pool=my-project.svc.id.goog \\\\
  --num-nodes 3

# Add GPU node pool
gcloud container node-pools create gpu-pool \\\\
  --cluster prod-cluster \\\\
  --region us-central1 \\\\
  --machine-type n1-standard-8 \\\\
  --accelerator type=nvidia-tesla-t4,count=1 \\\\
  --num-nodes 0 \\\\
  --enable-autoscaling \\\\
  --min-nodes 0 \\\\
  --max-nodes 5

# Get credentials
gcloud container clusters get-credentials prod-cluster \\\\
  --region us-central1

# GKE upgrade — control plane upgrades automatically in release channel
# Upgrade node pool manually
gcloud container node-pools update default-pool \\\\
  --cluster prod-cluster \\\\
  --region us-central1 \\\\
  --workload-metadata=GKE_METADATA
```

### Module 03 — Cloud Run & Serverless
*Container-based serverless, auto-scaling*

Cloud Run runs containers serverlessly — scales to zero, pay per request. No Kubernetes to manage. Perfect for: APIs, microservices, event-driven workloads, batch jobs. Cloud Run vs GKE: Run for stateless services needing simplicity, GKE for complex microservices needing full Kubernetes features. Cloud Run auto-scales based on requests — handles sudden traffic spikes instantly.

**Topics covered:**

- Cloud Run fundamentals — 🟢 Beginner
- Cloud Run vs GKE decision — 🟡 Intermediate
- Concurrency and scaling — 🟡 Intermediate
- Cloud Run Jobs for batch — 🟡 Intermediate

```bash
# Deploy to Cloud Run
gcloud run deploy myapp \\\\
  --image gcr.io/my-project/myapp:v1.2.3 \\\\
  --region us-central1 \\\\
  --platform managed \\\\
  --allow-unauthenticated \\\\
  --port 8080 \\\\
  --memory 512Mi \\\\
  --cpu 1 \\\\
  --concurrency 80 \\\\        # Requests per container instance
  --min-instances 1 \\\\       # Keep 1 warm (avoid cold starts)
  --max-instances 100 \\\\
  --service-account myapp-sa@my-project.iam.gserviceaccount.com

# Cloud Run with traffic splitting (canary)
gcloud run deploy myapp \\\\
  --image gcr.io/my-project/myapp:v1.3.0 \\\\
  --no-traffic   # Deploy without sending traffic

gcloud run services update-traffic myapp \\\\
  --to-revisions LATEST=10,myapp-00001-abc=90   # 10% canary

# Cloud Run Job (batch processing)
gcloud run jobs create data-processor \\\\
  --image gcr.io/my-project/processor:latest \\\\
  --tasks 10 \\\\         # Run 10 parallel task instances
  --max-retries 3 \\\\
  --region us-central1

gcloud run jobs execute data-processor
```

### Module 04 — Core GCP Services
*GCS, Pub/Sub, Cloud SQL, BigQuery*

GCS is GCP's S3 equivalent. Pub/Sub is managed Kafka-like messaging — fully managed, no brokers to manage. Cloud SQL is managed PostgreSQL/MySQL. BigQuery is a serverless data warehouse — run SQL on petabytes in seconds, pay per query. Artifact Registry is the modern container registry (replacing Container Registry).

**Topics covered:**

- Cloud Storage (GCS) — object storage — 🟢 Beginner
- Pub/Sub — managed messaging — 🟡 Intermediate
- Cloud SQL and Cloud Spanner — 🟡 Intermediate
- BigQuery — serverless data warehouse — 🟡 Intermediate
- Artifact Registry — container images — 🟢 Beginner

```bash
# Cloud Storage (GCS)
# Create bucket
gsutil mb -l us-central1 gs://my-prod-bucket

# Upload with lifecycle policy
gsutil cp myfile.tar.gz gs://my-prod-bucket/backups/

# Lifecycle policy — delete after 90 days
cat lifecycle.json
# {"rule": [{"action": {"type": "Delete"}, "condition": {"age": 90}}]}
gsutil lifecycle set lifecycle.json gs://my-prod-bucket

# Pub/Sub — managed messaging
gcloud pubsub topics create order-events
gcloud pubsub subscriptions create order-processor \\\\
  --topic order-events \\\\
  --ack-deadline 60 \\\\
  --message-retention-duration 7d

# Publish message
gcloud pubsub topics publish order-events \\\\
  --message '{"order_id":"123","amount":99.99}'

# Pull messages
gcloud pubsub subscriptions pull order-processor --auto-ack

# BigQuery — query at scale
bq query --use_legacy_sql=false \\\\
  'SELECT DATE(created_at) as date,
          COUNT(*) as orders,
          SUM(amount) as revenue
   FROM my_project.production.orders
   WHERE created_at >= DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY)
   GROUP BY date
   ORDER BY date DESC'

# Artifact Registry — push image
gcloud auth configure-docker us-central1-docker.pkg.dev
docker tag myapp:latest \\\\
  us-central1-docker.pkg.dev/my-project/prod-repo/myapp:v1.2.3
docker push us-central1-docker.pkg.dev/my-project/prod-repo/myapp:v1.2.3
```

### Module 05 — GCP Networking
*VPC, Cloud Load Balancing, Cloud Armor*

GCP VPC is global — one VPC spans all regions (unlike AWS where VPCs are regional). Subnets are regional. Cloud Load Balancing is truly global — one IP, routes to nearest healthy backend worldwide. Cloud Armor provides WAF rules and DDoS protection at the edge. Cloud NAT gives private instances internet access without external IPs.

**Topics covered:**

- VPC and subnet design — 🟡 Intermediate
- Cloud Load Balancing (L4 and L7) — 🟡 Intermediate
- Cloud Armor — WAF and DDoS protection — 🔴 Advanced
- Private Service Connect — 🔴 Advanced
- Cloud NAT — 🟡 Intermediate

```bash
# GCP VPC — global network
gcloud compute networks create prod-vpc \\\\
  --subnet-mode custom

# Regional subnets
gcloud compute networks subnets create prod-subnet-us \\\\
  --network prod-vpc \\\\
  --region us-central1 \\\\
  --range 10.0.0.0/20

gcloud compute networks subnets create prod-subnet-eu \\\\
  --network prod-vpc \\\\
  --region europe-west1 \\\\
  --range 10.1.0.0/20

# Firewall rules
gcloud compute firewall-rules create allow-https \\\\
  --network prod-vpc \\\\
  --allow tcp:443 \\\\
  --source-ranges 0.0.0.0/0 \\\\
  --target-tags web-server

# Cloud NAT — private instances reach internet (no external IP)
gcloud compute routers create prod-router \\\\
  --network prod-vpc \\\\
  --region us-central1

gcloud compute routers nats create prod-nat \\\\
  --router prod-router \\\\
  --region us-central1 \\\\
  --auto-allocate-nat-external-ips \\\\
  --nat-all-subnet-ip-ranges

# Cloud Armor — WAF security policy
gcloud compute security-policies create prod-security-policy
gcloud compute security-policies rules create 1000 \\\\
  --security-policy prod-security-policy \\\\
  --expression "evaluatePreconfiguredExpr('sqli-v33-stable')" \\\\
  --action deny-403
```

---

## Production Example

```bash
# GCP vs AWS vs Azure — Quick Reference for Interviews

# ┌─────────────────────┬──────────────┬──────────────┬──────────────┐
# │ Service             │ GCP          │ AWS          │ Azure        │
# ├─────────────────────┼──────────────┼──────────────┼──────────────┤
# │ Managed K8s         │ GKE          │ EKS          │ AKS          │
# │ Serverless containers│ Cloud Run   │ Fargate      │ Container Apps│
# │ Object storage      │ GCS          │ S3           │ Blob Storage │
# │ Managed VMs         │ Compute Eng. │ EC2          │ Azure VM     │
# │ Container registry  │ Artifact Reg.│ ECR          │ ACR          │
# │ Managed messaging   │ Pub/Sub      │ SQS/SNS/MSK  │ Service Bus  │
# │ Data warehouse      │ BigQuery     │ Redshift     │ Synapse      │
# │ Managed SQL         │ Cloud SQL    │ RDS          │ Azure SQL    │
# │ Serverless functions│ Cloud Functions│ Lambda     │ Azure Functions│
# │ DNS                 │ Cloud DNS    │ Route 53     │ Azure DNS    │
# │ CDN                 │ Cloud CDN    │ CloudFront   │ Azure CDN    │
# │ Load balancer       │ Cloud LB     │ ALB/NLB      │ App Gateway  │
# │ IAM                 │ IAM + SA     │ IAM Roles    │ Entra ID     │
# │ Secrets             │ Secret Mgr   │ Secrets Mgr  │ Key Vault    │
# │ Monitoring          │ Cloud Ops    │ CloudWatch   │ Azure Monitor│
# └─────────────────────┴──────────────┴──────────────┴──────────────┘

# KEY GCP ADVANTAGES:
# ✓ GKE is most mature managed K8s (Google invented K8s)
# ✓ BigQuery — fastest SQL analytics at any scale
# ✓ Global VPC — one network spans all regions
# ✓ Cloud Run — simplest serverless containers
# ✓ Sustained use discounts — automatic (no reserved instances needed)
```

---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is Google Cloud Platform and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Google Cloud Platform work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of Google Cloud Platform?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in Google Cloud Platform?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with Google Cloud Platform?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe Google Cloud Platform in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for Google Cloud Platform?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Google Cloud Platform compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain GCP Fundamentals in Google Cloud Platform."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain GKE — Google Kubernetes Engine in Google Cloud Platform."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [GCP Documentation](https://cloud.google.com/docs)
- [GKE Documentation](https://cloud.google.com/kubernetes-engine/docs)
- [Cloud Run Documentation](https://cloud.google.com/run/docs)
- [BigQuery Documentation](https://cloud.google.com/bigquery/docs)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*