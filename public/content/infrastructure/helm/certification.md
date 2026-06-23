# Helm Certification Guide

## Certifications Available

There is no standalone official Helm certification, but Helm is tested in:

| Cert | Helm Coverage | Provider |
|------|---------------|----------|
| **CKAD** | Deploy apps with Helm, customize releases | CNCF |
| **CKA** | Helm-installed components in cluster | CNCF |
| **GitLab CI Associate** | Helm in GitLab pipelines | GitLab |
| LF: Helm Fundamentals | Introductory course certificate | Linux Foundation |

---

## Helm in CKAD (Primary Exam Relevance)

CKAD tasks involving Helm:
```bash
# Install a chart
helm install myrelease bitnami/nginx
helm install myrelease bitnami/nginx --values custom-values.yaml
helm install myrelease bitnami/nginx --set service.type=ClusterIP,replicaCount=3

# Upgrade and rollback
helm upgrade myrelease bitnami/nginx --set image.tag=1.25
helm rollback myrelease 1                    # Roll back to revision 1
helm history myrelease                       # View revision history

# Inspect before install
helm show values bitnami/nginx               # Default values
helm template myrelease bitnami/nginx        # Render templates (dry run)
helm install myrelease bitnami/nginx --dry-run --debug

# List and manage
helm list -A                                 # All namespaces
helm status myrelease
helm uninstall myrelease

# Repos
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm search repo nginx
```

---

## Chart Development (Interviews & Advanced)

```
CHART STRUCTURE:
  Chart.yaml       — name, version, appVersion, description
  values.yaml      — default configuration values
  templates/       — Kubernetes manifests as Go templates
  templates/NOTES.txt — Post-install instructions
  charts/          — Chart dependencies
  .helmignore      — Files to exclude from packaging

GO TEMPLATE SYNTAX:
  {{ .Values.image.tag }}          — Reference value
  {{ .Release.Name }}              — Release name
  {{ .Release.Namespace }}         — Namespace
  {{ .Chart.Version }}             — Chart version
  {{ .Capabilities.KubeVersion }}  — Kubernetes version

CONTROL FLOW:
  {{ if .Values.ingress.enabled }}
  {{ else }}
  {{ end }}

  {{ range .Values.hosts }}
  - host: {{ . }}
  {{ end }}

  {{ with .Values.securityContext }}  — Only if not empty
  securityContext: {{ toYaml . | nindent 2 }}
  {{ end }}

NAMED TEMPLATES (_helpers.tpl):
  {{- define "myapp.labels" -}}
  app: {{ .Chart.Name }}
  release: {{ .Release.Name }}
  {{- end }}

  Usage: {{ include "myapp.labels" . | nindent 4 }}
```

---

## Hooks and Tests

```yaml
# Hook: run Job before install completes
apiVersion: batch/v1
kind: Job
metadata:
  name: "{{ .Release.Name }}-db-migrate"
  annotations:
    "helm.sh/hook": pre-install,pre-upgrade
    "helm.sh/hook-weight": "0"
    "helm.sh/hook-delete-policy": hook-succeeded
spec:
  template:
    spec:
      containers:
        - name: migrate
          image: myapp:{{ .Values.image.tag }}
          command: ["python", "manage.py", "migrate"]
      restartPolicy: Never

# Test: validate after install
apiVersion: v1
kind: Pod
metadata:
  annotations:
    "helm.sh/hook": test
spec:
  containers:
    - name: test-connection
      image: curlimages/curl
      command: ['curl', '-f', 'http://{{ .Release.Name }}/health']
  restartPolicy: Never
```

---

## Production Patterns

```bash
# Helmfile: manage multiple charts declaratively
# helmfile.yaml
releases:
  - name: nginx
    chart: bitnami/nginx
    values: [./values/nginx.yaml]
  - name: prometheus
    chart: prometheus-community/prometheus
    namespace: monitoring

helmfile apply
helmfile diff

# Secrets with Helm Secrets plugin
helm secrets encrypt secrets.yaml
helm secrets install myrelease . -f secrets.yaml

# Schema validation
# values.schema.json — validates values.yaml types
```

## Revision Notes
```
HELM = Kubernetes package manager. Charts = packages. Releases = instances.

CORE COMMANDS:
  helm repo add/update | helm search repo
  helm install/upgrade/rollback/uninstall
  helm list | helm history | helm status
  helm template (dry-run render) | helm show values

CKAD EXAM TIPS:
  Know: install with --values and --set
  Know: upgrade and rollback with revision numbers
  Know: helm list, helm uninstall

CHART TEMPLATE:
  .Values.* — from values.yaml | .Release.* — runtime info
  {{ if/else/end }} | {{ range }} | {{ include "name" . }}
  nindent N — indent N spaces (critical for YAML)

HOOKS: pre-install/post-install/pre-upgrade/post-upgrade/pre-delete
TESTS: helm test — validate deployment works
```
