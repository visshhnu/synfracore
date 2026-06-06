# Helm — Kubernetes Package Manager

Helm is the package manager for Kubernetes. Just as `apt` installs software on Ubuntu and `pip` installs Python packages, Helm installs and manages complex Kubernetes applications through reusable, configurable packages called **Charts**.

## Why Helm?

Without Helm, deploying a production application requires manually writing and maintaining dozens of YAML files — Deployment, Service, ConfigMap, Secret, Ingress, HPA, PDB, ServiceAccount, RBAC, and more. Multiply this by 10 microservices across 3 environments (dev/staging/prod) and you have hundreds of nearly-identical YAML files that drift apart over time.

Helm solves this with:
- **Charts** — Packaged Kubernetes applications (templates + defaults)
- **Values** — Override any default for your environment
- **Releases** — Tracked installations (upgrade, rollback, history)
- **Repository** — Share charts across teams and with the community

## How Helm Works

```
Chart (templates/ + values.yaml)
         +
Your values (values-prod.yaml)
         =
Rendered Kubernetes YAML
         →
kubectl apply (via Helm)
         →
Kubernetes Cluster
```

## Installation

```bash
# Install Helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Verify
helm version

# Add popular repositories
helm repo add stable https://charts.helm.sh/stable
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

# Update all repos
helm repo update

# Search for charts
helm search repo nginx
helm search repo postgresql
helm search hub wordpress          # Search Artifact Hub (all public charts)
```

## Essential Helm Commands

```bash
# Install a chart
helm install my-nginx ingress-nginx/ingress-nginx \
  --namespace ingress-nginx \
  --create-namespace

# Install with custom values
helm install prometheus prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  --create-namespace \
  --values values-prod.yaml \
  --set grafana.adminPassword=SecurePass123 \
  --set prometheus.prometheusSpec.retention=30d

# List releases
helm list -A                        # All namespaces
helm list -n production             # Specific namespace

# Check status
helm status my-nginx -n ingress-nginx

# See rendered templates (dry run)
helm template my-app ./my-chart --values values-prod.yaml

# Upgrade release
helm upgrade prometheus prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  --reuse-values \                   # Keep existing values
  --set grafana.adminPassword=NewPass

# Upgrade or install (idempotent — great for CI/CD)
helm upgrade --install my-app ./my-chart \
  --namespace production \
  --create-namespace \
  --values values-prod.yaml \
  --wait \                           # Wait until all pods are ready
  --timeout 5m

# Rollback
helm history my-app -n production   # Show revision history
helm rollback my-app 2 -n production # Roll back to revision 2

# Uninstall
helm uninstall my-app -n production

# Show chart values
helm show values ingress-nginx/ingress-nginx > defaults.yaml
helm get values my-nginx -n ingress-nginx  # Currently applied values
```

## Creating Your Own Chart

```bash
# Scaffold a new chart
helm create myapp

# Structure:
# myapp/
# ├── Chart.yaml          — Chart metadata
# ├── values.yaml         — Default values
# ├── templates/          — Kubernetes YAML templates
# │   ├── deployment.yaml
# │   ├── service.yaml
# │   ├── ingress.yaml
# │   ├── hpa.yaml
# │   ├── serviceaccount.yaml
# │   ├── _helpers.tpl    — Reusable template functions
# │   └── NOTES.txt       — Post-install instructions
# ├── charts/             — Chart dependencies
# └── .helmignore
```

```yaml
# Chart.yaml
apiVersion: v2
name: myapp
description: My application Helm chart
type: application
version: 1.2.0          # Chart version
appVersion: "2.5.1"     # App version being packaged
```

```yaml
# values.yaml — All configurable defaults
replicaCount: 3

image:
  repository: myregistry.io/myapp
  tag: "latest"
  pullPolicy: IfNotPresent

resources:
  requests:
    memory: "128Mi"
    cpu: "100m"
  limits:
    memory: "256Mi"
    cpu: "500m"

service:
  type: ClusterIP
  port: 80

ingress:
  enabled: true
  className: nginx
  host: myapp.example.com
  tls: true

autoscaling:
  enabled: true
  minReplicas: 3
  maxReplicas: 20
  targetCPUUtilizationPercentage: 60

env:
  LOG_LEVEL: info
  APP_ENV: production

secrets:
  DB_PASSWORD: ""   # Set via --set or external secrets
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
  {{- if not .Values.autoscaling.enabled }}
  replicas: {{ .Values.replicaCount }}
  {{- end }}
  selector:
    matchLabels:
      {{- include "myapp.selectorLabels" . | nindent 6 }}
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 0
  template:
    metadata:
      labels:
        {{- include "myapp.selectorLabels" . | nindent 8 }}
    spec:
      containers:
      - name: {{ .Chart.Name }}
        image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
        imagePullPolicy: {{ .Values.image.pullPolicy }}
        ports:
        - containerPort: {{ .Values.service.port }}
        env:
        {{- range $key, $val := .Values.env }}
        - name: {{ $key }}
          value: {{ $val | quote }}
        {{- end }}
        resources:
          {{- toYaml .Values.resources | nindent 10 }}
        readinessProbe:
          httpGet:
            path: /health
            port: {{ .Values.service.port }}
          initialDelaySeconds: 5
          periodSeconds: 5
        livenessProbe:
          httpGet:
            path: /health
            port: {{ .Values.service.port }}
          initialDelaySeconds: 15
          periodSeconds: 10
```

## Environment-Specific Values

```bash
# Directory structure
helm/
└── myapp/
    ├── Chart.yaml
    ├── values.yaml              # Defaults
    ├── values-dev.yaml          # Dev overrides
    ├── values-staging.yaml      # Staging overrides
    └── values-prod.yaml         # Production overrides
```

```yaml
# values-prod.yaml — production overrides only
replicaCount: 5

image:
  tag: "2.5.1"             # Pin to specific version in prod

resources:
  requests:
    memory: "512Mi"
    cpu: "250m"
  limits:
    memory: "1Gi"
    cpu: "1000m"

autoscaling:
  minReplicas: 5
  maxReplicas: 50

ingress:
  host: myapp.company.com
```

```bash
# Deploy to production
helm upgrade --install myapp ./helm/myapp \
  --values helm/myapp/values.yaml \
  --values helm/myapp/values-prod.yaml \
  --namespace production \
  --create-namespace \
  --wait --timeout 10m
```

## Helm in CI/CD (GitHub Actions)

```yaml
- name: Deploy with Helm
  run: |
    helm upgrade --install ${{ env.APP_NAME }} ./helm \
      --namespace ${{ env.NAMESPACE }} \
      --create-namespace \
      --set image.tag=${{ github.sha }} \
      --values helm/values-${{ env.ENVIRONMENT }}.yaml \
      --wait --timeout 10m \
      --atomic        # Rollback automatically if deploy fails
```

## Interview Questions

**What is the difference between `helm install` and `helm upgrade --install`?**
`helm install` fails if the release already exists. `helm upgrade --install` is idempotent — it installs on first run and upgrades on subsequent runs. Always use `helm upgrade --install` in CI/CD pipelines so they work regardless of whether it's the first deployment or the hundredth.

**What does `--atomic` do in Helm?**
If the deployment fails (pods don't become ready within the timeout), Helm automatically rolls back to the previous successful release. Without `--atomic`, a failed upgrade leaves the release in a failed state. Always use `--atomic` in production CI/CD to prevent partial deployments.

**How do you manage secrets with Helm?**
Never put real secrets in values.yaml — it gets committed to Git. Options: pass secrets via `--set` from CI secrets at deploy time, use Helm Secrets plugin (encrypts values.yaml with SOPS), use External Secrets Operator (fetches from AWS Secrets Manager/Vault at runtime) — best for production, or use sealed-secrets (encrypt in Git, decrypt in cluster).
