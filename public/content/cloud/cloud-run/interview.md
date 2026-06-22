# Google Cloud Run Interview Questions

## Core Concepts

**Q: What is Cloud Run?**

Cloud Run is Google Cloud's managed serverless container platform. Deploy any container — Cloud Run handles scaling, networking, SSL, and infrastructure.

Key properties:
- **Fully managed**: No nodes, no clusters to manage
- **Scale to zero**: No traffic = no cost. Scales up in ~seconds on request.
- **Request-based pricing**: Pay per request + CPU/memory while handling requests
- **Stateless**: Each request is independent (use Cloud Storage/Firestore for state)
- **Any language**: Run any containerised application

vs GKE: Cloud Run = simple, serverless, stateless apps. GKE = complex, stateful, custom K8s.

---

**Q: Deploying to Cloud Run.**

```bash
# Deploy from container image
gcloud run deploy my-service \
  --image gcr.io/my-project/my-app:v1 \
  --region us-central1 \
  --platform managed \
  --memory 512Mi \
  --cpu 1 \
  --concurrency 80 \         # Max concurrent requests per container
  --min-instances 0 \        # Scale to zero
  --max-instances 100 \
  --allow-unauthenticated    # Public endpoint (or --no-allow-unauthenticated for private)

# Set environment variables and secrets
gcloud run deploy my-service \
  --set-env-vars "DB_HOST=localhost,APP_ENV=prod" \
  --set-secrets "DB_PASSWORD=my-secret:latest"   # From Secret Manager

# Traffic splitting (canary deployment)
gcloud run services update-traffic my-service \
  --to-revisions LATEST=10,stable-revision=90    # 10% to new, 90% to old
```

---

**Q: Cloud Run Jobs vs Services.**

**Cloud Run Services**: Long-running web service. Responds to HTTP requests. Scales based on traffic.

**Cloud Run Jobs**: Batch/script that runs to completion. Not HTTP-triggered. Good for: data processing, cron jobs, one-off tasks.

```bash
gcloud run jobs create my-job \
  --image gcr.io/my-project/batch-job \
  --tasks 10 \              # Run 10 parallel task instances
  --max-retries 3

gcloud run jobs execute my-job  # Run immediately
gcloud scheduler jobs create http ... # Or schedule with Cloud Scheduler
```

---

**Q: Cloud Run security and authentication.**

```bash
# Internal service-to-service (authenticated with service account)
gcloud run services add-iam-policy-binding backend-service \
  --member="serviceAccount:frontend-sa@project.iam.gserviceaccount.com" \
  --role="roles/run.invoker"

# Service identity: assign service account to Cloud Run service
gcloud run deploy my-service \
  --service-account my-service-sa@project.iam.gserviceaccount.com
# Service gets GCP credentials via Workload Identity (no key files)

# VPC connector: access private resources
gcloud run deploy my-service \
  --vpc-connector my-connector \
  --vpc-egress private-ranges-only
```

## Revision Notes
```
CLOUD RUN: serverless containers. Scale to zero. Pay per request.
Any container language. Fully managed (no nodes/clusters).

vs GKE: Cloud Run=simple stateless | GKE=complex stateful
vs Cloud Functions: Cloud Run=container | CF=function code

DEPLOY: gcloud run deploy --image --region --memory --concurrency
SCALE: min-instances=0 (zero) to max-instances
TRAFFIC: --to-revisions for canary (10% new, 90% old)

JOBS vs SERVICES:
Services: HTTP, long-running, scales on traffic
Jobs: batch, runs to completion, parallel tasks

SECURITY:
IAM roles.run.invoker for service-to-service
Assign service account -> GCP credentials via Workload Identity
VPC connector for private resource access
```
