# HA & DR — Fundamentals

## HA vs. DR — Core Concepts

|  | High Availability (HA) | Disaster Recovery (DR) |
|---|---|---|
| Scenario | Pod crashes, node fails, AZ down | Entire region unavailable |
| Goal | Zero downtime during partial failure | Recover from total failure |
| RTO | Seconds to minutes | Minutes to hours |
| Solution | Multiple replicas, anti-affinity, PDB | Multi-region, backups, runbooks |
| Cost | Medium (+50-100% infra) | High (+100-200% infra for active-passive) |

```
RTO (Recovery Time Objective) — how long can we be down?
RPO (Recovery Point Objective) — how much data can we lose?
MTTR (Mean Time To Recovery) — the actual, measured average recovery time

CAP theorem — under a network partition, a distributed system must
choose: Consistency (every read sees the latest write) OR
Availability (every request gets a response, possibly stale) —
you cannot have both simultaneously during the partition.
Most production systems choose AP (available, eventually consistent)
for user-facing reads, and CP for anything involving money/inventory.
```

## HA in Kubernetes

```yaml
# PodDisruptionBudget — guarantees a minimum number of pods stay up
# during voluntary disruptions (node drains, cluster upgrades)
apiVersion: policy/v1
kind: PodDisruptionBudget
metadata:
  name: payment-api-pdb
spec:
  minAvailable: 2
  selector:
    matchLabels: { app: payment-api }
---
# Anti-affinity — spread replicas across different nodes/AZs so one
# node/AZ failure doesn't take out multiple replicas at once
apiVersion: apps/v1
kind: Deployment
metadata: { name: payment-api }
spec:
  replicas: 3
  template:
    spec:
      affinity:
        podAntiAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            - labelSelector: { matchLabels: { app: payment-api } }
              topologyKey: "kubernetes.io/hostname"
      topologySpreadConstraints:
        - maxSkew: 1
          topologyKey: topology.kubernetes.io/zone
          whenUnsatisfiable: DoNotSchedule
          labelSelector: { matchLabels: { app: payment-api } }
      containers:
        - name: payment-api
          readinessProbe:
            httpGet: { path: /health/ready, port: 8080 }
            periodSeconds: 5
          livenessProbe:
            httpGet: { path: /health/live, port: 8080 }
            periodSeconds: 10
```
Readiness probes control whether a pod *receives traffic*; liveness probes control whether Kubernetes *restarts* the pod. Conflating them — using the same shallow check for both — means a pod stuck waiting on a slow dependency gets killed and restarted (liveness) instead of just being pulled from the load balancer until it recovers (readiness), which is usually the wrong response.

## Database HA

```bash
# PostgreSQL streaming replication — a standby ready to promote
# primary: postgresql.conf
wal_level = replica
max_wal_senders = 3

# standby: recovery via replication slot
primary_conninfo = 'host=primary-db port=5432 user=replicator'
primary_slot_name = 'standby1'

# Promote the standby to primary during a real failover
pg_ctl promote -D /var/lib/postgresql/data
```
```
RDS Multi-AZ: AWS manages this automatically — a synchronous standby
in a different AZ, with automatic failover typically under 60-120
seconds. You don't manage replication slots or promotion manually;
RDS handles both, at the cost of it being AWS-specific and not
something you can replicate for a self-managed database elsewhere.

Backup strategy layering:
  Automated daily snapshots — the baseline, covers most recovery needs
  Point-in-time recovery (PITR) via WAL archiving — restores to any
    specific minute, not just the last nightly snapshot
  Cross-region snapshot copy — protects against a full region failure,
    not just node/AZ failure
```

## Disaster Recovery

**DR tiers:**

| Strategy | RPO | RTO | Cost | Use when |
|---|---|---|---|---|
| Active-Active | ~0 | ~0 | 2x | RTO/RPO requirements are seconds |
| Active-Passive (warm) | Minutes | 5-15 min | 1.5x | Business-critical, can afford 15 min downtime |
| Backup + Restore | Hours | 1-4 hours | 1.1x | Non-critical, cost-sensitive |

```bash
# Velero — backs up and restores entire Kubernetes clusters, including
# persistent volume data, to object storage
velero backup create daily-backup --include-namespaces production \
  --ttl 720h0m0s
velero schedule create daily --schedule="0 2 * * *" --include-namespaces production

# Restore into a fresh cluster during an actual disaster
velero restore create --from-backup daily-backup-20260710
```
A DR runbook needs to be a genuinely followable, step-by-step document — who declares a disaster, who has the authority to trigger failover, the exact commands to run in order, and how to verify the failover actually succeeded — tested via periodic DR drills, not written once and assumed correct. Chaos engineering (deliberately triggering a controlled failure and confirming the DR/HA response actually works as designed) is the practical way to validate a runbook actually works before a real disaster is the first time it's tried.

## Interview Questions

**What is the difference between RTO and RPO? Give a concrete example.**
RTO (Recovery Time Objective) is the maximum acceptable time your system can be down after a failure — it answers "how long until we must be back online?" RPO (Recovery Point Objective) is the maximum acceptable amount of data that can be lost — it answers "how old can our last good backup be?" Concrete example: a payment processing system where the business decides it cannot afford to be down more than 15 minutes (RTO=15min) and cannot lose more than 1 minute of transaction data (RPO=1min). These requirements directly drive architecture: an RTO of 15 minutes means a warm standby that can be promoted quickly is needed, not a cold backup taking 2 hours to restore. An RPO of 1 minute means synchronous or near-synchronous replication is needed — daily backups alone would give an RPO of 24 hours, far outside the requirement. Lower RTO and RPO always mean higher infrastructure cost — a system with RTO=0 and RPO=0 (no downtime, no data loss) requires active-active multi-region architecture, which is genuinely expensive. RTO and RPO should be chosen based on the actual business impact of downtime versus the real cost of the HA infrastructure needed to hit them, not set arbitrarily to "as low as possible."

**How do you design a highly available application on Kubernetes?**
HA in Kubernetes requires several layers working together, not any single setting. Run at least 3 replicas (not 2 — with 2, losing 1 during a rolling update or node failure leaves zero redundancy at that moment), spread across multiple nodes and AZs via pod anti-affinity and topology spread constraints, so a single node or AZ failure can't take out multiple replicas simultaneously. Configure a PodDisruptionBudget so voluntary disruptions (node drains, cluster upgrades) never reduce available replicas below a safe minimum. Use genuinely meaningful readiness and liveness probes — a readiness probe checking real downstream dependency health (not just "is the process running") ensures traffic only routes to pods that can actually serve it, while a liveness probe restarts genuinely stuck processes without over-aggressively killing pods still recovering from a slow dependency. For the data layer, use a managed database with Multi-AZ automatic failover (RDS Multi-AZ) or a self-managed replication setup with a tested, practiced promotion procedure — application-layer HA alone doesn't help if the database itself is a single point of failure.
