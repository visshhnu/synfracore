# Cloud Run — Advanced

## VPC Connectivity

```bash
# Connect Cloud Run to private VPC resources (Cloud SQL, Redis, internal APIs)

# Create VPC Connector (Serverless VPC Access)
gcloud compute networks vpc-access connectors create prod-connector \
  --region asia-south1 \
  --subnet prod-connector-subnet \  # /28 subnet dedicated for connector
  --min-throughput 200 \
  --max-throughput 1000

# Deploy with VPC connector
gcloud run deploy myapp \
  --image gcr.io/$PROJECT/myapp:latest \
  --region asia-south1 \
  --vpc-connector prod-connector \
  --vpc-egress all-traffic   # Route all traffic through VPC (or 'private-ranges-only')

# Direct VPC egress (newer, no connector needed)
gcloud run deploy myapp \
  --image gcr.io/$PROJECT/myapp:latest \
  --network prod-vpc \
  --subnet prod-subnet \
  --region asia-south1
```

## Authentication and IAM

```bash
# Authenticated Cloud Run service (only specific identities can call)
gcloud run deploy private-api \
  --image gcr.io/$PROJECT/private-api:latest \
  --region asia-south1 \
  --no-allow-unauthenticated

# Grant access to a service account
gcloud run services add-iam-policy-binding private-api \
  --region asia-south1 \
  --member "serviceAccount:caller@$PROJECT.iam.gserviceaccount.com" \
  --role "roles/run.invoker"

# Call authenticated service (get ID token)
curl -H "Authorization: Bearer $(gcloud auth print-identity-token)" \
  https://private-api-xxx.run.app/endpoint

# Service-to-service (Cloud Run calling Cloud Run)
# Both services use their default service account
# Grant the caller's SA the run.invoker role on the target service
```

## Concurrency and Scaling

```bash
# Tune for your workload type
# CPU-bound (compute intensive): lower concurrency
gcloud run deploy compute-api \
  --image ... --concurrency 1 \
  --cpu 4 --memory 8Gi \
  --min-instances 1 --max-instances 100   # min-instances avoids cold starts

# I/O-bound (waiting for DB/external APIs): higher concurrency
gcloud run deploy api \
  --image ... --concurrency 1000 \
  --cpu 2 --memory 2Gi \
  --min-instances 0 --max-instances 1000

# CPU always-on (charged even when idle, but eliminates cold start)
gcloud run deploy latency-sensitive \
  --image ... --cpu-throttling false \
  --min-instances 5
```
