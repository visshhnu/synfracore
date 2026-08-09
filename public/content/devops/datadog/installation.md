# Datadog — Installation Guide

## Create a Datadog Account

1. Go to **datadoghq.com** (or the EU site, **datadoghq.eu**, if data residency requires it — pick the correct one at signup, since accounts aren't portable between them afterward `(needs verification — recheck against current source)`)
2. Sign up for the 14-day free trial (no credit card required at signup)
3. From Organization Settings → API Keys, copy your **API Key** — this identifies which org an Agent reports to
4. From Organization Settings → Application Keys, create an **Application Key** — required for API calls that manage resources (Monitors, SLOs), not just report data

## Install the Agent — Kubernetes (Helm)

This is the standard production deployment path, matching Overview's Module 01 example:

```bash
helm repo add datadog https://helm.datadoghq.com
helm repo update

helm install datadog datadog/datadog \
  --namespace monitoring --create-namespace \
  --set datadog.apiKey=${DD_API_KEY} \
  --set datadog.clusterName=my-cluster \
  --set datadog.logs.enabled=true \
  --set datadog.logs.containerCollectAll=true \
  --set datadog.apm.portEnabled=true \
  --set clusterAgent.enabled=true \
  --set clusterAgent.metricsProvider.enabled=true

# Verify the DaemonSet is running on every node
kubectl get pods -n monitoring -l app=datadog

# Verify the agent inside a specific pod reports healthy
kubectl exec -n monitoring <datadog-agent-pod> -- agent status
```

## Install the Agent — Single Host (Linux)

```bash
DD_API_KEY=${DD_API_KEY} DD_SITE="datadoghq.com" bash -c \
  "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script_agent7.sh)"

# Verify
sudo datadog-agent status
sudo datadog-agent health
```

## Install the Agent — Docker

```bash
docker run -d --name datadog-agent \
  -e DD_API_KEY=${DD_API_KEY} \
  -e DD_SITE="datadoghq.com" \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  -v /proc/:/host/proc/:ro \
  -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro \
  gcr.io/datadoghq/agent:7

docker exec -it datadog-agent agent status
```

## Verify Everything Works

```bash
# 1. Confirm the agent shows up in the Datadog UI
# Infrastructure → Host Map should show the new host/pod within a few minutes

# 2. Confirm log collection (if enabled)
# Logs → Log Explorer should show incoming log lines

# 3. Enable APM on one test service (Kubernetes example)
kubectl patch deployment my-test-service -p \
  '{"spec":{"template":{"metadata":{"labels":{"admission.datadoghq.com/enabled":"true"}}}}}'
kubectl rollout restart deployment my-test-service
# APM → Services should show the instrumented service within a few minutes of traffic
```

## Common Installation Issues

**Agent pod stuck in `CrashLoopBackOff`**
```bash
kubectl logs -n monitoring <datadog-agent-pod>
# Most common cause: invalid or missing API key in the Helm values/secret
```

**Host shows in Infrastructure List but no logs appear**
Confirm `datadog.logs.enabled=true` AND `datadog.logs.containerCollectAll=true` are both set — the first enables the log pipeline, the second is what actually tails every container's stdout/stderr without per-container configuration.

**APM shows the service but zero traces**
This is the exact scenario walked through in Overview's Interview Prep — check that the auto-instrumentation wrapper (`ddtrace-run`, or `require('dd-trace').init()` as the very first line) is actually present in the running process, not just that the Agent itself is healthy. A healthy Agent and flowing host metrics do not guarantee APM instrumentation is active.

**Cluster Agent metrics provider not working for HPA**
```bash
kubectl get pods -n monitoring -l app=datadog-cluster-agent
# Confirm clusterAgent.metricsProvider.enabled=true was set at install time —
# this is a separate flag from basic cluster-agent enablement
```

## What's Installed

After a successful Kubernetes installation:
- **Datadog Agent** — DaemonSet running on every node, collecting host/container metrics and logs
- **Cluster Agent** — cluster-level metadata aggregation and (if enabled) the external metrics API for HPA
- **APM trace collection** — enabled per-pod via the admission-controller label, not cluster-wide by default

## Next Steps

Go to the **Fundamentals** section to run your first metric queries and build a dashboard.
