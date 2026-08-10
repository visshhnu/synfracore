# Argo Rollouts

> **Progressive delivery — canary, blue-green with automated analysis**

**Category:** CI/CD  
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

---

## What is Argo Rollouts?

Standard Kubernetes rolling update moves all traffic gradually but has no intelligence — it cannot check if the new version is actually healthy based on business metrics before proceeding. Argo Rollouts adds: precise traffic weight control (10% canary), automated analysis (check error rate in Prometheus before proceeding), automatic rollback if analysis fails, and works alongside ArgoCD for full GitOps progressive delivery.

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
kubectl apply -n argo-rollouts \\
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

**A:** *Add your answer here based on your real experience.*

**Framework:** State the problem it solves → explain your solution → describe the result.

---

**Q2. How does Argo Rollouts work internally? Explain the architecture.**

**A:** *Add your answer here based on your real experience.*

**Framework:** State the problem it solves → explain your solution → describe the result.

---

**Q3. What are the main components of Argo Rollouts?**

**A:** *Add your answer here based on your real experience.*

**Framework:** State the problem it solves → explain your solution → describe the result.

---

**Q4. How do you handle failures in Argo Rollouts?**

**A:** *Add your answer here based on your real experience.*

**Framework:** State the problem it solves → explain your solution → describe the result.

---

**Q5. What is your production experience with Argo Rollouts?**

**A:** *Add your answer here based on your real experience.*

**Framework:** State the problem it solves → explain your solution → describe the result.

---

**Q6. How do you monitor and observe Argo Rollouts in production?**

**A:** *Add your answer here based on your real experience.*

**Framework:** State the problem it solves → explain your solution → describe the result.

---

**Q7. What are the security considerations for Argo Rollouts?**

**A:** *Add your answer here based on your real experience.*

**Framework:** State the problem it solves → explain your solution → describe the result.

---

**Q8. How does Argo Rollouts compare to alternatives?**

**A:** *Add your answer here based on your real experience.*

**Framework:** State the problem it solves → explain your solution → describe the result.

---

**Q9. Explain Why Argo Rollouts? in Argo Rollouts.**

**A:** *Add your answer here based on your real experience.*

**Framework:** State the problem it solves → explain your solution → describe the result.

---

**Q10. Explain Canary with AnalysisTemplate in Argo Rollouts.**

**A:** *Add your answer here based on your real experience.*

**Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [Argo Rollouts Documentation](https://argo-rollouts.readthedocs.io/)
- [Analysis and Progressive Delivery](https://argo-rollouts.readthedocs.io/en/stable/features/analysis/)

---

