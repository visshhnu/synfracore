# Helm — Cheatsheet

```bash
# ── REPOS ──────────────────────────────────────────────────
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo add cert-manager https://charts.jetstack.io
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update                               # Refresh all repos
helm repo list
helm repo remove old-repo

# ── SEARCH ─────────────────────────────────────────────────
helm search repo nginx                         # Search added repos
helm search hub postgresql                     # Search Artifact Hub
helm show chart bitnami/postgresql             # Chart metadata
helm show values bitnami/postgresql            # All configurable values
helm show values bitnami/postgresql > vals.yaml  # Save to file for editing

# ── INSTALL ────────────────────────────────────────────────
helm install RELEASE CHART
helm install my-app bitnami/nginx
helm install my-app bitnami/nginx --values my-values.yaml
helm install my-app bitnami/nginx --set service.type=LoadBalancer
helm install my-app bitnami/nginx --set service.type=LB,replicas=3
helm install my-app bitnami/nginx --version 15.0.0    # Pin version
helm install my-app bitnami/nginx -n production --create-namespace
helm install my-app ./local-chart                      # Local chart
helm install my-app oci://ghcr.io/org/charts/my-app   # OCI registry
helm upgrade --install my-app bitnami/nginx            # Install or upgrade

# ── UPGRADE ────────────────────────────────────────────────
helm upgrade my-app bitnami/nginx --values my-values.yaml
helm upgrade my-app bitnami/nginx --reuse-values        # Keep current values
helm upgrade my-app bitnami/nginx --reset-values        # Back to chart defaults
helm upgrade my-app bitnami/nginx --force               # Force pod restart
helm upgrade my-app bitnami/nginx --atomic              # Rollback on failure
helm upgrade my-app bitnami/nginx --timeout 10m         # Increase timeout

# ── STATUS ─────────────────────────────────────────────────
helm list                                      # All releases (current ns)
helm list -A                                   # All releases (all ns)
helm list -n production
helm list --pending                            # Stuck releases
helm status my-app                             # Release status + notes
helm get values my-app                         # Values used
helm get values my-app --all                   # All values (incl defaults)
helm get manifest my-app                       # Rendered K8s YAML
helm get notes my-app                          # Post-install notes

# ── ROLLBACK ───────────────────────────────────────────────
helm history my-app                            # Release history
helm rollback my-app                           # Roll back to previous
helm rollback my-app 3                         # Roll back to revision 3

# ── UNINSTALL ──────────────────────────────────────────────
helm uninstall my-app
helm uninstall my-app --keep-history           # Keep history for rollback

# ── DEVELOP ────────────────────────────────────────────────
helm create my-chart                           # Scaffold new chart
helm lint my-chart/                            # Check for errors
helm template my-chart/ --values vals.yaml     # Render without installing
helm template my-chart/ --debug                # Verbose rendering
helm template my-chart/ | kubectl apply --dry-run=client -f -  # K8s validation
helm package my-chart/                         # Create .tgz for distribution
helm dependency update my-chart/               # Download dependencies

# ── PLUGINS ────────────────────────────────────────────────
helm plugin list
helm plugin install https://github.com/helm/helm-plugin-test
helm secrets install                           # SOPS encryption plugin
```

## values.yaml Best Practices

```yaml
# Structured, documented values.yaml
replicaCount: 2

image:
  repository: registry.example.com/myapp
  pullPolicy: IfNotPresent
  tag: ""             # Defaults to Chart.appVersion if empty

imagePullSecrets: []  # [{name: regcred}]
nameOverride: ""
fullnameOverride: ""

serviceAccount:
  create: true
  annotations: {}     # For IRSA: {eks.amazonaws.com/role-arn: "arn:..."}
  name: ""

podAnnotations: {}
podLabels: {}

podSecurityContext:
  runAsNonRoot: true
  runAsUser: 1000
  fsGroup: 2000

securityContext:
  allowPrivilegeEscalation: false
  capabilities:
    drop: [ALL]
  readOnlyRootFilesystem: true

service:
  type: ClusterIP
  port: 80

ingress:
  enabled: false
  className: nginx
  annotations: {}
  hosts:
    - host: app.example.com
      paths: [{path: /, pathType: Prefix}]
  tls: []

resources:
  limits: {cpu: 500m, memory: 256Mi}
  requests: {cpu: 100m, memory: 128Mi}

autoscaling:
  enabled: false
  minReplicas: 2
  maxReplicas: 10
  targetCPUUtilizationPercentage: 70

env: []
# - name: LOG_LEVEL
#   value: info
# - name: DB_PASSWORD
#   valueFrom:
#     secretKeyRef: {name: db-secret, key: password}
```
