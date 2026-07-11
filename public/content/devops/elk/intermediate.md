# ELK Stack — Intermediate

## Writing Grok patterns that actually hold up

A Grok pattern that works on the sample log lines you tested against can still break on a real production stream, because real logs have more format variation than a handful of samples usually reveal:

```
# A pattern for a common nginx access log format
%{IPORHOST:client_ip} - %{USER:ident} \[%{HTTPDATE:timestamp}\] "%{WORD:method} %{URIPATHPARAM:request} HTTP/%{NUMBER:http_version}" %{NUMBER:status} %{NUMBER:bytes}
```

**Always test against a representative sample of real logs, not just one clean example** — malformed lines, unexpected characters, and format variations between different app versions are common, and a pattern that silently fails to match just drops that line's structured fields (it usually still indexes the raw message, but loses all the parsed fields you were relying on for search/filtering). Use the `_grokparsefailure` tag Logstash adds on a failed match to monitor for this directly, rather than assuming parsing succeeded because nothing errored loudly.

## Index templates and mappings: getting field types right from the start

Elasticsearch infers a field's data type from the first document that contains it — if the first `status` field it sees is a string, every subsequent document's `status` field is treated as a string too, even if later documents send it as a number, causing indexing errors or unusable range queries. An explicit index template, defined before data starts flowing, avoids this entirely:

```json
PUT _index_template/app-logs-template
{
  "index_patterns": ["app-logs-*"],
  "template": {
    "mappings": {
      "properties": {
        "status": { "type": "integer" },
        "response_time_ms": { "type": "float" },
        "timestamp": { "type": "date" }
      }
    }
  }
}
```

## ILM policies: automating the hot → warm → cold → delete lifecycle

```json
PUT _ilm/policy/app-logs-policy
{
  "policy": {
    "phases": {
      "hot": { "actions": { "rollover": { "max_size": "50GB", "max_age": "7d" } } },
      "warm": { "min_age": "7d", "actions": { "shrink": { "number_of_shards": 1 } } },
      "delete": { "min_age": "90d", "actions": { "delete": {} } }
    }
  }
}
```
This is the mechanism that actually controls Elasticsearch's real, ongoing storage cost — indices roll over to a new one on size/age triggers, get moved to cheaper storage tiers as they age, and are deleted entirely past a defined retention window, all without manual intervention. Without an ILM policy, indices accumulate indefinitely on the most expensive storage tier.

## Kibana: from search to dashboard

A dashboard is only as useful as the underlying queries it's built on — start in Kibana's Discover view, refining a search query until it reliably surfaces exactly the events you care about, *then* save that query as the basis for a visualization. Building visualizations directly without first validating the underlying query in Discover is a common way to end up with a dashboard that looks reasonable but is quietly filtering on the wrong thing.

## Common cardinality and cost mistakes

Indexing a field with genuinely unbounded cardinality (raw user IDs, full request URLs including query parameters, session tokens) as a searchable, analyzed field multiplies index size and search cost significantly — the same high-cardinality problem that affects Prometheus (see Prometheus's own cardinality notes) applies here too, for the same underlying reason: every unique value effectively becomes its own indexed entity. Mark genuinely high-cardinality fields as `keyword` type without full-text analysis where you only need exact-match filtering, not full-text search, on them — this alone meaningfully reduces both storage and query cost for fields that don't need full analysis.
