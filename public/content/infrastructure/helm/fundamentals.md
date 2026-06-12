# Helm — Fundamentals

## Core Concepts

```
Chart:      Package of Kubernetes manifests (templates + values + metadata)
Release:    Deployed instance of a chart (helm install creates a release)
Repository: Collection of charts (like npm registry for charts)
Values:     Configuration that customizes a chart for your environment

Chart structure:
  mychart/
    Chart.yaml          # Chart metadata (name, version, description)
    values.yaml         # Default values
    templates/
      deployment.yaml   # Go template files
      service.yaml
      ingress.yaml
      _helpers.tpl      # Named template definitions (reusable snippets)
    charts/             # Chart dependencies
```

## Install and Manage

```bash
# Add repository
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add stable https://charts.helm.sh/stable
helm repo update                             # Refresh repo indexes

# Search
helm search repo nginx                       # Search repos
helm search hub prometheus                   # Search Artifact Hub
helm show values bitnami/nginx              # Show all configurable values

# Install
helm install my-nginx bitnami/nginx         # Install with default values
helm install my-nginx bitnami/nginx --values my-values.yaml
helm install my-nginx bitnami/nginx --set service.type=LoadBalancer
helm install my-nginx bitnami/nginx --namespace web --create-namespace
helm install my-nginx bitnami/nginx --version 15.0.0  # Pin version

# Upgrade
helm upgrade my-nginx bitnami/nginx --values my-values.yaml
helm upgrade --install my-nginx bitnami/nginx  # Install if not exists, else upgrade

# Status and inspection
helm list                                    # All releases
helm list -n production                      # In specific namespace
helm status my-nginx                         # Release status
helm get values my-nginx                     # Values used in release
helm get manifest my-nginx                   # Rendered manifests

# Rollback
helm history my-nginx                        # Release history
helm rollback my-nginx 2                     # Roll back to revision 2

# Uninstall
helm uninstall my-nginx                      # Remove release
helm uninstall my-nginx --keep-history       # Keep history for rollback
```

## Create a Chart

```bash
helm create myapp                            # Generate chart skeleton
```

```yaml
# values.yaml
replicaCount: 2
image:
  repository: nginx
  tag: "1.25"
  pullPolicy: IfNotPresent
service:
  type: ClusterIP
  port: 80
ingress:
  enabled: false
  host: app.example.com
resources:
  requests: { cpu: 100m, memory: 128Mi }
  limits:   { cpu: 500m, memory: 256Mi }
```

```yaml
# templates/deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ include "myapp.fullname" . }}
  labels:
    {{- include "myapp.labels" . | nindent 4 }}
spec:
  replicas: {{ .Values.replicaCount }}
  template:
    spec:
      containers:
      - name: {{ .Chart.Name }}
        image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
        imagePullPolicy: {{ .Values.image.pullPolicy }}
        ports:
        - containerPort: 80
        resources:
          {{- toYaml .Values.resources | nindent 10 }}
```

```bash
# Test rendering without installing
helm template myapp ./myapp --values custom.yaml

# Lint
helm lint ./myapp

# Package for distribution
helm package ./myapp
helm push myapp-1.0.0.tgz oci://registry.example.com/charts
```
