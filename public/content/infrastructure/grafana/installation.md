# Grafana — Installation Guide

## Option 1: Docker (Fastest)

```bash
docker run -d \
  --name grafana \
  -p 3000:3000 \
  -e GF_SECURITY_ADMIN_PASSWORD=admin123 \
  -v grafana-storage:/var/lib/grafana \
  grafana/grafana:latest

# Open http://localhost:3000
# Login: admin / admin123
```

## Option 2: Docker Compose with Prometheus

```yaml
# docker-compose.yml
services:
  prometheus:
    image: prom/prometheus:latest
    ports: ["9090:9090"]
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml

  grafana:
    image: grafana/grafana:latest
    ports: ["3000:3000"]
    environment:
      GF_SECURITY_ADMIN_PASSWORD: admin123
      GF_USERS_ALLOW_SIGN_UP: "false"
    volumes:
      - grafana-data:/var/lib/grafana
    depends_on: [prometheus]

volumes:
  grafana-data:
```

```bash
docker compose up -d
# Prometheus: http://localhost:9090
# Grafana: http://localhost:3000
```

## Option 3: Install on Ubuntu

```bash
sudo apt-get install -y apt-transport-https software-properties-common
sudo mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | \
  sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null

echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | \
  sudo tee /etc/apt/sources.list.d/grafana.list

sudo apt update && sudo apt install grafana -y
sudo systemctl enable --now grafana-server
sudo systemctl status grafana-server

# Access at http://localhost:3000 (admin/admin on first login)
```

## Option 4: Kubernetes (Helm)

```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

helm install grafana grafana/grafana \
  --namespace monitoring --create-namespace \
  --set adminPassword=MyPassword \
  --set service.type=NodePort

# Get password
kubectl get secret --namespace monitoring grafana \
  -o jsonpath="{.data.admin-password}" | base64 --decode

kubectl port-forward -n monitoring svc/grafana 3000:80
```

## First Steps After Login

### Add Prometheus as a Data Source
1. Connections → Data Sources → Add new data source
2. Choose Prometheus
3. URL: `http://prometheus:9090` (Docker) or `http://localhost:9090`
4. Click **Save & Test** — should say "Successfully queried"

### Import a Dashboard
1. Dashboards → Import
2. Enter ID `1860` (Node Exporter Full — most popular)
3. Select your Prometheus data source
4. Click Import

You now have a full system metrics dashboard.

## Next Steps

Grafana is connected to Prometheus. Go to **Fundamentals** to learn how to build custom dashboards and panels.
