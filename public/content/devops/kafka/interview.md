# Kafka Interview Q&A

**Q: Kafka vs RabbitMQ?**
Kafka: distributed log, high throughput (millions/sec), retained messages, replay capability, consumer groups. RabbitMQ: traditional message broker, complex routing (exchanges/queues), message acknowledgment, lower throughput. Kafka for event streaming/analytics; RabbitMQ for task queues.

**Q: What is a consumer group?**
Set of consumers that collectively read from a topic. Each partition is assigned to exactly one consumer in the group. Enables horizontal scaling — add consumers to scale processing. Multiple groups can independently consume the same topic.

**Q: How does Kafka ensure message ordering?**
Ordering guaranteed within a partition only, not across partitions. Use partition key to route related messages to same partition (e.g. user_id as key — all events for user go to same partition in order).

**Q: What is the role of ZooKeeper/KRaft in Kafka?**
ZooKeeper (legacy): managed broker metadata, leader election. KRaft (Kafka 2.8+): Kafka's own Raft-based consensus — no ZooKeeper dependency. Simpler operations. KRaft is default in Kafka 3.x.
