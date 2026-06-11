# Prometheus — Interview Questions

**What is the difference between rate() and irate()?**
`rate()` calculates the per-second average rate over the entire time window. `irate()` uses only the last two data points for an instantaneous rate — it reacts to spikes faster. Use `rate()` for alerting (more stable, less noise), use `irate()` in dashboards where you want to see real-time spikes. For 5-minute windows or longer, the difference is minor. `rate()` handles counter resets (on restart) correctly by detecting them.

**How does Prometheus handle high cardinality?**
Cardinality is the number of unique label combinations. High cardinality (millions of unique series) causes memory exhaustion. Never use user IDs, IP addresses, request IDs, or UUIDs as label values — these create one series per unique value. Labels should have bounded, low-cardinality values (status codes, methods, endpoints). If you need user-level metrics, use logging or tracing, not Prometheus metrics.

**What is the pull vs push model?**
Prometheus pulls (scrapes) metrics from targets at regular intervals. Most monitoring systems push. Pull model advantages: Prometheus controls the rate, easier to detect when a target goes down (no scrapes = target unhealthy), simpler network model. Pushgateway exists for short-lived jobs that finish before Prometheus scrapes them — but it's an exception, not the default pattern.

**Explain the Recording Rule use case.**
Recording rules pre-compute expensive PromQL expressions and store results as new metrics. Without recording rules, complex queries run on every dashboard load, putting load on Prometheus. With recording rules, the expression runs on the evaluation interval (e.g. every 15s) and results are stored. Dashboards then query the pre-computed metric — fast and cheap. Essential for federation and long-term storage queries.

```yaml
# Recording rule example
- record: job:http_requests:rate5m
  expr: sum(rate(http_requests_total[5m])) by (job)
# Dashboard queries job:http_requests:rate5m instead of the full expression
```
