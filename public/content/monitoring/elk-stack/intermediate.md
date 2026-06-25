# ELK Stack Intermediate

## Index Lifecycle Management (ILM)

ILM automatically manages index phases: hot → warm → cold → delete.

```bash
# Create ILM policy
curl -X PUT "localhost:9200/_ilm/policy/logs-policy" -H "Content-Type: application/json" -d '
{
  "policy": {
    "phases": {
      "hot": {
        "min_age": "0ms",
        "actions": {
          "rollover": {
            "max_primary_shard_size": "50gb",
            "max_age": "1d"
          },
          "set_priority": {"priority": 100}
        }
      },
      "warm": {
        "min_age": "3d",
        "actions": {
          "shrink": {"number_of_shards": 1},
          "forcemerge": {"max_num_segments": 1},
          "set_priority": {"priority": 50}
        }
      },
      "cold": {
        "min_age": "30d",
        "actions": {
          "freeze": {},
          "set_priority": {"priority": 0}
        }
      },
      "delete": {
        "min_age": "90d",
        "actions": {"delete": {}}
      }
    }
  }
}'
```

## Elasticsearch Aggregations

```json
// Terms aggregation — count by field
GET /logs/_search
{
  "size": 0,
  "aggs": {
    "by_service": {
      "terms": {"field": "service.keyword", "size": 10},
      "aggs": {
        "error_rate": {
          "filter": {"term": {"level.keyword": "ERROR"}}
        },
        "avg_latency": {
          "avg": {"field": "latency_ms"}
        }
      }
    }
  }
}

// Date histogram — events over time
GET /logs/_search
{
  "size": 0,
  "aggs": {
    "errors_per_hour": {
      "date_histogram": {
        "field": "@timestamp",
        "fixed_interval": "1h"
      },
      "aggs": {
        "error_count": {"filter": {"term": {"level.keyword": "ERROR"}}}
      }
    }
  }
}
```

## Logstash Advanced Filters

```
filter {
  # Conditional processing
  if [type] == "java" {
    multiline {
      pattern => "^[[:space:]]"
      what => "previous"
    }
    grok {
      match => {"message" => "%{TIMESTAMP_ISO8601:timestamp} %{LOGLEVEL:level} %{JAVACLASS:class} - %{GREEDYDATA:msg}"}
    }
  }

  # Lookup enrichment
  translate {
    field => "response_code"
    destination => "response_description"
    dictionary => {
      "200" => "OK"
      "404" => "Not Found"
      "500" => "Internal Server Error"
    }
  }

  # Remove sensitive fields
  mutate {
    remove_field => ["password", "credit_card", "ssn"]
  }
}
```

## Kibana Lens and Visualizations

Create dashboards with:
- **Lens**: drag-drop for quick charts
- **TSVB**: time-series with complex formulas
- **Maps**: geo_point field mapping on world map
- **Vega**: custom D3-like visualizations

## Elasticsearch Security

```yaml
# elasticsearch.yml
xpack.security.enabled: true
xpack.security.http.ssl.enabled: true
xpack.security.transport.ssl.enabled: true

# Create users via API
POST /_security/user/log_reader
{
  "password": "strongpassword",
  "roles": ["viewer"],
  "full_name": "Log Reader Service"
}

# Create role with index restrictions
POST /_security/role/app_logs_reader
{
  "indices": [{
    "names": ["app-logs-*"],
    "privileges": ["read", "view_index_metadata"]
  }]
}
```

## Cluster Health Monitoring

```bash
# Check cluster health
curl "localhost:9200/_cluster/health?pretty"

# Node stats
curl "localhost:9200/_nodes/stats/indices,jvm,os?pretty"

# Hot threads (diagnose CPU spike)
curl "localhost:9200/_nodes/hot_threads"

# Pending tasks
curl "localhost:9200/_cluster/pending_tasks"

# Shard allocation
curl "localhost:9200/_cat/shards?v&h=index,shard,prirep,state,node,unassigned.reason"
```

## Beats Ecosystem
| Beat | Purpose |
|------|---------|
| Filebeat | Log files |
| Metricbeat | System/service metrics |
| Packetbeat | Network traffic |
| Heartbeat | Uptime monitoring |
| Auditbeat | Linux audit framework |
| Winlogbeat | Windows event logs |
