# KEDA Cheatsheet

```yaml
# Scale on Kafka consumer lag
apiVersion: keda.sh/v1alpha1
kind: ScaledObject
metadata:
  name: kafka-scaler
spec:
  scaleTargetRef:
    name: order-processor
  minReplicaCount: 0   # scale to zero!
  maxReplicaCount: 20
  triggers:
  - type: kafka
    metadata:
      bootstrapServers: kafka:9092
      consumerGroup: order-processors
      topic: orders
      lagThreshold: '100'   # 1 replica per 100 messages lag

# Scale on cron schedule
triggers:
- type: cron
  metadata:
    timezone: Asia/Kolkata
    start: 30 8 * * 1-5    # 8:30 AM weekdays
    end: 0 20 * * 1-5      # 8:00 PM weekdays
    desiredReplicas: '10'
```

## Quick Reference — Keda

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
