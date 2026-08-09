# FluxCD — Advanced

## Multi-Tenancy at Scale — Sharding and Tenant Bootstrapping

Overview covered the core multi-tenancy mechanism (per-tenant `GitRepository` + scoped `ServiceAccount`). At real scale — dozens of tenants on one cluster — two additional concerns matter. First, **tenant bootstrapping** should itself be GitOps-managed and repeatable, not a manual per-tenant setup: a template that generates a new tenant's `GitRepository`, `ServiceAccount`, `RoleBinding`, and initial `Kustomization` from a single input (tenant name, namespace) keeps onboarding consistent and auditable. Second, **sharding** — Flux supports assigning specific controllers to specific tenant workloads via label-based sharding, so one enormous shared `kustomize-controller` instance isn't reconciling every tenant's resources serially and becoming a bottleneck as tenant count grows:

```yaml
# Sharding: run a dedicated kustomize-controller instance for a
# specific shard of tenants, reducing reconciliation contention
apiVersion: kustomize.toolkit.fluxcd.io/v1
kind: Kustomization
metadata:
  name: team-a-apps
  labels:
    sharding.fluxcd.io/key: shard-1   # routed to the shard-1 controller instance specifically
```

## Monitoring Flux Itself — Prometheus Integration

Flux's controllers expose Prometheus-compatible metrics natively — reconciliation duration, success/failure counts per `Kustomization`, and suspended-resource counts are all queryable the same way any other cluster workload's metrics are, which matters because a GitOps controller silently failing to reconcile is a serious, easy-to-miss blind spot (the cluster looks fine; it's just running increasingly stale config):

```yaml
# ServiceMonitor (Prometheus Operator) scraping Flux controller metrics
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata: { name: flux-system, namespace: flux-system }
spec:
  selector: { matchLabels: { app: source-controller } }
  endpoints: [{ port: http-prom }]
```

```promql
# Alert on Kustomizations that haven't successfully reconciled recently —
# the metric-based equivalent of the notification-controller alert in
# Intermediate, useful when Prometheus is already the standard alerting path
gotk_reconcile_condition{type="Ready", status="False"} == 1
```

## Disaster Recovery — Git as the Actual Source of Truth

The practical DR story for a GitOps-managed cluster is fundamentally different from a traditionally-managed one: since the cluster's entire desired state already lives in Git, recovering from a total cluster loss is largely "provision a new cluster, bootstrap Flux pointing at the same Git repository" — Flux reconciles the new cluster to match Git without needing a separate backup/restore process for application configuration specifically. This doesn't cover *data* (persistent volume contents, database state), which still needs its own backup strategy — but for the configuration and desired-state layer, Git already *is* the backup, continuously, by construction.

```bash
# The actual DR bootstrap for a lost cluster — largely identical to
# initial setup, because that's the point of GitOps
flux bootstrap github \
  --owner=myorg \
  --repository=gitops-fleet \
  --branch=main \
  --path=clusters/production
# Flux then reconciles the new cluster to match the same Git state
# the old cluster was running — no separate config backup needed
```

## Progressive Delivery — Flagger Integration

FluxCD alone does apply-and-reconcile, not gradual traffic shifting — for canary deployments (shift 10% of traffic to a new version, watch metrics, proceed or roll back automatically), Flux integrates with **Flagger**, a separate CNCF project that automates the canary process itself, driven by the same GitOps loop:

```yaml
apiVersion: flagger.app/v1beta1
kind: Canary
metadata: { name: payment-service }
spec:
  targetRef: { apiVersion: apps/v1, kind: Deployment, name: payment-service }
  analysis:
    interval: 1m
    threshold: 5              # max consecutive failed checks before rollback
    stepWeight: 10             # shift 10% more traffic per successful interval
    metrics:
      - name: request-success-rate
        thresholdRange: { min: 99 }
        interval: 1m
```

Flagger watches the target Deployment (updated via the normal Flux/`ImageUpdateAutomation` loop), automatically creates a canary version, shifts traffic incrementally while checking the defined success-rate metric, and rolls back automatically if the metric breaches threshold at any step — this is what turns "GitOps deploys the new version" into "GitOps safely, gradually rolls out the new version with automatic rollback," a materially different risk profile for production deploys.
