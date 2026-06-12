# Prometheus — Advanced

## SLO-Based Alerting (Multi-Burn-Rate)

```yaml
# Multi-window, multi-burn-rate alerts (Google SRE Book approach)
# Idea: alert when error budget burns too fast

# For a 99.9% SLO (30min error budget per month = 43.2 min/month)
# 1x burn rate = using budget at normal speed
# 14x burn rate = budget exhausted in ~2 days (page now!)

groups:
  - name: slo-alerts
    rules:
      # Fast burn — page immediately (14x burn rate for 1h)
      - alert: HighErrorBudgetBurn
        expr: |
          (
            job:http_requests_errors:rate1h > (14 * 0.001)
            and
            job:http_requests_errors:rate5m > (14 * 0.001)
          )
        for: 2m
        labels:
          severity: critical
          page: "true"
        annotations:
          summary: "High error budget burn rate on {{ $labels.job }}"
          description: "At current rate, 1-hour budget exhausted in 1h"

      # Slow burn — ticket (6x burn rate for 6h)
      - alert: MediumErrorBudgetBurn
        expr: |
          (
            job:http_requests_errors:rate6h > (6 * 0.001)
            and
            job:http_requests_errors:rate30m > (6 * 0.001)
          )
        for: 15m
        labels:
          severity: warning
          page: "false"
```

## Custom Exporters

```python
# Write a custom exporter in Python
from prometheus_client import start_http_server, Gauge, Counter, Histogram
import time, psutil, requests

# Define metrics
PROCESS_CPU = Gauge('process_cpu_percent', 'CPU usage by process',
                    ['process_name'])
QUEUE_SIZE = Gauge('job_queue_size', 'Current queue depth', ['queue_name'])
API_LATENCY = Histogram('external_api_duration_seconds',
                        'External API call duration',
                        ['api_name', 'method'],
                        buckets=[.005, .01, .025, .05, .1, .25, .5, 1, 2.5])

def collect_process_metrics():
    for proc in psutil.process_iter(['name', 'cpu_percent']):
        PROCESS_CPU.labels(proc.info['name']).set(proc.info['cpu_percent'])

def check_queue(queue_name: str, url: str):
    try:
        resp = requests.get(url, timeout=5)
        QUEUE_SIZE.labels(queue_name).set(resp.json()['depth'])
    except Exception:
        QUEUE_SIZE.labels(queue_name).set(-1)  # -1 = error

def collect():
    while True:
        collect_process_metrics()
        check_queue('orders', 'http://rabbitmq:15672/api/queues/%2F/orders')

        # Track external API latency
        with API_LATENCY.labels('payment-api', 'POST').time():
            requests.post('https://payments.example.com/ping')

        time.sleep(15)

if __name__ == '__main__':
    start_http_server(9100)  # Expose on :9100/metrics
    collect()
```

## Alertmanager Advanced Configuration

```yaml
# alertmanager.yml
global:
  resolve_timeout: 5m
  slack_api_url: $SLACK_WEBHOOK

route:
  group_by: [alertname, cluster, service]
  group_wait: 30s        # Collect alerts before sending
  group_interval: 5m     # Min time between notification groups
  repeat_interval: 12h   # Re-notify if still firing after 12h
  receiver: default

  routes:
    # Critical → PagerDuty
    - match:
        severity: critical
      receiver: pagerduty
      continue: false       # Stop routing once matched

    # Warning → Slack #alerts channel
    - match:
        severity: warning
      receiver: slack-warnings

    # Database alerts → DBA team
    - match_re:
        alertname: "^(Postgres|MySQL|Redis).*"
      receiver: dba-team

inhibit_rules:
  # Suppress warning if critical already firing for same service
  - source_match:
      severity: critical
    target_match:
      severity: warning
    equal: [alertname, cluster, service]

receivers:
  - name: pagerduty
    pagerduty_configs:
      - service_key: $PAGERDUTY_KEY
        severity: '{{ if eq .Labels.severity "critical" }}critical{{ else }}warning{{ end }}'

  - name: slack-warnings
    slack_configs:
      - channel: '#alerts'
        title: '{{ range .Alerts }}{{ .Annotations.summary }}{{ end }}'
        text: |
          {{ range .Alerts }}
          *Alert:* {{ .Labels.alertname }}
          *Severity:* {{ .Labels.severity }}
          *Description:* {{ .Annotations.description }}
          {{ end }}

  - name: dba-team
    email_configs:
      - to: 'dba-team@company.com'
        send_resolved: true
```
