# Helm — Production Patterns & Kustomize

## `--atomic`: automatic rollback on a failed upgrade

```bash
helm upgrade my-release ./mychart --atomic --timeout 5m
```

Without `--atomic`, a failed `helm upgrade` can leave a release in a broken, half-applied state — some resources updated, others not, with no automatic recovery. `--atomic` wraps the upgrade so that a failure triggers an automatic rollback to the last known-good revision, rather than leaving the cluster in an inconsistent intermediate state for someone to notice and fix manually. This is a real, cheap safety net worth using on every production upgrade, not an occasional-use flag.

## `helm diff`: seeing the actual change before you commit to it

The `helm-diff` plugin (`helm plugin install https://github.com/databus23/helm-diff`) shows exactly what will change in the cluster before running `upgrade` — the direct equivalent of `terraform plan` for Helm:

```bash
helm diff upgrade my-release ./mychart -f production-values.yaml
```
Without this, `helm upgrade` is closer to a leap of faith than a reviewed change — for anything beyond a trivial values tweak, seeing the actual diff first is worth the extra step.

## Managing secrets in Helm values safely

Plain `values.yaml` files shouldn't contain real secrets — they're typically committed to Git. `helm-secrets` (built on SOPS) encrypts sensitive values files so they're safe to commit, decrypting only at deploy time:

```bash
helm secrets upgrade my-release ./mychart -f secrets.yaml
```
This keeps the GitOps workflow (config lives in Git, deploys are triggered by Git changes) intact even for values that genuinely need to stay secret, rather than forcing secrets to live entirely outside the Helm/Git flow.

## Chart testing with `ct` (chart-testing)

For a chart maintained by more than one person, or shared across teams, automated linting and installation testing in CI catches breakage before it reaches anyone using the chart:

```bash
ct lint --config ct.yaml
ct install --config ct.yaml
```
This is the CI equivalent of Molecule for Ansible roles — worth the setup cost specifically once a chart has real, multiple consumers depending on it not breaking silently.

## Helmfile: declaring multiple releases as one unit

```yaml
# helmfile.yaml
releases:
  - name: postgresql
    namespace: data
    chart: bitnami/postgresql
    values: [postgresql-values.yaml]
  - name: web
    namespace: app
    chart: ./charts/web
    values: [web-values.yaml]
```
```bash
helmfile sync
```
Rather than running `helm install`/`upgrade` separately for every chart in a platform, Helmfile declares the full set and applies them together — the practical unit becomes "the whole platform," not "one chart at a time," which matters once a real deployment involves a dozen or more charts.

## Kustomize: when overlays beat templating

Kustomize takes a different approach entirely — pure YAML overlays, no templating language, built directly into `kubectl` (`kubectl apply -k`). A **base** holds common configuration; environment-specific **overlays** patch it:

```yaml
# overlays/production/kustomization.yaml
resources: [../../base]
patchesStrategicMerge: [replica-count.yaml]
images:
  - name: myapp
    newTag: v2.1.0
```

**The real decision rule**: use Kustomize for your *own* applications, where you control the base YAML directly — overlay patching is simpler to reason about than templating when you own the source. Use Helm for *third-party* applications (Prometheus, cert-manager, a database) where the chart is provided and pre-built for exactly this kind of configuration via values. Many real platforms use both side by side, deliberately, not as a compromise but because each tool fits a different half of the problem.
