# Helm Fundamentals

## Chart Structure Deep Dive

```bash
helm create myapp
tree myapp/
# myapp/
# ├── Chart.yaml
# ├── values.yaml
# ├── charts/                  # Subcharts (dependencies)
# ├── templates/
# │   ├── _helpers.tpl         # Named templates / functions
# │   ├── deployment.yaml
# │   ├── service.yaml
# │   ├── ingress.yaml
# │   ├── hpa.yaml
# │   ├── serviceaccount.yaml
# │   ├── configmap.yaml
# │   └── NOTES.txt            # Post-install instructions
# └── .helmignore
```

## _helpers.tpl — Reusable Templates

```yaml
{{/* _helpers.tpl */}}

{{/* Expand the name of the chart */}}
{{- define "myapp.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Full name: release-chart (truncated to 63 chars) */}}
{{- define "myapp.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/* Common labels */}}
{{- define "myapp.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/name: {{ include "myapp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* Selector labels */}}
{{- define "myapp.selectorLabels" -}}
app.kubernetes.io/name: {{ include "myapp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
```

## Complete Deployment Template

```yaml
# templates/deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ include "myapp.fullname" . }}
  labels:
    {{- include "myapp.labels" . | nindent 4 }}
  annotations:
    {{- toYaml .Values.deploymentAnnotations | nindent 4 }}
spec:
  {{- if not .Values.autoscaling.enabled }}
  replicas: {{ .Values.replicaCount }}
  {{- end }}
  selector:
    matchLabels:
      {{- include "myapp.selectorLabels" . | nindent 6 }}
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: {{ .Values.updateStrategy.maxSurge }}
      maxUnavailable: {{ .Values.updateStrategy.maxUnavailable }}
  template:
    metadata:
      labels:
        {{- include "myapp.selectorLabels" . | nindent 8 }}
        {{- with .Values.podLabels }}
        {{- toYaml . | nindent 8 }}
        {{- end }}
      annotations:
        checksum/config: {{ include (print $.Template.BasePath "/configmap.yaml") . | sha256sum }}
        {{- with .Values.podAnnotations }}
        {{- toYaml . | nindent 8 }}
        {{- end }}
    spec:
      serviceAccountName: {{ include "myapp.fullname" . }}
      securityContext:
        {{- toYaml .Values.podSecurityContext | nindent 8 }}
      
      {{- with .Values.imagePullSecrets }}
      imagePullSecrets:
        {{- toYaml . | nindent 8 }}
      {{- end }}

      {{- with .Values.initContainers }}
      initContainers:
        {{- toYaml . | nindent 8 }}
      {{- end }}

      containers:
      - name: {{ .Chart.Name }}
        image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
        imagePullPolicy: {{ .Values.image.pullPolicy }}
        
        ports:
        - name: http
          containerPort: {{ .Values.service.targetPort }}
          protocol: TCP

        {{- if .Values.env }}
        env:
          {{- range $key, $value := .Values.env }}
          - name: {{ $key }}
            value: {{ $value | quote }}
          {{- end }}
        {{- end }}

        {{- if .Values.envFrom }}
        envFrom:
          {{- toYaml .Values.envFrom | nindent 10 }}
        {{- end }}

        resources:
          {{- toYaml .Values.resources | nindent 10 }}

        {{- with .Values.livenessProbe }}
        livenessProbe:
          {{- toYaml . | nindent 10 }}
        {{- end }}

        {{- with .Values.readinessProbe }}
        readinessProbe:
          {{- toYaml . | nindent 10 }}
        {{- end }}

        {{- with .Values.volumeMounts }}
        volumeMounts:
          {{- toYaml . | nindent 10 }}
        {{- end }}

        securityContext:
          {{- toYaml .Values.containerSecurityContext | nindent 10 }}

      {{- with .Values.volumes }}
      volumes:
        {{- toYaml . | nindent 8 }}
      {{- end }}

      {{- with .Values.nodeSelector }}
      nodeSelector:
        {{- toYaml . | nindent 8 }}
      {{- end }}

      {{- with .Values.affinity }}
      affinity:
        {{- toYaml . | nindent 8 }}
      {{- end }}

      {{- with .Values.tolerations }}
      tolerations:
        {{- toYaml . | nindent 8 }}
      {{- end }}
```

## Complete values.yaml

```yaml
# values.yaml — production-ready defaults
replicaCount: 2

image:
  repository: myregistry.io/myapp
  tag: ""                          # Defaults to Chart.AppVersion
  pullPolicy: IfNotPresent

imagePullSecrets: []

updateStrategy:
  maxSurge: 1
  maxUnavailable: 0

service:
  type: ClusterIP
  port: 80
  targetPort: 8080

ingress:
  enabled: true
  className: nginx
  annotations:
    cert-manager.io/cluster-issuer: letsencrypt-prod
  hosts:
  - host: myapp.example.com
    paths:
    - path: /
      pathType: Prefix
  tls:
  - secretName: myapp-tls
    hosts:
    - myapp.example.com

resources:
  requests:
    memory: 128Mi
    cpu: 100m
  limits:
    memory: 256Mi
    cpu: 500m

autoscaling:
  enabled: true
  minReplicas: 2
  maxReplicas: 20
  targetCPUUtilizationPercentage: 60
  targetMemoryUtilizationPercentage: 80

livenessProbe:
  httpGet:
    path: /health
    port: http
  initialDelaySeconds: 30
  periodSeconds: 10
  failureThreshold: 3

readinessProbe:
  httpGet:
    path: /ready
    port: http
  initialDelaySeconds: 5
  periodSeconds: 5

podSecurityContext:
  runAsNonRoot: true
  runAsUser: 1000
  fsGroup: 2000

containerSecurityContext:
  allowPrivilegeEscalation: false
  readOnlyRootFilesystem: true
  capabilities:
    drop: [ALL]

env:
  LOG_LEVEL: info
  APP_ENV: production

envFrom: []

podAnnotations: {}
podLabels: {}
deploymentAnnotations: {}

nodeSelector: {}
tolerations: []
affinity: {}
initContainers: []
volumes: []
volumeMounts: []
```

## Chart Dependencies

```yaml
# Chart.yaml with dependencies
apiVersion: v2
name: myapp
version: 1.0.0
appVersion: "2.5.0"
dependencies:
  - name: postgresql
    version: "13.x.x"
    repository: https://charts.bitnami.com/bitnami
    condition: postgresql.enabled   # Only install if postgresql.enabled=true
  - name: redis
    version: "18.x.x"
    repository: https://charts.bitnami.com/bitnami
    condition: redis.enabled
```

```bash
# Download dependencies
helm dependency update ./myapp

# values.yaml — configure sub-charts
postgresql:
  enabled: true
  auth:
    database: myapp
    username: myapp
    existingSecret: myapp-db-secret
  primary:
    persistence:
      size: 50Gi

redis:
  enabled: false   # disabled, using external Redis
```

## Helm Testing

```yaml
# templates/tests/test-connection.yaml
apiVersion: v1
kind: Pod
metadata:
  name: {{ include "myapp.fullname" . }}-test-connection
  labels:
    {{- include "myapp.labels" . | nindent 4 }}
  annotations:
    helm.sh/hook: test              # Only runs during helm test
    helm.sh/hook-delete-policy: keep
spec:
  restartPolicy: Never
  containers:
  - name: wget
    image: busybox
    command: ['wget']
    args: ['{{ include "myapp.fullname" . }}:{{ .Values.service.port }}/health']
```

```bash
# Run tests after install
helm install myapp ./myapp
helm test myapp

# Unit test with helm-unittest plugin
helm plugin install https://github.com/helm-unittest/helm-unittest
helm unittest ./myapp
```

## Helm Cheat Sheet

```bash
# Render templates locally (debug)
helm template myapp ./myapp --values values-prod.yaml

# Lint chart
helm lint ./myapp
helm lint ./myapp --strict     # Fail on warnings too

# Show computed values
helm get values myapp -n production

# Diff before upgrade (plugin)
helm plugin install https://github.com/databus23/helm-diff
helm diff upgrade myapp ./myapp --values values-prod.yaml -n production

# Package and push to registry
helm package ./myapp
helm push myapp-1.0.0.tgz oci://registry.example.com/charts

# Pull from OCI registry
helm pull oci://registry.example.com/charts/myapp --version 1.0.0
```
