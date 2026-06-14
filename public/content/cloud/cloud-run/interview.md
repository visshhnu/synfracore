# Cloud Run — Interview Questions

**When would you use Cloud Run vs GKE vs Cloud Functions?**
Cloud Run: containerized services, pay per request, scales to zero, stateless, HTTP/gRPC services, good for: APIs, web apps, microservices with variable traffic. GKE: complex stateful workloads, many microservices, need Kubernetes features (DaemonSets, specific networking, GPU), long-running jobs, existing K8s expertise. Cloud Functions (2nd gen): simple event-driven functions, lightweight triggers, FaaS model, simpler code deployment. Rule: start with Cloud Run (simplicity + flexibility), graduate to GKE when you need more control.

**How does Cloud Run scale to zero and what are cold starts?**
Cloud Run scales to zero when there's no traffic — no instances running, no cost. When a new request arrives: Cloud Run starts a new container instance (cold start) — this adds 100ms to several seconds of latency depending on container size and startup time. Warm instance: already running container, handles request with normal latency. Mitigate cold starts: min-instances (keep N always warm), optimize container startup (small images, fast init), use startup CPU boost. For latency-sensitive production services, set min-instances ≥ 1.

**How do you manage secrets in Cloud Run?**
Three approaches: Environment variables (simple but visible in console logs, avoid for sensitive data). Secret Manager integration (recommended): mount secrets as environment variables or volume files — values fetched from Secret Manager at runtime, auto-rotated, access controlled via IAM. Syntax: --set-secrets DB_PASSWORD=prod-db-password:latest mounts the latest version of the secret as env var. Cloud Run's service account needs secretmanager.versions.access permission on the secret.
