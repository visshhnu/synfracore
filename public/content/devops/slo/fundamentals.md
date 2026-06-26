# SLO & Error Budget Complete Guide

Monitoring › SLO
📐**SLO & Error Budget**
BeginnerEngineerProductionArchitectSLI, SLO, SLA — reliability targets, error budgets, burn rate alerts
[SLA/SLO/SLI](#sec-concepts)[Prometheus](#sec-prometheus)[Latency SLOs](#sec-latency)[Error Budget Policy](#sec-policy)[Interview Q&A](#sec-interview)


## 📐 SLA, SLO, SLI — Core Concepts›


#### The most asked senior interview topic in SRE and DevOps

These three terms are related but distinct. Getting them confused in an interview signals you have not worked at the architectural level.


| Term | What it is | Who sets it | Example |
|---|---|---|---|
| SLI — Indicator | The actual measured value | Engineering (what can we measure?) | 99.3% availability this month |
| SLO — Objective | Internal reliability target | Engineering + Product | Must maintain 99.9% availability |
| SLA — Agreement | External customer contract | Business + Legal | We guarantee 99.5% or give credits |


#### Error Budget — the key insight

Error budget = 100% - SLO. It is the amount of unreliability you are **allowed**. It transforms reliability from a vague aspiration into a quantitative resource teams manage consciously.


| SLO | Error Budget/month | Allowed downtime/month |
|---|---|---|
| 99% | 1% | 7.3 hours |
| 99.9% | 0.1% | 43 minutes |
| 99.95% | 0.05% | 21.9 minutes |
| 99.99% | 0.01% | 4.4 minutes |


SLA/SLO/SLI concepts with real numbersCopy

```

```


## 📊 Implementing SLOs in Prometheus›


#### SLOs are not just a concept — implement them in code

Recording rules calculate your SLI continuously. Alerts fire when the burn rate is too high — not when you have already exhausted the budget.


Availability SLO recording rules + burn rate alertsCopy

```

```


## ⏱️ Latency SLOs›


Latency SLO — P99 budget + Grafana panelsCopy

```

```


## 📋 Error Budget Policy›


#### How error budgets change team behaviour

Without error budget policy: reliability is a vague concern, feature pressure always wins. With error budget policy: reliability has a measurable impact on feature delivery — teams automatically balance both.


Error budget policy + multi-burn-rate alertingCopy

```

```


## 🎯 Interview Questions›


All
Architect
Engineer
Production


SLO · ENGINEER
Explain SLA, SLO, and SLI. Give a concrete example of each.
SLI is the actual measurement — a number you can query from monitoring. Examples: availability (percentage of successful HTTP requests in a time period), latency (P99 request duration), error rate (percentage of 5xx responses). SLO is your internal reliability target — what the engineering team commits to maintaining. Always stricter than the SLA to give a buffer. Example: availability SLO of 99.9% means the team alerts and acts if availability drops below 99.9% — that is 43 minutes of downtime allowed per month. SLA is the external customer contract with commercial consequences. Example: availability SLA of 99.5% means if a customer experiences more than 3.6 hours of downtime in a month, they receive service credits. The key relationships: SLI is what you measure. SLO is what you aim for (internal). SL
