# Google Cloud Run Cheatsheet

## Core Commands
```bash
# Deploy from source (auto-builds with Cloud Build)
gcloud run deploy my-service \
  --source . \
  --region us-central1 \
  --platform managed \
  --allow-unauthenticated

# Deploy from container image
gcloud run deploy my-service \
  --image gcr.io/my-project/my-app:latest \
  --region us-central1 \
  --port 8080 \
  --memory 512Mi --cpu 1 \
  --max-instances 10 --min-instances 0 \
  --concurrency 80 \
  --timeout 300 \
  --set-env-vars ENV=prod,DB_HOST=mydb.example.com \
  --service-account my-sa@my-project.iam.gserviceaccount.com

# Update traffic (canary / blue-green)
gcloud run services update-traffic my-service \
  --region us-central1 \
  --to-revisions v1=90,v2=10  # 90% old, 10% new

gcloud run services update-traffic my-service \
  --to-latest  # 100% to latest

# Manage
gcloud run services list --region us-central1
gcloud run services describe my-service --region us-central1
gcloud run services delete my-service --region us-central1
gcloud run revisions list --service my-service --region us-central1

# Invoke (test)
gcloud run services describe my-service \
  --region us-central1 --format 'value(status.url)'
curl -H "Authorization: Bearer $(gcloud auth print-identity-token)" <URL>

# Logs
gcloud logging read "resource.type=cloud_run_revision AND resource.labels.service_name=my-service" \
  --limit 50 --format json
```

## Key Configuration Settings
| Setting | Default | Notes |
|---------|---------|-------|
| Concurrency | 80 | Requests handled per container instance |
| CPU | 1 | 1-8 vCPU; throttled when no requests (min-instances=0) |
| Memory | 512Mi | 128Mi-32Gi |
| Timeout | 300s | Max 3600s |
| Max instances | 1000 | Hard per-region limit |
| Min instances | 0 | >0 keeps warm instances (costs money) |
| Port | 8080 | App must listen on PORT env var |

## IAM and Authentication
```bash
# Allow unauthenticated (public)
gcloud run services add-iam-policy-binding my-service \
  --member allUsers --role roles/run.invoker

# Allow specific service account
gcloud run services add-iam-policy-binding my-service \
  --member serviceAccount:caller@project.iam.gserviceaccount.com \
  --role roles/run.invoker

# Service identity for the Cloud Run service itself
gcloud run deploy my-service \
  --service-account my-service-sa@project.iam.gserviceaccount.com
```

## Cloud Run Jobs (batch)
```bash
# Create and run a job
gcloud run jobs create my-job \
  --image gcr.io/my-project/batch-app:latest \
  --region us-central1 \
  --tasks 10 --task-timeout 600 \
  --parallelism 5

gcloud run jobs execute my-job --region us-central1
gcloud run jobs describe my-job --region us-central1
gcloud run jobs list --region us-central1
```
