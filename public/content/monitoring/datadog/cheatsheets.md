# Datadog Cheatsheet

## Agent Commands
```bash
sudo datadog-agent status           # full agent status
sudo datadog-agent configcheck      # validate config
sudo datadog-agent check <check>    # run specific check
sudo systemctl restart datadog-agent
sudo datadog-agent flare            # collect diagnostics for support
```

## Metric Query Syntax
```
# Basic
avg:system.cpu.user{host:web-01}

# Multi-host rollup
avg:system.cpu.user{env:prod} by {host}

# Arithmetic
(sum:http.requests{status:5xx} / sum:http.requests{*}) * 100

# Time shift comparison (vs. last week)
avg:web.latency{*} - week_before(avg:web.latency{*})

# Anomaly
anomalies(avg:db.query_time{*}, "agile", 2)

# Forecast
forecast(avg:disk.used{device:/dev/sda1}, "linear", 1, interval="60m")
```

## Log Search Syntax
```
service:nginx status:error                    # errors in nginx
@http.status_code:>=500                       # 5xx status
@duration:>1000 service:api                   # slow API calls
host:web-01 -source:healthcheck               # exclude healthchecks
@user.id:12345 @action:(login OR logout)      # user activity
```

## Monitor Thresholds
```yaml
Critical: >90       # page oncall
Warning:  >75       # slack alert
Recovery: <70       # auto-resolve
No data:  10 min    # alert if no metrics
```

## Useful Functions
```
top(avg:metric{*} by {host}, 10, "mean", "desc")  # top 10 hosts
diff(avg:metric{*})                                # rate of change
dt(avg:metric{*})                                  # derivative
ewma_5(avg:metric{*})                              # exponential moving avg
median_5(avg:metric{*})                            # 5-point median
```

## API Quick Reference
```bash
# Get monitors
curl -X GET "https://api.datadoghq.com/api/v1/monitor"   -H "DD-API-KEY: ${DD_API_KEY}"   -H "DD-APPLICATION-KEY: ${DD_APP_KEY}"

# Mute host
curl -X POST "https://api.datadoghq.com/api/v1/host/web-01/mute"   -H "DD-API-KEY: ${DD_API_KEY}" -H "DD-APPLICATION-KEY: ${DD_APP_KEY}"   -d '{"end": 1704153600}'
```

## Tag Best Practices
```
Must-have:  env:prod/staging/dev
            service:api/worker/db
            version:1.2.3
            team:platform/payments

Avoid:      pod_id (too high cardinality)
            request_id (millions of unique values)
            timestamp (unbounded)
```

## DogStatsD Types
| Type | Method | Use Case |
|------|--------|----------|
| Gauge | `statsd.gauge()` | Current value |
| Counter | `statsd.increment()` | Cumulative count |
| Histogram | `statsd.histogram()` | Distribution |
| Timer | `statsd.timing()` | Duration |
| Set | `statsd.set()` | Unique count |
| Distribution | `statsd.distribution()` | Global percentiles |

## Monitor Notification Variables
```
{{host.name}}      - triggering host
{{value}}          - current metric value
{{threshold}}      - configured threshold
{{override_message}} - custom message per condition
@pagerduty        - page oncall
@slack-channel    - notify channel
```
