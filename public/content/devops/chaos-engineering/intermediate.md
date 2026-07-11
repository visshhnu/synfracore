# Chaos Engineering — Intermediate

## Network chaos: the failure category infrastructure chaos misses entirely

Pod/instance termination tests whether a system handles a component disappearing outright — but a large share of real production incidents aren't a clean failure, they're a component that's still running but responding slowly, intermittently, or partially. Network chaos experiments specifically target this gap:

```yaml
# Chaos Mesh — inject 100ms latency between two services
apiVersion: chaos-mesh.org/v1alpha1
kind: NetworkChaos
metadata:
  name: latency-payment-api
  namespace: production
spec:
  action: delay
  mode: all
  selector:
    labelSelectors:
      app: payment-api
  delay:
    latency: "100ms"
    jitter: "10ms"
  duration: "5m"
```
A "kill the pod" experiment and a "the pod is alive but every response now takes 3 extra seconds" experiment expose genuinely different weaknesses — the second is what actually reveals whether upstream services have real timeouts configured, or whether a slow downstream dependency will quietly cascade into thread/connection-pool exhaustion across the whole call chain. Teams that only ever test hard-kill failures routinely discover, during a real incident, that they'd never actually verified their timeout configuration handles a slow-but-alive dependency at all.

## Game days: structured, scheduled chaos as a team practice

A game day is a deliberately scheduled event where a team runs one or more chaos experiments together, live, with the specific goal of practicing incident response under controlled conditions — not just testing the system, but testing the team's own process for detecting, diagnosing, and responding to a failure. The structure that makes a game day actually valuable, rather than just an ad-hoc experiment with extra people watching:

1. **Define the scenario and hypothesis in advance**, shared with the team but with the exact trigger timing kept unknown to whoever's on the response side, closer to simulating a real page
2. **Someone plays the role of incident commander**, running the same process (declaring severity, coordinating comms, deciding on rollback) that would apply to a real incident
3. **Time-to-detect and time-to-mitigate are the actual metrics that matter** — not just whether the system technically survived, but how long it took the team to notice and respond, which is exactly the gap that matters in a real outage
4. **A blameless retro afterward** captures what the monitoring/alerting/runbook gaps actually were — a game day's real output is the list of gaps found, not a pass/fail grade

## AWS Fault Injection Simulator: managed chaos for AWS-native workloads

For teams running primarily on AWS-managed services (RDS, ECS, EKS-on-Fargate) where self-hosting a Kubernetes-native chaos tool doesn't fit cleanly, FIS provides the same core capability as a managed AWS service:

```json
{
  "description": "Terminate one random EC2 instance in an ASG",
  "targets": {
    "instances": {
      "resourceType": "aws:ec2:instance",
      "resourceTags": { "chaos-eligible": "true" },
      "selectionMode": "COUNT(1)"
    }
  },
  "actions": {
    "terminate-instance": {
      "actionId": "aws:ec2:terminate-instances",
      "targets": { "Instances": "instances" }
    }
  },
  "stopConditions": [
    { "source": "aws:cloudwatch:alarm", "value": "arn:aws:cloudwatch:...:alarm:HighErrorRate" }
  ]
}
```
The `stopConditions` field is FIS's built-in safety mechanism worth specifically calling out — the experiment automatically halts if a named CloudWatch alarm fires during the run, which is a genuinely valuable default that a hand-rolled chaos script wouldn't have unless someone explicitly built it: the platform itself, not just the operator watching a dashboard, is what stops a runaway experiment.

## Building the case for chaos engineering when the team is skeptical

A common, reasonable objection: "we already have monitoring and tests, why deliberately break things too." The honest answer is that tests and monitoring both verify what you already expect to happen — a unit test confirms the code does what you designed it to do, and monitoring alerts on thresholds you already thought to define. Neither surfaces failure modes you haven't imagined yet, which is specifically the gap chaos engineering fills: a well-designed experiment often fails in a way nobody predicted, and that failure is the actual value delivered, not a sign the practice isn't working. Starting with low-risk, well-understood experiments (pod-delete in staging) and building a track record of real findings is what typically converts skepticism into buy-in — arguing the abstract case rarely does as much as one concrete finding that would have caused a real incident.

## Choosing what to break next: prioritizing by actual risk, not novelty

Not every possible experiment is equally worth running — the ones worth prioritizing are the failure modes most likely to actually occur in production and least likely to have already been tested: a critical dependency that's never had its failure simulated, a recent architecture change (a new service added to a call chain) that hasn't been chaos-tested yet, or a component whose last incident postmortem revealed an untested assumption. Chasing exotic, unlikely failure combinations before covering these basics is a common way for a chaos program to produce interesting findings that don't actually reduce real incident risk.
