# FluxCD — Troubleshooting

## `GitRepository` shows "not ready" and never fetches

**Symptom:** `flux get sources git` shows the `GitRepository` stuck in a failed or unready state — no commits are ever picked up, and nothing downstream (`Kustomization`, `HelmRelease`) has anything to reconcile from.

**Root cause:** almost always an authentication or connectivity problem at the source level — a missing or wrong `secretRef` for a private repo, an expired deploy token/PAT, or the Git host being unreachable from inside the cluster (a network policy blocking egress, most commonly).

**Fix:** `flux logs --kind=GitRepository` or `kubectl describe gitrepository <name> -n flux-system` shows the actual fetch error, not just "not ready." Verify the referenced secret actually exists and contains valid credentials:

```bash
kubectl get secret github-token -n flux-system
flux reconcile source git gitops-repo   # forces a re-fetch after fixing credentials
```

```yaml
apiVersion: source.toolkit.fluxcd.io/v1
kind: GitRepository
metadata:
  name: gitops-repo
  namespace: flux-system
spec:
  interval: 1m
  url: https://github.com/company/gitops-repo
  ref:
    branch: main
  secretRef:
    name: github-token   # this Secret must exist in the SAME namespace as the GitRepository
```

A common variant of this mistake: the secret exists, but in the wrong namespace — `secretRef` only resolves within the `GitRepository`'s own namespace, not cluster-wide.

## `Kustomization` never reports healthy, stuck on health checks

**Symptom:** `flux get kustomizations` shows a `Kustomization` perpetually "not ready," even though `kubectl get deployment` shows the target Deployment running fine.

**Root cause:** a `healthChecks:` entry on the `Kustomization` ties reconciliation success to a *specific* named resource being healthy — if the `healthChecks:` block references the wrong name/namespace, or the actual Deployment takes longer to become ready than the `timeout:` allows, the Kustomization reports unready even though the applied resources themselves are fine.

**Fix:** `flux trace kustomization <name>` shows exactly which resource Flux is waiting on and its current status. Confirm the `healthChecks:` name/namespace matches the real object exactly, and that `timeout:` is generous enough for the workload's actual startup time (a slow-starting Deployment with a 1-minute liveness probe delay needs a `timeout:` longer than that, not the default):

```yaml
apiVersion: kustomize.toolkit.fluxcd.io/v1
kind: Kustomization
metadata:
  name: production-apps
spec:
  healthChecks:
  - apiVersion: apps/v1
    kind: Deployment
    name: payment-service      # must match the real Deployment name exactly
    namespace: production      # and its real namespace — a common copy-paste mismatch
  timeout: 5m                  # raise this if the Deployment's own readiness takes longer
```

## Manual `kubectl` change doesn't get reverted — drift isn't corrected

**Symptom:** someone manually edits a resource that Flux manages, expecting it to snap back to Git's declared state on the next reconciliation — but it stays as manually edited.

**Root cause:** two common causes. First, `prune: true` only controls whether resources *removed from Git* get deleted from the cluster — it does not, by itself, guarantee every field on an existing resource is force-reconciled back to Git's exact value if another controller (an HPA changing `replicas`, for instance) or a human keeps re-editing it between reconciliation intervals. Second, the `interval:` on the `Kustomization` might simply not have elapsed yet — Flux only reconciles on that schedule, not instantly on every cluster change.

**Fix:** force an immediate reconciliation to confirm behavior rather than waiting for the interval:

```bash
flux reconcile kustomization production-apps --with-source
```

If drift genuinely isn't being corrected even after a forced reconcile, check whether the field being manually edited is actually managed by the `Kustomization`'s applied manifest at all — Flux only reconciles fields it owns; a field an HPA or another controller actively manages outside Git will keep drifting regardless of Flux's own correction, because two controllers are fighting over the same field.

## `HelmRelease` stuck in "upgrade retries exhausted"

**Symptom:** a `HelmRelease` shows a failed status with "upgrade retries exhausted" or similar, and `helm-controller` stops attempting further installs/upgrades for it.

**Root cause:** `helm-controller` retries a failed Helm upgrade a bounded number of times (governed by `.spec.upgrade.remediation.retries`, default a small number) before giving up entirely — a persistently failing chart (bad values, a resource conflict, a webhook rejecting the manifest) will exhaust those retries and then sit stuck until manually reconciled, rather than retrying forever.

**Fix:** check the actual Helm failure first — `flux logs --kind=HelmRelease` or `kubectl describe helmrelease <name>` shows the underlying error (frequently a values schema validation failure or a resource already existing outside Helm's ownership). After fixing the root cause, force a fresh reconciliation rather than waiting — Flux won't auto-retry past the exhausted count on its own:

```bash
flux reconcile helmrelease prometheus -n monitoring --force
```

## `flux bootstrap` fails or `flux check` reports missing prerequisites

**Symptom:** `flux bootstrap github ...` errors out partway through, or `flux check` reports the cluster isn't ready for Flux.

**Root cause:** `flux check` validates Kubernetes version compatibility and that required CRDs/permissions exist before bootstrap proceeds — the most common real failures are insufficient RBAC on the credentials used to run bootstrap (it needs to both install controllers into the cluster and create/push to the target Git repo), or a Kubernetes version below Flux's minimum supported version.

**Fix:** run `flux check --pre` before attempting bootstrap at all — it validates prerequisites without touching the cluster or Git, so failures surface before a half-completed bootstrap leaves the cluster in a partially-configured state:

```bash
flux check --pre                 # validates prerequisites only, makes no changes
flux check                       # validates an already-installed Flux
kubectl get pods -n flux-system  # confirms which controllers are actually running
```

A bootstrap that fails partway through after `flux check --pre` passed is usually a Git-side permission problem (the token used doesn't have push/repo-creation rights), not a cluster problem.

## One team's `Kustomization` unexpectedly touches another team's namespace

**Symptom:** in a multi-tenant cluster, a change intended for `team-a`'s namespace shows up applied against `team-b`'s resources, or a tenant's `Kustomization` fails with an RBAC-denied error it shouldn't be hitting.

**Root cause:** the isolation between tenants is enforced entirely by `serviceAccountName:` and `targetNamespace:` on each tenant's `Kustomization` — if a tenant's `Kustomization` is missing `serviceAccountName:` (defaulting to Flux's own cluster-wide permissions) or its manifests themselves reference a namespace outside the intended `targetNamespace:`, the isolation that's supposed to exist doesn't actually apply.

**Fix:** audit every tenant `Kustomization` for an explicit, correctly-scoped `serviceAccountName:` — a missing one is the single most common cause of this, since Flux silently falls back to broader permissions rather than failing loudly:

```yaml
apiVersion: kustomize.toolkit.fluxcd.io/v1
kind: Kustomization
metadata:
  name: team-a-apps
  namespace: flux-system
spec:
  serviceAccountName: flux-team-a   # missing this = reconciles with Flux's own (broader) permissions
  targetNamespace: team-a
  sourceRef:
    kind: GitRepository
    name: team-a-repo
```

---

## Official Resources

- [FluxCD Documentation](https://fluxcd.io/flux/)
- [FluxCD Troubleshooting Guide](https://fluxcd.io/flux/cheatsheets/troubleshooting/)
- [Flux CLI Reference](https://fluxcd.io/flux/cmd/)

---
