# Datadog — FAQ

## Do I need to already know Prometheus/Grafana/ELK to learn Datadog?

No, but this guide's own framing (Module 04) is built around that mapping specifically because it's the fastest on-ramp if you do — the underlying observability concepts (metrics, logs, traces, alerting, dashboards) are identical across all these tools, only the syntax and UI differ. If you're learning Datadog as your first observability tool entirely, the Fundamentals and Intermediate modules stand on their own without assuming that prior knowledge — the mapping module is a shortcut for people who already have it, not a prerequisite.

## Why does my newly instrumented service show up in the Infrastructure List but have zero APM traces?

This is directly addressed in Troubleshooting: host metrics and APM instrumentation are separate mechanisms. A healthy Agent guarantees the former, not the latter. Check that the auto-instrumentation wrapper (`ddtrace-run`, or `require('dd-trace').init()` as the literal first line for Node) is actually present in the running process — a common real cause is this getting dropped during a Dockerfile refactor.

## Is Datadog just an expensive version of Prometheus+Grafana+ELK, or does it do something those can't?

Neither framing is quite right. The underlying capabilities largely overlap — Datadog isn't doing something fundamentally impossible with open-source tooling. What it adds is a managed, unified platform: one Agent instead of three separate collectors, built-in cross-signal correlation (metric spike → logs → trace, one click), and zero operational overhead for storage/HA/scaling. Whether that's worth the per-host/per-GB cost depends on team size and existing expertise — this guide's own Interview Prep frames it explicitly as a total-cost-of-ownership decision, not a capability gap.

## Why does `DD_TRACE_SAMPLE_RATE` matter if I want complete trace visibility?

Because capturing 100% of traces (the default) gets expensive fast at real production volume, and a sampled trace set still catches the P99 outliers that matter most for debugging — sampling doesn't mean losing visibility into the problems you actually need to see, it means not paying to store every single normal, uninteresting request in full detail. This is one of the concrete cost levers this guide's Troubleshooting and Interview Prep material both cover.

## What's actually different between a Monitor's notification and a Downtime?

A Monitor with a notification rule alerts when its condition is true — this is the active detection mechanism. A Downtime is a deliberate, scheduled suppression of alerts (during planned maintenance, for instance) so a known, expected condition doesn't generate noise. They're not alternatives to each other; a Downtime silences Monitors temporarily, it doesn't replace having them.

## Should every custom metric get its own dashboard panel and alert, since we're already collecting it?

No — this is a real, common way both dashboard clutter and alert fatigue build up over time. A metric being worth *collecting* is a different bar than a metric being worth *displaying prominently*, which is again different from being worth *paging someone about*. Reserve Monitors for symptoms that directly, actionably affect users or system health; dashboards can reasonably show more detail than the alerting system pages on.

## Why does this guide recommend a meta-monitor on the Agent's own health?

Because an Agent failure is silent from the application's perspective by design — the Agent observes without being in the request path, so its own failure has zero user-facing symptom. This guide's Troubleshooting scenario describes exactly this: an Agent `CrashLoopBackOff` on a subset of nodes going unnoticed for hours. A Monitor on `datadog.agent.up` is the direct, deliberate fix — the monitoring system alerting on itself, not just on what it watches.

## Is self-hosted Prometheus/Grafana/ELK always cheaper than Datadog in the long run?

Not necessarily, once real operational cost is counted, not just license price. Prometheus+Grafana+ELK has no licensing cost, but the team owns storage sizing, HA design, and Alertmanager routing — genuine engineering time that has its own real cost, especially without dedicated SRE headcount. Datadog's cost is visible and per-host/per-GB, but collapses that operational burden into a managed platform. This guide frames the decision explicitly as total cost of ownership, not sticker price — the honest answer depends on team size and existing expertise, not a universal rule.
