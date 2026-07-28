# HA & DR Interview Q&A

**Q: RTO vs RPO?**
RTO (Recovery Time Objective): how long can we be down? Target for restoring service after failure. RPO (Recovery Point Objective): how much data can we lose? Maximum acceptable data loss measured in time.

**Q: Active-Active vs Active-Passive?**
Active-Active: both sites serve traffic simultaneously. Zero downtime, complex data sync, expensive. Active-Passive: primary serves all traffic, secondary on standby. Simpler, cheaper, but failover has downtime (minutes typically).

**Q: How do you design a multi-region K8s deployment?**
Primary cluster in region A, replica in region B. Global load balancer (AWS Route53/Azure Traffic Manager) with health checks. Data layer: geo-replicated database (CockroachDB/Cosmos DB/Aurora Global). Deploy with identical Helm charts via ArgoCD ApplicationSet across both clusters.

**Q: What is the difference between HA and DR?**
HA (High Availability): keeps the system running through component failures — redundancy within a region, no planned downtime. DR (Disaster Recovery): recovers from catastrophic failure (data center loss, ransomware) — restores from backup or failover to another region. HA prevents outages; DR recovers from them.

**Q: How do you test DR without causing an actual outage?**
Chaos engineering: controlled, planned failure injection (Chaos Monkey, Gremlin, AWS Fault Injection Simulator). Game days: scheduled DR tests where team simulates failover. The key is testing before you need it — discover gaps in the runbook while there is no pressure.

**Q: What is an RPO of zero and how do you achieve it?**
RPO=0 means zero data loss — any transaction committed before failure must be preserved. Achieved with: synchronous database replication (writes are confirmed only after secondary acknowledges), multi-region active-active writes, distributed consensus databases (CockroachDB, Spanner). Expensive in latency — every write waits for remote acknowledgment.

**Q: Explain the DR strategy pyramid from cheapest to most expensive.**
1. Backup & Restore (cheapest): backup to S3, restore on failure. RTO: hours. RPO: last backup.
2. Pilot Light: minimal version always running, scale up on failure. RTO: 10-30 min.
3. Warm Standby: scaled-down but functional copy. RTO: minutes.
4. Multi-Site Active-Active (most expensive): both sites serve traffic. RTO: near-zero.
