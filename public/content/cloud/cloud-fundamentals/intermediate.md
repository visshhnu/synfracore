# Cloud Fundamentals — Intermediate

## High Availability: designing for component failure, not avoiding it

HA isn't about preventing failure — individual components (a VM, a disk, a network link) will fail eventually, at scale, as a statistical certainty. HA design assumes this and ensures the *system* keeps working anyway: redundancy across failure domains (multiple availability zones, not just multiple instances in one zone), health checks that detect a failed component quickly, and automated failover/replacement rather than manual intervention. The minimum real HA baseline on any major cloud is multi-AZ, single-region — a single-AZ deployment, no matter how many redundant instances, shares one failure domain and isn't actually highly available.

## Disaster Recovery: RTO and RPO, precisely

**RTO (Recovery Time Objective)**: how long you can tolerate being down before service is restored. **RPO (Recovery Point Objective)**: how much data loss (measured in time) is acceptable — an RPO of 1 hour means you can tolerate losing up to the last hour of data if disaster strikes.

These two numbers drive real, different architectural decisions: a low RTO (minutes) typically requires a warm or hot standby already running in a second region, ready to take traffic — expensive, but fast. A low RPO requires frequent, possibly continuous data replication to that standby. A business that can tolerate a 24-hour RTO and 24-hour RPO can use much cheaper cold-backup-based DR than one requiring minutes of both — DR architecture should be driven by these two numbers explicitly, not by "as resilient as possible" without a defined target.

## Elasticity vs. scalability — a real, useful distinction

**Scalability** is the *capability* to handle more load by adding resources. **Elasticity** is *automatically* scaling up and back down in response to actual demand, without manual intervention. A system can be scalable (you can manually add more servers) without being elastic (nothing does that automatically based on real-time load). Cloud's actual cost advantage over traditional infrastructure comes specifically from elasticity — automatically scaling down during low-demand periods is what avoids paying for permanently-provisioned peak capacity, not scalability alone.

## Cost optimization: the levers that actually matter

- **Right-sizing**: matching instance/resource size to actual observed usage, not a guessed initial size that never gets revisited. A meaningful fraction of real cloud spend is genuinely idle or over-provisioned capacity nobody's gone back to check.
- **Reserved/committed-use pricing**: committing to a usage baseline (1-3 years) in exchange for a substantial discount over on-demand pricing — makes sense for genuinely stable, predictable workloads, not for anything still finding its real steady-state size.
- **Spot/preemptible instances**: significant discounts (commonly 60-90% off on-demand) in exchange for the provider being able to reclaim the instance with short notice — appropriate for fault-tolerant, interruptible workloads (batch processing, CI runners), never for stateful services that can't tolerate sudden termination.
- **Storage lifecycle policies**: automatically moving infrequently-accessed data to cheaper storage tiers (or deleting it) on a schedule, rather than leaving everything on the most expensive, fastest tier indefinitely.

## Choosing a service model for a real decision: a payment API example

- **IaaS** (raw VMs): full control, full operational burden — team manages OS patches, load balancer config, scaling. Significant ongoing ops overhead for a workload that doesn't need this much control.
- **PaaS** (managed runtime): simpler, but less customization latitude — can be limiting for a workload with specific runtime requirements.
- **CaaS** (managed Kubernetes): team deploys containers; the provider manages the control plane. The right choice for a genuinely multi-service microservices system needing real Kubernetes capabilities, without taking on control-plane operations.
- **FaaS** (serverless functions): works well for simple, stateless, short-duration APIs — but most execution environments impose a hard duration limit (commonly in the 15-minute range for AWS Lambda, for instance) that rules FaaS out for workloads with long-running or genuinely stateful requirements.

The right answer depends on the workload's actual shape (stateless vs. stateful, duration, complexity), not a generic "more managed is always better" default.
