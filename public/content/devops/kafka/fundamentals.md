# Apache Kafka

Networking › Kafka
📨**Apache Kafka**
BeginnerEngineerProductionArchitectEvent streaming — partitions, consumer groups, Strimzi on Kubernetes, KEDA
[What is Kafka](#sec-what)[Partitions](#sec-concepts)[CLI](#sec-commands)[K8s](#sec-kubernetes)[🏢 Confluent](#sec-confluent)
[Troubleshoot](#sec-troubleshoot)[Interview Q&A](#sec-interview)


## 📨 What is Kafka?›


#### When to use Kafka vs traditional queues

|  | Kafka | RabbitMQ/SQS |
|---|---|---|
| Message persistence | Retained for days/weeks | Deleted after consumption |
| Multiple consumers | Each consumer group gets all messages | One consumer per message |
| Replay | Yes — rewind offset to re-process | No |
| Throughput | Millions/second | Thousands/second |
| Best for | Event streaming, multiple services need same events, analytics | Task queues, simple pub/sub |


Kafka concepts and comparisonCopy

```

```


## 🧩 Partitions & Consumer Groups›


Partitions, consumer groups, ordering, replicationCopy

```

```


## 🖥️ CLI Commands›


Topic management, consumer lag, offset resetCopy

```

```


## ☸️ Kafka on Kubernetes›


Strimzi Operator + KafkaTopic + KEDA auto-scalingCopy

```

```


## 🔍 Troubleshooting›


Consumer lag, under-replicated partitions, disk fullCopy

```

```





## 🏢 Confluent Kafka — Enterprise Edition›




#### What is Confluent and how does it differ from Apache Kafka?

Apache Kafka is the open-source project — you install, manage, monitor, and operate it yourself. **Confluent** was founded by the original creators of Kafka (Jay Kreps, Neha Narkhede, Jun Rao) and builds a commercial platform on top of Apache Kafka with enterprise features, managed cloud offering, and support.



|  | Apache Kafka | Confluent Platform | Confluent Cloud |
|---|---|---|---|
| What it is | Open-source event streaming | Self-hosted Kafka + enterprise tools | Fully managed Kafka as a Service |
| Operations | You manage everything | You manage, better tooling | Confluent manages everything |
| Schema Registry | Not included | Included | Included |
| KSQL / ksqlDB | Not included | Included | Included |
| Control Center | Not included (use Kafdrop/Grafana) | Included — rich monitoring UI | Cloud console |
| Connectors | Community connectors | 100+ certified connectors | 100+ managed connectors |
| Cost | Free (infra cost only) | Paid licence | Pay per usage (GB/CU) |
| Best for | Teams with Kafka expertise, cost-sensitive | Enterprise, need Schema Registry + KSQL | Teams wanting zero ops overhead |



#### Confluent Key Components — what you get extra


##### 1. Schema Registry

The most important Confluent feature. In Apache Kafka, producers and consumers agree on message format by convention — if a producer changes the schema, consumers break silently. Schema Registry enforces a **contract**: producers register schemas, consumers validate against them. Supports Avro, JSON Schema, Protobuf.



- **Schema evolution** — backward compatible changes (add optional field) are allowed. Breaking changes (remove required field) are rejected by the registry.

- **Serialisation** — instead of raw bytes, messages are serialised with schema ID embedded. Consumer knows exactly how to deserialise.

- Real scenario: Telecom alarm events (TeMIP/SRO) have strict schemas. Producer sends alarm with 15 fields. Without Schema Registry: if a field is renamed, 10 downstream consumers silently fail. With Schema Registry: breaking change is rejected at produce time.



##### 2. ksqlDB — SQL on Kafka Streams

Write SQL-like queries on live Kafka streams without writing Java or Python code. Create streaming aggregations, joins, and filters that run continuously.


```
-- Count errors per service in real-time (sliding 5-minute window)
CREATE TABLE error_counts AS
SELECT service_name,
COUNT(*) as error_count
FROM application_logs
WINDOW TUMBLING (SIZE 5 MINUTES)
WHERE log_level = 'ERROR'
GROUP BY service_name;

-- Join two streams: payment events + fraud signals
CREATE STREAM payment_risk AS
SELECT p.payment_id, p.amount, f.risk_score
FROM payments p
LEFT JOIN fraud_signals f
WITHIN 30 SECONDS
ON p.user_id = f.user_id;
```



##### 3. Confluent Control Center

Enterprise monitoring UI — topic browser, consumer group lag dashboard, schema management, connector management, alert configuration. Replaces the need for custom Grafana dashboards for Kafka monitoring.



##### 4. Kafka Connect — Managed Connectors

Move data between Kafka and external systems without writing code. Confluent provides 100+ certified connectors:



- **Source connectors** — pull data INTO Kafka: Debezium (database CDC), S3, Salesforce, PostgreSQL

- **Sink connectors** — push data FROM Kafka: Elasticsearch, S3, Snowflake, MongoDB, Azure Blob


```
# Debezium PostgreSQL CDC connector — capture every DB change as Kafka event
{
"name": "postgres-source",
"config": {
"connector.class": "io.debezium.connector.postgresql.PostgresConnector",
"database.hostname": "postgres",
"database.port": "5432",
"database.user": "debezium",
"database.password": "${file:/kafka/connect/secrets.properties:db.password}",
"database.dbname": "telecom_sro",
"table.include.list": "public.alarms,public.service_events",
"topic.prefix": "dbserver1"
}
}
# Every INSERT/UPDATE/DELETE on alarms table → Kafka topic event
# Downstream services react in real-time without polling the database
```



#### Confluent Cloud — when to use it

Confluent Cloud is Kafka as a fully managed service on AWS, Azure, or GCP. You create topics, set retention, configu
