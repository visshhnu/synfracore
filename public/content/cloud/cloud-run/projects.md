# Cloud Run — Portfolio Projects

Build these projects to demonstrate real skills to employers. Each project is designed to be interview-worthy — something you can walk through in detail.

## Project 1: Container-to-URL Deployment Pipeline

**Level:** Beginner | **Time:** 2 days

Take a small existing app (any language), containerize it, and deploy it to Cloud Run with a real CI/CD pipeline — every push to `main` produces a new revision automatically.

### Steps

1. Write a `Dockerfile` for your app (or use `--source` and let Buildpacks handle it)
2. Deploy manually first with `gcloud run deploy` and confirm the public URL works
3. Set up GitHub Actions (or Cloud Build triggers) to deploy on push to `main`
4. Add environment variables and at least one secret via Secret Manager (`--set-secrets`)
5. Lock the service down with `--no-allow-unauthenticated` and grant access via `roles/run.invoker` to a specific caller identity
6. Document the deploy pipeline and the auth model in your README

### Skills Demonstrated

- Cloud Run deployment fundamentals
- CI/CD for containers
- IAM-based service-to-service auth

### GitHub Repo Name

`cloud-run-deploy-pipeline`

---

## Project 2: Canary-Deployed API with Rollback

**Level:** Intermediate | **Time:** 3 days

Build a REST API on Cloud Run and practice a real canary release: ship a breaking change to 10% of traffic, detect it's broken, and roll back — all without redeploying old code.

### Steps

1. Design and deploy v1 of the API, serving 100% of traffic
2. Deploy v2 with `--no-traffic` and a `--tag`, then shift 10% of traffic to it with `update-traffic --to-tags`
3. Add structured logging so you can distinguish v1 vs v2 responses in Cloud Logging
4. Deliberately ship a v2 bug, observe it in the 10% slice, and roll back with `update-traffic --to-revisions`
5. Add a Cloud Run Job for a scheduled maintenance task (e.g. a nightly cleanup) triggered by Cloud Scheduler
6. Document the rollback timeline: how long from "noticed the bug" to "100% back on v1"

### Skills Demonstrated

- Traffic splitting and canary deploys
- Incident response / rollback practice
- Cloud Run Jobs + Scheduler

### GitHub Repo Name

`cloud-run-canary-api`

---

## Project 3: Cost- and Latency-Tuned Production Service

**Level:** Advanced | **Time:** 5 days

Take a realistic workload (CPU-bound vs I/O-bound — pick one) and tune Cloud Run's concurrency, CPU allocation, and min-instances settings to hit a latency target at the lowest sustainable cost.

### Steps

1. Build a small load-testing harness (e.g. `hey` or `k6`) against your service
2. Benchmark default settings (concurrency 80, min-instances 0) and record p50/p95 latency including cold starts
3. Tune concurrency to match your workload's CPU/IO profile — low concurrency for CPU-bound work, high concurrency for IO-bound work
4. Compare `min-instances=0` vs `min-instances>0` on cold-start-driven tail latency and the resulting cost difference
5. Connect to a private backend (Cloud SQL or Redis) via a Serverless VPC Access connector or Direct VPC egress and measure the latency impact
6. Write up your tuning decisions and the latency/cost tradeoff data — this is the actual deliverable

### Skills Demonstrated

- Concurrency and scaling tuning
- Load testing and latency analysis
- VPC connectivity from serverless

### GitHub Repo Name

`cloud-run-tuned-service`

---

## Tips for Great Projects

**Make it real.** Solve an actual problem, even a small one. "Deployed a real webhook handler I actually use, on Cloud Run, with a real rollback story" is more impressive than a tutorial clone.

**Document everything.** A repo with a great README beats one with better code but no explanation. Include: what it does, why you built it, how to run it, what you learned.

**Show your thinking.** In interviews, you'll be asked: "Why did you choose X over Y?" Have a reason. Architecture decisions matter.

**Iterate publicly.** Make commits regularly. Employers look at commit history. 10 commits over a week shows real work; 1 commit with everything shows you copied it.

## Portfolio Checklist

- [ ] 3+ projects on GitHub with clear READMEs  
- [ ] At least 1 project with CI/CD (GitHub Actions pipeline)
- [ ] At least 1 project that solves a real problem
- [ ] Each project has an architecture diagram
- [ ] Projects are pinned on your GitHub profile
