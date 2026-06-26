# Kafka Cheatsheet

```bash
# Topic management
kafka-topics.sh --bootstrap-server localhost:9092 --create --topic orders --partitions 6 --replication-factor 3
kafka-topics.sh --bootstrap-server localhost:9092 --list
kafka-topics.sh --bootstrap-server localhost:9092 --describe --topic orders

# Producer
kafka-console-producer.sh --bootstrap-server localhost:9092 --topic orders

# Consumer
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic orders --from-beginning --group mygroup

# Consumer groups
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --list
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group mygroup

# Lag monitoring
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group mygroup | grep LAG
```

## Key Config Properties

| Config | Producer | Consumer |
|--------|----------|---------|
| acks | 0/1/all | N/A |
| retries | 3 | N/A |
| batch.size | 16384 | N/A |
| auto.offset.reset | N/A | earliest/latest |
| enable.auto.commit | N/A | true/false |
| max.poll.records | N/A | 500 |
