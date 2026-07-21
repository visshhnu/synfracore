# Google Cloud Run — Fundamentals

## The hook: revisions make deploys reversible by default

The single habit that separates confident Cloud Run usage from nervous Cloud Run usage is understanding *revisions*. Every `gcloud run deploy` doesn't overwrite anything — it creates a brand-new, immutable revision, and only then repoints the traffic split to it. The old revision is still sitting there, fully deployable, until you delete it. That means "rollback" isn't a redeploy-and-hope operation, it's a traffic-routing operation that takes effect in seconds.

## Analogy

Think of Cloud Run revisions like numbered saved drafts of a document, not a single file you keep overwriting. `deploy` doesn't erase draft 4 to write draft 5 — it saves draft 5 alongside draft 4 and just updates which draft you're currently showing readers (the traffic split). Canary and blue-green deploys are simply showing two drafts to different fractions of your readers at once, and rollback is just switching back to showing draft 4 — the file itself never left.

## Diagram: revisions and traffic splitting

```
 Revision r1 (100% traffic) ──deploy──► Revision r2 created, --no-traffic
                                              │
                              update-traffic --to-tags v2=10 --to-latest=90
                                              │
                    ┌─────────────────────────┴─────────────────────────┐
                    │ r1 (90% of traffic, still fully running)           │
                    │ r2 tagged "v2" (10% of traffic — canary)           │
                    └─────────────────────────┬─────────────────────────┘
                                              │  looks good → promote
                                    update-traffic --to-latest=100
                                              │
                              r2 now serves 100% -- r1 still exists,
                              rollback = update-traffic --to-revisions r1=100
```

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
                    Limited timeout/CPU/RAM ceiling *(exact current limits need
                    verification against official docs -- these have been
                    raised over Cloud Functions' history, especially in the
                    2nd-gen runtime built on Cloud Run itself)*

Cloud Run:          Container, HTTP server
                    More flexible — any language, any dependencies
                    Request timeout, CPU, and memory ceilings are all higher
                    than Cloud Functions *(exact current maximums need
                    verification against official docs -- Cloud Run's request
                    timeout ceiling in particular has been extended over time)*
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

## Try it yourself (2 minutes)

Deploy the public hello-world sample image twice under the same service name, and practice the rollback muscle memory before you ever need it in a real incident:

```bash
gcloud run deploy demo --image us-docker.pkg.dev/cloudrun/container/hello --region us-central1 --allow-unauthenticated
gcloud run revisions list --service demo --region us-central1   # note revision name, e.g. demo-00001-abc

gcloud run deploy demo --image us-docker.pkg.dev/cloudrun/container/hello --region us-central1 --allow-unauthenticated
gcloud run revisions list --service demo --region us-central1   # now two revisions exist

# "Roll back" to the first revision -- notice this takes effect immediately,
# with no rebuild and no redeploy of old code:
gcloud run services update-traffic demo --to-revisions demo-00001-abc=100 --region us-central1
```
Both revisions still exist after this — nothing was deleted, you only moved where traffic points. That's the core mental model this whole section is built around.

