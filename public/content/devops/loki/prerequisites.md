# Loki + OpenTelemetry — Prerequisites

## What to Know Before Starting Loki

Loki is specifically approachable if you already know Prometheus — LogQL deliberately mirrors PromQL's structure, and Loki's label-based indexing is the same mental model as Prometheus's label-based metrics, just applied to logs instead of numbers.

## Required (Must Have)

### 1. Prometheus/PromQL Familiarity
```
{app="payment"}                         # Label selector — same syntax family as PromQL
sum(rate({app="payment"}[5m]))          # Same rate()/sum() aggregation pattern
```
If you haven't been through this site's Prometheus section yet, do that first — Loki's Learning Modules assume you already understand labels, streams (Loki's equivalent of a metric series), and the rate/aggregation mental model, and build on it rather than re-teaching it.

### 2. Basic Grafana Navigation
Loki is Grafana's native log backend — you'll be exploring logs inside Grafana's Explore view, not a separate standalone Loki UI:
- Adding a data source
- Using the Explore tab to run ad hoc queries
- Building a panel from a query result

### 3. Kubernetes Basics (for the Promtail/Agent deployment path)
```bash
kubectl get pods -n logging
helm install / helm upgrade
```
Most production Loki deployments run Promtail (or the newer Grafana Agent/Alloy) as a DaemonSet — the same deployment pattern as Datadog's Agent or Prometheus's node_exporter.

## Nice to Have (Speeds Up Learning)

### ELK/Filebeat Background
If you've used Elasticsearch/Logstash/Kibana before, Overview's framing directly applies: Loki is a deliberately cheaper alternative for high-volume logs specifically because it indexes only labels, not full log content — understanding what ELK does differently makes that tradeoff concrete rather than abstract.

### JSON/logfmt Parsing Familiarity
LogQL's pipeline stages (`| json`, `| logfmt`) assume basic comfort reading structured log formats — you don't need to write a parser, just recognize the shapes.

### YAML Comfort
Promtail's scrape configs and pipeline stages are YAML-based, following the same `kubernetes_sd_configs` pattern as Prometheus's own service discovery — prior Prometheus YAML exposure transfers directly.

## What You Do NOT Need

- Elasticsearch/Lucene query syntax knowledge
- Full-text search engine internals
- Prior Loki or Grafana Cloud experience

## Time Estimate

If you have the prerequisites above (especially Prometheus/PromQL):
- Fundamentals: 1 day
- Intermediate + Advanced: 3-4 days
- Job-ready (comfortable with LogQL, alerting via the Ruler, and the chunk/index storage model): 1-2 weeks

## Start Here

Go to the **Installation** section to deploy Loki and Promtail, then proceed to **Fundamentals**.
