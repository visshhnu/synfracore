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

## Quick Reference — Elk

### Key Points for Revision

- Review the overview section for core architecture and fundamentals
- Practice commands/configurations from the cheatsheet section
- Use interview Q&A for active recall before exams or interviews
- Cross-reference with related tools in the devops academy

### Related Topics

Explore these connected topics to build complete understanding:
- Overview and Architecture
- Fundamentals and Core Concepts
- Advanced Patterns and Production Usage
- Interview Preparation Q&A
- Quick Reference Cheatsheet

### Practice Approach

1. Read the overview to understand *what* and *why*
2. Work through fundamentals for *how*
3. Attempt hands-on labs or configurations
4. Test yourself with interview questions
5. Keep cheatsheet accessible for quick reference during work

### Further Learning

Connect this topic to the broader devops ecosystem. 
Each tool in this academy is designed to work with others —
understanding the integration points is what separates intermediate from senior practitioners.

---

*This section is part of the SynfraCore learning platform. Use the sidebar to navigate to Overview, Fundamentals, Advanced, and Cheatsheet sections for comprehensive coverage of this topic.*

## Summary

This reference section complements the main content. For best results:
- Start with the Overview to understand the big picture
- Work through Fundamentals for core concepts
- Use this section alongside the Cheatsheet for quick recall
- Practice with Interview Q&A to test your understanding

Use the navigation sidebar to move between sections of this topic.
