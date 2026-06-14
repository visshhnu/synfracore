# Cloud Run — Cheatsheet

```bash
# ── DEPLOY ────────────────────────────────────────────────
gcloud run deploy myapp \
  --image gcr.io/$PROJECT/myapp:latest \
  --region asia-south1 \
  --allow-unauthenticated \
  --min-instances 0 --max-instances 100 \
  --concurrency 80 \
  --cpu 1 --memory 512Mi \
  --timeout 300 \
  --set-env-vars DB_HOST=localhost,DEBUG=false \
  --set-secrets DB_PASS=prod-db-pass:latest \
  --service-account myapp-sa@$PROJECT.iam.gserviceaccount.com

# Deploy from source (auto-build)
gcloud run deploy myapp --source . --region asia-south1

# ── MANAGE ────────────────────────────────────────────────
gcloud run services list
gcloud run services describe myapp --region asia-south1
gcloud run services delete myapp --region asia-south1
gcloud run services update myapp --region asia-south1 --min-instances 2

# ── TRAFFIC ───────────────────────────────────────────────
gcloud run revisions list --service myapp --region asia-south1
gcloud run services update-traffic myapp --region asia-south1 --to-revisions=$REV=10
gcloud run services update-traffic myapp --region asia-south1 --to-latest

# ── LOGS ──────────────────────────────────────────────────
gcloud logs read "resource.type=cloud_run_revision AND resource.labels.service_name=myapp" \
  --limit 50 --format="table(timestamp,textPayload)"

# ── URL AND DOMAIN MAPPING ────────────────────────────────
gcloud run services describe myapp --region asia-south1 --format="value(status.url)"
gcloud run domain-mappings create --service myapp \
  --domain myapp.example.com --region asia-south1

# ── INVOKING ──────────────────────────────────────────────
URL=$(gcloud run services describe myapp --region asia-south1 --format="value(status.url)")
curl $URL/health
curl -H "Authorization: Bearer $(gcloud auth print-identity-token)" $URL/private

# ── JOBS ──────────────────────────────────────────────────
gcloud run jobs create batch-job --image $IMAGE --region asia-south1 --tasks 10
gcloud run jobs execute batch-job --region asia-south1
gcloud run jobs executions list --job batch-job --region asia-south1

# ── KEY LIMITS ────────────────────────────────────────────
# Request timeout: max 60 min
# Concurrency: max 1000 per instance
# Memory: max 32 GiB
# CPU: max 8 vCPU
# Startup timeout: max 4 min
```
