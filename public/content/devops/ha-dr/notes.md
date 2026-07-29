# HA / DR Design — Revision Notes

Condensed reference for quick review. Consolidated from this course's overview, fundamentals, interview, and cheatsheet material.

---

## HA vs. DR — The Core Distinction

```
HA (High Availability): survive PARTIAL failure, zero/near-zero downtime
  Scenario: a node dies, a pod crashes, an AZ has issues
  Solution: replicas, anti-affinity, PDB — WITHIN a region
  RTO: seconds to minutes | Cost: +50-100% infra

DR (Disaster Recovery): survive TOTAL failure, some downtime expected
  Scenario: an ENTIRE region goes down, database corruption, ransomware
  Solution: multi-region, backups, tested runbooks
  RTO: minutes to hours | Cost: +100-200%+ infra (active-passive), 2x+ (active-active)

KEY: HA and DR are genuinely DIFFERENT disciplines, not the same thing
at different speeds. Excellent HA within a region + zero real DR plan
is a common, real gap — don't assume one implies the other.
```

## RTO / RPO

```
RTO (Recovery Time Objective): how long can we be down?
RPO (Recovery Point Objective): how much data can we lose (in time)?
MTTR (Mean Time To Recovery): the ACTUAL measured average — compare
  against RTO to see if the design target is being met in practice

These are INDEPENDENT properties — a design can have a fast RTO (fails
over in 30 seconds) but a poor RPO (loses the last hour of data) if it
fails over to a stale backup quickly rather than a synced standby.
Solving one does not automatically solve the other.

SET BASED ON ACTUAL BUSINESS IMPACT, not "as low as possible" by default
— lower RTO/RPO always costs more; an internal tool doesn't need
Active-Active-level spend just to be safe.

RTO/RPO tiers (illustrative, tune to actual business need):
  Tier 1 (Payment/Auth):     RTO <15min,  RPO <1min  (or <1min/0 — sources
                              in this course's own material vary slightly
                              on exact Tier-1 numbers; treat as directional)
  Tier 2 (Product/Search):   RTO <1hr,    RPO <15min
  Tier 3 (Reporting):        RTO <4hr,    RPO <1hr
  Tier 4 (Internal tools):   RTO <24hr,   RPO <24hr
```

## Availability Percentages — Verified Math

```
99.9%   = 8.7 hrs/year   = 43.2 min/month  = ~10 min/week
99.95%  = 4.4 hrs/year   = 21.6 min/month
99.99%  = 52.6 min/year  = 4.3 min/month
99.999% = 5.3 min/year   = ~26 sec/month
(Each additional "9" cuts allowed downtime by ~10x — verified correct.)
```

## CAP Theorem

```
Under a network partition, choose ONE:
  Consistency (every read = latest write, may reject/delay requests)
  Availability (every request gets a response, possibly STALE)
  → cannot have both simultaneously during the partition

CHOOSE CP: anything involving money/inventory/limited resources —
  serving a stale "yes, funds available" or "yes, in stock" risks real
  harm (double-spend, overselling)
CHOOSE AP: user-facing reads where staleness is a minor, acceptable
  degradation (a social feed, a recommendation list) — refusing to
  respond at all is worse than a slightly stale response here
```

## Kubernetes HA Patterns

```
REPLICAS: minimum 3, NOT 2 — with 2, losing even 1 (routine rolling
  update, node failure) leaves ZERO redundancy at that moment; with 3,
  losing 1 still leaves 2, retaining real redundancy

Pod anti-affinity: spreads replicas across nodes/AZs so one failure
  doesn't take out multiple replicas simultaneously
  requiredDuringSchedulingIgnoredDuringExecution + topologyKey
  WITHOUT this, K8s scheduler is free to put ALL replicas on the SAME
  node — "3 replicas" alone does NOT guarantee real fault tolerance

Topology spread constraints: maxSkew + whenUnsatisfiable: DoNotSchedule
  — a more precise/flexible alternative/complement to anti-affinity

PodDisruptionBudget (PDB): guarantees minAvailable during VOLUNTARY
  disruptions (node drains, cluster upgrades) — NOT involuntary failures
  If a drain gets stuck: check whether current healthy replica count is
  already at/below minAvailable — PDB is correctly refusing to violate
  the guarantee, not malfunctioning; fix the underlying replica health/
  distribution issue, don't override the PDB

Readiness vs Liveness — DIFFERENT consequences if conflated:
  Readiness FAILS → pod pulled from LB rotation, NOT restarted (right
    response to "temporarily can't serve," e.g. downstream dependency
    briefly struggling — restarting wouldn't fix that anyway)
  Liveness FAILS → pod RESTARTED (right only for genuinely stuck/
    crashed processes)
  Using the SAME shallow check for both, or a deep check for liveness
  specifically, risks a cascading restart loop when a downstream
  dependency merely hiccups — the pod itself was fine.
```

## Database HA

```
PostgreSQL: streaming replication (wal_level=replica, max_wal_senders)
  standby ready via replication slot → pg_ctl promote during failover
RDS Multi-AZ: AWS-managed synchronous standby, automatic failover
  typically 60-120 sec — you don't manage slots/promotion manually,
  but it's AWS-specific (not portable to self-managed DBs elsewhere)

Backup layering (defense in depth, not either/or):
  Automated daily snapshots        — baseline, most recovery needs
  Point-in-time recovery (PITR)    — restore to ANY specific minute,
    via WAL archiving, not just last nightly snapshot
  Cross-region snapshot copy       — protects against FULL REGION
    failure specifically, not just node/AZ failure

Synchronous vs Asynchronous replication:
  SYNC: write confirmed only after replica acks → RPO ~0, but adds
    real WRITE LATENCY (every write waits for remote ack) — typically
    used WITHIN a region (AZ-to-AZ, low latency) for this reason
  ASYNC: write confirmed immediately, ships to replica after → small
    real RPO window (seconds), but no write-latency cost — the norm
    for CROSS-REGION replication specifically
```

## DR Strategy Pyramid (cheapest → most expensive)

```
1. BACKUP & RESTORE     Cost: $     RTO: hours    RPO: hours (last backup)
   Use: internal tools, low-criticality, cost-sensitive
2. PILOT LIGHT          Cost: $$    RTO: 10-30min RPO: minutes
   Minimal always-on: DB replica (read-only) + container images in DR
   registry + DNS ready — scale up compute, promote DB, switch DNS on failure
3. WARM STANDBY         Cost: $$$   RTO: minutes  RPO: seconds
   Scaled-down but FUNCTIONAL copy running — DB replica + 1-2 pods/service
   + LB ready at weight 0 — scale pods, promote DB, shift LB weight
4. ACTIVE-ACTIVE        Cost: $$$$  RTO: near-zero RPO: near-zero
   BOTH regions serve production traffic simultaneously
   REAL CHALLENGE: data consistency — NOT just infra cost. Any logic
   involving a LIMITED/COUNTED shared resource (discount code max
   redemptions, remaining inventory) needs explicit audit — "check
   count, then decrement" logic safe under one writer becomes a race
   condition once two regions can write to the same logical resource
   simultaneously. See this course's Real World Scenarios for a full
   worked example of exactly this failure mode.

Database replication options by DR tier: PostgreSQL streaming
  replication | RDS Multi-AZ (sync) / Read Replica (async) | Cosmos DB
  (multi-region writes built-in) | Redis Sentinel (HA) / Cluster (DR)
```

## DR Testing — Non-Negotiable, Not Optional

```
"DR only works if you test it" — teams that never test find it doesn't
work during REAL incidents. Run GameDay exercises QUARTERLY, actually
PROMOTING the standby, not just reviewing the runbook document.

WHY THIS MATTERS BEYOND GENERAL CAUTION: a well-designed architecture
can still have a silent gap (a replication permission issue silently
blocking one type of DDL change, an outdated credential in the runbook)
that ONLY surfaces during an actual promotion attempt — "well-designed
on paper" ≠ "verified to actually work."

Chaos engineering (Chaos Monkey, Gremlin, LitmusChaos, AWS Fault
  Injection Simulator): controlled, deliberate failure injection —
  pod-delete, node-drain, network-loss, disk-fill — finds gaps under
  controlled conditions, on your schedule, rather than during a real,
  uncontrolled incident.

DNS failover: LOW TTL (60 sec, not 24 hours) is a REAL, easily-
  overlooked component of actual end-to-end RTO — a slow TTL means
  cached clients keep hitting the failed endpoint for up to that TTL
  duration regardless of how fast the backend infrastructure switched.

The DECISION to trigger failover is often the real bottleneck, not the
technical mechanism — define explicit, PRE-AGREED objective trigger
criteria (specific error-rate/health-check thresholds) before an actual
incident, and give on-call PRE-AUTHORIZED authority to trigger without
needing to escalate for permission first. A technically-fast failover
with a slow human decision process has a much longer REAL RTO than the
infrastructure capability alone suggests.
```

## DR Failover Runbook — Standard Sequence

```
1. Detect (automated alert, e.g. health check failing >2 min)
2. Confirm (verify via cloud provider's own status page, not just
   your own monitoring — rules out a monitoring-side false positive)
3. Communicate (post ETA immediately: "initiating failover, ETA X min")
4. Database failover (promote standby/replica)
5. Scale up DR compute (pre-warmed images matter here — faster scale-up)
6. Shift DNS/traffic-manager weight (0 → primary, 100 → DR)
7. Verify (health checks + monitor error rates for ~10 min + confirm
   requests actually landing in DR region via logs, not just assumption)
```

## Certifications

```
No dedicated HA/DR-specific certification exists. Most directly
relevant: AWS Certified Solutions Architect – Associate (SAA-C03) —
covers reliability/DR design as a core domain.
VERIFIED current format: 65 questions, 130 min, 720/1000 passing,
  $150 USD, 3-year validity (renew via current SAA-C03 or SAP-C02).
Most real assessment of this specific skill happens via architecture-
  design interview questions and scenario-based reasoning (see this
  course's own PYQ) rather than a dedicated exam.
```
