# Google Cloud Run — Learning Roadmap

## Estimated Time to Job-Ready
**4-6 weeks** of consistent learning (2-3 hours/day), assuming basic container/Docker familiarity already — Cloud Run's core model (deploy a container, it scales on requests) is quick to learn; the real depth is in request-based scaling behavior, cold starts, and knowing when it fits better than GKE or Cloud Functions.

## Phase 1: Foundation (Week 1-2)

- Core model: give Cloud Run a container image, it runs it as an HTTP service, scales instance count with request volume, and scales to zero when idle
- Deploying a container (`gcloud run deploy`) and understanding what "serverless containers" actually means operationally — no cluster, no node pool, no YAML manifests to manage
- Request-based autoscaling: concurrency per instance (how many simultaneous requests one instance handles) and how that setting directly affects how many instances get provisioned under load
- Revisions and traffic splitting for gradual rollouts, distinct from a hard cutover deployment

**Checkpoint:** can you explain why Cloud Run scaling to zero when idle is fundamentally different from a traditional VM or container that's simply "stopped," in terms of billing and cold-start behavior?

## Phase 2: Cold Starts and Configuration (Week 2-3)

- Cold start behavior specifically for Cloud Run: container startup time directly becomes request latency for the first request to a new instance, and why minimizing image size and startup work matters more here than on an always-running service
- Minimum instances (keeping some instances warm to avoid cold starts) vs. accepting scale-to-zero's cost savings — a genuine latency-vs-cost tradeoff, not a default choice
- Environment variables, secrets (Secret Manager integration), and CPU/memory allocation per instance
- CPU allocation modes: "CPU only allocated during request processing" vs. "CPU always allocated" — a Cloud Run-specific setting with real cost and background-task implications

**Checkpoint:** given a service with a background task that needs to keep running slightly after the HTTP response is sent, can you explain why the CPU allocation mode matters for whether that task actually completes?

## Phase 3: Networking and Integration (Week 3-5)

- VPC connectors for reaching resources inside a private VPC (like a Cloud SQL instance) from a Cloud Run service
- Cloud Run jobs (for run-to-completion batch/cron-style work) as distinct from Cloud Run services (for long-running HTTP-triggered workloads)
- Event-driven triggers via Eventarc (Cloud Storage, Pub/Sub events triggering a Cloud Run service) as the standard event-driven integration pattern
- IAM-based service-to-service authentication for private Cloud Run services that shouldn't be publicly invocable

**Checkpoint:** can you explain the difference between a Cloud Run service and a Cloud Run job, and give a real example of a workload that fits each?

## Phase 4: Production Readiness and Interview Readiness (Week 5-6)

- Comparing Cloud Run against GKE and Cloud Functions for a given workload — knowing which one actually fits, not defaulting to Cloud Run because it's simplest
- Observability: Cloud Logging/Monitoring integration and what's automatically captured versus what needs application-level instrumentation
- Cost model: pay only for CPU/memory time actually spent handling requests, and how concurrency setting directly affects the real cost-per-request
- Review this course's Interview Q&A material, particularly the cold-start mitigation and Cloud Run vs. GKE vs. Cloud Functions comparison questions

## Common Pitfalls Specific to Cloud Run

- **Assuming background work after the response completes reliably** — with default CPU allocation, CPU isn't guaranteed after the response is sent; this needs the "CPU always allocated" setting or a different architecture
- **Setting minimum instances to zero for a genuinely latency-sensitive service without measuring the actual cold-start impact** — the cost savings from scale-to-zero aren't free if they visibly hurt user-facing latency
- **Reaching for GKE by default when Cloud Run would genuinely be simpler and sufficient** — Cloud Run exists specifically for HTTP-triggered container workloads that don't need Kubernetes' full feature set
- **Ignoring concurrency setting's effect on scaling** — a low per-instance concurrency setting causes more instances to spin up under the same load than a higher one would, directly affecting both latency and cost

## Getting Your First Cloud-Run-Heavy Role

1. **Portfolio:** a project demonstrating a real Cloud Run service with documented cold-start measurements and a deliberate choice (minimum instances vs. accepting cold starts) justified with real numbers
2. **Resume:** be specific — "eliminated cold-start latency spikes for a customer-facing API by configuring minimum instances, reducing p99 latency from 1.8s to 210ms" is far stronger than "experience with Cloud Run"
3. **Know the Cloud Run vs. GKE vs. Cloud Functions decision cold:** this comparison is one of the most commonly tested practical GCP serverless questions
4. **Certifications, if pursuing one:** Cloud Run is covered in Google Cloud's Professional Cloud Developer and Associate Cloud Engineer certifications — see this course's own Certification Guide for current format and pricing
