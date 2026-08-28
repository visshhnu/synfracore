# Google Cloud Run

**Before you start:** basic familiarity with containers (what a `Dockerfile` and a container image are) is assumed. No Kubernetes experience is required or even relevant here — Cloud Run's whole pitch, covered below, is running containers without a cluster to manage.

## What Is Cloud Run?
Cloud Run is Google Cloud's fully managed serverless container platform. You package your application in a container, deploy it to Cloud Run, and it automatically scales from zero to thousands of instances based on incoming requests — you pay only for what you use.

## Why this exists (the hook)

Say you've built a small REST API. You containerized it with a `Dockerfile` because that's the standard way to package an app today, but you don't want to run Kubernetes just to serve maybe a handful of requests a day — that's a control plane, node pools, and YAML for something that could be one command. Cloud Run's pitch: give it your container image, and it runs it as an HTTP service, scales the number of running instances up when requests arrive and down to *zero* when they stop, and bills you only for the CPU/memory time actually spent handling requests. No idle server bill, no cluster to patch.

## Analogy

Think of Cloud Run like an on-demand car rental kiosk versus owning a car. Owning a car (a VM or a GKE node pool) means you pay for it whether it's parked in your driveway or on the highway — insurance, depreciation, parking, all the time. Cloud Run is the kiosk: a car (a container instance) is handed to you the moment you need one, you're billed only for the minutes you're actually driving, and when you're done it goes back into the shared pool — if nobody needs a car for a while, the kiosk simply keeps zero cars staffed and ready, costing nothing until the next request pulls up.

## How a request flows through Cloud Run (diagram)

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "Request Arrives", "sublabel": "HTTP request hits Cloud Run", "color": "slate" },
    { "label": "Front-End Routing", "sublabel": "Warm instance? Route to it. Cold? Start one first", "color": "blue" },
    { "label": "Container Instance", "sublabel": "Handles up to --concurrency requests at once", "color": "purple" },
    { "label": "Scale to Zero", "sublabel": "No requests for a while -> torn down -> zero cost", "color": "green" }
  ]
}
```

## Annotated example: deploy and understand what happened

```bash
# Build-and-deploy in one step: Cloud Build packages your source into a
# container image for you, then Cloud Run deploys it.
gcloud run deploy my-service \
  --source . \
  --region us-central1 \
  --allow-unauthenticated
# --allow-unauthenticated makes the URL public. Omit it and the service
# still deploys, but every caller needs a valid IAM-based identity token --
# the safer default for internal services.

# Read back the auto-generated public URL
gcloud run services describe my-service \
  --region us-central1 \
  --format "value(status.url)"
```

What actually happened: Cloud Build turned your source into a container image and pushed it to Artifact Registry, Cloud Run created a *revision* (an immutable snapshot of that image plus its config — env vars, memory, CPU), and traffic was routed 100% to that new revision. Every subsequent `gcloud run deploy` creates a *new* revision rather than mutating the old one — which is exactly what makes instant rollback possible: an old revision never disappears, it's just not receiving traffic until you point traffic back at it.

## Try it yourself (2 minutes)

If you have a GCP project with billing enabled (Cloud Run has an always-free monthly tier), deploy Google's public "hello" sample container with zero build step required:

```bash
gcloud run deploy hello-world \
  --image us-docker.pkg.dev/cloudrun/container/hello \
  --region us-central1 \
  --allow-unauthenticated
```
Open the URL it prints. Then wait roughly 15 minutes without hitting it again, and check `gcloud run services describe hello-world --region us-central1` for instance count — you'll see it's scaled back to zero. Hit the URL once more and time how long the response takes versus a second immediate request; the difference you feel is the cold start. *(the exact idle-to-zero timing and cold-start latency are not fixed guarantees and can vary by traffic pattern and image size — treat the exercise as building intuition, not a benchmark.)*

## Key Features

```conceptgrid
{
  "boxes": [
    { "title": "Fully Managed", "description": "No servers, no clusters to manage", "color": "blue" },
    { "title": "Scale to Zero", "description": "Pay nothing when idle", "color": "green" },
    { "title": "Any Language", "description": "Deploy any container -- Python, Node, Go, Java, Rust", "color": "purple" },
    { "title": "Request-Based Billing", "description": "Charged per CPU/memory time actually used", "color": "amber" }
  ]
}
```

- **Fully managed**: No servers, no clusters to manage
- **Scale to zero**: Pay nothing when idle
- **Any language**: Deploy any container — Python, Node, Go, Java, Rust
- **HTTPS by default**: Automatic SSL certificates and custom domains
- **Request-based billing**: Charged per 100ms of CPU/memory time actually used *(exact current billing granularity and rate need verification against official pricing — this has been the commonly-cited figure but Google has adjusted billing increments before)*
- **VPC integration**: Connect to private Cloud SQL, Memorystore, internal services via a Serverless VPC Access connector

## Cloud Run vs Cloud Functions vs GKE
| Feature | Cloud Run | Cloud Functions | GKE |
|---------|-----------|----------------|-----|
| Unit | Container | Function | Pod |
| Cold start | Present, image/dependency-size dependent | Present, typically smaller footprint | None (nodes stay warm) |
| Max memory | Multiple GB, configurable up to a high ceiling *(exact current max needs verification)* | Configurable, lower ceiling than Cloud Run *(exact current max needs verification)* | Bound only by node machine type |
| Custom port | Yes | No | Yes |
| Long-running requests | Yes, well beyond a minute *(exact current max request timeout needs verification against official docs — this has increased over Cloud Run's history)* | No — short-lived by design | Yes, unbounded |
| Cost model | Per request (CPU/memory time) | Per invocation | Cluster/node hours |

## Common Use Cases
- REST APIs and microservices
- Background jobs triggered by Pub/Sub
- Web applications with traffic spikes
- ML model serving endpoints
- Webhook handlers
- Batch/one-off jobs that run to completion rather than serve HTTP traffic (Cloud Run Jobs — see Fundamentals)

## Who This Is For
Backend engineers deploying APIs, DevOps teams managing containerised services on GCP, and anyone wanting container flexibility without taking on Kubernetes operational overhead.
