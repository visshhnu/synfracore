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
