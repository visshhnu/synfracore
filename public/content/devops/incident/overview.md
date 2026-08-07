# Incident Management

> **P1 to P4 severity, response framework, post-mortem, MTTR improvement**

**Category:** Site Reliability Engineering  
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

**Before you start:** basic Kubernetes/CLI familiarity helps for the response-framework examples, but the core material here is process, not tooling — no specific prior SRE experience is assumed.

---

## What is Incident Management?

**Severity classification** drives how fast a team responds and who gets called. **P1** means a complete outage or data loss — all hands on deck, an SLA breach is imminent, leadership may be notified. **P2** is major degradation where the service is still partially working. **P3** is a non-critical feature broken, handled within a normal business day. **P4** is cosmetic, fixed whenever it fits into the next sprint. The rule of thumb: always err toward the higher severity — it's easy to downgrade an incident once you have more information, but missing a real P1 is expensive.

## Why Incident Management?

The most important rule in incident response: **restore service first, find root cause second.** Every minute spent investigating without taking mitigating action is a minute of continued downtime. Communicate to stakeholders every 10-15 minutes even when there's nothing new to report — silence during an outage feels worse than uncertainty. And for incidents caused by a recent deployment, a rollback is almost always the fastest way to mitigate, faster than trying to forward-fix the actual bug under pressure.

---

## Learning Modules

### Module 01 — Incident Severity Levels
*P1 to P4 — definition and response*

Covered above: what distinguishes each severity level. This module puts real response-time and escalation targets against each one.

**Topics covered:**

- P1 — Critical: service down, revenue impacted — 🟢 Beginner
- P2 — Major: degraded, workaround exists — 🟢 Beginner
- P3 — Minor: non-critical feature broken — 🟢 Beginner
- P4 — Low: cosmetic, no user impact — 🟢 Beginner
- Escalation matrix — who calls who — 🟡 Intermediate

```bash
# Severity Classification Matrix

# P1 — CRITICAL
# Definition: Service down, data loss, payment failing, security breach
# Response:   Immediate — engineer on-call within 5 minutes
# Updates:    Every 10-15 minutes even if no fix yet
# Escalate:   Engineering Manager + VP after 30 minutes
# Example:    Payment API returning 500 for all requests

# P2 — MAJOR
# Definition: Service degraded, slow, or partial functionality
# Response:   Within 30 minutes
# Updates:    Every 30 minutes
# Example:    Reports page timing out for 20% of users

# P3 — MINOR
# Definition: Non-critical feature broken, workaround available
# Response:   Business hours, within 4 hours
# Example:    Export to CSV button not working

# P4 — LOW
# Definition: Cosmetic, UI glitch, no functional impact
# Response:   Next sprint
# Example:    Footer copyright year shows wrong year

# ESCALATION: Never go silent on P1/P2
# 0-5 min:   Acknowledge + start incident channel
# 5 min:     First status update (even if just "investigating")
# 30 min:    Escalate to manager if not mitigated
# 60 min:    Escalate to VP/Director for P1
```

### Module 02 — Incident Response Framework
*6-phase response: Detect → Post-mortem*

Covered above: restore-first, communicate-constantly, rollback-as-default-mitigation. This module walks the full 6-phase sequence with real commands and message templates.

**Topics covered:**

- Phase 1 — Detect and acknowledge — 🟢 Beginner
- Phase 2 — Assess blast radius — 🟡 Intermediate
- Phase 3 — Communicate proactively — 🟡 Intermediate
- Phase 4 — Mitigate first, root cause later — 🟡 Intermediate
- Phase 5 — Resolve and monitor — 🟢 Beginner
- Phase 6 — Blameless post-mortem — 🟡 Intermediate

```bash
# PHASE 1 — DETECT (0-2 minutes)
# Alert fires → acknowledge immediately in PagerDuty/Slack
# Open incident channel: #inc-20260531-payment-down
# Never acknowledge and go back to sleep

# PHASE 2 — ASSESS (2-5 minutes)
# What is broken?     symptom (500 errors on /api/payment)
# Who is affected?    blast radius (all users? 10%? one region?)
# Since when?         timeline (started 14:32 IST)
# What changed?       check recent deployments
kubectl get pods -A | grep -v Running | grep -v Completed
kubectl get events -A --sort-by=.lastTimestamp | tail -20
# Check ArgoCD for recent syncs
# Check deployment history: git log --since="2 hours ago"

# PHASE 3 — COMMUNICATE (5 minute mark)
# Post to #incidents and status page:
# "P1: Payment service returning 500 errors since 14:32 IST
#  Impact: ~30% of payment requests failing
#  Investigating: deployment at 14:15 suspected
#  Next update: 14:50 IST"
# Update every 10-15 min. Never go silent.

# PHASE 4 — MITIGATE (fastest to slowest options)
# 1. Rollback last deployment (if recent change caused it)
kubectl rollout undo deployment/payment-api -n production
kubectl rollout status deployment/payment-api -n production

# 2. Scale up replicas (if traffic spike)
kubectl scale deployment/payment-api --replicas=10

# 3. Restart pods (if memory leak)
kubectl rollout restart deployment/payment-api

# 4. Feature flag off (if new feature causing it)
# 5. Failover to DR region (if infrastructure issue)

# PHASE 5 — MONITOR (15-30 minutes)
# Watch error rate return to baseline
# Watch latency return to normal
# Confirm no secondary issues

# PHASE 6 — POST-MORTEM (within 48 hours)
# Blameless: focus on system, not people
# Timeline of events
# Root cause (use 5-whys)
# Impact: users affected, revenue, duration
# What worked, what did not
# Action items with owners and due dates
```

### Module 03 — Post-Mortem Writing
*Blameless RCA, 5-whys, action items*

Post-mortems are the most valuable part of incident management — they prevent the same incident from happening again. Blameless means the system failed, not a person. People make mistakes; the system should be designed so one mistake does not cause an outage. 5-Whys: ask "why" five times to reach the real root cause, not just the symptom.

**Topics covered:**

- Blameless culture — system not people — 🟢 Beginner
- 5-Whys root cause analysis — 🟡 Intermediate
- Post-mortem template structure — 🟡 Intermediate
- Action items that actually get fixed — 🟡 Intermediate

```bash
# POST-MORTEM TEMPLATE

# INCIDENT: Payment service outage — 2026-05-31
# SEVERITY: P1
# DURATION: 47 minutes (14:32 - 15:19 IST)
# IMPACT:   ~12,000 payment requests failed, est. INR 4.2L revenue delayed

# TIMELINE:
# 14:15 — Deploy v2.3.1 (new payment gateway integration)
# 14:32 — Alert: error rate >5% on payment service
# 14:35 — On-call engineer acknowledges, opens incident channel
# 14:42 — Correlated with v2.3.1 deployment
# 14:45 — Rollback initiated
# 14:52 — Rollback complete, error rate drops to 0.1%
# 15:19 — Full resolution confirmed, monitoring period ends

# ROOT CAUSE (5-Whys):
# Why did payment fail?       → Service returned 500 errors
# Why 500 errors?             → DB connection pool exhausted
# Why pool exhausted?         → New code opened connections without closing
# Why did this reach prod?    → Integration test did not use production-scale DB config
# Why did test not catch it?  → Test env has pool_size=5, prod has pool_size=10 (still not enough)
# ROOT CAUSE: Missing connection pool configuration validation in deployment pipeline

# WHAT WORKED:
# — Alert fired within 2 minutes of degradation starting
# — Rollback procedure took 7 minutes
# — Communication was consistent throughout

# WHAT DID NOT WORK:
# — No integration test at production-scale connection settings
# — No connection pool monitoring alert existed

# ACTION ITEMS:
# 1. Add connection pool exhaustion alert to Prometheus  [Owner: Platform] [Due: 2026-06-07]
# 2. Add prod-scale DB config to staging environment      [Owner: DevOps]   [Due: 2026-06-14]
# 3. Add pool health check to deployment smoke tests     [Owner: Backend]  [Due: 2026-06-14]
```

---

## Production Example

```bash
# Incident Management — Key Metrics to Track

# MTTR (Mean Time To Recover):
# How long from incident start to full resolution
# Target: < 30 minutes for P1, < 4 hours for P2
# Formula: sum(resolution_time) / count(incidents)

# MTTD (Mean Time To Detect):
# How long before the incident was detected
# Target: < 5 minutes (alerts should fire fast)
# Improving MTTD: better alerting, synthetic monitoring

# MTTA (Mean Time To Acknowledge):
# How long before someone responds to the alert
# Target: < 5 minutes for P1
# Improving MTTA: better on-call rotation, clear escalation

# Change Failure Rate:
# % of deployments that cause an incident
# Target: < 5%
# Improving: better testing, feature flags, canary deployments

# MONITORING YOUR INCIDENT METRICS WITH PROMETHEUS:
# Track incident duration as a histogram
# Alert if P1 MTTR > 30 minutes in last 30 days
# Dashboard: incidents per week by severity
# Trend: MTTR improving or worsening over time?

# TOOL STACK:
# Alerting:     PagerDuty / OpsGenie
# Channels:     Slack #incidents
# Status page:  Statuspage.io / Atlassian
# Post-mortems: Confluence / GitHub wiki
# Tracking:     Jira incidents project
```

---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is Incident Management and why would you use it in production?"
    Incident management is the structured process for responding to production issues — classifying severity (P1-P4), acting fast to restore service, communicating clearly throughout, and learning from it afterward with a blameless post-mortem. Without it, teams either under-react to real outages (slow response, no clear owner) or over-react to minor issues (waking people up for a P4). A consistent framework means the right people respond at the right speed every time, and every incident produces action items that prevent a repeat.

??? question "How does Incident Management work internally? Explain the architecture."
    It's a 6-phase process, not a system architecture: detect and acknowledge (alert fires, someone owns it within minutes), assess (what's broken, who's affected, what changed), communicate (status updates every 10-15 minutes, never go silent), mitigate (rollback, scale up, restart, or feature-flag off — fastest option first, root cause investigation comes later), monitor (confirm the fix actually held), and post-mortem (blameless root-cause analysis within 48 hours, with owned action items).

??? question "What are the main components of Incident Management?"
    A severity matrix (P1-P4) that maps issue type to response speed and who gets paged; an incident channel/communication process (Slack channel, status page, update cadence); a mitigation playbook (rollback, scale, restart, feature-flag, failover — in order of speed); and a post-mortem process (blameless, 5-whys root cause, timeline, action items with owners and due dates).

??? question "How do you handle failures in Incident Management?"
    The core principle is mitigate first, investigate root cause second — every minute spent diagnosing instead of acting is a minute of continued downtime. The fastest mitigations, roughly in order: roll back the last deployment if it's suspected, scale up replicas if it's a traffic spike, restart pods if it looks like a memory leak, turn off a feature flag if a new feature is the cause, or fail over to a DR region if it's infrastructure-level. Only after service is restored does the team dig into the actual root cause via a 5-whys post-mortem.

??? question "What is your production experience with Incident Management?"
    *(Needs verification — this platform can't fabricate a first-person production story. Answer from your own experience: an incident you responded to, what severity it was, what the actual mitigation was, and what came out of the post-mortem.)*

??? question "How do you monitor and observe Incident Management in production?"
    Track MTTD (Mean Time To Detect — how fast alerts fire after something breaks, target under 5 minutes), MTTA (Mean Time To Acknowledge — how fast someone responds to the page, target under 5 minutes for P1), MTTR (Mean Time To Recover — total time from start to full resolution, target under 30 minutes for P1), and Change Failure Rate (% of deployments that cause an incident, target under 5%). These get tracked as ongoing metrics — a dashboard of incidents per week by severity and a trend on whether MTTR is improving or getting worse over time — not just recorded per-incident and forgotten.

??? question "What are the security considerations for Incident Management?"
    Incident channels and post-mortems often contain sensitive details — customer data exposure scope, internal architecture, credentials that were rotated — so access to incident history should be restricted appropriately, not open to the whole company by default. During active incidents, be careful what gets pasted into shared channels (no live credentials, no raw customer PII in a Slack message). And post-mortems for security-related incidents specifically need a clear disclosure process — whether and when affected customers or regulators need to be notified — decided ahead of time, not improvised mid-incident.

??? question "How does Incident Management compare to alternatives?"
    There isn't really a competing approach — the alternative to structured incident management is ad-hoc firefighting, which reliably produces worse outcomes: unclear ownership, inconsistent communication, no severity triage (P4s treated like P1s or vice versa), and no post-mortem, so the same failure mode recurs. The frameworks differ mainly in formality and tooling (PagerDuty vs. OpsGenie for alerting, Statuspage vs. Atlassian for status pages) — the 6-phase detect-assess-communicate-mitigate-monitor-post-mortem shape is close to universal across mature SRE organizations.

??? question "Explain Incident Severity Levels in Incident Management."
    P1 is a complete outage, data loss, or security breach — immediate all-hands response, updates every 10-15 minutes, leadership notified after 30 minutes if unresolved. P2 is major degradation with the service still partially working — response within 30 minutes. P3 is a non-critical feature broken with a workaround available — handled within business hours. P4 is cosmetic with no functional impact — fixed whenever it fits the next sprint. The classification directly drives response speed and who gets paged, so the rule is to err toward the higher severity when it's ambiguous.

??? question "Explain Incident Response Framework in Incident Management."
    Six phases: Detect (alert fires, acknowledge immediately, open an incident channel), Assess (what's broken, who's affected, what changed recently — check recent deployments first), Communicate (post a status update within 5 minutes and every 10-15 minutes after, even with no new information), Mitigate (take the fastest safe action — usually rollback — before investigating root cause), Monitor (confirm error rates and latency actually returned to baseline, watch for secondary issues), and Post-mortem (blameless root-cause analysis within 48 hours, with a timeline, 5-whys, and action items that have real owners and due dates).

---

## Official Resources

- [Google SRE Book — Incident Management](https://sre.google/sre-book/managing-incidents/)
- [PagerDuty Incident Response Guide](https://response.pagerduty.com/)
- [Atlassian Incident Management](https://www.atlassian.com/incident-management)

---

