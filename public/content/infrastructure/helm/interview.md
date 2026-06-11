# Helm — Interview Questions

**What is Helm and why is it used with Kubernetes?**
Helm is the package manager for Kubernetes. It packages related Kubernetes manifests (Deployments, Services, ConfigMaps, etc.) into a "chart" — a versioned, reusable, parameterizable unit. Without Helm, deploying a complex application like PostgreSQL requires managing dozens of individual YAML files. With Helm, you run `helm install my-db bitnami/postgresql --set auth.password=secure123`. It solves templating (values.yaml), versioning (rollback with `helm rollback`), and sharing (public chart repositories like Artifact Hub).

**What is the difference between values.yaml and --set?**
`values.yaml` is the default values file packaged in the chart — it defines all configurable parameters with their defaults. `--values` (or `-f`) lets you override with your own values file. `--set` lets you override individual values on the command line. Priority: `--set` > `-f` > chart's `values.yaml`. In production, use a values file in Git rather than `--set` — this way your configuration is version-controlled.

**Explain the Helm template rendering process.**
Helm reads the chart's `templates/` directory, processes each file as a Go template, substituting `{{ .Values.xxx }}` with values from merged values files, and adds built-in objects like `.Release.Name`, `.Chart.Name`, `.Capabilities`. It also runs `helm lint` checks, applies the `_helpers.tpl` named templates, and produces final Kubernetes YAML. `helm template` shows you the rendered output without installing.

**What is a named template in Helm?**
Named templates are reusable template snippets defined in `_helpers.tpl` files (or any file starting with `_`). They're defined with `{{- define "myapp.labels" -}}` and called with `{{- include "myapp.labels" . | indent 4 }}`. Common use: standardized labels across all resources.
```yaml
{{- define "myapp.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
{{- end }}
```

**How do you handle secrets in Helm charts?**
Never put secrets directly in values.yaml (committed to Git). Options:
1. External secrets: Use External Secrets Operator or AWS Secrets Manager, reference from chart via environment variables pointing to K8s secrets
2. Helm Secrets plugin: Encrypts values files with SOPS + KMS — `helm secrets install`
3. Sealed Secrets: Encrypt K8s secret manifests — only the cluster can decrypt
4. Vault Agent Injector: HashiCorp Vault injects secrets into pods at runtime
Best practice: Keep secrets out of Helm entirely; manage them separately with External Secrets Operator.
