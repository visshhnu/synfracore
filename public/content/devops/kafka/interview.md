# Kafka Interview Q&A

**Q: Kafka vs RabbitMQ?**
Kafka: distributed log, high throughput (millions/sec), retained messages, replay capability, consumer groups. RabbitMQ: traditional message broker, complex routing (exchanges/queues), message acknowledgment, lower throughput. Kafka for event streaming/analytics; RabbitMQ for task queues.

**Q: What is a consumer group?**
Set of consumers that collectively read from a topic. Each partition is assigned to exactly one consumer in the group. Enables horizontal scaling — add consumers to scale processing. Multiple groups can independently consume the same topic.

**Q: How does Kafka ensure message ordering?**
Ordering guaranteed within a partition only, not across partitions. Use partition key to route related messages to same partition (e.g. user_id as key — all events for user go to same partition in order).

**Q: What is the role of ZooKeeper/KRaft in Kafka?**
ZooKeeper (legacy): managed broker metadata, leader election. KRaft (Kafka 2.8+): Kafka's own Raft-based consensus — no ZooKeeper dependency. Simpler operations. KRaft is default in Kafka 3.x.

## Quick Reference — Kafka

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

**Q: How does Kafka guarantee exactly-once semantics?**
Three delivery guarantees: At-most-once (may lose), At-least-once (may duplicate), Exactly-once (EOS). EOS in Kafka: producer idempotence (deduplicates retries with sequence numbers) + transactional API (atomic writes to multiple partitions). Kafka Streams uses EOS by default. Requires acks=all, enable.idempotence=true, transactional.id set.

**Q: What is the role of __consumer_offsets topic?**
Internal Kafka topic that stores consumer group offset commits. When a consumer calls commitSync() or commitAsync(), the offset is written here. On restart, consumer reads its last committed offset from this topic and resumes from there. Previously stored in ZooKeeper; moved to Kafka in 0.9+.

**Q: How do you handle a consumer that can't keep up with production rate?**
1. Increase partitions (enables more consumers)
2. Add consumers to the group (up to partition count)
3. Increase max.poll.records and tune processing batch size
4. Optimize consumer processing (async I/O, batching DB writes)
5. Scale consumer application horizontally
6. Check if the issue is processing bottleneck vs consumer poll timeout

**Q: What is Kafka Connect?**
Framework for streaming data between Kafka and external systems (databases, files, cloud storage). Source connectors: pull data into Kafka (Debezium for CDC from databases). Sink connectors: push Kafka data out (S3 Sink, Elasticsearch Sink, JDBC Sink). Connectors run as distributed workers — fault-tolerant, scalable.
