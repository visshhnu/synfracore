# Kafka & Messaging

> **Apache Kafka, RabbitMQ — event streaming, consumer lag, production operations**

**Category:** Messaging & Event Systems  
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

**Before you start:** basic Kubernetes and Linux/CLI comfort are assumed, since Kafka is run and operated on Kubernetes throughout this course. No prior messaging-system experience is needed.

---

## What is Kafka & Messaging?

Kafka is a distributed **event streaming** platform — instead of one service calling another directly, services publish events to Kafka and other services read them independently. A **topic** (a named stream of events, e.g. `orders`) is divided into **partitions** — the unit of parallelism, since each partition can be read independently. Each partition is an ordered, immutable log. Consumers track their position with an **offset** (their place in that log). A **consumer group** lets multiple consumers split the work of reading a topic in parallel — each partition is assigned to exactly one consumer within the group at a time, which is why the rule is consumer instances ≤ partition count (extra consumers beyond the partition count sit idle, with nothing assigned to them). **Replication factor** is the number of copies of each partition kept across brokers (3 is standard for production, so the cluster survives a broker failure).

## Why Kafka & Messaging?

**Consumer lag** is the number of messages waiting to be processed — the gap between the log-end-offset (the newest message written) and the consumer's current offset, per partition. Growing lag means consumers can't keep up with the producer rate. Lag growing on *all* partitions means the consumer group is simply too slow overall (the fix is to scale up, up to the partition count). Lag stuck on *one* partition specifically usually means a stuck consumer or a **poison pill message** — a malformed message the consumer keeps failing to process and retrying forever, blocking everything behind it on that partition.

---

## Learning Modules

### Module 01 — Kafka Architecture
*Brokers, topics, partitions, consumer groups*

Covered above: topics, partitions, offsets, and consumer groups. This module shows the actual CLI commands for creating topics and inspecting them.

**Topics covered:**

- Topics, partitions, offsets — 🟢 Beginner
- Brokers and replication factor — 🟡 Intermediate
- Producer and consumer model — 🟢 Beginner
- Consumer groups and partition assignment — 🟡 Intermediate
- Retention and log compaction — 🔴 Advanced

```bash
# Kafka core concepts
Topic: orders
  Partition 0: [msg0, msg1, msg2, msg3...]  ← consumer A reads
  Partition 1: [msg0, msg1, msg2...]         ← consumer B reads
  Partition 2: [msg0, msg1...]               ← consumer C reads

# Each consumer in group tracks its own offset per partition
# Offset = position in the log (restart from here after crash)
# Retention: messages kept for N days (default 7) — replay possible

# Create a topic
kafka-topics.sh \
  --bootstrap-server kafka:9092 \
  --create \
  --topic orders \
  --partitions 6 \
  --replication-factor 3

# Describe topic — see leader and replicas per partition
kafka-topics.sh \
  --bootstrap-server kafka:9092 \
  --describe \
  --topic orders

# Produce test messages
kafka-console-producer.sh \
  --bootstrap-server kafka:9092 \
  --topic orders \
  --property "key.separator=:" \
  --property "parse.key=true"
# Type: order-123:{"amount":99.99}

# Consume from beginning (for debugging)
kafka-console-consumer.sh \
  --bootstrap-server kafka:9092 \
  --topic orders \
  --from-beginning \
  --group debug-consumer
```

### Module 02 — Consumer Lag — Most Common Issue
*Diagnose and fix processing lag*

Covered above: what consumer lag means and the all-partitions-vs-one-partition diagnosis split. This module shows the actual commands for checking and fixing it.

**Topics covered:**

- What consumer lag means — 🟢 Beginner
- Check lag with kafka-consumer-groups — 🟢 Beginner
- Lag on all partitions vs one partition — 🟡 Intermediate
- Poison pill messages — 🔴 Advanced
- Scaling consumers — 🟡 Intermediate

```bash
# Consumer lag monitoring
kafka-consumer-groups.sh \
  --bootstrap-server kafka:9092 \
  --group payment-processor \
  --describe

# Output to interpret:
# GROUP            TOPIC    PARTITION  CURR-OFFSET  LOG-END  LAG
# payment-proc     orders   0          1250         1251     1    ← normal
# payment-proc     orders   1          1100         1200     100  ← growing!
# payment-proc     orders   2          980          980      0    ← healthy

# Lag GROWING on ALL partitions → consumer too slow
# Fix: add more consumer instances (up to partition count)
kubectl scale deployment payment-consumer --replicas=6
# Note: must have ≥ partition count consumers, extras are idle

# Lag STUCK on ONE partition → poison pill message
# Find the bad message
kafka-console-consumer.sh \
  --bootstrap-server kafka:9092 \
  --topic orders \
  --partition 1 \
  --offset 1100 \
  --max-messages 1
  # ^ 1100 is the stuck offset from the lag output above

# Skip the bad message (advance offset by 1)
kafka-consumer-groups.sh \
  --bootstrap-server kafka:9092 \
  --group payment-processor \
  --topic orders:1 \
  --reset-offsets \
  --to-offset 1101 \
  --execute

# Prometheus alert for consumer lag
- alert: KafkaConsumerLagCritical
  expr: kafka_consumergroup_lag_sum > 10000
  for: 5m
  labels:
    severity: critical
  annotations:
    summary: "Kafka consumer lag critical: {{ $value }} messages"
```

### Module 03 — Kafka in Kubernetes (Strimzi)
*Operator-based Kafka on K8s*

Strimzi is the CNCF Kafka Operator for Kubernetes — manages the entire Kafka cluster lifecycle (deploy, upgrade, scale, config changes). Instead of manually managing Kafka brokers, you define a Kafka custom resource and Strimzi handles everything. Used in production at a large telecom organisation for telecom SOM/COM event streaming.

**Topics covered:**

- Strimzi Kafka Operator — 🟡 Intermediate
- Kafka CR deployment — 🟡 Intermediate
- Topic and User operators — 🔴 Advanced
- KafkaConnect for data pipelines — 🔴 Advanced

```bash
# Deploy Kafka with Strimzi Operator
# Install Strimzi operator
kubectl create namespace kafka
kubectl apply -f https://strimzi.io/install/latest?namespace=kafka -n kafka

# Deploy a 3-broker Kafka cluster
apiVersion: kafka.strimzi.io/v1beta2
kind: Kafka
metadata:
  name: prod-kafka
  namespace: kafka
spec:
  kafka:
    version: 3.6.0
    replicas: 3
    listeners:
      - name: plain
        port: 9092
        type: internal
        tls: false
      - name: tls
        port: 9093
        type: internal
        tls: true
    config:
      offsets.topic.replication.factor: 3
      transaction.state.log.replication.factor: 3
      transaction.state.log.min.isr: 2
      default.replication.factor: 3
      min.insync.replicas: 2
      log.retention.hours: 168     # 7 days
    storage:
      type: persistent-claim
      size: 100Gi
      class: managed-premium
  zookeeper:
    replicas: 3
    storage:
      type: persistent-claim
      size: 20Gi
  entityOperator:
    topicOperator: {}    # Manages KafkaTopic CRDs
    userOperator: {}     # Manages KafkaUser CRDs

# Create topic via CRD
apiVersion: kafka.strimzi.io/v1beta2
kind: KafkaTopic
metadata:
  name: orders
  labels:
    strimzi.io/cluster: prod-kafka
spec:
  partitions: 6
  replicas: 3
  config:
    retention.ms: 604800000    # 7 days
    segment.bytes: 1073741824  # 1GB segments
```

### Module 04 — Kafka vs RabbitMQ
*When to choose which*

Kafka: high throughput, message retention (replay), consumer-controlled offsets, ordered per partition, for event streaming, audit logs, ML pipelines. RabbitMQ: moderate throughput, messages deleted after consume (no replay), push-based, complex routing (exchanges/queues), for task queues, RPC, microservice messaging. Kafka is NOT the right tool for simple job queues — RabbitMQ or SQS is simpler and more appropriate.

**Topics covered:**

- Kafka use cases (streaming, replay) — 🟢 Beginner
- RabbitMQ use cases (task queues) — 🟢 Beginner
- Key differences (retention, throughput, model) — 🟡 Intermediate
- When NOT to use Kafka — 🟡 Intermediate

```bash
# Kafka vs RabbitMQ decision matrix

# USE KAFKA when:
# ✓ High throughput (millions/sec) needed
# ✓ Need to replay messages (debugging, reprocessing)
# ✓ Multiple consumers need same event (fan-out)
# ✓ Event sourcing / audit log
# ✓ Stream processing (Kafka Streams, Flink)
# ✓ Long retention required (days/weeks)
# Examples: order events, user activity, IoT data, CDC

# USE RABBITMQ when:
# ✓ Task queue (process job once, delete it)
# ✓ Complex routing (topic exchange, headers exchange)
# ✓ Request-reply / RPC pattern
# ✓ Priority queues
# ✓ Simpler ops (less infrastructure than Kafka)
# Examples: email sending, background jobs, notifications

# RabbitMQ quick example
# Python producer
import pika
connection = pika.BlockingConnection(
    pika.URLParameters('amqp://user:pass@rabbitmq:5672'))
channel = connection.channel()
channel.queue_declare(queue='email_tasks', durable=True)
channel.basic_publish(
    exchange='',
    routing_key='email_tasks',
    body='{"to":"user@example.com","subject":"Order confirmed"}',
    properties=pika.BasicProperties(delivery_mode=2))  # Persistent
connection.close()

# INTERVIEW ANSWER:
# "At a large telecom organisation we use Kafka for SOM/COM orchestration events
# because we need high throughput, replay capability for debugging,
# and the Strimzi operator manages it well on OCP.
# For simpler job queues like email notifications I'd choose
# RabbitMQ or AWS SQS — less operational complexity
# when you don't need Kafka's replay or throughput."
```

---

## Production Example

```bash
# Kafka Production Operations Cheatsheet

# ── DAILY HEALTH CHECKS ──────────────────────────────────
# Check all consumer groups lag
kafka-consumer-groups.sh \
  --bootstrap-server kafka:9092 \
  --list | xargs -I{} kafka-consumer-groups.sh \
    --bootstrap-server kafka:9092 \
    --group {} --describe 2>/dev/null \
    | awk 'NR>1 && $6 > 0 {print}'  # Show groups with lag

# Broker health
kafka-broker-api-versions.sh --bootstrap-server kafka:9092

# Under-replicated partitions (data at risk!)
kafka-topics.sh --bootstrap-server kafka:9092 \
  --describe --under-replicated-partitions
# If any output → broker is down or behind
# Fix: check broker logs, check disk space

# ── REBALANCING ──────────────────────────────────────────
# After adding brokers, redistribute partitions
kafka-reassign-partitions.sh \
  --bootstrap-server kafka:9092 \
  --reassignment-json-file reassign.json \
  --execute

# ── PERFORMANCE TUNING ───────────────────────────────────
# Producer: batching for throughput
# linger.ms=5 (wait 5ms to batch messages)
# batch.size=65536 (64KB batch)
# compression.type=lz4 (compress batches)

# Consumer: parallel processing
# max.poll.records=500 (process 500 at a time)
# fetch.max.bytes=52428800 (50MB max fetch)
```

---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is Kafka & Messaging and why would you use it in production?"
    Kafka is a distributed event-streaming platform: instead of services calling each other directly, they publish events to Kafka topics and other services consume them independently, at their own pace. You'd reach for it when you need high throughput, the ability to replay past events (debugging, reprocessing, backfilling a new consumer), or multiple independent consumers reading the same event stream. It's not the right tool for a simple one-off task queue — RabbitMQ or SQS is simpler and more appropriate there.

??? question "How does Kafka & Messaging work internally? Explain the architecture."
    A topic is split into partitions, each an ordered, append-only log. Producers write to a partition (often by a key, so related events land on the same partition and stay ordered relative to each other). Each partition is replicated across brokers (typically 3x) for durability. Consumers in a consumer group split the partitions among themselves — each partition assigned to exactly one consumer in the group at a time — and each consumer tracks its own offset (position in the log) so it can resume correctly after a restart.

??? question "What are the main components of Kafka & Messaging?"
    Brokers (the servers storing partition data), topics and partitions (the data model), producers (write events), consumers and consumer groups (read events, in parallel across partitions), and — for Kubernetes deployments — the Strimzi Operator, which manages the entire cluster lifecycle (deploy, upgrade, scale) via a `Kafka` custom resource instead of managing brokers by hand.

??? question "How do you handle failures in Kafka & Messaging?"
    For broker failures, replication (factor 3 in production) means other replicas keep serving the partition. For consumer failures, the diagnosis splits in two: lag growing on *every* partition means the consumer group as a whole is too slow, so scale up (add consumer instances, up to the partition count). Lag stuck on *one specific* partition usually means a poison pill message — a malformed message the consumer keeps failing on — which requires finding that message and either fixing the consumer's handling of it or manually advancing past the stuck offset.

??? question "What is your production experience with Kafka & Messaging?"
    *(Needs verification — this platform can't fabricate a first-person production story. Answer from your own experience: what topics/partition counts you ran, what a real consumer-lag incident looked like, and how Strimzi or your own operational setup handled it.)*

??? question "How do you monitor and observe Kafka & Messaging in production?"
    The most important signal is consumer lag per consumer group and partition (`kafka-consumer-groups.sh --describe`, or the `kafka_consumergroup_lag_sum` metric in Prometheus, alerted on when it crosses a threshold sustained for several minutes). Also watch for under-replicated partitions (`kafka-topics.sh --under-replicated-partitions` — a sign a broker is down or falling behind, meaning data is at reduced durability) and broker health via `kafka-broker-api-versions.sh`.

??? question "What are the security considerations for Kafka & Messaging?"
    Enable TLS for both broker-to-broker and client-to-broker traffic (the example Strimzi config shows both a plaintext internal listener and a TLS listener — production should favor TLS). Use SASL or mTLS for client authentication rather than trusting network-level access alone. And apply topic-level ACLs so a compromised producer credential can't read or write topics it has no business touching.

??? question "How does Kafka & Messaging compare to alternatives?"
    Kafka vs. RabbitMQ is the main comparison: Kafka retains messages for replay, is pull-based (consumers control their own offset and pace), and handles very high throughput — suited to event streaming, audit logs, and ML pipelines. RabbitMQ deletes messages once consumed (no replay), is push-based, and supports complex routing (exchanges, queues) — suited to task queues, RPC, and simpler microservice messaging. Choosing Kafka for a simple job queue is over-engineering; choosing RabbitMQ when you need replay or extreme throughput under-delivers.

??? question "Explain Kafka Architecture in Kafka & Messaging."
    Topics are divided into partitions, the unit of parallelism — each partition is an ordered, immutable log that consumers read sequentially by tracking an offset. A consumer group splits partitions among its members so each partition is read by exactly one consumer at a time, which is why having more consumers than partitions leaves the extras idle. Replication factor (commonly 3 in production) determines how many copies of each partition exist across brokers, so the cluster tolerates broker failure without data loss.

??? question "Explain Consumer Lag — Most Common Issue in Kafka & Messaging."
    Consumer lag is the gap between the log-end-offset (the newest message written to a partition) and a consumer's current offset — effectively, how many messages are waiting to be processed. Lag growing across all partitions means the consumer group is simply too slow for the producer rate, fixed by scaling up consumers (up to the partition count). Lag stuck on one specific partition, while others are healthy, points to a stuck consumer or a poison pill message on that partition specifically — a different problem requiring you to find and handle that specific bad message, not just add more consumers.

---

## Official Resources

- [Apache Kafka Documentation](https://kafka.apache.org/documentation/)
- [Strimzi Kafka Operator](https://strimzi.io/documentation/)
- [RabbitMQ Documentation](https://www.rabbitmq.com/documentation.html)

---

