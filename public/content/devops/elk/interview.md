# ELK Stack Interview Q&A

**Q: Elasticsearch vs OpenSearch?**
OpenSearch is the AWS-maintained open-source fork of Elasticsearch (created after Elastic changed license to non-open-source in 2021). Same API, same query syntax, different licence. Most cloud providers use OpenSearch now. If asked in interview: "We use ELK — OpenSearch is the open-source equivalent I can work with."

**Q: How does Elasticsearch indexing work?**
Documents → shards (primary + replicas) → Lucene indexes. Default: 1 primary shard, 1 replica. Indexing: document → analyzed (tokenized, lowercased, filtered) → inverted index. Search: query → analyzed same way → match in inverted index → relevance scored (BM25 by default).

**Q: Kibana Lens vs Discover vs Visualize?**
- Discover: explore raw documents, filter, view fields
- Lens: drag-and-drop chart building (recommended)
- Visualize: older chart builder (legacy)
- Dashboard: combine multiple visualizations
- Canvas: pixel-perfect presentation dashboards

**Q: How do you handle log retention?**
ILM (Index Lifecycle Management): Hot phase (fast SSD, recent data) → Warm phase (slower storage, 7d) → Cold phase (object storage, 30d) → Delete phase. Define in Kibana → Stack Management → Index Lifecycle Policies.

**Q: Logstash vs Filebeat vs Fluentd?**
Filebeat: lightweight, runs on every host, forwards logs with minimal processing.
Logstash: heavy processing pipeline (parse, enrich, filter) — runs on central servers.
Fluentd: Ruby-based, plugin ecosystem, popular in Kubernetes.
Modern pattern: Filebeat/Fluent Bit (node) → Logstash (central) → Elasticsearch.
