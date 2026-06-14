# ELK Stack — Cheatsheet

```bash
# ── ELASTICSEARCH CLI ─────────────────────────────────────
# Cluster health
curl localhost:9200/_cluster/health?pretty
curl localhost:9200/_cat/nodes?v
curl localhost:9200/_cat/indices?v&s=docs.count:desc

# Index operations
curl -X GET localhost:9200/myindex/_count
curl -X GET localhost:9200/myindex/_mapping
curl -X DELETE localhost:9200/myindex

# Search
curl -X GET localhost:9200/myindex/_search -H 'Content-Type: application/json' -d '{"query":{"match_all":{}},"size":5}'
curl -X GET localhost:9200/myindex/_search -H 'Content-Type: application/json' -d '{"query":{"match":{"message":"error"}}}'

# ── LOGSTASH ─────────────────────────────────────────────
# Test config
logstash -f config.conf --config.test_and_exit

# Pipeline config structure
input  { beats { port => 5044 } }
filter { grok { match => { "message" => "%{COMBINEDAPACHELOG}" } } }
output { elasticsearch { hosts => ["localhost:9200"] index => "logs-%{+YYYY.MM.dd}" } }

# ── FILEBEAT ─────────────────────────────────────────────
filebeat test config        # Validate config
filebeat test output        # Test connection to output
filebeat modules list       # Available modules
filebeat modules enable nginx system

# ── KIBANA ───────────────────────────────────────────────
# KQL (Kibana Query Language)
message: "error"                    # Full-text search
status: 500                         # Exact match
status >= 400 AND status < 500      # Range
@timestamp > "2024-01-15"          # Date filter
NOT status: 200                     # Negation
url.path: /api/*                    # Wildcard

# ── GROK PATTERNS ────────────────────────────────────────
%{IP:client_ip}
%{WORD:method}
%{URIPATHPARAM:request}
%{NUMBER:bytes}
%{NUMBER:response_time}
%{COMBINEDAPACHELOG}                # Full Apache/Nginx access log
%{TIMESTAMP_ISO8601:timestamp}
%{GREEDYDATA:message}               # Match anything

# ── ELASTICSEARCH QUERY DSL ──────────────────────────────
# Bool query
{"query":{"bool":{"must":[{"match":{"status":"error"}}],"filter":[{"range":{"@timestamp":{"gte":"now-1h"}}}]}}}

# Aggregation
{"aggs":{"by_status":{"terms":{"field":"status.keyword"}}},"size":0}

# Top hits
{"aggs":{"top_errors":{"terms":{"field":"service.keyword","size":10},"aggs":{"count":{"value_count":{"field":"_id"}}}}}}
```
