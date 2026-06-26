# HA & DR

SRE › HA & DR
🔄**HA & DR**
BeginnerEngineerProductionArchitectHigh Availability and Disaster Recovery — RTO, RPO, Kubernetes HA, database failover
[HA vs DR](#sec-concepts)[K8s HA](#sec-kubernetes)[Database HA](#sec-database)[Disaster Recovery](#sec-dr)[Interview Q&A](#sec-interview)


## 🔄 HA vs DR — Core Concepts›


#### Two Different Problems

|  | High Availability (HA) | Disaster Recovery (DR) |
|---|---|---|
| Scenario | Pod crashes, node fails, AZ down | Entire region unavailable |
| Goal | Zero downtime during partial failure | Recover from total failure |
| RTO | Seconds to minutes | Minutes to hours |
| Solution | Multiple replicas, anti-affinity, PDB | Multi-region, backups, runbooks |
| Cost | Medium (+50-100% infra) | High (+100-200% infra for active-passive) |


RTO/RPO/MTTR + CAP theoremCopy

```

```


## ☸️ HA in Kubernetes›


PDB, anti-affinity, topology spread, health probesCopy

```

```


## 🗄️ Database HA›


PostgreSQL HA, RDS Multi-AZ, backup strategyCopy

```

```


## 🌍 Disaster Recovery›


#### DR Tiers

| Strategy | RPO | RTO | Cost | Use when |
|---|---|---|---|---|
| Active-Active | ~0 | ~0 | 2x | RTO/RPO requirements are seconds |
| Active-Passive (warm) | Minutes | 5-15 min | 1.5x | Business-critical, can afford 15 min downtime |
| Backup + Restore | Hours | 1-4 hours | 1.1x | Non-critical, cost-sensitive |


Velero K8s backup, DR runbook, chaos engineeringCopy

```

```


## 🎯 Interview Questions›


All
Architect
Engineer
Production


HA/DR · ENGINEER
What is the difference between RTO and RPO? Give a concrete example.
RTO (Recovery Time Objective) is the maximum acceptable time your system can be down after a failure. It answers: how long until we must be back online? RPO (Recovery Point Objective) is the maximum acceptable amount of data that can be lost. It answers: how old can our last good data backup be? Concrete example: payment processing system. Business decides: we cannot afford to be down more than 15 minutes (RTO=15min) and we cannot lose more than 1 minute of transaction data (RPO=1min). These requirements drive architecture decisions: RTO of 15 minutes means you need a warm standby that can be promoted quickly — not a cold backup that takes 2 hours to restore. RPO of 1 minute means you need synchronous or near-synchronous replication — daily backups would give RPO of 24 hours. Lower RTO and RPO = higher infrastructure cost. A system with RTO=0 and RPO=0 (no downtime, no data loss) requires active-active multi-region architecture — very expensive. Chose RTO and RPO based on business impact of downtime versus cost of HA infrastructure.

HA/DR · ARCHITECT
How do you design a highly available application on Kubernetes?
HA in Kubernetes requ
