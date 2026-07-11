# Chaos Engineering — Quick Reference

## LitmusChaos — core commands

```bash
# Install LitmusChaos (Kubernetes)
kubectl apply -f https://litmuschaos.github.io/litmus/litmus-operator-v3.0.0.yaml

# List available chaos experiments in the hub
kubectl get chaosexperiments -n litmus

# Check a running experiment's status
kubectl get chaosengine nginx-chaos -n production -o yaml

# Check the result/verdict after completion
kubectl get chaosresult nginx-chaos-pod-delete -n production -o jsonpath='{.status.experimentStatus.verdict}'

# Abort a running experiment immediately
kubectl delete chaosengine nginx-chaos -n production
```

## Chaos Mesh — core commands

```bash
# Install via Helm
helm repo add chaos-mesh https://charts.chaos-mesh.org
helm install chaos-mesh chaos-mesh/chaos-mesh -n chaos-mesh --create-namespace

# List active chaos experiments of any kind
kubectl get podchaos,networkchaos,stresschaos -A

# Delete a specific experiment (stops it)
kubectl delete networkchaos latency-payment-api -n production

# Access the Chaos Dashboard (default port 2333)
kubectl port-forward -n chaos-mesh svc/chaos-dashboard 2333:2333
```

## Experiment type reference

| Experiment | Litmus name | Chaos Mesh kind | Tests |
|---|---|---|---|
| Kill a pod | `pod-delete` | `PodChaos` (action: pod-kill) | Graceful failover, replica recovery |
| Network latency | `pod-network-latency` | `NetworkChaos` (action: delay) | Timeout handling, cascading slowness |
| Packet loss | `pod-network-loss` | `NetworkChaos` (action: loss) | Retry logic, connection resilience |
| CPU stress | `pod-cpu-hog` | `StressChaos` | Resource limits, autoscaling response |
| Memory stress | `pod-memory-hog` | `StressChaos` | OOM handling, memory limit enforcement |
| Disk fill | `disk-fill` | N/A (use `PodChaos` + custom) | Disk-full failure paths |
| Kill a node | `node-drain` | N/A (use cloud-provider tooling) | Node-level failover, pod rescheduling |

## AWS Fault Injection Simulator — quick reference

```bash
# List available FIS actions
aws fis list-actions

# Start an experiment from a saved template
aws fis start-experiment --experiment-template-id EXT1234567890abcdef

# Check experiment status
aws fis get-experiment --id EXPabcdef1234567890

# Stop a running experiment immediately
aws fis stop-experiment --id EXPabcdef1234567890
```

## Pre-experiment safety checklist

```
[ ] Steady-state metric defined precisely (specific threshold, not "seems fine")
[ ] Hypothesis is falsifiable and written down before starting
[ ] Blast radius confirmed minimal (one pod/instance, exact selector verified)
[ ] Abort/kill-switch mechanism tested — not just assumed to work
[ ] Dashboards for the target service open and being watched live
[ ] Running in staging first, or explicit sign-off obtained for production
[ ] Team/on-call aware an experiment is running, not caught by surprise
```

## Blast-radius escalation ladder

```
1. One pod, staging, business hours, team watching
2. One pod, production, business hours, team watching
3. Full deployment (all replicas of one service), staging
4. Full deployment, production, with rollback tested
5. Availability Zone failure — requires executive sign-off, scheduled window
6. Region failover — requires executive sign-off, scheduled window, full DR test
```
Each step should only be attempted after the previous one has been run successfully, repeatedly, with no surprises — skipping steps trades a genuinely small, controlled risk for a much larger, less understood one.
