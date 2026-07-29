# HA / DR Design — FAQ

## Is HA just "DR but faster," or are they actually different disciplines?

They're genuinely different, not just different points on the same speed spectrum — HA is about surviving *partial* failure with essentially no downtime (a node dies, traffic quietly shifts elsewhere within the same region), while DR is about recovering from *total* failure of an entire region or facility, where some real downtime is generally expected and planned for. A system can have excellent HA (rock-solid within a region) and no real DR plan at all (nothing prepared for the whole region going down) — these require genuinely different architecture decisions, not just "the DR version of the same HA setup, done more thoroughly."

## Why does everyone say "3 replicas minimum," not 2?

With 2 replicas, losing even 1 (during a routine rolling update, a node failure, anything) leaves you with exactly 1 running instance and zero redundancy at that moment — you're fully exposed to a second failure with nothing standing behind it, even briefly. With 3, losing 1 still leaves 2 running, meaning you retain actual redundancy even while already down a replica. This is why "2 replicas" often gives a false sense of having HA — it survives losing one instance, but leaves no margin at all afterward, which is a meaningfully weaker guarantee than 3 replicas provides for a very small additional cost.

## If synchronous replication guarantees zero data loss, why doesn't everyone just use it everywhere?

Because that guarantee comes with a real latency cost — every write has to wait for the remote replica to acknowledge it before the write completes, and that round-trip time adds up meaningfully, especially across any real distance (a cross-region replica is much slower to acknowledge than one in the same data center). This is exactly why synchronous replication is the norm *within* a region (AZ-to-AZ, where the network latency is small) but asynchronous replication is far more common for DR *across* regions — the latency cost of synchronous cross-region replication is usually judged not worth the RPO improvement over accepting a small, well-understood asynchronous replication lag instead.

## Does having a multi-region architecture automatically mean you have good DR?

Not automatically — a multi-region deployment where the second region isn't actually kept in sync, isn't tested, or where failover isn't actually automated/practiced provides much weaker real protection than the architecture diagram might suggest. This course's own Real World Scenarios covers exactly this gap: an architecture that looks correct on paper can still fail during a real disaster if the failover path itself has never actually been exercised. Multi-region is a necessary ingredient for real DR, but the testing and operational readiness around it is what actually determines whether it works when needed.

## Why do readiness and liveness probes need to check different things, rather than just using one health check for both?

Because they control genuinely different Kubernetes actions with different consequences if triggered incorrectly. A failing readiness probe pulls a pod out of load balancer rotation *without restarting it* — the right response when a pod is temporarily unable to serve well (warming up, a downstream dependency is briefly struggling) but doesn't need to be killed. A failing liveness probe *restarts the pod* — appropriate only when the process itself is genuinely stuck or broken in a way a restart would actually fix. Using the same shallow check for both, or worse, using an overly deep dependency-check as the liveness probe, risks a cascading restart loop the moment some downstream dependency briefly hiccups — the pod itself was fine, but an aggressive liveness check restarted it anyway, adding unnecessary churn on top of an already-degraded situation.

## Is Active-Active always the "best" HA/DR strategy since it has the fastest RTO and RPO?

No — "best" depends entirely on whether the actual business requirement justifies the real cost, both in infrastructure spend and in the engineering effort needed to make application logic safe under simultaneous multi-region writes (see this course's own Real World Scenarios for a concrete example of exactly this kind of bug). For a system where an hour of downtime is genuinely tolerable, Active-Active is meaningfully over-engineered relative to the actual requirement — the right strategy is the cheapest one that satisfies the real, business-justified RTO/RPO targets, not automatically the fastest one available.

## Why does chaos engineering deliberately break things in a system that's already supposedly designed to be resilient?

Because "designed to be resilient" and "verified to actually be resilient" are different claims, and the gap between them is exactly where real incidents live — a PodDisruptionBudget, an anti-affinity rule, or a database failover procedure can all look correct in configuration while having a subtle gap that only a real, controlled failure would expose. Chaos engineering (deliberately killing a pod, draining a node, injecting network loss) is specifically a way to find that gap under controlled conditions, on your own schedule, rather than discovering it for the first time during a genuine, uncontrolled production incident.

## What's the actual difference between an RTO of "minutes" and RPO of "minutes" if they sound similar?

They measure completely different things and can require entirely different engineering solutions to hit the same numeric target. RTO (Recovery Time Objective) is about *speed of recovery* — how long the system is actually down. RPO (Recovery Point Objective) is about *acceptable data loss* — how much data created between the last safe point and the failure is acceptable to lose. A system could have a fantastic RTO (fails over in 30 seconds) but a poor RPO (loses the last hour of transactions) if it fails over to a stale backup quickly rather than a continuously-replicated standby — speed of recovery and freshness of the data you recover to are independent properties, and a good architecture needs to address both deliberately, not assume solving one solves the other.

## Why does this course's material emphasize that a DR runbook needs "who has authority to trigger failover" as an explicit, named part of the plan?

Because a technically fast failover mechanism doesn't help if the actual bottleneck is a slow, ambiguous human decision about whether to use it — this course's own Real World Scenarios covers exactly this gap, where the compute/database failover could complete in minutes, but it took much longer for someone to feel confident enough to actually trigger it during a real, ambiguous (not clean-cut) degradation. Naming exactly who can make that call, and under what pre-agreed conditions, removes the need to improvise that judgment call under pressure during the actual incident.

## Is a nightly backup "good enough" DR for most systems, or is that always considered inadequate?

It's genuinely adequate for plenty of real systems — the question is whether the business can actually tolerate the resulting RPO (up to nearly 24 hours of data loss, in the worst case right before the next backup) and RTO (however long a full restore actually takes, which is often hours, not minutes). For an internal tool or a system whose data is easily reconstructed from another source, this is often a perfectly reasonable, low-cost choice — the mistake isn't choosing Backup & Restore, it's choosing it *without* having actually confirmed the business can tolerate what that specific RPO/RTO combination means in a real worst-case scenario.
