# Argo Rollouts

> **Progressive delivery — canary, blue-green with automated analysis**

**Category:** CI/CD  
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

---

**Before you start:** solid Kubernetes fundamentals (Deployments, Services) and familiarity with Prometheus/metrics-based monitoring are assumed. Argo CD knowledge helps for the GitOps integration sections but isn't required to follow the core rollout mechanics.

## What is Argo Rollouts?

Standard Kubernetes rolling update moves all traffic gradually but has no intelligence — it cannot check if the new version is actually healthy based on business metrics before proceeding. Argo Rollouts adds: precise traffic weight control (10% canary), automated analysis (check error rate in Prometheus before proceeding), automatic rollback if analysis fails, and works alongside ArgoCD for full GitOps progressive delivery.

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "setWeight: 10", "sublabel": "10% traffic to canary", "color": "blue" },
    { "label": "Analysis", "sublabel": "Query Prometheus — error rate OK?", "color": "purple" },
    { "label": "Pass → setWeight: 50", "sublabel": "Fail → automatic rollback", "color": "green" }
  ]
}
```

## Why Argo Rollouts?

AnalysisTemplate queries Prometheus (or Datadog, Wavefront) during canary steps to check if the new version is healthy. If error rate exceeds threshold in 3 consecutive checks — automatic rollback. This is progressive delivery: data-driven deployment decisions instead of manual approval. Combine with ArgoCD: Git push → ArgoCD syncs Rollout → Argo Rollouts executes canary with analysis.

---

## Learning Modules

### Module 01 — Why Argo Rollouts?
*Beyond kubectl rolling update*

Standard Kubernetes rolling update moves all traffic gradually but has no intelligence — it cannot check if the new version is actually healthy based on business metrics before proceeding. Argo Rollouts adds: precise traffic weight control (10% canary), automated analysis (check error rate in Prometheus before proceeding), automatic rollback if analysis fails, and works alongside ArgoCD for full GitOps progressive delivery.

**Topics covered:**

- Kubernetes rolling update limitations — 🟢 Beginner
- Canary with traffic weights — 🟡 Intermediate
- Blue-Green with instant switchover — 🟡 Intermediate
- AnalysisTemplate — auto rollback on metrics — 🔴 Advanced
- Integration with ArgoCD — 🟡 Intermediate

```bash
# Install Argo Rollouts
kubectl create namespace argo-rollouts
kubectl apply -n argo-rollouts \
  -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml

# Install kubectl plugin
curl -LO https://github.com/argoproj/argo-rollouts/releases/latest/download/kubectl-argo-rollouts-linux-amd64
chmod +x kubectl-argo-rollouts-linux-amd64
sudo mv kubectl-argo-rollouts-linux-amd64 /usr/local/bin/kubectl-argo-rollouts

# Watch a rollout live
kubectl argo rollouts get rollout payment-service --watch

# Manually promote a paused canary
kubectl argo rollouts promote payment-service

# Abort and rollback
kubectl argo rollouts abort payment-service
```

### Module 02 — Canary with AnalysisTemplate
*Auto-proceed or auto-rollback based on metrics*

AnalysisTemplate queries Prometheus (or Datadog, Wavefront) during canary steps to check if the new version is healthy. If error rate exceeds threshold in 3 consecutive checks — automatic rollback. This is progressive delivery: data-driven deployment decisions instead of manual approval. Combine with ArgoCD: Git push → ArgoCD syncs Rollout → Argo Rollouts executes canary with analysis.

**Topics covered:**

- Rollout object — replaces Deployment — 🟡 Intermediate
- Canary steps with pause and weights — 🟡 Intermediate
- AnalysisTemplate — query Prometheus — 🔴 Advanced
- Auto rollback when analysis fails — 🔴 Advanced

```bash
# Rollout — replaces Deployment for canary
apiVersion: argoproj.io/v1alpha1
kind: Rollout
metadata:
  name: payment-service
spec:
  replicas: 10
  selector:
    matchLabels:
      app: payment
  template:
    metadata:
      labels:
        app: payment
    spec:
      containers:
      - name: payment
        image: myregistry/payment:v1.2.3
  strategy:
    canary:
      canaryService: payment-canary    # 10% traffic → new pods
      stableService: payment-stable    # 90% traffic → old pods
      steps:
      - setWeight: 10                  # Start: 10% canary
      - pause: {duration: 5m}          # Wait 5 minutes
      - analysis:
          templates:
          - templateName: error-rate-check  # Run analysis
      - setWeight: 50                  # If passed: 50% canary
      - pause: {duration: 5m}
      - analysis:
          templates:
          - templateName: error-rate-check
      - setWeight: 100                 # Full rollout
---
# AnalysisTemplate — check error rate in Prometheus
apiVersion: argoproj.io/v1alpha1
kind: AnalysisTemplate
metadata:
  name: error-rate-check
spec:
  metrics:
  - name: error-rate
    interval: 1m
    count: 5             # Run 5 times
    failureLimit: 1      # Allow 1 failure before aborting rollout
    successCondition: result[0] >= 0.99  # 99% success rate required
    provider:
      prometheus:
        address: http://prometheus.monitoring:9090
        query: |
          sum(rate(http_requests_total{app="payment",status!~"5.*"}[2m]))
          /
          sum(rate(http_requests_total{app="payment"}[2m]))
```

---

## Production Example

```bash
# Argo Rollouts — Progressive Delivery Summary

# FULL WORKFLOW WITH ARGOCD + ARGO ROLLOUTS:
# 1. Developer pushes new image tag to Git
# 2. ArgoCD detects change, syncs Rollout object
# 3. Argo Rollouts starts canary:
#    - 10% traffic → new pods
#    - Wait 5 minutes
#    - Query Prometheus: is error rate < 1%?
#    - If YES → proceed to 50%
#    - If NO  → automatic rollback, alert team
# 4. At 100% → rollout complete

# COMMANDS:
kubectl argo rollouts list rollouts -n production
kubectl argo rollouts get rollout payment-service --watch
kubectl argo rollouts promote payment-service       # Manual promote
kubectl argo rollouts abort payment-service         # Emergency rollback
kubectl argo rollouts undo payment-service          # Rollback to previous

# DASHBOARD (Argo Rollouts UI):
kubectl argo rollouts dashboard
# Opens at: http://localhost:3100

# INTERVIEW POINT:
# "Standard Kubernetes rolling update is naive — it proceeds
# regardless of whether the new version is healthy.
# Argo Rollouts makes deployments data-driven:
# automated analysis queries your existing Prometheus metrics
# and rolls back automatically if thresholds are breached.
# At a large telecom organisation this would have prevented several incidents
# where bad code got to 100% before anyone noticed."
```

---

## Interview Prep

**PSR Formula:** Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

**Q1. What is Argo Rollouts and why would you use it in production?**

**A:** **Problem:** standard Kubernetes rolling updates proceed based purely on pod readiness — they have no concept of real application-level health (error rate, latency), so a version that starts fine but behaves badly can reach 100% of traffic with nothing catching it. **Solution:** Argo Rollouts replaces `Deployment` with `Rollout`, adding canary/blue-green strategies with precise traffic-weight control and optional automated analysis that queries real metrics (Prometheus, Datadog, etc.) at each step. **Result:** deployments become data-driven and self-protecting — a regression can trigger automatic rollback before it ever reaches full traffic, instead of relying on someone noticing after the fact.

---

**Q2. How does Argo Rollouts work internally? Explain the architecture.**

**A:** **Problem:** understanding what actually drives a canary's progression matters for both debugging and trusting the safety mechanism. **Solution:** Argo Rollouts is a Kubernetes controller that watches `Rollout` custom resources (a superset of a Deployment's pod template plus a `strategy` block). It manages a stable and canary ReplicaSet, adjusts their relative replica counts per the step schedule, and — if a traffic provider (Istio, ALB, NGINX, SMI) is configured — coordinates with that provider to enforce precise traffic-weight splits at the routing layer, not just pod-count proportions. Analysis steps spawn `AnalysisRun` resources that query a configured metrics provider and report success/failure back to the controller. **Result:** the controller, not any single piece, owns the whole progression — which is why checking `kubectl argo rollouts get rollout --watch` (not just pod status) is the right way to understand what state a rollout is actually in.

---

**Q3. What are the main components of Argo Rollouts?**

**A:** **Problem:** "Argo Rollouts" names several distinct custom resources that are useful to separate when reasoning about a rollout. **Solution:** `Rollout` (the Deployment replacement, with canary/blue-green strategy), `AnalysisTemplate`/`ClusterAnalysisTemplate` (reusable metric-query + success-condition definitions), `AnalysisRun` (a single in-progress execution of a template, created automatically at an analysis step), and `Experiment` (runs separate baseline/canary pods to compare metrics without touching live traffic). **Result:** knowing this separation is what makes debugging concrete — a stuck rollout could be a pending `AnalysisRun`, a duration-based pause, or a traffic-provider misconfiguration, and each has a different diagnostic path.

---

**Q4. How do you handle failures in Argo Rollouts?**

**A:** **Problem:** a rollout can fail in different ways — a failed automated analysis, a stuck pause, or a genuinely broken deploy that analysis didn't catch. **Solution:** for an automated analysis failure, the default behavior is abort-style — canary scales down, traffic returns fully to stable, no manual action required. For a deploy that's already fully promoted and found broken afterward, `kubectl argo rollouts undo` initiates a new rollout back to the previous revision. For a stuck pause or unclear state, `kubectl argo rollouts get rollout --watch` combined with `kubectl describe analysisrun` on any associated AnalysisRun shows exactly what's blocking progress. **Result:** the right response depends on which failure mode it actually is — treating every stuck rollout as "just promote past it" risks bypassing a real, working safety check (see this course's Real World Scenarios for a worked example of exactly that mistake).

---

**Q5. What is your production experience with Argo Rollouts?**

**A:** This is a genuinely personal question — answer with a real incident using the Problem → Solution → Result structure: a canary that caught a real regression before full rollout, a traffic-provider misconfiguration that silently made a canary meaningless (see this course's Real World Scenarios for a worked example of exactly this failure mode), or a case where you had to decide between `promote --full` and investigating a stuck analysis. Interviewers are listening for whether you've actually operated progressive delivery under real constraints, not just configured a Rollout object once.

---

**Q6. How do you monitor and observe Argo Rollouts in production?**

**A:** **Problem:** a rollout's own status doesn't tell you everything — a canary can be "progressing normally" per its step schedule while its analysis is silently checking the wrong metrics (e.g. unscoped to canary pods specifically). **Solution:** `kubectl argo rollouts get rollout --watch` and the Argo Rollouts dashboard (`kubectl argo rollouts dashboard`) for live status; `kubectl describe analysisrun` to verify what an analysis step is actually measuring and returning; notifications (Slack, webhook) wired to rollout lifecycle events so completions, aborts, and analysis failures are visible without someone actively watching. **Result:** the combination of live status, analysis-run inspection, and event notifications closes the gap between "the rollout object says it's fine" and confirming the analysis is actually measuring something meaningful.

---

**Q7. What are the security considerations for Argo Rollouts?**

**A:** **Problem:** `promote`, `abort`, and `undo` are real, production-affecting actions on a resource that controls live traffic routing. **Solution:** govern the `Rollout` CRD (and its `AnalysisRun` subresources) with Kubernetes RBAC the same way any production-affecting resource is governed — commonly broader read access paired with narrower write access on the promote/abort/undo verbs specifically. Traffic-provider credentials (Istio config, ALB IAM permissions) also need their own least-privilege scoping, since they control real routing infrastructure. **Result:** this is the same separation-of-duties principle applied to `kubectl delete` on a Deployment in production, extended to Argo Rollouts' own verbs and its traffic-provider integrations.

---

**Q8. How does Argo Rollouts compare to alternatives?**

**A:** This usually means a specific comparison. Against a plain Kubernetes `Deployment`: Rollouts adds precise traffic-weight control and optional metric-based analysis/rollback that a Deployment's rolling update simply doesn't have. Against Flagger (another progressive-delivery controller): both solve similar problems, but Flagger is often paired more tightly with Flux/service-mesh-first workflows, while Argo Rollouts integrates naturally with ArgoCD's GitOps model specifically — the practical choice often comes down to which GitOps tool (ArgoCD vs. Flux) a team has already standardized on. State the specific tool being compared and the actual tradeoff, rather than reciting a generic list.

---

**Q9. Why does Argo Rollouts matter beyond "nicer deployments" — what's the actual production risk it reduces?**

**A:** Standard rolling updates are naive — they proceed regardless of whether the new version is actually healthy, checking only pod readiness. Argo Rollouts makes the deployment process itself data-driven: automated analysis queries real metrics at each step and can trigger rollback automatically if thresholds are breached, before a bad version ever reaches full traffic. This directly reduces the risk class of "a deploy silently degrades production and nobody catches it until a much later, unrelated alert" — the exact failure mode a plain rolling update has no defense against.

---

**Q10. Walk through what happens end to end in a canary rollout with AnalysisTemplate, step by step.**

**A:** A new image tag is applied to the Rollout (directly, or via ArgoCD syncing a Git change). The controller creates a new canary ReplicaSet and begins executing the strategy's steps: `setWeight: 10` shifts 10% of traffic to canary (via the configured traffic provider), `pause` holds at that weight for its duration, then an `analysis` step creates an `AnalysisRun` that queries the configured metrics provider (e.g. Prometheus) against a defined success condition. If it passes, the rollout proceeds to the next `setWeight`; if it fails past the configured `failureLimit`, the rollout automatically aborts — canary scales down, traffic returns fully to stable. This repeats through each step until either full 100% traffic is reached (rollout complete) or an analysis failure triggers rollback.

---

## Official Resources

- [Argo Rollouts Documentation](https://argo-rollouts.readthedocs.io/)
- [Analysis and Progressive Delivery](https://argo-rollouts.readthedocs.io/en/stable/features/analysis/)

