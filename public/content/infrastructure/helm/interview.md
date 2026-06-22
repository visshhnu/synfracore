# Helm Interview Questions

## Core Concepts

**Q: What is Helm? Why is it used?**
Helm is the package manager for Kubernetes — like apt/yum for Linux. It simplifies deploying complex applications by packaging all Kubernetes manifests into a "chart."

**Problems Helm solves:**
Without Helm: manually apply 20+ YAML files, manage versions manually, handle environment differences in each file.
With Helm: `helm install myapp ./chart --values prod-values.yaml` — one command deploys everything.

**Three main components:**
- **Chart**: Package of Kubernetes manifests + templates + metadata
- **Release**: Running instance of a chart in a cluster
- **Repository**: Collection of charts (like Docker Hub for images)

---

**Q: Explain Helm chart structure.**

```
myapp/
├── Chart.yaml          # Chart metadata (name, version, description, dependencies)
├── values.yaml         # Default configuration values
├── values-prod.yaml    # (Optional) Production overrides
├── templates/
│   ├── deployment.yaml # K8s Deployment template
│   ├── service.yaml    # K8s Service template
│   ├── ingress.yaml    # K8s Ingress template
│   ├── configmap.yaml  # K8s ConfigMap template
│   ├── _helpers.tpl    # Reusable template helpers (NOT rendered directly)
│   ├── NOTES.txt       # Shown after install (usage instructions)
│   └── tests/
│       └── test-connection.yaml  # Helm test pod
└── charts/             # Chart dependencies (subcharts)
```

**Chart.yaml example:**
```yaml
apiVersion: v2
name: myapp
description: My application
type: application
version: 1.2.0        # Chart version
appVersion: "2.5.1"   # Application version
dependencies:
  - name: postgresql
    version: "12.1.0"
    repository: "https://charts.bitnami.com/bitnami"
```

---

**Q: How do Helm templates work? Explain Go templating in Helm.**

Templates use Go's `text/template` package with Helm-specific functions.

```yaml
# templates/deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ include "myapp.fullname" . }}    # Helper function from _helpers.tpl
  labels:
    {{- include "myapp.labels" . | nindent 4 }}
spec:
  replicas: {{ .Values.replicaCount }}       # Value from values.yaml
  template:
    spec:
      containers:
      - name: {{ .Chart.Name }}
        image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
        ports:
        - containerPort: {{ .Values.service.port }}
        {{- if .Values.resources }}
        resources:
          {{- toYaml .Values.resources | nindent 10 }}
        {{- end }}
        env:
        {{- range .Values.env }}
        - name: {{ .name }}
          value: {{ .value | quote }}
        {{- end }}
```

**Key template functions:**
- `{{ .Values.key }}` — access values
- `{{ .Release.Name }}` — release name
- `{{ .Chart.Version }}` — chart version
- `{{ include "helper" . }}` — call named template
- `{{ toYaml .Values.obj | nindent 4 }}` — convert to YAML with indentation
- `{{- }}` and `{{ -}}` — trim whitespace
- `{{ if / else / end }}` — conditionals
- `{{ range .Values.list }}` — loops
- `{{ with .Values.optional }}` — scope + nil check

---

**Q: Difference between `helm install`, `helm upgrade`, `helm upgrade --install`?**

```bash
# First installation
helm install release-name ./chart --namespace dev

# Upgrade existing release
helm upgrade release-name ./chart --set image.tag=v2.0

# Install if not exists, upgrade if exists (most common in CI/CD)
helm upgrade --install release-name ./chart   --namespace prod   --create-namespace   --values values-prod.yaml   --set image.tag=$IMAGE_TAG   --atomic \          # Rollback on failure
  --timeout 5m

# Dry run (see what would be deployed without applying)
helm upgrade --install release-name ./chart --dry-run --debug
```

---

**Q: How do you manage multiple environments with Helm?**

**Option 1: Multiple values files**
```bash
# Dev
helm upgrade --install app ./chart -f values.yaml -f values-dev.yaml

# Production
helm upgrade --install app ./chart -f values.yaml -f values-prod.yaml
```

```yaml
# values-prod.yaml (overrides values.yaml)
replicaCount: 5
resources:
  requests:
    cpu: 500m
    memory: 512Mi
  limits:
    cpu: 2000m
    memory: 2Gi
ingress:
  host: app.company.com
```

**Option 2: `--set` overrides (for CI/CD)**
```bash
helm upgrade --install app ./chart   --set image.tag=$CI_SHA   --set environment=production   --set replicas=3
```

**Option 3: Helmfile** (manage multiple releases)
```yaml
# helmfile.yaml
releases:
  - name: app
    chart: ./charts/app
    values:
      - values.yaml
      - values-{{ .Environment.Name }}.yaml
```

---

**Q: What are Helm hooks?**

Hooks run at specific points in the release lifecycle.

```yaml
# templates/job-migrate.yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: {{ .Release.Name }}-migrate
  annotations:
    "helm.sh/hook": pre-upgrade,pre-install    # When to run
    "helm.sh/hook-weight": "-5"                 # Order (lower = first)
    "helm.sh/hook-delete-policy": hook-succeeded  # Clean up after success
spec:
  template:
    spec:
      containers:
      - name: migrate
        image: myapp:{{ .Values.image.tag }}
        command: ["python", "manage.py", "migrate"]
      restartPolicy: Never
```

**Hook types:**
`pre-install`, `post-install`, `pre-upgrade`, `post-upgrade`, `pre-delete`, `post-delete`, `pre-rollback`, `post-rollback`, `test`

Use cases: DB migrations before upgrade, send notification after install, cleanup after delete.

---

**Q: Explain Helm dependencies (subcharts).**

```yaml
# Chart.yaml
dependencies:
  - name: postgresql
    version: "12.x.x"
    repository: "https://charts.bitnami.com/bitnami"
    condition: postgresql.enabled   # Only install if values.postgresql.enabled=true
  - name: redis
    version: "17.x.x"
    repository: "https://charts.bitnami.com/bitnami"
```

```bash
helm dependency update   # Downloads dependencies to charts/ directory
helm dependency list     # List dependencies and their status
```

```yaml
# values.yaml — configure subchart
postgresql:
  enabled: true
  auth:
    database: myapp
    username: myuser
    password: secret
```

---

**Q: How do you test a Helm chart?**

```bash
# Lint (check syntax and best practices)
helm lint ./mychart

# Render templates locally (don't install)
helm template release-name ./mychart --values values-test.yaml

# Dry run against cluster (validates against K8s API)
helm install test-release ./mychart --dry-run --debug

# Run Helm tests (pods that verify installation)
helm test release-name
```

**Helm test pod example:**
```yaml
# templates/tests/test-connection.yaml
apiVersion: v1
kind: Pod
metadata:
  annotations:
    "helm.sh/hook": test
spec:
  containers:
  - name: test
    image: busybox
    command: ['wget', '--spider', 'http://{{ include "myapp.fullname" . }}:{{ .Values.service.port }}/health']
  restartPolicy: Never
```

---

**Q: Helm rollback — how does it work?**

Helm keeps release history (configurable with `--history-max`).

```bash
helm history release-name          # Show all revisions
helm rollback release-name 2       # Rollback to revision 2
helm rollback release-name         # Rollback to previous revision
helm upgrade --atomic ./chart      # Auto-rollback if upgrade fails
```

Helm stores release history as Secrets in Kubernetes. Each revision = one Secret.

## Revision Notes
```
HELM = K8s package manager
Chart: templates + values + Chart.yaml
Release: running chart instance
Repository: chart store

COMMANDS:
install: first deploy | upgrade: update | rollback: revert
upgrade --install: idempotent (CI/CD standard)
--dry-run: preview | --atomic: rollback on fail | lint: validate

TEMPLATES:
{{ .Values.key }}: access values
{{ .Release.Name }}: release name
toYaml | nindent: convert nested objects
if/else/end: conditionals | range: loops

HOOKS: pre/post install/upgrade/delete/rollback
hook-weight: execution order | hook-delete-policy: cleanup

DEPENDENCIES: Chart.yaml dependencies → helm dep update → downloads to charts/
condition: key to enable/disable subchart

ENVIRONMENTS:
Multiple -f values files | --set for single overrides
Helmfile for multiple releases
```
