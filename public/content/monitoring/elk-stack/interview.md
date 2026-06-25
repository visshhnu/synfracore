# ELK Stack Interview Questions

**Q: Explain the difference between an index and a shard in Elasticsearch.**
A: An index is a logical namespace for data — like a database. A shard is the physical unit of storage and is an Apache Lucene instance. Elasticsearch distributes shards across nodes for parallelism. A primary shard handles writes; replica shards provide redundancy and scale reads. Rule of thumb: size shards at 10–50 GB; each shard costs ~few MB of heap.

**Q: What is the difference between a filter and a query context in Elasticsearch?**
A: Query context scores documents for relevance (affects `_score`). Filter context is binary yes/no — no scoring. Filters are cached, making them much faster. Best practice: use `filter` for exact matches (term, range, exists) and `must` for full-text search (match). Combining: `bool` with `must` for scoring + `filter` for fast elimination.

**Q: How does Logstash handle backpressure?**
A: By default, Logstash uses an in-memory queue (bounded). When Elasticsearch is slow, the queue fills and Logstash blocks the input plugin. With persistent queues enabled (`queue.type: persisted`), events are written to disk — protecting against data loss during restarts or downstream failures. Size the persistent queue with `queue.max_bytes` appropriate to your ingestion rate × acceptable delay.

**Q: What causes split-brain in an Elasticsearch cluster and how do you prevent it?**
A: Split-brain occurs when two groups of nodes each elect a master simultaneously, leading to data inconsistency. Cause: network partition between nodes. Prevention: set `discovery.zen.minimum_master_nodes` to (N/2)+1, where N = master-eligible nodes. With 3 master-eligible nodes, set to 2. Modern Elasticsearch (7+) uses the Raft-based cluster coordinator — set `cluster.initial_master_nodes` properly during bootstrap and add dedicated master nodes.

**Q: How would you handle a high disk usage alert on Elasticsearch?**
A: Step 1: Check `_cat/indices?v&s=store.size:desc` — identify largest indices. Step 2: Check if ILM policy is running — verify phases executed. Step 3: Force-delete expired indices if ILM stuck. Step 4: Enable forcemerge on warm indices to reclaim space from deleted docs. Step 5: If ongoing, reduce replica count temporarily, add disk, or move to tiered storage. Step 6: Review shard sizes — over-sharding wastes space on Lucene metadata.

**Q: How do you monitor Elasticsearch itself?**
A: Use Metricbeat with the Elasticsearch module — ships all cluster, node, and index stats to Elasticsearch (separate monitoring cluster ideally). Monitor: JVM heap % (alert >85%), search/indexing latency, rejected thread pool tasks (indicates backpressure), disk watermark levels (85%/90%/95%), unassigned shards (cluster goes yellow/red). Kibana Stack Monitoring provides built-in dashboards.

**Q: What's the difference between Filebeat and Logstash? When would you use each?**
A: Filebeat is a lightweight Go binary — low CPU/memory, installed on every host, minimal processing. Logstash is a JVM process with full pipeline processing capabilities — grok, enrichment, conditional routing, multiple outputs. Pattern: Filebeat on hosts for shipping, Logstash for heavy transformation, Elasticsearch for storage. For simple cases, Filebeat can send directly to Elasticsearch using ingest pipelines for light processing. Skip Logstash when transformation is minimal to reduce operational complexity.

**Q: How do you handle a yellow Elasticsearch cluster status?**
A: Yellow = primary shards allocated but one or more replica shards unallocated. Causes: new node not joined yet (wait), insufficient nodes for replicas (add node or reduce replica count), disk watermark reached (free disk space or add storage), node failure (ES will reallocate replicas). Check: `GET /_cluster/allocation/explain` to see why specific shards can't allocate. For single-node dev clusters, set `number_of_replicas: 0`.

**Q: What is Elasticsearch tokenization and why does it matter?**
A: Tokenization is how Elasticsearch breaks text into searchable tokens. The standard analyzer lowercases text and splits on whitespace/punctuation. `analyze API` shows tokenization: `GET /_analyze {"analyzer": "standard", "text": "Hello World"}`. Different analyzers suit different needs: `keyword` — no tokenization, exact match only; `english` — stemming (run=runs=running); `custom` — combine tokenizer + filters. Wrong analyzer causes unexpected search misses.

**Q: How would you migrate from one Elasticsearch version to a major new version?**
A: Use rolling upgrade (minor versions: upgrade nodes one at a time). For major versions: 1) Snapshot current indices to S3. 2) Deploy new cluster version. 3) Reindex data from old to new (breaking mapping changes require reindex). 4) Use cross-cluster replication to sync during migration. 5) Update aliases to point to new cluster. 6) Cut over applications. 7) Verify, then decommission old cluster. Always test on a clone first. Check breaking changes in migration guide for field type changes and removed API endpoints.

**Q: How does Elasticsearch handle write consistency and replication?**
A: A write request goes to the primary shard, which writes to its Lucene index and WAL (translog). The primary then forwards the operation to all replica shards in parallel. Once all in-sync replicas acknowledge (wait_for_active_shards parameter), the client gets success. The translog ensures durability — on crash, replayed before the node rejoins. Refresh makes documents searchable (default 1s interval); fsync flushes translog to disk (default 5s or per request). `wait_for_active_shards=all` gives strongest consistency at the cost of latency.

**Q: What are data streams in Elasticsearch and how do they differ from indices?**
A: Data streams are a managed abstraction over time-series indices. A data stream has: a write index (current active index), backing indices (rolled-over historical indices), and an ILM policy. Documents always write to the write index. When rollover triggers (size/age), a new write index is created automatically. Data streams enforce `@timestamp` field, simplify ILM, and enable seamless index rotation. Unlike manual index-per-day patterns, data streams handle rollover, ILM, and retention automatically. All documents are immutable (delete via delete-by-query).

**Q: How does cross-cluster replication (CCR) work in Elasticsearch?**
A: CCR replicates indices from a leader cluster to follower clusters in near-real time. Use cases: disaster recovery (replica in different region), geo-proximity (serve reads locally), traffic isolation. A follower index continuously polls the leader for new operations and replays them. CCR uses the Elasticsearch Changes API. Setup: configure remote cluster on follower, create follower index pointing to leader index. Supports full replication or filtered replication. Replication lag typically < 1 second on low-latency links.

**Q: What is Elasticsearch's role in the observability stack compared to Loki?**
A: Elasticsearch excels at full-text search with rich query DSL, aggregations, and schema-on-write (defined mappings). It's ideal when you need to search across all log fields instantly, run complex aggregations (top-N by custom fields), or store structured JSON events with varying schemas. Loki is cheaper (schema-on-read, compressed chunks, object storage) and tighter Grafana integration. Choose ELK when: rich field search, compliance logs requiring fast ad-hoc queries, existing ELK infrastructure, or OpenSearch compatibility needed. Choose Loki when: cost is primary concern, already using Grafana/Prometheus, and log access is primarily label-filtered.

**Q: How do you secure an Elasticsearch cluster in production?**
A: Enable TLS on HTTP and transport layers (xpack.security.enabled=true, SSL certs). Enable authentication — built-in users (elastic, kibana_system) with strong passwords, or LDAP/SAML integration. Role-based access: create roles with index-level permissions, assign to users. Enable audit logging for compliance. Network: run ES on private subnet, expose only Kibana publicly via reverse proxy. Use IP filtering for inter-node communication. Encrypt data at rest via OS-level encryption (LUKS) or cloud provider disk encryption. Rotate API keys regularly.

**Q: How do you perform a rolling restart of an Elasticsearch cluster with zero downtime?**
A: 1) Disable shard allocation: `PUT /_cluster/settings {"persistent": {"cluster.routing.allocation.enable": "primaries"}}`. 2) Perform a synced flush: `POST /_flush/synced`. 3) Stop one node, perform maintenance (upgrade, config change), start it, wait for it to rejoin and go green. 4) Re-enable allocation: `PUT /_cluster/settings {"persistent": {"cluster.routing.allocation.enable": null}}`. 5) Wait for cluster to go green again. 6) Repeat for each node. This ensures replicas remain available during each node restart.

**Q: What metrics should you always monitor in production?**
A: The four golden signals: Latency (P50, P95, P99 request duration), Traffic (requests per second), Errors (error rate as % of total requests), Saturation (CPU, memory, disk, connection pool utilization). Add: availability/uptime, queue depth and consumer lag, external dependency health (DB connections, third-party API latency). For infrastructure: disk I/O wait, network drops/retransmits, OOM kills, pod restarts. Key principle: alert on user-visible symptoms (latency, errors) not internal causes (CPU, memory) — unless saturation directly causes symptoms.

**Q: How do you implement effective on-call alerting practices?**
A: Every alert must be actionable — if no action needed, it's not an alert. Set thresholds that reflect real user impact. Use multi-window burn rate alerts for SLO-based oncall. Route by severity: P1 (production down) → immediate page; P2 (degraded) → page within 30m; P3 (warning) → Slack. Each alert must have a runbook link. Maintain an alert inventory — review quarterly, delete stale alerts. Track alert quality metrics: false positive rate, MTTA, alert volume per team. Postmortems should include "were alerts useful?" review.

**Q: Explain the difference between observability and monitoring.**
A: Monitoring = watching known, predefined metrics and alerting on thresholds you define in advance. It answers "is this thing I know about working?" Observability = ability to understand arbitrary internal state of a system from its external outputs (metrics, logs, traces). It answers "what is wrong and why?" — including for failure modes you didn't anticipate. Observable systems emit rich telemetry; monitoring consumes it. You can have monitoring without observability (dashboards but no drill-down) but not the reverse. Modern SRE practice aims for observable systems, not just monitored ones.

**Q: What is Kibana Lens and how does it improve dashboard creation?**
A: Kibana Lens is a drag-and-drop visualization builder that replaced the older Charts and TSVB editors for most use cases. Drag a field to X or Y axis, Lens suggests the appropriate aggregation automatically. Supports: bar, line, area, pie, metric, table, treemap, waffle charts. Formula mode lets you write expressions like `count(kql='level:ERROR') / count()` for computed metrics. Lens generates the Elasticsearch aggregation query automatically, reducing the need to know Elasticsearch aggregation DSL. Export Lens panels to dashboards, share via URL or snapshot. TSVB remains for complex time-series math; Vega for fully custom visualizations.
