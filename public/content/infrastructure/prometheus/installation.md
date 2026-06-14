# Prometheus — Installation Guide

## Option 1: Docker Compose (Fastest — Recommended for Learning)

```bash
mkdir prometheus-stack && cd prometheus-stack

# prometheus.yml - main configuration
cat > prometheus.yml << 'EOF'
global:
  scrape_interval: 15s
  evaluation_interval: 15s

scrape_configs:
  - job_name: "prometheus"
    static_configs:
      - targets: ["localhost:9090"]

  - job_name: "node-exporter"
    static_configs:
      - targets: ["node-exporter:9100"]
EOF

# docker-compose.yml
cat > docker-compose.yml << 'EOF'
services:
  prometheus:
    image: prom/prometheus:latest
    ports: ["9090:9090"]
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml
      - prometheus-data:/prometheus
    command:
      - --config.file=/etc/prometheus/prometheus.yml
      - --storage.tsdb.retention.time=15d

  node-exporter:
    image: prom/node-exporter:latest
    ports: ["9100:9100"]
    volumes:
      - /proc:/host/proc:ro
      - /sys:/host/sys:ro
    command:
      - --path.procfs=/host/proc
      - --path.sysfs=/host/sys

  grafana:
    image: grafana/grafana:latest
    ports: ["3000:3000"]
    environment:
      GF_SECURITY_ADMIN_PASSWORD: admin123
    volumes:
      - grafana-data:/var/lib/grafana

volumes:
  prometheus-data:
  grafana-data:
EOF

docker compose up -d
```

Access:
- **Prometheus**: http://localhost:9090
- **Grafana**: http://localhost:3000 (admin / admin123)
- **Node Exporter metrics**: http://localhost:9100/metrics

## Option 2: Install on Linux Server

```bash
# Download Prometheus
PROM_VERSION="2.51.0"
curl -LO https://github.com/prometheus/prometheus/releases/download/v${PROM_VERSION}/prometheus-${PROM_VERSION}.linux-amd64.tar.gz
tar xvf prometheus-${PROM_VERSION}.linux-amd64.tar.gz
sudo mv prometheus-${PROM_VERSION}.linux-amd64/prometheus /usr/local/bin/
sudo mv prometheus-${PROM_VERSION}.linux-amd64/promtool /usr/local/bin/

# Create directories and config
sudo mkdir /etc/prometheus /var/lib/prometheus
sudo cp prometheus.yml /etc/prometheus/

# Create systemd service
sudo tee /etc/systemd/system/prometheus.service << 'EOF'
[Unit]
Description=Prometheus
After=network.target

[Service]
User=prometheus
ExecStart=/usr/local/bin/prometheus   --config.file=/etc/prometheus/prometheus.yml   --storage.tsdb.path=/var/lib/prometheus   --storage.tsdb.retention.time=15d   --web.listen-address=0.0.0.0:9090

[Install]
WantedBy=multi-user.target
EOF

sudo useradd -rs /bin/false prometheus
sudo chown -R prometheus /etc/prometheus /var/lib/prometheus
sudo systemctl daemon-reload
sudo systemctl enable --now prometheus
```

## Option 3: Kubernetes with Helm (Production)

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm install prometheus prometheus-community/kube-prometheus-stack   --namespace monitoring --create-namespace   --set grafana.adminPassword=MyPassword   --set prometheus.prometheusSpec.retention=15d

kubectl get pods -n monitoring
kubectl port-forward -n monitoring svc/prometheus-kube-prometheus-prometheus 9090:9090
```

## Verify It's Working

```bash
# Check Prometheus is up
curl http://localhost:9090/-/healthy

# Query the API
curl 'http://localhost:9090/api/v1/query?query=up'

# Run a PromQL query
curl 'http://localhost:9090/api/v1/query?query=node_memory_MemAvailable_bytes'
```

Open http://localhost:9090 → Graph → try query: `up`
Should show value 1 for all your scrape targets.

## Add Grafana Data Source

1. Open Grafana at http://localhost:3000
2. Connections → Data Sources → Add new → Prometheus
3. URL: `http://prometheus:9090` (Docker) or `http://localhost:9090` (bare metal)
4. Save & Test → should say "Successfully queried the Prometheus API"

## Next Steps

Prometheus is scraping metrics. Go to **Fundamentals** to learn PromQL queries and create your first alerts.
