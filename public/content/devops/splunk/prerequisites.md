# Splunk — Prerequisites

## What to Know Before Starting Splunk

Splunk predates the modern observability stack and has its own distinct query language (SPL) and architecture — prior Prometheus/ELK/Datadog experience helps conceptually but doesn't transfer syntax the way it does between those tools.

## Required (Must Have)

### 1. Command-Line Comfort (Any Unix Shell)
Fundamentals' own framing is the fastest way to get SPL to click: it's the same mental model as a Unix pipeline (`grep | sort | uniq -c`), applied to log data instead of files.
```bash
grep, sort, uniq -c, awk    # If these are familiar, SPL's pipe-based
                              # structure will feel immediately recognizable
```

### 2. Basic Understanding of Logs and Events
- What a log line/event is, and that different systems produce wildly different formats
- The concept of a timestamp-ordered stream of events
- Basic familiarity with JSON and key-value (logfmt-style) log formats

### 3. General Networking Basics
- What a port is, what `http://<host>:8000` means
- Client/server request-response concept (needed to understand the forwarder → indexer → search head data flow in Overview's architecture)

## Nice to Have (Speeds Up Learning)

### Prior SIEM or Security Operations Exposure
Splunk remains particularly entrenched in security teams — if you have any SOC, incident-response, or security-monitoring background, Advanced's coverage of Splunk Enterprise Security (correlation searches, Notable Events, CIM) will connect to real concepts you already understand, not abstract new ones.

### Regex Familiarity
SPL's `rex` command (field extraction from unstructured text, covered in Fundamentals) is regex-based — comfort reading and writing basic regex patterns speeds this up significantly, though it's learnable within the guide without prior exposure.

### Experience With Any Other Log/Observability Tool
If you know Prometheus, ELK, or Datadog, the *concepts* (indexing, querying, alerting, dashboards) transfer — the specific syntax and architecture do not. Treat this as a genuinely new tool to learn, not a syntax-mapping exercise the way Datadog's guide frames itself relative to Prometheus.

## What You Do NOT Need

- Prior Splunk account, trial, or certification
- SQL knowledge (SPL is its own language, not SQL-derived)
- Distributed-systems administration experience — Fundamentals starts with a single-instance evaluation install before Advanced introduces indexer clustering

## Time Estimate

If you have the prerequisites above:
- Fundamentals: 2-3 days
- Intermediate + Advanced: 1-2 weeks
- Job-ready (comfortable with SPL, alerting, and at least conversant in Enterprise Security concepts): 3-4 weeks

## Start Here

Go to the **Installation** section to set up a single-instance Splunk evaluation environment, then proceed to **Fundamentals**.
