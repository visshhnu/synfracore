# HA & DR Interview Q&A

**Q: RTO vs RPO?**
RTO (Recovery Time Objective): how long can we be down? Target for restoring service after failure. RPO (Recovery Point Objective): how much data can we lose? Maximum acceptable data loss measured in time.

**Q: Active-Active vs Active-Passive?**
Active-Active: both sites serve traffic simultaneously. Zero downtime, complex data sync, expensive. Active-Passive: primary serves all traffic, secondary on standby. Simpler, cheaper, but failover has downtime (minutes typically).

**Q: How do you design a multi-region K8s deployment?**
Primary cluster in region A, replica in region B. Global load balancer (AWS Route53/Azure Traffic Manager) with health checks. Data layer: geo-replicated database (CockroachDB/Cosmos DB/Aurora Global). Deploy with identical Helm charts via ArgoCD ApplicationSet across both clusters.

## Quick Reference — Ha Dr

### Key Points for Revision

- Review the overview section for core architecture and fundamentals
- Practice commands/configurations from the cheatsheet section
- Use interview Q&A for active recall before exams or interviews
- Cross-reference with related tools in the devops academy

### Related Topics

Explore these connected topics to build complete understanding:
- Overview and Architecture
- Fundamentals and Core Concepts
- Advanced Patterns and Production Usage
- Interview Preparation Q&A
- Quick Reference Cheatsheet

### Practice Approach

1. Read the overview to understand *what* and *why*
2. Work through fundamentals for *how*
3. Attempt hands-on labs or configurations
4. Test yourself with interview questions
5. Keep cheatsheet accessible for quick reference during work

### Further Learning

Connect this topic to the broader devops ecosystem. 
Each tool in this academy is designed to work with others —
understanding the integration points is what separates intermediate from senior practitioners.

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

---

*This section is part of the SynfraCore learning platform. Use the sidebar to navigate to Overview, Fundamentals, Advanced, and Cheatsheet sections for comprehensive coverage of this topic.*
