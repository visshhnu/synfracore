# Cloud Architecture Patterns — Troubleshooting

## Multi-AZ failover is taking much longer than expected

Check whether the failover is genuinely automatic or requires a manual trigger — some managed database failover mechanisms need a specific configuration flag enabled, and without it, "Multi-AZ" only means data is replicated, not that failover happens without intervention. If failover is configured correctly but still slow, check DNS TTL on the endpoint your application uses to connect — a long-cached DNS TTL means clients keep connecting to the old (now-failed) endpoint after the database-level failover has already completed, adding client-side delay on top of the actual database failover time.

## Hub-and-Spoke networking: a spoke VPC can reach the hub but not other spokes

Almost always a routing table issue, not a Transit Gateway configuration issue — check that each spoke's route table actually has a route pointing traffic destined for other spokes' CIDR ranges through the Transit Gateway attachment. It's easy to correctly attach a VPC to the hub but forget to add the corresponding route table entries, which leaves the attachment technically present but effectively unused for that traffic path.

## Strangler Fig migration: new service returns different results than legacy for the same request

Before assuming the new service has a bug, verify the two services are actually receiving equivalent input — a common, easy-to-miss cause is the routing layer normalizing or transforming the request differently for each destination (a header stripped for one path but not the other, a default query parameter applied inconsistently). Shadow-traffic comparison (see Intermediate) exists specifically to catch this class of discrepancy before a real cutover, rather than during one.

## CQRS: read side never catches up to the write side, lag keeps growing

This means the read-side consumer is falling behind its event source, not just experiencing normal small lag — check the consumer's processing throughput against the write side's actual event production rate. Common causes: the read-side update logic does expensive work per event (an unindexed query, a synchronous external call) that can't keep pace with write volume, or the consumer has silently stopped/crashed and isn't processing at all, which looks identical to "very slow" from the outside until you check whether it's actually running.

## Saga: a compensating transaction fails, leaving the system in an inconsistent state

This is the hardest real Saga failure mode, and it needs to be designed for explicitly rather than discovered in production — a compensating transaction is itself an operation that can fail (the "cancel payment" call can time out just like the original "charge payment" call did). Production Saga implementations need the compensation steps themselves to have retry logic, and a defined escalation path (alerting, manual intervention) for when compensation genuinely can't complete automatically — treating compensating transactions as guaranteed-to-succeed is a common design gap that only surfaces when they don't.

## Serverless event chain: events are being dropped or processed out of order

Check whether your event source guarantees ordering at all — most managed queues (SQS standard, EventBridge) explicitly do not guarantee ordering by default; if your pattern depends on order, you need a FIFO-specific configuration (SQS FIFO queues, partition-key-based ordering) rather than assuming a standard queue preserves it. For dropped events specifically, check dead-letter queue configuration — an event that fails processing repeatedly without a DLQ configured is often silently discarded after retry exhaustion, rather than being retained anywhere you'd notice the loss.
