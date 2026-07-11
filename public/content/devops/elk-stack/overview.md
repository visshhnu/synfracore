# ELK Stack — Overview

## What ELK actually is

ELK is three tools working together for centralized log management: **Elasticsearch** stores and indexes logs for fast search, **Logstash** collects and parses logs before they're indexed, and **Kibana** provides the UI for searching, visualizing, and building dashboards over what's indexed. **Beats** (Filebeat for logs, Metricbeat for metrics) are lightweight shippers installed on source servers, forwarding data to Logstash or directly to Elasticsearch.

## Why centralize logs at all

Without centralized logging, debugging a distributed system means SSHing into each individual server to grep its local log files — genuinely unworkable once you have more than a handful of services or servers. Centralized logging (ELK, or an alternative like Loki) makes cross-service correlation possible: seeing a request's full path through multiple services in one search, rather than manually reconstructing it from separate machines' logs.

## The Logstash pipeline model

Logstash processes data in three stages: **Input** (where logs come from — a file, a Beats agent, a message queue), **Filter** (parse and enrich — extracting structured fields from unstructured log lines), **Output** (where processed data goes — typically Elasticsearch). **Grok** patterns use regex to parse unstructured log lines into named fields:

```
filter {
  grok {
    match => { "message" => "%{IP:client_ip} - - \[%{HTTPDATE:timestamp}\] \"%{WORD:method} %{URIPATHPARAM:path}\" %{NUMBER:status}" }
  }
}
```

Grok patterns are genuinely fiddly to write correctly by hand — testing them against real sample log lines before deploying (rather than trusting a pattern that merely "looks right") is standard, necessary practice, not excessive caution.

## Index Lifecycle Management: controlling storage cost

Elasticsearch storage cost grows directly with how much data you keep and how long. ILM automates moving older indices through progressively cheaper storage tiers (hot → warm → cold) and eventually deleting them entirely past a retention threshold — without ILM, an Elasticsearch cluster's storage (and cost) grows unbounded, since nothing removes old data automatically by default.

## ELK vs. Loki vs. Splunk — a real, practical decision

- **ELK**: full-text search and indexing of complete log content, powerful for complex queries and correlation. Cost: expensive storage (indexes every word) and real operational complexity (cluster sizing, shard management).
- **Loki** (paired with Grafana): indexes only labels (service, namespace, pod), not full log content — dramatically cheaper storage, purpose-built for Kubernetes-native teams already using Prometheus + Grafana. Content search is slower since it isn't pre-indexed, but for teams whose primary need is "show me logs for this specific service/pod," that tradeoff is usually worth it.
- **Splunk**: enterprise-grade, strong compliance/SIEM features, dedicated support — and priced accordingly. Makes sense when compliance/audit requirements and budget both support it; overkill for a team that just needs application log search.

The practical default: Loki for Kubernetes-native teams already in the Grafana ecosystem prioritizing cost efficiency; ELK when you need genuinely powerful full-text search and analytics capability that justifies its higher operational cost; Splunk when enterprise compliance requirements are the actual driving constraint, not a preference.

## Beats: lightweight collection at the source

Rather than running a heavyweight collector on every server, Beats are purpose-built, lightweight shippers — Filebeat tails log files and forwards them, Metricbeat collects system/service metrics. This lets the heavier processing (Logstash's parsing/enrichment) happen centrally, on dedicated infrastructure, rather than burdening every individual application server with it.
