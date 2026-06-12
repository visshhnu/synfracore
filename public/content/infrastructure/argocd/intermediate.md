# ArgoCD — Intermediate

## ApplicationSets

```yaml
# ApplicationSet — template that generates multiple Applications
apiVersion: argoproj.io/v1alpha1
kind: ApplicationSet
metadata:
  name: microservices
  namespace: argocd
spec:
  generators:
    # List generator — explicit list of apps
    - list:
        elements:
          - app: api-gateway
            namespace: production
            repoPath: services/api-gateway
          - app: user-service
            namespace: production
            repoPath: services/user-service
          - app: payment-service
            namespace: production
            repoPath: services/payment-service

  template:
    metadata:
      name: '{{app}}'
    spec:
      project: production
      source:
        repoURL: https://github.com/myorg/k8s-configs
        targetRevision: HEAD
        path: '{{repoPath}}'
      destination:
        server: https://kubernetes.default.svc
        namespace: '{{namespace}}'
      syncPolicy:
        automated:
          prune: true
          selfHeal: true
```

```yaml
# Git generator — discover apps from directory structure
spec:
  generators:
    - git:
        repoURL: https://github.com/myorg/k8s-configs
        revision: HEAD
        directories:
          - path: services/*          # Each subdirectory becomes an Application
            exclude: false
          - path: services/legacy-*  # Exclude legacy services
            exclude: true

# Cluster generator — deploy to multiple clusters
  generators:
    - clusters:
        selector:
          matchLabels:
            environment: production
  template:
    spec:
      destination:
        server: '{{server}}'         # Each cluster's API server URL
        namespace: myapp
```

## Multi-Cluster Deployment

```bash
# Register external clusters with ArgoCD
argocd cluster add arn:aws:eks:us-east-1:123456:cluster/prod-us \
    --name prod-us

argocd cluster add arn:aws:eks:ap-south-1:123456:cluster/prod-in \
    --name prod-india

# List registered clusters
argocd cluster list
```

```yaml
# Deploy same app to all production clusters
apiVersion: argoproj.io/v1alpha1
kind: ApplicationSet
spec:
  generators:
    - clusters:
        selector:
          matchLabels: { tier: production }
  template:
    metadata:
      name: 'myapp-{{name}}'          # name = cluster name
    spec:
      destination:
        server: '{{server}}'
        namespace: production
      source:
        path: apps/myapp/overlays/{{metadata.annotations.region}}
```

## Image Updater

```yaml
# ArgoCD Image Updater — auto-update image tags in Git
# Install:
# kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj-labs/argocd-image-updater/stable/manifests/install.yaml

apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: my-app
  annotations:
    # Track latest semver tag matching v1.x.x
    argocd-image-updater.argoproj.io/image-list: app=registry.io/myapp:~1
    argocd-image-updater.argoproj.io/app.update-strategy: semver
    # Write updated tag back to Git
    argocd-image-updater.argoproj.io/write-back-method: git
    argocd-image-updater.argoproj.io/git-branch: main
    # Or update Helm values file
    argocd-image-updater.argoproj.io/app.helm.image-name: image.repository
    argocd-image-updater.argoproj.io/app.helm.image-tag: image.tag
spec:
  source:
    helm:
      parameters:
        - name: image.tag
          value: latest      # Image Updater will update this
```

## RBAC and Projects

```yaml
# ArgoCD Project — namespace for applications with RBAC
apiVersion: argoproj.io/v1alpha1
kind: AppProject
metadata:
  name: team-backend
  namespace: argocd
spec:
  description: "Backend team applications"

  # Which repos this project can pull from
  sourceRepos:
    - https://github.com/myorg/backend-configs
    - https://github.com/myorg/helm-charts

  # Which clusters/namespaces this project can deploy to
  destinations:
    - server: https://kubernetes.default.svc
      namespace: backend-*           # Wildcard namespace match
    - server: https://prod.k8s.internal
      namespace: production

  # Restrict which K8s resources can be used
  namespaceResourceWhitelist:
    - group: apps
      kind: Deployment
    - group: ""
      kind: Service
    - group: networking.k8s.io
      kind: Ingress

  # Deny cluster-scoped resources (security)
  clusterResourceBlacklist:
    - group: ""
      kind: Namespace
    - group: rbac.authorization.k8s.io
      kind: ClusterRole

  # Roles within the project
  roles:
    - name: developer
      description: "Can sync but not delete"
      policies:
        - p, proj:team-backend:developer, applications, sync, team-backend/*, allow
        - p, proj:team-backend:developer, applications, get, team-backend/*, allow
      groups:
        - backend-developers          # Maps to SSO group
```

## Notifications

```yaml
# ArgoCD Notifications — alert on sync failures, health issues
# Install: kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj-labs/argocd-notifications/release-1.0/manifests/install.yaml

# ConfigMap for notification templates
apiVersion: v1
kind: ConfigMap
metadata:
  name: argocd-notifications-cm
data:
  service.slack: |
    token: $slack-token
  template.app-sync-failed: |
    message: |
      :red_circle: *{{.app.metadata.name}}* sync FAILED
      Repo: {{.app.spec.source.repoURL}}
      Error: {{.app.status.operationState.message}}
  trigger.on-sync-failed: |
    - when: app.status.operationState.phase in ['Error', 'Failed']
      send: [app-sync-failed]

# Annotate application to enable notifications
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  annotations:
    notifications.argoproj.io/subscribe.on-sync-failed.slack: deployments
    notifications.argoproj.io/subscribe.on-health-degraded.slack: oncall
```
