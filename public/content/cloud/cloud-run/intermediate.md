# Cloud Run — Intermediate

## Deploying from Source (Buildpacks)

```bash
# Deploy directly from source code — no Dockerfile needed
# Cloud Run builds using Google Cloud Buildpacks
gcloud run deploy myapp \
  --source . \
  --region asia-south1 \
  --allow-unauthenticated \
  --set-env-vars NODE_ENV=production \
  --memory 512Mi --cpu 1

# Cloud Run automatically detects language and builds
# Supported: Node.js, Python, Java, Go, .NET, Ruby, PHP
```

## Traffic Splitting (Canary Deployments)

```bash
# Deploy new version without routing traffic
gcloud run deploy myapp \
  --image gcr.io/$PROJECT/myapp:v2 \
  --region asia-south1 \
  --no-traffic

# Get revision name
NEW_REV=$(gcloud run revisions list --service myapp --region asia-south1 \
  --format="value(metadata.name)" | head -1)

# Gradually shift traffic
gcloud run services update-traffic myapp \
  --region asia-south1 \
  --to-revisions=$NEW_REV=10   # 10% to new version

# Increase if metrics look good
gcloud run services update-traffic myapp \
  --region asia-south1 \
  --to-revisions=$NEW_REV=50

# Full cutover
gcloud run services update-traffic myapp \
  --region asia-south1 \
  --to-latest   # 100% to latest

# Check traffic split
gcloud run services describe myapp --region asia-south1 --format='yaml(spec.traffic)'
```

## Cloud Run Jobs (Batch Processing)

```bash
# Cloud Run Jobs: run-to-completion tasks (batch processing, migrations)
gcloud run jobs create data-processor \
  --image gcr.io/$PROJECT/processor:latest \
  --region asia-south1 \
  --tasks 10 \             # Run 10 parallel task instances
  --max-retries 3 \
  --task-timeout 1h \
  --memory 2Gi

# Execute the job
gcloud run jobs execute data-processor --region asia-south1

# Schedule via Cloud Scheduler
gcloud scheduler jobs create http daily-report \
  --location asia-south1 \
  --schedule "0 2 * * *" \
  --uri "https://asia-south1-run.googleapis.com/apis/run.googleapis.com/v1/namespaces/$PROJECT/jobs/data-processor:run" \
  --oauth-service-account-email scheduler@$PROJECT.iam.gserviceaccount.com
```
