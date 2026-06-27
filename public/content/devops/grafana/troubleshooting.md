# Grafana Troubleshooting Guide

## Issue 1: Dashboard shows "No data" after data source change

**Symptom:** All panels show "No data" after migrating from one Prometheus to another.

**Root Cause:** Old panel queries use specific label values or metric names that don't exist in new data source.

**Debug steps:**
```bash
# Check if the data source connection works at all
# Grafana → Configuration → Data Sources → [source] → Test
# Should show "Data source connected"

# In Grafana Explore, run a broad query first:
{job=~".+"}   # for Prometheus
*             # for Loki
```

**Fix:**
- Update data source URL to new endpoint
- Re-run template variables: Dashboard settings → Variables → Update all
- If metric names changed, use `metric_relabel_configs` in Prometheus to expose old names:
```yaml
metric_relabel_configs:
  - source_labels: [__name__]
    regex: 'old_metric_name'
    target_label: '__name__'
    replacement: 'new_metric_name'
```

---

## Issue 2: Grafana panels load very slowly or time out

**Symptom:** Panels show "Loading..." for minutes. Some timeout completely.

**Root Cause:** Expensive PromQL queries, high cardinality, or Prometheus under load.

**Debug steps:**
```bash
# Check query execution time in Prometheus
curl 'http://prometheus:9090/api/v1/query?query=<your-query>' -w "%{time_total}"

# Profile the query
curl 'http://prometheus:9090/api/v1/query_range?query=<your-query>&start=...&end=...&step=60'
```

**Fix:**
```promql
# Slow: scans all time series
sum(rate(http_requests_total[5m]))

# Fast: pre-filter with labels before aggregation
sum(rate(http_requests_total{environment="production"}[5m])) by (service)

# Use recording rules for frequently-used expensive queries
groups:
  - name: recording_rules
    rules:
      - record: job:http_requests_total:rate5m
        expr: sum(rate(http_requests_total[5m])) by (job)
```

---

## Issue 3: Alert not sending to notification channel

**Symptom:** Alert state changes to Firing in Grafana but Slack/PagerDuty receives nothing.

**Debug steps:**
```bash
# Check alert history in Grafana UI
# Alerting → Alert rules → [rule] → Alert instances

# Test notification channel directly
# Alerting → Contact points → [point] → Test

# Check Grafana logs
kubectl logs grafana-pod -n monitoring | grep -i "alert\|notification" | tail -20
```

**Fix:**
- For Grafana Unified Alerting (v8+): Check Notification Policies route matches alert labels
- For Legacy alerting: Settings → Notification channels → re-test
- Common Slack issue: webhook URL expired — regenerate at api.slack.com/apps

---

## Issue 4: User can't log in — SSO/LDAP issues

**Symptom:** `Login Failed` for SSO users. Local admin login works.

**Debug steps:**
```bash
# Enable debug logging
kubectl set env deployment/grafana -n monitoring GF_LOG_LEVEL=debug

# Check logs after login attempt
kubectl logs grafana-pod -n monitoring | grep -i "oauth\|ldap\|auth" | tail -20
```

**Fix in grafana.ini:**
```ini
[auth.generic_oauth]
enabled = true
name = Keycloak
client_id = grafana
client_secret = <secret>
auth_url = https://keycloak/auth/realms/myrealm/protocol/openid-connect/auth
token_url = https://keycloak/auth/realms/myrealm/protocol/openid-connect/token
api_url = https://keycloak/auth/realms/myrealm/protocol/openid-connect/userinfo
scopes = openid profile email groups
role_attribute_path = contains(groups[*], 'grafana-admin') && 'Admin' || 'Viewer'
```

---

## Issue 5: Dashboard variables not filtering panels correctly

**Symptom:** Selecting a value in a dashboard variable doesn't filter all panels.

**Root Cause:** Panels use different label names than the variable, or variable syntax is wrong.

**Fix:**
```promql
# Variable definition (correct):
label_values(http_requests_total, namespace)   # gets all values of 'namespace' label

# Panel query using variable (correct):
rate(http_requests_total{namespace="$namespace"}[5m])

# Multi-value support (when user selects multiple):
rate(http_requests_total{namespace=~"$namespace"}[5m])  # use =~ for regex match

# Variable in panel title:
HTTP Requests — $namespace          # shows selected value in title
```
