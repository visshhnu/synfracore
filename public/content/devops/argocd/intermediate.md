# ArgoCD — Sync Policies, Drift & ApplicationSets

## Auto-sync vs. manual sync — a real production decision, not a default to accept blindly

By default, an ArgoCD `Application` requires a manual sync click (or `argocd app sync` command) to apply a Git change to the cluster — this is a deliberate safety gate. **Auto-sync** removes that gate: any change merged to the watched Git path applies to the cluster automatically, on ArgoCD's next reconciliation. Auto-sync is genuinely appropriate for lower environments (dev, staging) where fast iteration matters more than a review gate — for production, many teams deliberately keep manual sync, so a human confirms the actual diff before it goes live, even though the change was already reviewed via the Git PR itself. This is a real, debated tradeoff, not an obviously-correct default either way.

```yaml
spec:
  syncPolicy:
    automated:
      prune: true      # deletes resources removed from Git
      selfHeal: true    # auto-corrects manual drift back to Git state
```

## Drift detection and self-heal

"Drift" means the cluster's actual state no longer matches what's declared in Git — someone ran `kubectl edit` directly, or a controller mutated a resource outside Git's knowledge. ArgoCD detects this continuously and marks the affected Application `OutOfSync`. With `selfHeal: true`, ArgoCD automatically reverts the drifted resource back to match Git — enforcing that Git really is the single source of truth, not just true until someone manually intervenes. Without `selfHeal`, drift is detected and visible but not auto-corrected, which some teams prefer specifically to avoid an automated system silently reverting a deliberate emergency `kubectl` change before someone's had a chance to also fix it properly in Git.

## `prune`: the flag that makes "delete from Git" actually delete from the cluster

Without `prune: true`, removing a resource from your Git-tracked manifests does *not* delete it from the cluster — ArgoCD only adds/updates what's in Git by default, it doesn't remove things absent from Git unless explicitly told to. This is a genuinely common point of confusion: a resource deleted from a Helm values file or a manifest directory keeps running in the cluster indefinitely until `prune` is enabled or someone deletes it manually.

## AppProject: RBAC scoping for multi-team ArgoCD

```yaml
apiVersion: argoproj.io/v1alpha1
kind: AppProject
metadata: { name: team-payments }
spec:
  sourceRepos: ["https://github.com/org/payments-*"]
  destinations:
  - { namespace: "payments-*", server: "https://kubernetes.default.svc" }
  clusterResourceWhitelist: []   # no cluster-scoped resources allowed
```
An `AppProject` restricts which Git repos and which cluster/namespace destinations a given team's Applications can use — the mechanism that lets one shared ArgoCD instance safely serve multiple teams, each scoped to only their own repos and namespaces, rather than every team implicitly having access to deploy anything anywhere the ArgoCD service account itself can reach.

## ApplicationSets: generating many Applications from one template

```yaml
apiVersion: argoproj.io/v1alpha1
kind: ApplicationSet
metadata: { name: services }
spec:
  generators:
  - git:
      repoURL: https://github.com/org/services
      directories: [{ path: services/* }]
  template:
    metadata: { name: '{{path.basename}}' }
    spec:
      source: { repoURL: https://github.com/org/services, path: '{{path}}' }
      destination: { namespace: '{{path.basename}}' }
```

Manually creating and maintaining one `Application` resource per service (or per cluster, for a multi-cluster fleet) doesn't scale past a handful — an `ApplicationSet`'s Git directory generator automatically creates one Application per matching directory, so adding a new service is just adding a new directory to the Git repo, with the corresponding Application created automatically. The cluster generator does the equivalent across multiple target clusters — deploying the same Application definition to every registered cluster from one ApplicationSet, essential for platform teams managing infrastructure across many clusters rather than one.

## Resource health and status — what ArgoCD is actually telling you

`Synced`/`OutOfSync` describes whether the cluster matches Git. **Health** (`Healthy`/`Progressing`/`Degraded`) is a separate axis — a resource can be perfectly `Synced` (the cluster has exactly what Git says) while still `Degraded` (the pods it created are crashing). ArgoCD's own UI resource tree view is the fastest way to find *which specific resource* is unhealthy within a larger Application — drilling into the red-flagged resource directly rather than guessing from the Application's overall status alone.
