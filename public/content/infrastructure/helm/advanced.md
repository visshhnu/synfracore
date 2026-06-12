# Helm — Advanced

## Library Charts

```yaml
# Library chart — shared templates, cannot be installed directly
# Chart.yaml
apiVersion: v2
name: common-lib
type: library          # Key difference
version: 1.0.0

# templates/_deployment.yaml in library chart
{{- define "common.deployment" -}}
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ include "common.fullname" . }}
  labels: {{- include "common.labels" . | nindent 4 }}
spec:
  replicas: {{ .Values.replicaCount | default 1 }}
  selector:
    matchLabels: {{- include "common.selectorLabels" . | nindent 6 }}
  template:
    metadata:
      labels: {{- include "common.selectorLabels" . | nindent 8 }}
    spec:
      containers:
      - name: {{ .Chart.Name }}
        image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
        {{- if .Values.resources }}
        resources: {{- toYaml .Values.resources | nindent 10 }}
        {{- end }}
        {{- if .Values.livenessProbe }}
        livenessProbe: {{- toYaml .Values.livenessProbe | nindent 10 }}
        {{- end }}
{{- end }}
```

```yaml
# Consumer chart — uses library
dependencies:
  - name: common-lib
    version: "1.0.0"
    repository: oci://ghcr.io/myorg/charts

# templates/deployment.yaml — just call the library template
{{ include "common.deployment" . }}
```

## Helm and GitOps

```bash
# Render Helm chart to plain YAML (for GitOps without Helm)
helm template my-app ./chart \
    --values values-prod.yaml \
    --set image.tag=v1.2.3 \
    --namespace production \
    > manifests/prod/my-app.yaml

# Helmfile — manage multiple Helm releases declaratively
# helmfile.yaml
repositories:
  - name: bitnami
    url: https://charts.bitnami.com/bitnami
  - name: ingress-nginx
    url: https://kubernetes.github.io/ingress-nginx

releases:
  - name: ingress
    namespace: ingress-nginx
    chart: ingress-nginx/ingress-nginx
    version: "4.8.3"
    values: [infra/ingress-values.yaml]

  - name: cert-manager
    namespace: cert-manager
    chart: jetstack/cert-manager
    version: "v1.13.3"
    set:
      - name: installCRDs
        value: true

  - name: my-app
    namespace: production
    chart: ./charts/my-app
    values:
      - environments/prod/values.yaml
    secrets:
      - environments/prod/secrets.yaml    # Helm Secrets (SOPS encrypted)
```

```bash
helmfile sync            # Install/upgrade all releases
helmfile diff            # Show what will change
helmfile destroy         # Delete all releases
helmfile apply           # diff + sync
```

## Chart Security

```bash
# Sign charts with GPG
gpg --gen-key
helm package --sign --key 'Your Name' --keyring ~/.gnupg/secring.gpg my-app/
helm verify my-app-1.0.0.tgz --keyring ~/.gnupg/pubring.gpg

# Scan charts for security issues
helm plugin install https://github.com/helm/helm-plugin-test
trivy config ./my-app/    # Scan Kubernetes configs in chart

# Checkov scan
checkov --directory ./my-app/templates

# Best practices for chart security:
# 1. Never hardcode secrets in values.yaml
# 2. Use secretKeyRef / secretEnvVars for sensitive values
# 3. Set resource limits (required by many security policies)
# 4. Set runAsNonRoot: true in securityContext
# 5. Set readOnlyRootFilesystem: true where possible
# 6. Drop all capabilities: { drop: [ALL] }
```
