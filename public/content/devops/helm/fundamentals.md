# Helm — Fundamentals

## Charts, releases, and values — the core mental model

A **Chart** is a package of Kubernetes YAML templates plus metadata — think of it as the installable unit, similar to an apt/yum package but for Kubernetes resources. A **Release** is one specific, named, running instance of a Chart in a cluster — you can install the same chart multiple times under different release names for different purposes. **`values.yaml`** provides the default configuration a chart's templates render against; overriding specific values (via `--set` or a custom values file) is how you customize a chart without editing its templates directly.

```bash
helm install my-release ./mychart
helm install my-release ./mychart --set replicaCount=3 -f production-values.yaml
helm upgrade my-release ./mychart --set image.tag=v2.1.0
helm rollback my-release 1   # back to revision 1
helm list
helm uninstall my-release
```

Helm tracks every release's revision history in the cluster — this is what makes `helm rollback` a genuine, fast operation (reverting to a previously-recorded state) rather than something you'd have to reconstruct manually from Git history.

## Chart structure

```
mychart/
├── Chart.yaml           # chart metadata: name, version, dependencies
├── values.yaml           # default configuration values
├── templates/            # Kubernetes YAML, with Go templating
│   ├── deployment.yaml
│   ├── service.yaml
│   └── _helpers.tpl       # reusable named templates
└── charts/                # subchart dependencies (populated by `helm dependency update`)
```

## Template syntax: the part that actually does the work

```yaml
# templates/deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ .Release.Name }}-web
spec:
  replicas: {{ .Values.replicaCount }}
  template:
    spec:
      containers:
      - name: web
        image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
```

`.Values` references `values.yaml` (or CLI overrides); `.Release.Name` is the release name given at install time — this is what lets the same chart produce differently-named, non-colliding resources across multiple installs. Conditionals and loops use Go template syntax directly:

```yaml
{{- if .Values.ingress.enabled }}
apiVersion: networking.k8s.io/v1
kind: Ingress
...
{{- end }}

{{- range .Values.extraEnvVars }}
- name: {{ .name }}
  value: {{ .value }}
{{- end }}
```

## `_helpers.tpl`: shared logic across a chart's templates

```yaml
{{- define "mychart.fullname" -}}
{{ .Release.Name }}-{{ .Chart.Name }}
{{- end }}
```
Called elsewhere as `{{ include "mychart.fullname" . }}` — this avoids repeating the same naming/labeling logic across every template file in a chart, and is standard practice in any real chart beyond a toy example.

## `helm lint` and `NOTES.txt` — small habits worth having from day one

`helm lint ./mychart` catches structural chart problems (missing required values, malformed YAML) before you ever try installing — run it before every commit to a chart, not just before a release. `templates/NOTES.txt` is rendered and shown to the user immediately after a successful `helm install`/`upgrade` — the standard place to surface "here's how to access what you just deployed" (a port-forward command, a URL, a generated password lookup command), rather than leaving users to figure that out from the chart's source.

## `helm repo` and chart distribution

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm search repo postgresql
helm install my-db bitnami/postgresql
```

Third-party charts (databases, monitoring stacks) are almost always installed from a published repo like this, not copied and modified locally — modifying a third-party chart's templates directly makes future upstream updates a manual merge exercise; overriding via `values.yaml` (which the chart is designed to support) keeps you on the upgrade path the chart's maintainers intended.
