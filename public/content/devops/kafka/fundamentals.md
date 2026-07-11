# Apache Kafka — Fundamentals

## What is Kafka?

|  | Kafka | RabbitMQ/SQS |
|---|---|---|
| Message persistence | Retained for days/weeks | Deleted after consumption |
| Multiple consumers | Each consumer group gets all messages | One consumer per message |
| Replay | Yes — rewind the offset to re-process | No |
| Throughput | Millions/second | Thousands/second |
| Best for | Event streaming, multiple services needing the same events, analytics | Task queues, simple pub/sub |

```bash
# Kafka is fundamentally different from a task queue: a message stays
# in the log after being read, so a NEW consumer group added months
# later can still read the entire history from the beginning.
kafka-console-producer.sh --broker-list localhost:9092 --topic orders
kafka-console-consumer.sh --bootstrap-server localhost:9092 \
  --topic orders --from-beginning
```

## Partitions & Consumer Groups

```bash
# A topic with 6 partitions — allows up to 6 consumers in one group
# to process in parallel (one partition per consumer, max)
kafka-topics.sh --create --topic orders --bootstrap-server localhost:9092 \
  --partitions 6 --replication-factor 3

# Ordering is guaranteed WITHIN a partition, never across partitions —
# messages with the same key always land on the same partition
kafka-console-producer.sh --broker-list localhost:9092 --topic orders \
  --property "parse.key=true" --property "key.separator=:"
# > customer-123:{"order_id": 456, "amount": 99.99}

# Consumer group — each group independently tracks its own offset,
# so multiple groups can read the same topic without interfering
kafka-consumer-groups.sh --bootstrap-server localhost:9092 \
  --describe --group order-processors
```
A partition count decided too low limits maximum parallelism permanently — partitions can be increased later, but doing so breaks the key-to-partition mapping for any keyed data already produced, since the hash-to-partition assignment changes with a different partition count.

## CLI Commands

```bash
# Topic management
kafka-topics.sh --list --bootstrap-server localhost:9092
kafka-topics.sh --describe --topic orders --bootstrap-server localhost:9092
kafka-topics.sh --alter --topic orders --partitions 12 --bootstrap-server localhost:9092

# Consumer lag — the single most important Kafka health metric
kafka-consumer-groups.sh --bootstrap-server localhost:9092 \
  --describe --group order-processors
# LAG column shows how far behind the consumer is from the latest message

# Reset an offset — replay from a specific point (careful in production)
kafka-consumer-groups.sh --bootstrap-server localhost:9092 \
  --group order-processors --topic orders \
  --reset-offsets --to-earliest --execute
```

## Kafka on Kubernetes

```yaml
# Strimzi Operator — the standard way to run Kafka on K8s
apiVersion: kafka.strimzi.io/v1beta2
kind: Kafka
metadata: { name: my-cluster }
spec:
  kafka:
    replicas: 3
    listeners:
      - name: plain
        port: 9092
        type: internal
        tls: false
    storage: { type: persistent-claim, size: 100Gi }
  zookeeper:
    replicas: 3
    storage: { type: persistent-claim, size: 20Gi }
---
apiVersion: kafka.strimzi.io/v1beta2
kind: KafkaTopic
metadata: { name: orders, labels: { strimzi.io/cluster: my-cluster } }
spec: { partitions: 6, replicas: 3 }
```
```yaml
# KEDA — auto-scale consumer pods based on consumer group lag
apiVersion: keda.sh/v1alpha1
kind: ScaledObject
metadata: { name: order-processor-scaler }
spec:
  scaleTargetRef: { name: order-processor }
  minReplicaCount: 1
  maxReplicaCount: 10
  triggers:
    - type: kafka
      metadata:
        bootstrapServers: my-cluster-kafka-bootstrap:9092
        consumerGroup: order-processors
        topic: orders
        lagThreshold: "50"     # scale up if lag exceeds 50 messages
```

## Troubleshooting

```bash
# Consumer lag growing steadily — the consumer can't keep up with production
kafka-consumer-groups.sh --bootstrap-server localhost:9092 \
  --describe --group order-processors
# If LAG keeps rising: scale out consumers (up to partition count),
# or investigate a slow downstream call inside the consumer's processing loop

# Under-replicated partitions — a real durability risk
kafka-topics.sh --describe --bootstrap-server localhost:9092 \
  --under-replicated-partitions
# Usually means a broker is down or struggling — check broker health first

# Disk approaching full — Kafka retention policy needs adjusting
kafka-configs.sh --bootstrap-server localhost:9092 \
  --entity-type topics --entity-name orders --alter \
  --add-config retention.ms=604800000   # 7 days
```

## Confluent Kafka — Enterprise Edition

Apache Kafka is the open-source project — you install, manage, monitor, and operate it yourself. Confluent was founded by Kafka's original creators (Jay Kreps, Neha Narkhede, Jun Rao) and builds a commercial platform on top of it with enterprise features, a managed cloud offering, and support.

|  | Apache Kafka | Confluent Platform | Confluent Cloud |
|---|---|---|---|
| What it is | Open-source event streaming | Self-hosted Kafka + enterprise tools | Fully managed Kafka as a Service |
| Operations | You manage everything | You manage, better tooling | Confluent manages everything |
| Schema Registry | Not included | Included | Included |
| KSQL / ksqlDB | Not included | Included | Included |
| Control Center | Not included (use Kafdrop/Grafana) | Included — rich monitoring UI | Cloud console |
| Connectors | Community connectors | 100+ certified connectors | 100+ managed connectors |
| Cost | Free (infra cost only) | Paid licence | Pay per usage (GB/CU) |
| Best for | Teams with Kafka expertise, cost-sensitive | Enterprise, needs Schema Registry + KSQL | Teams wanting zero ops overhead |

**Schema Registry** is the most important Confluent feature. In plain Apache Kafka, producers and consumers agree on message format by convention — if a producer changes the schema, consumers break silently. Schema Registry enforces a contract: producers register schemas, consumers validate against them, supporting Avro, JSON Schema, and Protobuf.
- **Schema evolution** — backward-compatible changes (adding an optional field) are allowed; breaking changes (removing a required field) are rejected by the registry.
- **Serialisation** — messages are serialised with the schema ID embedded, so a consumer knows exactly how to deserialise them.
- Real scenario: telecom alarm events have strict schemas with 15 fields. Without Schema Registry, if a field is renamed, 10 downstream consumers silently fail. With Schema Registry, the breaking change is rejected at produce time, before it ever reaches a consumer.

**ksqlDB** lets you write SQL-like queries on live Kafka streams without writing Java or Python code:
```sql
-- Count errors per service in real time (sliding 5-minute window)
CREATE TABLE error_counts AS
  SELECT service_name, COUNT(*) AS error_count
  FROM application_logs
  WINDOW TUMBLING (SIZE 5 MINUTES)
  WHERE log_level = 'ERROR'
  GROUP BY service_name;

-- Join two streams: payment events + fraud signals
CREATE STREAM payment_risk AS
  SELECT p.payment_id, p.amount, f.risk_score
  FROM payments p
  LEFT JOIN fraud_signals f WITHIN 30 SECONDS
  ON p.user_id = f.user_id;
```

**Kafka Connect** moves data between Kafka and external systems without writing code — source connectors pull data *into* Kafka (Debezium for database CDC, S3, Salesforce, PostgreSQL), sink connectors push data *from* Kafka (Elasticsearch, S3, Snowflake, MongoDB, Azure Blob):
```json
{
  "name": "postgres-source",
  "config": {
    "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
    "database.hostname": "postgres",
    "database.dbname": "orders_db",
    "table.include.list": "public.orders,public.order_items",
    "topic.prefix": "dbserver1"
  }
}
```
Every INSERT/UPDATE/DELETE on the `orders` table becomes a Kafka topic event automatically — downstream services react in real time without polling the database.

**Confluent Cloud** is Kafka as a fully managed service on AWS, Azure, or GCP — you create topics and set retention through a console, Confluent handles brokers, patching, scaling, and availability entirely, trading operational control for zero infrastructure management, priced per usage (GB transferred, compute units) rather than per host.
