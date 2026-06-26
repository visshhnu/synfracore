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
