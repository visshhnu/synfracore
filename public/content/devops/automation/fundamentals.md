# SRE Automation — Fundamentals

## Toil: the specific thing automation is meant to eliminate

Not all manual work is toil — toil has a specific definition worth holding onto precisely: work that is manual, repetitive, automatable, tactical (no lasting value once done), and scales linearly with service growth. Writing a design doc is manual but isn't toil (it's not repetitive or automatable in the same sense). Restarting the same service by hand every time a specific alert fires *is* toil — it's the same action, repeated, that a script could do identically every time. The 50% threshold matters as a real, practical signal, not an arbitrary number: once toil consistently exceeds half of a team's working hours, there's structurally no time left for the engineering work (automation, architecture improvements) that would actually reduce toil going forward — the team is stuck treating symptoms because there's no bandwidth to fix causes.

## Writing your first runbook automation

The starting point for automating any manual incident-response step is a runbook that's already written down clearly enough that a script *could* follow it — if the human process itself is vague or requires judgment calls, that's the thing to fix first, before automating it:

```python
# A minimal runbook automation — restart a service when its health check fails,
# triggered by a webhook from the alerting system
import subprocess
import requests

def restart_service(service_name: str, namespace: str):
    result = subprocess.run(
        ["kubectl", "rollout", "restart", f"deployment/{service_name}", "-n", namespace],
        capture_output=True, text=True
    )
    if result.returncode != 0:
        # Automation that fails silently is worse than no automation —
        # always escalate a failure, don't just log it
        notify_oncall(f"Auto-restart of {service_name} failed: {result.stderr}")
    return result.returncode == 0

def handle_alert_webhook(alert):
    if alert["alertname"] == "ServiceHealthCheckFailing":
        restart_service(alert["labels"]["service"], alert["labels"]["namespace"])
```
The failure-handling path is not optional — automation that silently does nothing when it fails is strictly worse than a human process, because a human notices when they can't complete a task; a failed script that doesn't escalate just leaves the original problem unaddressed with nobody aware it's still happening.

## Auto-remediation: Kubernetes' own built-in example

Kubernetes' own restart policy is the simplest, most universal example of auto-remediation already running in most clusters, worth understanding as the baseline pattern before building custom automation on top of it:

```yaml
spec:
  containers:
    - name: myapp
      resources:
        limits:
          memory: "512Mi"
  restartPolicy: Always
```
When a container is OOMKilled (exceeds its memory limit), Kubernetes restarts it automatically — no human, no PagerDuty alert, no manual `kubectl` command. This is auto-remediation working exactly as intended for a well-understood, safe-to-retry failure mode. The pattern generalizes: any failure that's (a) well-understood, (b) safe to retry without side effects, and (c) has a clear, deterministic fix is a strong automation candidate. A failure that's ambiguous, has side effects if retried incorrectly (double-processing a payment, for instance), or needs judgment to diagnose is not — automating that prematurely risks doing real harm faster than a human would have, not less.

## Capacity auto-scaling as automation, not just an ops feature

Autoscaling is itself a form of SRE automation worth explicitly recognizing as such — it eliminates what would otherwise be manual, repetitive toil (someone watching a dashboard and manually adding replicas during a traffic spike):

```yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: api-hpa
spec:
  minReplicas: 2
  maxReplicas: 20
  metrics:
    - type: Resource
      resource:
        name: cpu
        target: { type: Utilization, averageUtilization: 70 }
```
This connects directly to the Capacity Planning content covered elsewhere in this academy — the thresholds and headroom reasoning there is what determines *what* this HPA config should actually say; automation here is the mechanism that executes a capacity decision already made, not a substitute for making that decision correctly in the first place.

## GitOps: automating deployment itself, not just remediation

GitOps extends the same "eliminate manual, repetitive work" principle to deployment: a developer pushes code, CI builds an image, a pipeline step updates a Helm values file, and a GitOps controller (ArgoCD, Flux) detects the change and applies it — with zero manual `kubectl apply` commands run by a human against production at any point. The toil eliminated here isn't just typing a deploy command — it's the entire class of manual-deploy risks (deploying the wrong version, a typo in a manually-run command, an undocumented manual change that later can't be reproduced) that a fully automated, git-driven pipeline removes by construction, since every actual production state change traces back to a reviewed, versioned git commit.

## Measuring whether automation is actually working

| Metric | Target | Why it matters |
|---|---|---|
| Toil percentage | Under 50% of working hours | The core signal — automation is failing its purpose if toil stays high despite automation effort |
| MTTR for auto-remediated incidents | Under 5 minutes | Confirms remediation is genuinely faster than a human response, not just automated for its own sake |
| Runbook automation coverage | Over 80% of P2+ runbooks | Tracks whether automation effort is actually being applied broadly, not just to a few convenient cases |
| Manual intervention rate | Decreasing ~20% per quarter | A trend metric — automation that isn't measurably reducing manual work over time isn't delivering its intended value |

Tracking these explicitly matters because automation effort itself can quietly become a form of toil if it's not measured against outcomes — building automation for its own sake, without confirming it's actually reducing manual work or improving MTTR, is a real trap worth guarding against from the start.
