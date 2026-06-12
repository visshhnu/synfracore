# Google Cloud Run — Fundamentals

## What is Cloud Run

```
Cloud Run = Serverless containers on GCP
  - Deploy any container (not just HTTP functions)
  - Scale to zero (no traffic = no cost)
  - Scale to 1000+ instances in seconds
  - Pay per request (100ms billing increments)
  - Automatic HTTPS, custom domains, traffic splitting
```

## Deploy a Service

```bash
# Deploy from container registry
gcloud run deploy my-service \
    --image us-central1-docker.pkg.dev/PROJECT/repo/myapp:latest \
    --platform managed \
    --region us-central1 \
    --allow-unauthenticated \
    --port 8080 \
    --memory 512Mi \
    --cpu 1 \
    --min-instances 0 \
    --max-instances 100 \
    --concurrency 80 \       # Requests per container instance
    --timeout 300 \
    --set-env-vars "DB_HOST=10.0.0.1,APP_ENV=prod" \
    --set-secrets "DB_PASSWORD=db-secret:latest" \
    --service-account service-account@PROJECT.iam.gserviceaccount.com

# Build and deploy in one step
gcloud run deploy my-service \
    --source . \             # Builds with Cloud Build automatically
    --region us-central1

# Get service URL
gcloud run services describe my-service \
    --region us-central1 \
    --format "value(status.url)"
```

## Traffic Splitting (Blue-Green / Canary)

```bash
# Deploy new version (no traffic yet)
gcloud run deploy my-service \
    --image myapp:v2 \
    --no-traffic \
    --tag v2

# Send 10% of traffic to new version
gcloud run services update-traffic my-service \
    --to-tags v2=10 \
    --to-latest=90

# Promote to 100% when stable
gcloud run services update-traffic my-service \
    --to-latest=100

# Rollback instantly
gcloud run services update-traffic my-service \
    --to-revisions REVISION_NAME=100
```

## Cloud Run vs Cloud Functions vs GKE

```
Cloud Functions:    Single function, HTTP trigger or event
                    Simplest — just write a function
                    Limited: 540s timeout, 1 CPU, 8GB RAM max

Cloud Run:          Container, HTTP server
                    More flexible — any language, any dependencies
                    15 min timeout, 8 CPUs, 32GB RAM
                    Can run async tasks, background services

GKE:                Full Kubernetes cluster
                    Most powerful — stateful apps, complex networking
                    Most expensive to run (even when idle)
                    Use when: Need Kubernetes-specific features

Rule: Start with Cloud Run, move to GKE only when you need it.
```

## Cloud Run Jobs (Batch)

```bash
# For tasks that run to completion (not HTTP servers)
# Example: DB migration, report generation, data processing

gcloud run jobs create process-data \
    --image my-batch-job:latest \
    --tasks 10 \              # Run 10 parallel tasks
    --max-retries 3 \
    --memory 2Gi \
    --cpu 2 \
    --set-env-vars "BATCH_SIZE=1000"

# Execute the job
gcloud run jobs execute process-data \
    --region us-central1 \
    --wait

# Schedule with Cloud Scheduler
gcloud scheduler jobs create http daily-report \
    --schedule "0 8 * * *" \
    --uri "https://us-central1-run.googleapis.com/apis/run.googleapis.com/v1/namespaces/PROJECT/jobs/process-data:run" \
    --oauth-service-account-email scheduler@PROJECT.iam.gserviceaccount.com
```
