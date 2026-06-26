# HA / DR Design

> **High Availability and Disaster Recovery — RTO, RPO, multi-AZ patterns**

**Category:** Site Reliability Engineering  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is HA / DR Design?

HA and DR are different things. HA: keep running during partial failures with no downtime (a node dies, traffic shifts to another). DR: recover from total failure with acceptable downtime (an entire region goes down). RTO = how long can you be down? RPO = how much data can you lose? These numbers drive every architecture decision.

## Why HA / DR Design?

Production Kubernetes requires explicit HA configuration. By default all 3 replicas of a deployment could land on the same node — one node failure kills all of them. Anti-affinity spreads pods across nodes and AZs. PodDisruptionBudget ensures minimum replicas stay running during node drains. Probes ensure traffic only reaches healthy pods.

---

## Learning Modules

### Module 01 — HA vs DR — The Difference
*RTO, RPO, availability tiers*

HA and DR are different things. HA: keep running during partial failures with no downtime (a node dies, traffic shifts to another). DR: recover from total failure with acceptable downtime (an entire region goes down). RTO = how long can you be down? RPO = how much data can you lose? These numbers drive every architecture decision.

**Topics covered:**

- High Availability — survive partial failure — 🟢 Beginner
- Disaster Recovery — survive total failure — 🟢 Beginner
- RTO — Recovery Time Objective — 🟢 Beginner
- RPO — Recovery Point Objective — 🟢 Beginner
- Availability percentages — 99.9% vs 99.99% — 🟡 Intermediate

```bash
# Availability targets and their real meaning:
# 99.9%   = 8.7 hours/year   = 43.2 min/month  = 10 min/week
# 99.95%  = 4.4 hours/year   = 21.6 min/month
# 99.99%  = 52.6 min/year    = 4.3 min/month
# 99.999% = 5.3 min/year     = 26 sec/month

# HA — designed for partial failures:
# A node dies          → K8s reschedules pods to healthy nodes
# A pod crashes        → K8s restarts it (liveness probe)
# A deployment fails   → rolling update pauses, PDB prevents full outage
# A DB node fails      → Multi-AZ replica promotes automatically

# DR — designed for total failures:
# An entire AZ goes down    → traffic routes to other AZs
# An entire region goes down → failover to DR region (RTO = minutes to hours)
# Database corruption        → restore from backup (RPO = last backup)

# RTO/RPO targets by tier:
# Payment / Auth (Tier 1): RTO < 15min,  RPO < 1min
# Product / Search (Tier 2): RTO < 1hr,  RPO < 15min
# Reporting (Tier 3): RTO < 4hr,         RPO < 1hr
# Internal tools: RTO < 24hr,            RPO < 24hr
```

### Module 02 — HA Patterns in Kubernetes
*Anti-affinity, PDB, probes, replicas*

Production Kubernetes requires explicit HA configuration. By default all 3 replicas of a deployment could land on the same node — one node failure kills all of them. Anti-affinity spreads pods across nodes and AZs. PodDisruptionBudget ensures minimum replicas stay running during node drains. Probes ensure traffic only reaches healthy pods.

**Topics covered:**

- Pod anti-affinity — spread across zones — 🟡 Intermediate
- PodDisruptionBudget — min replicas during maintenance — 🟡 Intermediate
- Liveness, Readiness, Startup probes — 🟢 Beginner
- Resource requests for scheduler decisions — 🟡 Intermediate
- Topology spread constraints — 🔴 Advanced

```bash
# HA Kubernetes deployment — production template
apiVersion: apps/v1
kind: Deployment
spec:
  replicas: 3
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxUnavailable: 1   # max 1 pod down at once during update
      maxSurge: 1         # allow 1 extra pod during update
  template:
    spec:
      # Spread pods across availability zones
      affinity:
        podAntiAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
          - labelSelector:
              matchLabels:
                app: payment
            topologyKey: topology.kubernetes.io/zone
      containers:
      - name: payment
        resources:
          requests:
            cpu: "200m"
            memory: "256Mi"
          limits:
            memory: "512Mi"
        livenessProbe:
          httpGet:
            path: /healthz
            port: 8080
          initialDelaySeconds: 30
          periodSeconds: 10
          failureThreshold: 3
        readinessProbe:
          httpGet:
            path: /ready
            port: 8080
          periodSeconds: 5
          failureThreshold: 2
---
# PodDisruptionBudget — minimum 2 pods always running
apiVersion: policy/v1
kind: PodDisruptionBudget
metadata:
  name: payment-pdb
spec:
  minAvailable: 2
  selector:
    matchLabels:
      app: payment
```

### Module 03 — DR Strategies
*Backup/Restore, Pilot Light, Warm Standby, Active/Active*

Four DR strategies in order of cost and speed. Choose based on your RTO/RPO targets. Backup and Restore: cheapest, RTO hours. Pilot Light: core components always on, scale up on failure, RTO 10-30min. Warm Standby: scaled-down running copy in DR region, RTO minutes. Active/Active: two regions both serving traffic, RTO seconds but most expensive.

**Topics covered:**

- Backup and Restore — cheapest, slowest — 🟢 Beginner
- Pilot Light — minimal always-on resources — 🟡 Intermediate
- Warm Standby — scaled-down running copy — 🟡 Intermediate
- Multi-Site Active/Active — fastest, most expensive — 🔴 Advanced
- Database replication strategies — 🔴 Advanced

```bash
# DR Strategy Selection Guide

# 1. BACKUP AND RESTORE (cheapest)
# Cost:  $
# RTO:   Hours
# RPO:   Hours (time since last backup)
# Use when: internal tools, low-criticality systems
# AWS: S3 backups + CloudFormation to recreate infra
# Azure: Azure Backup + ARM templates

# 2. PILOT LIGHT
# Cost:  $$
# RTO:   10-30 minutes
# RPO:   Minutes (continuous replication)
# Minimal resources always running in DR region:
# - Database replica (read-only, promoted on failover)
# - Container images in DR registry
# - DNS ready to switch
# On failure: scale up compute, promote DB, switch DNS

# 3. WARM STANDBY
# Cost:  $$$
# RTO:   Minutes
# RPO:   Seconds (continuous replication)
# Scaled-down copy running in DR region:
# - DB replica (promoted on failover)
# - 1-2 pods per service (scaled to full on failover)
# - Load balancer ready (weight 0)
# On failure: scale pods, promote DB, shift LB weight

# 4. ACTIVE/ACTIVE (most expensive)
# Cost:  $$$$
# RTO:   Seconds
# RPO:   Near-zero
# Both regions serve production traffic:
# - Global load balancer (AWS Route53, Azure Traffic Manager)
# - Bi-directional DB replication
# - Stateless services only (or distributed cache)
# Challenge: data consistency across regions

# Database replication for DR:
# PostgreSQL: streaming replication to standby
# MySQL/RDS:  Multi-AZ (synchronous), Read Replica (async)
# Cosmos DB:  Multi-region writes built-in
# Redis:      Redis Sentinel (HA) or Redis Cluster (DR)
```

### Module 04 — DR Runbook
*Failover procedures and testing*

DR only works if you test it. Teams that never test their DR find it does not work in real incidents. Run GameDay exercises quarterly — simulate a region failure in non-prod and practice the runbook. Chaos engineering (Chaos Monkey, LitmusChaos) deliberately kills infrastructure to find weaknesses before real failures do.

**Topics covered:**

- DNS failover with low TTL — 🟡 Intermediate
- Database promotion procedure — 🔴 Advanced
- DR testing — chaos engineering — 🔴 Advanced
- GameDay exercises — 🟡 Intermediate

```bash
# DR Failover Runbook — example for AKS multi-region

# STEP 1: Detect (automated alert)
# Alert: Primary region health check failing > 2 minutes
# PagerDuty page to on-call engineer

# STEP 2: Confirm (2 minutes)
az aks get-credentials --resource-group prod-rg --name prod-aks
kubectl get nodes
# If unreachable: confirm region outage via Azure Status page

# STEP 3: Communicate (5 minute mark)
# Post in #incidents: "Initiating failover to DR region. ETA 15 minutes."

# STEP 4: Database failover
az sql failover-group failover \\
  --name prod-fog \\
  --resource-group dr-rg \\
  --server dr-sql-server
# Wait for: failoverGroupState = Primary (in DR server)

# STEP 5: Scale up DR compute
az aks nodepool scale \\
  --resource-group dr-rg \\
  --cluster-name dr-aks \\
  --name default \\
  --node-count 10

# STEP 6: Shift DNS traffic
az network traffic-manager endpoint update \\
  --resource-group prod-rg \\
  --profile-name global-tm \\
  --name primary-endpoint \\
  --type azureEndpoints \\
  --weight 0
az network traffic-manager endpoint update \\
  --name dr-endpoint \\
  --weight 100
# DNS TTL was 60s — traffic shifts within 1 minute

# STEP 7: Verify
curl -s https://myapp.example.com/health
# Monitor error rates for 10 minutes
# Confirm requests hitting DR region in logs

# DR TESTING — run quarterly
# LitmusChaos for Kubernetes fault injection:
kubectl apply -f https://litmuschaos.github.io/litmus/litmus-operator.yaml
# Experiments: pod-delete, node-drain, network-loss, disk-fill
```

---

## Production Example

```bash
# HA/DR Architecture — Interview Answer Framework

# Q: "Design an HA/DR architecture for a payment platform.
#     RTO = 15 minutes, RPO = 1 minute."

# ANSWER (PSR format):

# ARCHITECTURE:
# ┌─────────────────────────────────────────────────────┐
# │  Region: Primary (East US)                          │
# │  ┌──────────┐  ┌──────────┐  ┌──────────┐         │
# │  │ AZ-1     │  │ AZ-2     │  │ AZ-3     │         │
# │  │ 2 pods   │  │ 2 pods   │  │ 2 pods   │  ← HA   │
# │  └──────────┘  └──────────┘  └──────────┘         │
# │  Azure SQL (Primary) ─sync─► AZ replica            │
# └─────────────────────────────────────────────────────┘
#           │ async replication (RPO < 1 min)
# ┌─────────────────────────────────────────────────────┐
# │  Region: DR (West US) — Warm Standby                │
# │  ┌──────────────────────────────────────┐          │
# │  │ 2 pods (scaled to 6 on failover)     │  ← DR   │
# │  │ Azure SQL replica (promoted on fail) │          │
# │  └──────────────────────────────────────┘          │
# └─────────────────────────────────────────────────────┘

# MEETING RTO 15 MIN:
# - DNS TTL: 60 seconds (fast switchover)
# - Azure Traffic Manager health check: 30s detection
# - DB promotion: automated via Failover Group (~2 min)
# - Pod scale-up: pre-warmed images, ~5 min to full capacity
# - Total: ~8-10 minutes from detection to restored traffic

# MEETING RPO 1 MIN:
# - Synchronous replication within AZs (RPO = 0)
# - Async replication to DR region (RPO < 30 seconds)
# - Transaction logs shipped continuously
```

---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is HA / DR Design and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does HA / DR Design work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of HA / DR Design?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in HA / DR Design?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with HA / DR Design?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe HA / DR Design in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for HA / DR Design?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does HA / DR Design compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain HA vs DR — The Difference in HA / DR Design."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain HA Patterns in Kubernetes in HA / DR Design."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [AWS DR Whitepaper](https://docs.aws.amazon.com/whitepapers/latest/disaster-recovery-workloads-on-aws/disaster-recovery-workloads-on-aws.html)
- [Azure DR Guidance](https://learn.microsoft.com/en-us/azure/reliability/disaster-recovery-overview)
- [K8s Pod Disruption Budget](https://kubernetes.io/docs/tasks/run-application/configure-pdb/)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*