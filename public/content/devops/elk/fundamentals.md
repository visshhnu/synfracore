# ELK Stack — Fundamentals

## The problem centralized logging actually solves

With one server, `tail -f app.log` is a perfectly reasonable way to debug an error. With 50 pods spread across a Kubernetes cluster, that approach breaks down completely — an error happened somewhere, but which pod, which node, at what exact time, and what else was happening around it in other services at that same moment? Centralized logging exists specifically to answer that: every service ships its logs to one searchable store, so debugging a distributed system means one search across everything, not SSH-ing into 50 machines one at a time hoping to find the right one.

## The three components, and what each one actually does

| Component | Role | Rough analogy |
|---|---|---|
| Elasticsearch | Stores logs as indexed JSON documents, provides fast full-text search | The database, purpose-built for search |
| Logstash | Collects logs, parses/transforms them, routes them to a destination | The ETL pipeline |
| Kibana | Web UI for searching logs, building dashboards, configuring alerts | The dashboard layer — Grafana's equivalent, but for logs rather than metrics |

**Filebeat** is a fourth piece worth knowing from day one, even though it's not in the "ELK" name: a lightweight log shipper (a few MB, versus Logstash's several hundred) that runs as a DaemonSet on every Kubernetes node, tails container log files, and forwards them onward — either directly to Elasticsearch for simple cases, or to Logstash first when the logs need real parsing/enrichment. Most production setups use Filebeat for collection and reserve Logstash specifically for the transformation work Filebeat alone can't do.

## Getting logs in: the basic pipeline

```yaml
# filebeat.yml — the minimal setup for shipping Kubernetes pod logs
filebeat.inputs:
  - type: container
    paths:
      - /var/log/containers/*.log
    processors:
      - add_kubernetes_metadata:
          host: ${NODE_NAME}
          matchers:
            - logs_path:
                logs_path: "/var/log/containers/"

output.elasticsearch:
  hosts: ["elasticsearch:9200"]
  username: "elastic"
  password: "${ELASTIC_PASSWORD}"
```
This is the entire mechanism for the common case: Filebeat watches the standard container log path, automatically attaches Kubernetes metadata (pod name, namespace, labels) to each log line so it's filterable later, and ships directly to Elasticsearch — no separate Logstash pipeline needed unless the raw log text itself needs parsing into structured fields first.

## When you actually need Logstash instead of shipping directly

Direct Filebeat → Elasticsearch works well when logs are already structured (a service emitting JSON log lines). It stops being sufficient the moment logs are unstructured free text that needs to become searchable fields — a raw Nginx access log line, for instance, is just one long string until something parses `client_ip`, `status`, and `response_time` out of it into separate, individually-searchable fields. That parsing step (via Logstash's `grok` filter, which matches a line against a regex-based pattern) is Logstash's actual reason for existing in a modern pipeline: everything Filebeat can already do on its own, you don't need Logstash for.

## Elasticsearch: what "indexing" a log actually means

Every log entry becomes a JSON document, and every field within it (`level`, `service`, `message`, `status`) gets analyzed and added to an inverted index — a structure mapping each distinct term back to every document containing it, which is what makes full-text search across millions of log lines return in milliseconds instead of scanning every line sequentially. Documents are grouped into **indices** (typically one per day, e.g. `app-logs-2026.07.11`), and each index is split into **shards** distributed across the cluster — this is both how Elasticsearch scales beyond a single machine and the reason cluster health has three states worth knowing immediately: **Green** (every shard, primary and replica, is assigned and healthy), **Yellow** (primaries are fine but a replica isn't assigned — common and low-risk on a single-node dev cluster), **Red** (a primary shard itself is unassigned — that data is genuinely unavailable right now and needs immediate attention).

## Kibana: the basic workflow

Kibana's **Discover** view is the starting point for essentially all log investigation — a live, filterable view over raw log documents, searched using KQL (Kibana Query Language), which is deliberately simpler than Elasticsearch's underlying JSON query syntax:

```
level: ERROR AND service: "payment-api"
status: 500
message: "OutOfMemory*"
```
The practical habit worth building early: validate a search query in Discover until it reliably surfaces exactly the events you're after, *then* save it as the basis for a dashboard panel — building a visualization directly, without first confirming the underlying query is actually correct in Discover, is a common way to end up with a dashboard that looks fine but is quietly filtering on the wrong thing.

## Why this stack isn't free, and what to plan for early

Elasticsearch's full-text indexing is powerful but genuinely expensive — every field of every log line gets tokenized and indexed, which is a real, ongoing storage and compute cost that scales directly with log volume. Two habits keep this manageable from the start rather than becoming a crisis later: mark fields you only ever need for exact-match filtering (not full-text search) as `keyword` type instead of the default analyzed text, and set up an Index Lifecycle Management (ILM) policy from day one so old indices automatically age out to cheaper storage and eventually delete, rather than accumulating on the most expensive tier indefinitely (ILM specifics are covered on the Intermediate tab). Skipping ILM is the single most common reason a healthy ELK deployment turns into a full-disk incident months later — not a hypothetical, a routine operational failure mode worth designing against from the first deployment.
