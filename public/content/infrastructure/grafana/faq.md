# Grafana — FAQ

## Do I need Prometheus to use Grafana, or are they the same thing?

They're separate products that are commonly used together, but neither requires the other. Grafana is purely a visualization/alerting layer with no storage of its own — it can query Prometheus, but equally Loki, Elasticsearch, PostgreSQL, CloudWatch, or 100+ other sources. Prometheus has its own built-in expression browser and can be used without Grafana at all for basic querying. They're commonly paired because Prometheus is excellent at collecting and storing metrics while Grafana is excellent at visualizing and alerting on data from many sources at once — but "Grafana" and "the Prometheus/Grafana stack" aren't synonyms.

## Why does my dashboard look completely different after I imported a community dashboard by ID?

Community dashboards are frequently built assuming specific metric names, label names, and a specific scrape configuration (commonly `kube-state-metrics` + `node-exporter` + `cAdvisor` for Kubernetes dashboards) — if your actual Prometheus setup doesn't expose metrics under those exact names, panels will show "No data" or broken visualizations even though the import itself succeeded without error. This is exactly why picking a data source during import matters, but it doesn't fix a mismatch in the underlying metric/label names the dashboard's queries assume — check the dashboard's own documentation on grafana.com for its specific requirements before assuming it'll "just work" against any Prometheus setup.

## Is it bad practice to let people edit dashboards directly in the Grafana UI if we're also managing dashboards as code?

It creates a real, specific problem: config drift — a manual UI edit isn't reflected in the Git-stored JSON, so the next time the dashboard gets re-provisioned from Git (a redeploy, a config sync), the manual UI change silently gets overwritten and lost, often without anyone immediately noticing. The common fix isn't necessarily banning UI edits entirely (sometimes quick, exploratory panel tweaks are genuinely useful) — it's having a clear convention (UI edits are for prototyping/Explore-style investigation; anything meant to persist gets exported back to the JSON file and committed) rather than letting the two paths silently diverge.

## Why do people say to avoid high-cardinality labels on metrics, when adding more labels seems like it would just give more detail?

Because each unique combination of label values creates an entirely separate stored time series in Prometheus, and both storage and query performance scale with total series count — a label with unbounded or very large cardinality (a user ID, a raw IP, a full request path with query parameters) can multiply your total series count dramatically, degrading query performance across *every* dashboard querying that metric, not just the one panel that added the label. More detail is genuinely useful, but the right place for high-cardinality, per-request detail is usually logs (Loki) or traces (Tempo), correlated back to metrics via exemplars — not metric labels themselves.

## What's actually different between Grafana's built-in alerting and using Prometheus's own Alertmanager?

Grafana's unified alerting can evaluate and route alerts from *any* connected data source (Loki log patterns, a SQL query result, CloudWatch metrics), not just Prometheus-compatible ones — which matters if your alerting needs span beyond Prometheus metrics specifically. Prometheus Alertmanager is more mature and is what many existing, Prometheus-only shops already have deeply integrated into their workflow. Neither is strictly "better" — the right choice depends on whether your alerting genuinely needs to span multiple, non-Prometheus data source types in one unified system.

## Why does a panel sometimes show correct-looking data that's actually wrong, without any error message at all?

This is one of the more insidious failure modes in dashboarding generally — a query can be syntactically valid and return data that *looks* plausible while measuring something subtly different from what the panel title claims (a metric rename that silently changed what a query actually captures, an aggregation that averages across the wrong dimension, a rate window mismatched to the actual scrape interval). Grafana has no way to know a query is "conceptually wrong" if it's syntactically valid and returns some data — this is exactly why periodically validating dashboards and alerts against known historical incidents (does this dashboard/alert correctly reflect what we already know happened during a past incident?) matters more than trusting a dashboard just because it renders without error.

## Should every metric on a dashboard have an alert, since we're already tracking it?

Generally no — this is a common way alert fatigue builds up over time. A metric being worth *displaying* (useful context, helps diagnose an issue once something else has already triggered investigation) is a different bar than a metric being worth *paging someone about* (a symptom that directly, actionably affects users and needs a human response right now). This course's own interview material makes this distinction explicitly: alert on symptoms that affect users, not every underlying cause — a dashboard can and should show far more metrics than the alerting system pages on.

## Why does Grafana Explore exist separately from building a dashboard — isn't that redundant?

Explore is specifically designed for ad-hoc, exploratory querying during active investigation (an incident, a "something feels off, let me look around" moment) — it supports split-view (two queries side by side), log context (lines before/after a specific error), and jumping between data sources fluidly, none of which fit the pre-built, curated nature of a saved dashboard. A dashboard is meant to answer known, recurring questions quickly; Explore is meant for the unknown, one-off question you haven't built a dashboard for yet. Building a permanent dashboard panel for every ad-hoc investigative query would be both impractical and would clutter dashboards meant to stay focused on known, recurring signals.

## Is a dashboard with 40 panels on one page better than several smaller, focused dashboards?

Generally not — a single overloaded dashboard makes it harder to find the specific panel that matters during an actual incident, and it's also a real performance cost, since every panel on a dashboard queries its data source when the dashboard loads or refreshes. The more effective pattern is usually a small, focused "Key Metrics" overview dashboard (the handful of golden-signal panels that matter most, checked first) linked out to more detailed, drill-down dashboards for specific subsystems — rather than one dashboard trying to show everything at once.

## Why does this course emphasize that Grafana itself needs to be highly available, when it "just" shows dashboards?

Because during a real incident, Grafana (and whatever it queries) is often the primary tool a response team uses to understand what's actually happening — if it goes down at the same time as the infrastructure it monitors (a genuinely common pattern when observability tooling shares failure domains with production), the team loses visibility at exactly the moment they need it most. This is covered in more depth in this course's own Real World Scenarios material — treating observability infrastructure's own resilience as an afterthought is a well-documented, recurring gap in real incident postmortems, not a hypothetical concern.
