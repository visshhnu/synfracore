# SRE Automation — Quick Reference

## Toil criteria — is this actually toil?

```
Manual         — requires a human to perform it
Repetitive     — done the same way, repeatedly
Automatable    — a script/system could do it deterministically
Tactical       — no lasting value once done (vs. e.g. a design doc)
Scales with growth — grows linearly with service/user count

All five present = toil, and a real automation candidate.
Missing one or more = probably not toil, automating it may not help.
```

## Automation candidate checklist

```
[ ] Failure mode is well-understood (not ambiguous/novel)
[ ] Safe to retry without side effects (no risk of duplicate action,
    e.g. double-charging, double-sending)
[ ] Fix is deterministic — same input, same correct action every time
[ ] Blast radius of an automated action is small and well-scoped
[ ] A circuit breaker / max-attempts limit is in place
[ ] The action itself emits a visible signal (metric/log) every time it fires
[ ] An escalation path exists for when automation can't resolve it
```
If any of the first three are false, that failure mode is a candidate for better alerting/diagnostics automation (gather context, notify a human) rather than automated remediation.

## Kubernetes self-healing quick reference

```yaml
# Basic restart-on-failure
restartPolicy: Always

# Liveness probe — should check actual functional health, not just "is alive"
livenessProbe:
  httpGet: { path: /health/deep, port: 8080 }
  initialDelaySeconds: 30
  periodSeconds: 10
  failureThreshold: 3

# HPA — capacity auto-scaling as automation
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
spec:
  minReplicas: 2
  maxReplicas: 20
  metrics:
    - type: Resource
      resource: { name: cpu, target: { type: Utilization, averageUtilization: 70 } }
```

## GitOps pipeline, at a glance

```
git push → CI build/test → CI updates Helm values → PR (human review) →
merge → ArgoCD/Flux detects change → applies to cluster →
continuous reconciliation (reverts manual drift automatically)
```

## Key metrics to track

| Metric | Target | Signals a problem if... |
|---|---|---|
| Toil percentage | < 50% of working hours | Stays high despite automation investment |
| MTTR (auto-remediated) | < 5 minutes | Automated path is slower than expected, or looping |
| Runbook automation coverage | > 80% of P2+ | Large gap between "runbook exists" and "runbook is automated" |
| Manual intervention rate | ↓ ~20%/quarter | Flat or rising — automation isn't reducing real manual work |
| Auto-remediation trigger rate (per service) | Stable/low | Rising trend — may indicate a worsening masked problem |

## Common tools by function

| Function | Tool |
|---|---|
| System config / deployment automation | Ansible |
| Custom auto-remediation scripts | Python + Kubernetes API client |
| Event-driven autoscaling beyond CPU/mem | KEDA |
| Alert-to-automation trigger | PagerDuty/Opsgenie webhooks |
| Validating automation under real failure | AWS FIS, LitmusChaos, Chaos Mesh |
