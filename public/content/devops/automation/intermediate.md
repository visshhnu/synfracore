# SRE Automation — Intermediate

## Alert correlation: turning 50 symptoms into 1 actionable incident

A single real failure routinely triggers many independent-looking alerts — a database going down might simultaneously fire alerts for every service that depends on it, each looking like a separate incident to an on-call engineer paging through a notification list. Alert correlation logic groups related alerts back into one root-cause incident automatically, rather than leaving a human to manually recognize the pattern under time pressure:

```python
# Simplified alert correlation — group alerts by a shared root-cause signal
# within a time window, rather than treating each as independent
from collections import defaultdict
from datetime import datetime, timedelta

def correlate_alerts(alerts, window_minutes=5):
    groups = defaultdict(list)
    for alert in alerts:
        # Group by shared dependency label, not just alert name —
        # this is what actually catches "50 services alerting because
        # one shared database is down" as one group, not 50
        key = alert.get("labels", {}).get("dependency", alert["alertname"])
        groups[key].append(alert)

    incidents = []
    for key, group in groups.items():
        if len(group) >= 3:  # multiple related alerts = likely one root cause
            incidents.append({
                "root_cause_candidate": key,
                "symptom_count": len(group),
                "alerts": group,
            })
        else:
            incidents.extend([{"root_cause_candidate": a["alertname"], "alerts": [a]} for a in group])
    return incidents
```
The real MTTR improvement from correlation isn't from responding faster to each individual alert — it's from an on-call engineer immediately seeing "one database outage, 50 downstream symptoms" instead of separately triaging 50 alerts before independently arriving at the same conclusion, which is exactly the kind of repeated manual pattern-recognition that automation should eliminate.

## Self-healing patterns: beyond simple restart-on-failure

Restart-on-OOM (covered on Fundamentals) is the simplest self-healing pattern — more sophisticated self-healing automation handles failure modes that a blind restart doesn't fix:

```yaml
# Liveness probe with a meaningful check, not just "is the process running"
livenessProbe:
  httpGet:
    path: /health/deep
    port: 8080
  initialDelaySeconds: 30
  periodSeconds: 10
  failureThreshold: 3
# /health/deep checks actual dependencies (DB connection, cache reachability),
# not just "the process is technically alive" — a process can be running
# and still be functionally broken (e.g. its DB connection pool is exhausted
# and every real request fails, while the process itself never crashes)
```
This distinction matters specifically because a shallow liveness check (just confirming the process responds to a ping) misses an entire category of real failures — a service that's technically "up" but functionally broken never gets restarted by a shallow check, since nothing about that check would ever fail. Building health checks that reflect actual functional health, not just process liveness, is what makes self-healing automation catch the failures that actually matter.

## GitOps automation: the full pipeline, and where automation boundaries matter

```
Developer pushes code
  → CI builds image, runs tests
  → CI updates image tag in a Helm values file, opens a PR
  → PR reviewed and merged (still a human decision point, deliberately)
  → ArgoCD detects the git change
  → ArgoCD applies the change to the cluster
  → ArgoCD continuously reconciles — if someone manually kubectl-edits
    the live resource, ArgoCD detects the drift and reverts it
```
The deliberate human checkpoint (PR review before merge) is worth calling out specifically — full GitOps automation doesn't mean removing human judgment from deployment decisions, it means removing manual *execution* risk (a mistyped command, an undocumented manual change) while keeping the actual "should this deploy" decision as an explicit, reviewed step. Automating past that checkpoint (auto-merge on green CI with no review) is a different, higher-risk design choice that trades review-time safety for deploy speed — appropriate for some teams and contexts, not a default to reach for without deliberately deciding it's the right tradeoff.

## Triggering automation from alerts: the integration layer

```python
# PagerDuty webhook → automation trigger
from flask import Flask, request

app = Flask(__name__)

@app.route("/pagerduty-webhook", methods=["POST"])
def handle_pagerduty_event():
    event = request.json
    if event["event"]["event_type"] == "incident.triggered":
        alert_name = event["event"]["data"]["title"]
        if alert_name in AUTOMATED_REMEDIATION_MAP:
            AUTOMATED_REMEDIATION_MAP[alert_name](event["event"]["data"])
    return "", 200
```
The `AUTOMATED_REMEDIATION_MAP` pattern — an explicit, reviewed allowlist of which specific alerts trigger which specific automated action — matters more than it might look: automating "run some remediation for whatever alert comes in" without an explicit, reviewed mapping is how automation ends up taking an inappropriate action for an alert nobody actually intended it to handle. Every entry in that map should be a deliberate decision, reviewed the same way a production code change would be, not an implicit catch-all.

## When automation should escalate instead of act

Not every failure should trigger automated remediation, even when a script *could* technically act — the judgment call worth building into automation design from the start is distinguishing "safe to auto-remediate" from "needs a human, but the alert should still be enriched with context first." A failure with unclear scope, an unfamiliar error signature, or any risk of data loss on retry should route to a human with as much diagnostic context pre-gathered as automation can provide (recent deploys, related alerts, relevant logs) — automating the *information-gathering* step even when the *remediation* step stays manual is itself a significant toil reduction, without taking on the risk of an automated action in a genuinely ambiguous situation.
