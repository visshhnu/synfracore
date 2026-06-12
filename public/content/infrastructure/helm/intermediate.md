# Helm — Intermediate

## Chart Dependencies

```yaml
# Chart.yaml — declare dependencies
apiVersion: v2
name: my-app
version: 1.2.0
appVersion: "2.5.1"
dependencies:
  - name: postgresql
    version: "14.x.x"
    repository: https://charts.bitnami.com/bitnami
    condition: postgresql.enabled    # Optional: only install if value is true
  - name: redis
    version: "18.x.x"
    repository: https://charts.bitnami.com/bitnami
    alias: cache                     # Reference as 'cache' in values.yaml
  - name: common
    version: "2.x.x"
    repository: https://charts.bitnami.com/bitnami
```

```bash
# Download dependencies to charts/ directory
helm dependency update my-app/

# Dependencies in values.yaml
# postgresql:
#   enabled: true
#   auth:
#     password: "secretpassword"
# cache:            # alias used here
#   enabled: true
#   auth:
#     enabled: false
```

## Advanced Templating

```yaml
# _helpers.tpl — named templates for reuse
{{/*
Expand the name of the chart.
*/}}
{{- define "myapp.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a fully qualified name (max 63 chars, no trailing dash)
*/}}
{{- define "myapp.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Common labels — include in all resources
*/}}
{{- define "myapp.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/name: {{ include "myapp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- if .Values.commonLabels }}
{{ toYaml .Values.commonLabels }}
{{- end }}
{{- end }}

{{/*
Selector labels (subset of labels, used for matchLabels)
*/}}
{{- define "myapp.selectorLabels" -}}
app.kubernetes.io/name: {{ include "myapp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
```

```yaml
# Use named templates in manifests
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ include "myapp.fullname" . }}
  labels:
    {{- include "myapp.labels" . | nindent 4 }}
spec:
  selector:
    matchLabels:
      {{- include "myapp.selectorLabels" . | nindent 6 }}
  template:
    metadata:
      labels:
        {{- include "myapp.selectorLabels" . | nindent 8 }}
        {{- with .Values.podLabels }}
        {{- toYaml . | nindent 8 }}
        {{- end }}
    spec:
      {{- with .Values.imagePullSecrets }}
      imagePullSecrets:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      containers:
        - name: {{ .Chart.Name }}
          image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
          {{- with .Values.env }}
          env:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- if .Values.resources }}
          resources:
            {{- toYaml .Values.resources | nindent 12 }}
          {{- end }}
```

## Helm Hooks

```yaml
# Hooks run at specific points in release lifecycle
# pre-install, post-install, pre-upgrade, post-upgrade, pre-delete, post-delete, test

# Database migration hook — run before upgrade
apiVersion: batch/v1
kind: Job
metadata:
  name: "{{ .Release.Name }}-db-migrate"
  annotations:
    "helm.sh/hook": pre-upgrade,pre-install
    "helm.sh/hook-weight": "-5"              # Lower = earlier
    "helm.sh/hook-delete-policy": before-hook-creation,hook-succeeded
spec:
  template:
    spec:
      restartPolicy: Never
      containers:
      - name: migrate
        image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
        command: ["python", "manage.py", "migrate"]
        env:
        - name: DATABASE_URL
          valueFrom:
            secretKeyRef:
              name: {{ include "myapp.fullname" . }}-secrets
              key: database-url

# Helm test — verify release after install
apiVersion: v1
kind: Pod
metadata:
  name: "{{ .Release.Name }}-test"
  annotations:
    "helm.sh/hook": test
spec:
  restartPolicy: Never
  containers:
  - name: test
    image: curlimages/curl
    command: ['curl', '-f', 'http://{{ include "myapp.fullname" . }}:{{ .Values.service.port }}/health']
```

## OCI Registry for Charts

```bash
# Push chart to OCI registry (e.g., ECR, GHCR, ACR)
helm package ./my-app
helm push my-app-1.2.0.tgz oci://ghcr.io/myorg/charts

# Install from OCI
helm install my-app oci://ghcr.io/myorg/charts/my-app --version 1.2.0

# Login to registry first
echo $GITHUB_TOKEN | helm registry login ghcr.io --username myuser --password-stdin
```
