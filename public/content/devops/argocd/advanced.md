# ArgoCD — Multi-Cluster, HA & Progressive Delivery

## Hub-and-spoke: one ArgoCD instance managing many clusters

At real scale, a platform team runs a single "hub" ArgoCD instance that manages several "spoke" clusters (dev, staging, prod-us, prod-eu) rather than installing ArgoCD separately in every cluster. Each spoke is registered once and then targeted like any other destination:

```bash
# Register each spoke cluster (uses the current kubeconfig context)
argocd cluster add prod-us-context --name prod-us
argocd cluster add prod-eu-context --name prod-eu
argocd cluster list
```

```yaml
# Application targeting a registered external cluster
spec:
  destination:
    server: https://prod-us-api.example.com   # matches the registered cluster's API server
    namespace: production
```

**Environment promotion** — moving a change from dev through staging to prod — is typically modeled as a Git-level workflow, not an ArgoCD-level one: a merge to `main` auto-deploys to dev, a tag or PR merge promotes to staging (still automated), and production requires either a separate `prod` branch merge or `syncPolicy.automated` deliberately left unset so a human reviews the diff and syncs manually. ArgoCD itself doesn't have an "environment promotion" primitive — the promotion gate is enforced in Git (branch protection, PR review) or in the Application's own sync policy, not inside ArgoCD.

## High availability: what actually needs replicating

A single-replica ArgoCD installation is a real single point of failure for deployments (though not for already-running workloads — if ArgoCD goes down, the cluster keeps running whatever was last applied, it just can't reconcile new changes until ArgoCD is back). Production HA means:

```yaml
# argocd-operator's ArgoCD CR (if using the Argo CD Operator) --
# for a plain Helm install, the equivalent is set via values.yaml
apiVersion: argoproj.io/v1alpha1
kind: ArgoCD
metadata:
  name: argocd
spec:
  ha:
    enabled: true       # Redis in HA mode (sentinel-backed), not single-instance
  controller:
    replicas: 2          # multiple Application Controller shards
  server:
    replicas: 2
  applicationSet:
    replicas: 2
```

Redis backs ArgoCD's caching layer — losing it isn't data loss (Git is still the source of truth), but it does mean every component re-reads from the Kubernetes API and Git until it's back, which is real added load on both. The Application Controller can be sharded (multiple replicas, each responsible for a subset of Applications) so no single controller pod becomes a bottleneck as the number of managed Applications grows into the hundreds or thousands.

## Disaster recovery: what to actually back up

ArgoCD's Application/AppProject objects are themselves just Kubernetes resources in the `argocd` namespace — they are not reconstructable from the target clusters' Git repos alone, because the *mapping* of which repo/path goes to which cluster/namespace, plus repo credentials and RBAC config, lives only in ArgoCD's own state.

```bash
# Back these up on a schedule, not as a one-time afterthought
kubectl get applications -n argocd -o yaml > apps-backup.yaml
kubectl get appprojects -n argocd -o yaml > projects-backup.yaml
kubectl get secrets -n argocd -l argocd.argoproj.io/secret-type=repository -o yaml > repo-creds-backup.yaml
kubectl get configmap argocd-cm argocd-rbac-cm -n argocd -o yaml > config-backup.yaml
```

Note what does *not* need backing up: the actual deployed workload manifests. Those live in Git, and a freshly-restored ArgoCD (with its Applications re-created from the backup above) will re-sync every managed cluster back to exactly what Git says on its own — that's the entire point of GitOps. The backup above exists specifically because ArgoCD's own configuration isn't derivable from Git; everything downstream of it is.

## Progressive delivery with Argo Rollouts

Plain ArgoCD syncs a Deployment's new image in one shot — the rollout strategy (rolling update, its default) is whatever the underlying Kubernetes object defines, not something ArgoCD controls. **Argo Rollouts** is a separate controller (from the same Argo project, commonly used alongside ArgoCD) that replaces a Deployment with a `Rollout` CRD supporting canary and blue-green strategies with automated analysis:

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Rollout
metadata:
  name: myapp
spec:
  strategy:
    canary:
      steps:
        - setWeight: 10           # 10% of traffic to the new version
        - pause: { duration: 5m }
        - analysis:                # automated go/no-go check, not just a timer
            templates:
              - templateName: success-rate
        - setWeight: 50
        - pause: { duration: 10m }
        - setWeight: 100
      trafficRouting:
        nginx:
          stableIngress: myapp-stable   # requires an ingress controller Rollouts can control traffic splitting through
```

```yaml
# AnalysisTemplate -- queries Prometheus to decide promote or abort automatically
apiVersion: argoproj.io/v1alpha1
kind: AnalysisTemplate
metadata:
  name: success-rate
spec:
  metrics:
    - name: success-rate
      interval: 1m
      successCondition: result[0] >= 0.95
      provider:
        prometheus:
          address: http://prometheus.monitoring:9090
          query: |
            sum(rate(http_requests_total{status!~"5.."}[5m]))
            / sum(rate(http_requests_total[5m]))
```

The real value over a manual canary: if the success-rate query drops below 0.95 during the `analysis` step, Rollouts aborts and rolls back automatically — nobody has to be watching a dashboard in real time for the rollout to fail safely. ArgoCD's own role doesn't disappear here — it still syncs the `Rollout` object (and the `AnalysisTemplate`) from Git like any other resource; Argo Rollouts then drives the actual traffic-shifting and analysis independently of ArgoCD's sync cycle.

## ApplicationSet Matrix generator: combining two generators

The generators covered in Intermediate (List, Git directory, Cluster) each answer one question — which environments, which services, which clusters. A **Matrix generator** answers two at once by taking the Cartesian product of two child generators — most commonly "every service" × "every cluster":

```yaml
apiVersion: argoproj.io/v1alpha1
kind: ApplicationSet
metadata:
  name: services-across-clusters
spec:
  generators:
    - matrix:
        generators:
          - git:
              repoURL: https://github.com/myorg/services
              directories:
                - path: services/*
          - clusters:
              selector:
                matchLabels: { tier: production }
  template:
    metadata:
      name: '{{path.basename}}-{{name}}'   # {{path.basename}} from the git generator, {{name}} from the clusters generator
    spec:
      source:
        repoURL: https://github.com/myorg/services
        path: '{{path}}'
      destination:
        server: '{{server}}'
        namespace: '{{path.basename}}'
```

Without Matrix, deploying 8 services to 3 production clusters means either 24 hand-written Applications or 3 separate Git-directory ApplicationSets (one per cluster, each hardcoding that cluster's server URL) — both real maintenance burdens as either dimension grows. The Matrix generator produces all 24 Applications from one definition, and adding a 9th service or a 4th cluster requires no ApplicationSet change at all — just a new directory in Git, or a new cluster registration.
