# HA / DR Design

> **High Availability and Disaster Recovery — RTO, RPO, multi-AZ patterns**

**Category:** Site Reliability Engineering  
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

**Before you start:** solid Kubernetes (Deployments, Services, node scheduling) is required — most of the patterns here are Kubernetes-native. Basic cloud concepts (regions, availability zones) help too.

---

## What is HA / DR Design?

**HA (High Availability)** and **DR (Disaster Recovery)** solve different problems. HA keeps a system running through *partial* failure with no real downtime — a node dies, traffic shifts to another node automatically. DR recovers from *total* failure with some acceptable downtime — an entire region goes down and you fail over elsewhere. Two numbers drive every decision here: **RTO** (Recovery Time Objective — how long can you be down?) and **RPO** (Recovery Point Objective — how much data can you afford to lose, measured as time since the last durable copy?).

## Why HA / DR Design?

Production Kubernetes requires explicit HA configuration — it isn't automatic. By default, all 3 replicas of a Deployment could land on the same node, so one node failure kills all of them at once. **Anti-affinity** rules spread pods across nodes and availability zones. A **PodDisruptionBudget** ensures a minimum number of replicas stay running during voluntary disruptions like node drains. Liveness/readiness **probes** ensure traffic only ever reaches pods that are actually healthy.

---

## Learning Modules

### Module 01 — HA vs DR — The Difference
*RTO, RPO, availability tiers*

Covered above: the HA/DR distinction and what RTO/RPO mean. This module puts real numbers on "how much downtime is acceptable" per tier.

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

Covered above: why HA needs explicit configuration and the four mechanisms involved. This module shows the actual manifests.

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

**PSR Formula:** Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

**Q1. What is HA / DR Design and why would you use it in production?**

**A:** HA (High Availability) keeps a system running through partial failure — a node or pod dies and traffic shifts automatically, with no real downtime. DR (Disaster Recovery) handles total failure — an entire region goes down and you fail over elsewhere, accepting some planned downtime. Every production system needs both, and the acceptable RTO (how long you can be down) and RPO (how much data you can lose) should be set deliberately per service tier, not left implicit — a payment system and an internal admin tool don't need the same guarantees, and treating them the same wastes money on the low-tier one or under-protects the high-tier one.

---

**Q2. How does HA / DR Design work internally? Explain the architecture.**

**A:** HA is enforced at the scheduling layer: pod anti-affinity spreads replicas across nodes and availability zones so one node or zone failure can't take out every replica at once, a PodDisruptionBudget guarantees a minimum number of healthy replicas survive voluntary disruptions like node drains, and liveness/readiness probes make sure traffic is only routed to pods that are actually healthy. DR is enforced at the region layer: a chosen strategy (backup/restore, pilot light, warm standby, or active/active) determines what's already running in a second region and how fast it can take over, with database replication and DNS failover as the mechanics that actually move traffic and data during a real failover.

---

**Q3. What are the main components of HA / DR Design?**

**A:** For HA: anti-affinity rules, PodDisruptionBudgets, liveness/readiness/startup probes, and resource requests (so the scheduler can make good placement decisions). For DR: a chosen strategy tier (backup/restore, pilot light, warm standby, active/active), database replication set up to match the target RPO, DNS failover with a low TTL, and a tested runbook — a strategy that's never been rehearsed isn't a real DR plan.

---

**Q4. How do you handle failures in HA / DR Design?**

**A:** For partial failures (HA), Kubernetes reacts automatically once anti-affinity, PDBs, and probes are configured: a node dies, pods reschedule elsewhere; a pod crashes, its liveness probe triggers a restart. For total failures (DR), the runbook drives the response: detect (automated alert), confirm (check the actual region/cluster status), communicate ("initiating failover, ETA X minutes"), fail over the database, scale up DR-region compute, shift DNS traffic, then verify — in that order, because skipping the communicate step or reordering these makes incidents worse even when the technical failover itself works.

---

**Q5. What is your production experience with HA / DR Design?**

**A:** *(Needs verification — this platform can't fabricate a first-person production story. Answer from your own experience: what RTO/RPO targets you've worked against, which DR tier you ran — pilot light, warm standby, etc. — and what a real or GameDay failover actually looked like.)*

---

**Q6. How do you monitor and observe HA / DR Design in production?**

**A:** HA health is visible through standard Kubernetes signals: pod restart counts, node status, and PDB status showing whether the minimum-available threshold is being respected during drains. DR readiness needs its own explicit monitoring, since it's easy to silently rot: replication lag between primary and DR-region databases (this is your actual real-time RPO), DR-region health checks even while it's not serving traffic, and — critically — scheduled GameDay exercises, since a DR plan that's never been tested is unverified, not working.

---

**Q7. What are the security considerations for HA / DR Design?**

**A:** The DR region needs the same security posture as production, not a lighter version — same network policies, same IAM/RBAC, same secrets management — because "we'll harden it after we fail over" is not a plan you get to execute calmly during an actual regional outage. Database replication traffic between regions should be encrypted in transit. And DR/backup credentials are high-value targets precisely because they're touched rarely, so they need the same rotation and access-review discipline as production credentials, not less.

---

**Q8. How does HA / DR Design compare to alternatives?**

**A:** The real comparison isn't HA/DR vs. some alternative — it's choosing the right DR strategy tier for each service. Backup and Restore is cheapest but slowest (RTO in hours) — fine for low-criticality internal tools. Pilot Light keeps minimal resources always-on for a 10-30 minute RTO. Warm Standby runs a scaled-down copy for a minutes-level RTO. Active/Active runs both regions serving production traffic simultaneously for a seconds-level RTO, at the highest cost and with real data-consistency challenges across regions. Choosing the most expensive tier for every service is as much a mistake as under-protecting a critical one.

---

**Q9. Explain HA vs DR — The Difference in HA / DR Design.**

**A:** HA keeps you running through partial failure with effectively no downtime — a node dies, Kubernetes reschedules the pods elsewhere automatically. DR recovers from total failure — an entire region goes down — with some accepted downtime defined by RTO, and some accepted data loss defined by RPO. Confusing the two leads to bad architecture: HA mechanisms alone (anti-affinity, PDBs) don't protect you if an entire region fails, and DR mechanisms alone are too slow to handle routine single-node failures gracefully.

---

**Q10. Explain HA Patterns in Kubernetes in HA / DR Design.**

**A:** Four mechanisms work together: pod anti-affinity spreads replicas across nodes/zones so a single failure can't take out all of them; a PodDisruptionBudget sets a minimum number of replicas that must stay available during voluntary disruptions like node drains or upgrades; liveness probes restart unhealthy pods automatically; and readiness probes keep traffic away from a pod until it's actually able to serve it. None of this is automatic by default — a Deployment with 3 replicas and no anti-affinity rule can still land all 3 replicas on the same node.

---

## Official Resources

- [AWS DR Whitepaper](https://docs.aws.amazon.com/whitepapers/latest/disaster-recovery-workloads-on-aws/disaster-recovery-workloads-on-aws.html)
- [Azure DR Guidance](https://learn.microsoft.com/en-us/azure/reliability/disaster-recovery-overview)
- [K8s Pod Disruption Budget](https://kubernetes.io/docs/tasks/run-application/configure-pdb/)

---

