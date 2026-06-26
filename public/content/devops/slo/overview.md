# SLA / SLO / SLI + Error Budgets

> **Reliability engineering — from measurements to error budgets**

**Category:** Site Reliability Engineering  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is SLA / SLO / SLI + Error Budgets?

These three terms are asked in every senior interview. SLI (Service Level Indicator) is the actual measurement — your error rate this month is 0.3%. SLO (Service Level Objective) is your internal target — maintain error rate below 1%. SLA (Service Level Agreement) is the external customer contract — we guarantee 99.5% availability. Always: SLI < SLO stricter than SLA. This buffer lets you breach SLO internally without breaching the customer SLA.

## Why SLA / SLO / SLI + Error Budgets?

Error budget = 100% - SLO. A 99.9% availability SLO gives 0.1% error budget = 43.2 minutes downtime/month. Error budget is the tool that balances reliability vs feature velocity. Budget healthy: ship features fast. Budget nearly gone: freeze risky deployments, focus on reliability. This removes the emotion from deployment decisions — it becomes data-driven.

---

## Learning Modules

### Module 01 — SLI, SLO, SLA Defined
*The three reliability concepts*

These three terms are asked in every senior interview. SLI (Service Level Indicator) is the actual measurement — your error rate this month is 0.3%. SLO (Service Level Objective) is your internal target — maintain error rate below 1%. SLA (Service Level Agreement) is the external customer contract — we guarantee 99.5% availability. Always: SLI < SLO stricter than SLA. This buffer lets you breach SLO internally without breaching the customer SLA.

**Topics covered:**

- SLI — what you measure — 🟢 Beginner
- SLO — your internal target — 🟢 Beginner
- SLA — external contract — 🟢 Beginner
- Relationship between all three — 🟡 Intermediate

```bash
# The three levels — concrete example

SLI = what actually happened (measurement)
SLO = what you aimed for (internal goal)
SLA = what you promised customers (contract)

Example:
  SLI: Availability this month = 99.3%  (actual measurement)
  SLO: 99.9% availability               (internal goal — BREACHED)
  SLA: 99.5% availability               (customer contract — NOT breached)

Result:
  → Internal SLO breached → engineering must investigate
  → Customer SLA not breached → no credits owed
  → Buffer (SLO - SLA = 0.4%) saved the team

# Good SLIs for common services:
# Web service:  availability, latency (P99), error rate
# Storage:      durability (data not lost), throughput
# Database:     query latency, connection error rate
# Queue:        consumer lag, message delivery rate
# Pipeline:     job success rate, processing latency
```

### Module 02 — Error Budgets
*The key to balancing reliability and velocity*

Error budget = 100% - SLO. A 99.9% availability SLO gives 0.1% error budget = 43.2 minutes downtime/month. Error budget is the tool that balances reliability vs feature velocity. Budget healthy: ship features fast. Budget nearly gone: freeze risky deployments, focus on reliability. This removes the emotion from deployment decisions — it becomes data-driven.

**Topics covered:**

- Error budget calculation — 🟡 Intermediate
- Error budget policy — 🟡 Intermediate
- Burn rate alerting — 🔴 Advanced
- Using budget to make deployment decisions — 🔴 Advanced

```bash
# Error budget calculation
# SLO = 99.9% availability
# Error budget = 100% - 99.9% = 0.1%

# Monthly error budget in time:
# 0.001 × 30 days × 24 hours × 60 min = 43.2 minutes/month

# Current error budget remaining:
# If you've had 40 minutes of downtime this month:
# Remaining = 43.2 - 40 = 3.2 minutes
# Status: CRITICAL — freeze all risky deployments

# Error budget policy (write this as a team agreement):
# Budget remaining > 50% → Deploy freely, run experiments
# Budget remaining 25-50% → Standard change process
# Budget remaining 10-25% → High-risk changes need approval
# Budget remaining < 10%  → Feature freeze, reliability work only
# Budget exhausted         → Post-mortem required before resuming

# Prometheus: track error budget remaining
groups:
- name: error_budget
  rules:
  - record: job:error_budget_remaining:30d
    expr: |
      1 - (
        (1 - sum(rate(http_requests_total{status!~"5.."}[30d]))
               / sum(rate(http_requests_total[30d])))
        / (1 - 0.999)
      )

# Alert when 90% of budget consumed
- alert: ErrorBudgetCritical
  expr: job:error_budget_remaining:30d < 0.10
  annotations:
    summary: "90% of error budget consumed — freeze deployments"
```

### Module 03 — SLO Implementation
*Recording rules, dashboards, burn rate alerts*

Implementing SLOs in Prometheus requires recording rules (pre-compute SLI over time windows) and burn rate alerts. Burn rate = how fast you are consuming error budget. A burn rate of 1 means you're on track to use exactly 100% of budget in the SLO window. Burn rate of 2 means you'll exhaust budget in half the time — alert immediately.

**Topics covered:**

- SLO recording rules in Prometheus — 🔴 Advanced
- Multi-window burn rate alerts — 🔴 Advanced
- SLO dashboards in Grafana — 🟡 Intermediate
- SLO tracking in Datadog — 🟡 Intermediate

```bash
# Multi-window burn rate alerting (Google SRE approach)
# Page if error budget burns in < 1 hour OR < 6 hours

groups:
- name: slo_burn_rate
  rules:
  # 5-minute window — catches fast burns
  - record: job:http_errors:rate5m
    expr: |
      sum(rate(http_requests_total{status=~"5.."}[5m]))
      / sum(rate(http_requests_total[5m]))

  # 1-hour window — catches sustained burns
  - record: job:http_errors:rate1h
    expr: |
      sum(rate(http_requests_total{status=~"5.."}[1h]))
      / sum(rate(http_requests_total[1h]))

  # Page immediately: fast burn (>14x budget consumption rate)
  - alert: SLOBurnRateCritical
    expr: |
      job:http_errors:rate5m > (14 * (1-0.999))
      AND
      job:http_errors:rate1h > (14 * (1-0.999))
    for: 2m
    labels:
      severity: page
    annotations:
      summary: "Error budget will be exhausted in < 1 hour"

  # Alert: moderate burn (>6x for 6 hours)
  - alert: SLOBurnRateWarning
    expr: |
      job:http_errors:rate1h > (6 * (1-0.999))
    for: 15m
    labels:
      severity: ticket
    annotations:
      summary: "Error budget will be exhausted in < 6 hours"
```

### Module 04 — Interview Answers on SLO
*What seniors are expected to say*

Senior engineers and architects are always asked about SLOs. The interviewer wants to hear that you: (1) know the difference between SLI/SLO/SLA, (2) understand error budgets as a team policy tool, (3) have implemented SLOs in Prometheus or Datadog, (4) use error budget status to make deployment decisions. Avoid saying "we just monitored uptime" — that is junior thinking.

**Topics covered:**

- Define SLI SLO SLA with examples — 🟡 Intermediate
- Explain error budget policy — 🟡 Intermediate
- SLO for a payment service — 🔴 Advanced
- When to freeze deployments — 🟡 Intermediate

```bash
# Interview answer framework — SLO question

# Q: "How do you set SLOs for a critical payment service?"

# ANSWER STRUCTURE (PSR format):

# PROBLEM:
# "At a large telecom organisation we had 50+ microservices with no consistent
# reliability targets. Alerting was reactive — we found out about
# problems from customers, not from our own monitoring."

# SOLUTION:
# "I introduced SLOs for our top 5 critical services.
# For the payment API I defined:
# - Availability SLI: % of requests that returned non-5xx
# - Latency SLI: % of requests completing in < 2 seconds
# - SLO: 99.9% availability, 95% of requests < 2s latency
# - SLA: 99.5% availability (customer contract)
#
# I implemented error budgets in Prometheus:
# - 43.2 min/month downtime budget
# - Team policy: < 10% remaining = no new feature deployments
# - Multi-window burn rate alerts for P1 paging
#
# Dashboards showed real-time error budget consumption."

# RESULT:
# "MTTR improved from 45min to 12min because engineers knew
# exactly how severe an incident was from the burn rate.
# Deployment confidence improved — teams used error budget
# status as an objective gate rather than gut feeling.
# We went 6 months without a customer SLA breach."
```

---

## Production Example

```bash
# SLA / SLO / SLI — Complete Reference

# AVAILABILITY CALCULATIONS:
# 99.9%  = 8.7 hours/year   = 43.2 min/month  = 10.1 min/week
# 99.95% = 4.4 hours/year   = 21.6 min/month  = 5.0 min/week
# 99.99% = 52.6 min/year    = 4.3 min/month   = 1.0 min/week
# 99.999%= 5.3 min/year     = 25.9 sec/month  = 6.0 sec/week

# FOUR GOLDEN SIGNALS (Google SRE — what to measure):
# 1. Latency    — how long does a request take?
# 2. Traffic    — how much demand is there? (RPS)
# 3. Errors     — what % of requests fail?
# 4. Saturation — how full is your service? (CPU/memory/queue)

# RED METHOD (for services):
# Rate     — requests per second
# Errors   — errors per second
# Duration — response time distribution (P50/P95/P99)

# USE METHOD (for infrastructure):
# Utilization  — % time resource is busy
# Saturation   — how much extra work is queued
# Errors       — error events rate

# GOOD SLO TARGETS BY TIER:
# Tier 1 (payment, auth, core):   99.99%  (4.3 min/month budget)
# Tier 2 (product, search):       99.9%   (43 min/month budget)
# Tier 3 (reporting, analytics):  99.5%   (3.6 hrs/month budget)
# Internal tools:                 99.0%   (7.2 hrs/month budget)
```

---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is SLA / SLO / SLI + Error Budgets and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does SLA / SLO / SLI + Error Budgets work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of SLA / SLO / SLI + Error Budgets?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in SLA / SLO / SLI + Error Budgets?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with SLA / SLO / SLI + Error Budgets?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe SLA / SLO / SLI + Error Budgets in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for SLA / SLO / SLI + Error Budgets?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does SLA / SLO / SLI + Error Budgets compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain SLI, SLO, SLA Defined in SLA / SLO / SLI + Error Budgets."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Error Budgets in SLA / SLO / SLI + Error Budgets."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [Google SRE Book — SLOs chapter](https://sre.google/sre-book/service-level-objectives/)
- [Prometheus SLO recording rules](https://prometheus.io/docs/practices/rules/)
- [Datadog SLO Documentation](https://docs.datadoghq.com/service_management/service_level_objectives/)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*