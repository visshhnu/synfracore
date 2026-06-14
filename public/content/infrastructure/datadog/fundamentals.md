# Datadog — Fundamentals

## What is Datadog?

Datadog is a cloud monitoring and analytics platform that unifies metrics, logs, and traces into one dashboard. It's the most widely adopted APM (Application Performance Monitoring) tool in enterprise environments.

## Core Pillars

**Infrastructure Monitoring** — CPU, memory, disk, network for every host, container, and cloud service

**APM (Application Performance Monitoring)** — Distributed tracing, service maps, error tracking

**Log Management** — Centralized logging with search, parsing, and alerting

**Synthetics** — Proactive monitoring by simulating user actions (API tests, browser tests)

**RUM (Real User Monitoring)** — Actual user experience data from browsers/mobile

## Install the Datadog Agent

```bash
# Linux (Ubuntu/Debian)
DD_API_KEY="your-api-key" DD_SITE="datadoghq.com" bash -c "$(curl -L https://install.datadoghq.com/scripts/install_script_agent7.sh)"

# Verify agent is running
sudo systemctl status datadog-agent
sudo datadog-agent status
sudo datadog-agent check disk

# Docker
docker run -d --name dd-agent \
  -e DD_API_KEY=your-api-key \
  -e DD_SITE=datadoghq.com \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  -v /proc/:/host/proc/:ro \
  -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro \
  gcr.io/datadoghq/agent:7

# Kubernetes (via Helm)
helm repo add datadog https://helm.datadoghq.com
helm install datadog-agent datadog/datadog \
  --set datadog.apiKey=your-api-key \
  --set datadog.site=datadoghq.com \
  --set datadog.apm.portEnabled=true \
  --set datadog.logs.enabled=true \
  --set datadog.logs.containerCollectAll=true
```

## Key Concepts

**Tags** — Key:value labels attached to metrics/logs (`env:prod`, `service:api`, `region:ap-south-1`). Critical for filtering and grouping in dashboards.

**Agent** — Lightweight daemon running on each host, collecting metrics every 15 seconds, forwarding to Datadog.

**Integrations** — 600+ built-in integrations (AWS, Kubernetes, PostgreSQL, Nginx, Redis, etc.) — just enable and configure.

**Dashboards** — Drag-and-drop widgets (timeseries, query values, heatmaps, logs).

## First Steps After Install
1. Add tags in `/etc/datadog-agent/datadog.yaml`: `tags: [env:prod, team:platform]`
2. Enable the integrations you need (e.g., Postgres, Nginx)
3. Create your first dashboard
4. Set up a monitor (alert) on CPU or disk
