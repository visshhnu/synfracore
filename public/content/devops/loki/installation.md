# Loki + OpenTelemetry — Installation Guide

## Install Loki + Grafana + Promtail — Kubernetes (Fastest Path)

Matching Intermediate's `loki-stack` bundle — this is the right starting point for evaluation or a smaller deployment:

```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

helm install loki grafana/loki-stack \
  --namespace logging --create-namespace \
  --set grafana.enabled=true \
  --set promtail.enabled=true \
  --set loki.persistence.enabled=true \
  --set loki.persistence.size=10Gi

# Verify all three components are running
kubectl get pods -n logging
```

## Access Grafana and Add Loki as a Data Source

```bash
# Get the auto-generated Grafana admin password
kubectl get secret --namespace logging loki-grafana \
  -o jsonpath="{.data.admin-password}" | base64 --decode

# Port-forward to reach Grafana locally
kubectl port-forward -n logging svc/loki-grafana 3000:80
```

If `grafana.enabled=true` was set at install time, Loki is pre-wired as a data source automatically — otherwise add it manually: Configuration → Data Sources → Loki, URL `http://loki:3100`.

## Install Promtail Standalone (Existing Grafana/Loki Setup)

For a cluster where Grafana and Loki already exist separately and only the log-shipping agent needs adding:

```bash
helm install promtail grafana/promtail \
  --namespace logging \
  --set "config.clients[0].url=http://loki.logging.svc.cluster.local:3100/loki/api/v1/push"

kubectl get pods -n logging -l app.kubernetes.io/name=promtail
```

## Install Loki — Docker Compose (Local Development)

```yaml
# docker-compose.yml
version: "3.8"
services:
  loki:
    image: grafana/loki:latest
    ports: ["3100:3100"]
    command: -config.file=/etc/loki/local-config.yaml

  promtail:
    image: grafana/promtail:latest
    volumes:
      - /var/log:/var/log
    command: -config.file=/etc/promtail/config.yml

  grafana:
    image: grafana/grafana:latest
    ports: ["3000:3000"]
```

```bash
docker compose up -d
curl http://localhost:3100/ready    # Should return "ready"
```

## Verify Everything Works

```bash
# 1. Confirm Loki is accepting queries
curl -s "http://localhost:3100/loki/api/v1/labels" | jq

# 2. Confirm Kubernetes pod logs are flowing with labels attached
# In Grafana Explore, select the Loki data source and run:
# {namespace="default"}

# 3. Confirm the LogQL pipeline works end to end
# {namespace="default"} |= "error" | json
```

## Common Installation Issues

**Promtail pods running but no logs appear in Grafana**
```bash
kubectl logs -n logging <promtail-pod>
# Most common cause: the clients[0].url in Promtail's config doesn't match
# Loki's actual in-cluster service address
```

**"context deadline exceeded" errors on ingestion**
Check `limits_config.ingestion_rate_mb` in the Loki config (covered in Intermediate) — a burst of logs above the configured sustained rate gets rejected, not queued, by design.

**Loki pod won't start — persistence volume issues**
```bash
kubectl get pvc -n logging
# If loki.persistence.enabled=true was set, confirm the cluster's default
# StorageClass can actually satisfy the requested PVC
```

**Grafana shows the Loki data source but queries return nothing**
Confirm the label selector in the query actually matches labels Promtail is attaching — `kubectl logs -n logging <promtail-pod> | grep "Adding target"` shows exactly what labels a given target is being scraped with.

## What's Installed

After a successful `loki-stack` installation:
- **Loki** — the log storage and query engine (single-binary mode by default in this chart)
- **Promtail** — the log-shipping agent, running as a DaemonSet, auto-labeling Kubernetes pod logs
- **Grafana** — pre-wired with Loki as a data source, ready for Explore-view querying

## Next Steps

Go to the **Fundamentals** section to run your first LogQL queries.
