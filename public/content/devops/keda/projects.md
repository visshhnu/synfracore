# KEDA — Portfolio Projects

Build these 3 projects to prove KEDA mastery. Each includes code, architecture, and interview talking points.

---

## Project 1: Kafka Consumer Lag Autoscaling With Scale-to-Zero

**Level:** Beginner | **Time:** 1 day | **GitHub:** `keda-kafka-lag-scaling`

**What you build:** A Kafka consumer deployment scaled entirely by consumer lag, demonstrating the exact HPA-limitation scenario from Overview — low CPU, high lag, HPA would miss it, KEDA catches it.

### ScaledObject
```yaml
apiVersion: keda.sh/v1alpha1
kind: ScaledObject
metadata: { name: kafka-consumer-scaler }
spec:
  scaleTargetRef: { name: kafka-consumer }
  idleReplicaCount: 0
  minReplicaCount: 0
  maxReplicaCount: 10
  triggers:
    - type: kafka
      metadata:
        bootstrapServers: kafka:9092
        consumerGroup: my-consumer-group
        topic: orders
        lagThreshold: "50"
```

### Interview points
- Demonstrating the exact scenario Overview describes — a consumer with low CPU but real lag — is far more convincing in an interview than reciting the concept
- `idleReplicaCount: 0` combined with `minReplicaCount: 0` is what actually enables true scale-to-zero — being able to name both fields, not just one, shows real configuration depth
- `lagThreshold` as the tuning knob controlling scaling aggressiveness — too low causes thrashing, too high causes real processing delay before scale-up triggers

### Steps
1. Set up a Kafka topic and a consumer deployment that intentionally has low CPU usage per message
2. Configure the ScaledObject above
3. Publish a burst of messages and observe scale-up from zero
4. Let the queue drain and observe scale-down back to zero
5. Document the observed timeline (messages published → scale-up triggered → queue drained → scale-down) with real timestamps in the README

---

## Project 2: Multi-Trigger Scaling With Custom HPA Behavior

**Level:** Intermediate | **Time:** 2 days | **GitHub:** `keda-multi-trigger-behavior`

**What you build:** A service scaled by two combined triggers (queue depth OR CPU, whichever is higher), with asymmetric HPA `behavior` tuning for fast scale-up and cautious scale-down.

### Multi-trigger ScaledObject with behavior tuning
```yaml
apiVersion: keda.sh/v1alpha1
kind: ScaledObject
metadata: { name: multi-trigger-scaler }
spec:
  scaleTargetRef: { name: order-processor }
  minReplicaCount: 2
  maxReplicaCount: 30
  advanced:
    horizontalPodAutoscalerConfig:
      behavior:
        scaleUp: { stabilizationWindowSeconds: 0, policies: [{type: Percent, value: 100, periodSeconds: 15}] }
        scaleDown: { stabilizationWindowSeconds: 300, policies: [{type: Pods, value: 1, periodSeconds: 60}] }
  triggers:
    - type: rabbitmq
      metadata: { queueName: orders, mode: QueueLength, value: "20" }
    - type: cpu
      metadata: { type: Utilization, value: "70" }
```

### Interview points
- Explaining that KEDA evaluates each trigger independently and scales based on whichever produces the higher target replica count — not an average, not a first-match
- The asymmetric `behavior` block (fast scale-up, cautious scale-down) as a deliberate production pattern, not a default left unconfigured — being able to justify why the asymmetry is correct (minimize latency impact of a spike vs. avoid prematurely shedding capacity)
- Setting `minReplicaCount: 2` rather than allowing scale-to-zero — a real production decision for a service where cold-start latency matters more than idle-cost savings

### Steps
1. Build a service where either queue depth or CPU spike could independently justify scaling
2. Configure the multi-trigger ScaledObject with the behavior block above
3. Trigger a queue-depth spike alone and confirm scaling responds correctly
4. Trigger a CPU spike alone (independent of queue depth) and confirm scaling also responds
5. Document, with real observed replica-count-over-time data, the asymmetric scale-up/scale-down behavior in the README

---

## Project 3: Custom External Scaler for a Bespoke System

**Level:** Advanced | **Time:** 3-4 days | **GitHub:** `keda-custom-external-scaler`

**What you build:** A custom gRPC External Scaler for a system with no built-in KEDA scaler (an internal job-tracking database is a realistic stand-in), demonstrating the full escape-hatch pattern.

### External Scaler gRPC service (simplified)
```python
# Implements the three-method KEDA externalscaler.proto contract
class CustomScaler(ExternalScalerServicer):
    def IsActive(self, request, context):
        pending_jobs = query_internal_job_queue()
        return IsActiveResponse(result=pending_jobs > 0)

    def GetMetricSpec(self, request, context):
        return GetMetricSpecResponse(metricSpecs=[
            MetricSpec(metricName="pending_jobs", targetSize=10)
        ])

    def GetMetrics(self, request, context):
        pending_jobs = query_internal_job_queue()
        return GetMetricsResponse(metricValues=[
            MetricValue(metricName="pending_jobs", metricValue=pending_jobs)
        ])
```

### ScaledObject referencing the custom scaler
```yaml
apiVersion: keda.sh/v1alpha1
kind: ScaledObject
metadata: { name: custom-backend-scaler }
spec:
  triggers:
    - type: external
      metadata:
        scalerAddress: custom-scaler-svc.production:50051
        metricName: pending_jobs
```

### Interview points
- Being able to explain exactly why this is necessary — for any bespoke internal system that will never have an official KEDA scaler, this is the only path to KEDA-based scaling, not a workaround
- Walking through the three-method contract (`IsActive`, `GetMetricSpec`, `GetMetrics`) and what each is actually responsible for in the KEDA reconciliation flow
- Demonstrating this live (a real deployed gRPC service, not just the code) is a genuine differentiator — most candidates can describe built-in triggers; fewer have actually built a custom one

### Steps
1. Build a small internal system with a queryable "pending work" signal (a job-tracking table is a realistic and simple choice)
2. Implement the External Scaler gRPC service against KEDA's contract
3. Deploy it and configure a ScaledObject referencing it
4. Confirm scaling responds correctly to changes in the internal system's pending-work signal
5. Document the full architecture (internal system → custom scaler → KEDA → HPA → workload) with a real diagram in the README

---

## Portfolio Checklist
- [ ] All repos public on GitHub with clear READMEs
- [ ] README includes the full ScaledObject/scaler YAML and how to reproduce the setup
- [ ] Can explain why HPA alone can't handle Project 1's scenario, without notes, in an interview
- [ ] Project 2 includes real observed replica-count-over-time data, not just the configuration
- [ ] Project 3's custom scaler is demonstrated live/deployed, not just described in code
