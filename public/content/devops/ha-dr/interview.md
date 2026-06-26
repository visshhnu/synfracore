# HA & DR Interview Q&A

**Q: RTO vs RPO?**
RTO (Recovery Time Objective): how long can we be down? Target for restoring service after failure. RPO (Recovery Point Objective): how much data can we lose? Maximum acceptable data loss measured in time.

**Q: Active-Active vs Active-Passive?**
Active-Active: both sites serve traffic simultaneously. Zero downtime, complex data sync, expensive. Active-Passive: primary serves all traffic, secondary on standby. Simpler, cheaper, but failover has downtime (minutes typically).

**Q: How do you design a multi-region K8s deployment?**
Primary cluster in region A, replica in region B. Global load balancer (AWS Route53/Azure Traffic Manager) with health checks. Data layer: geo-replicated database (CockroachDB/Cosmos DB/Aurora Global). Deploy with identical Helm charts via ArgoCD ApplicationSet across both clusters.
