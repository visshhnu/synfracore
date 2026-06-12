# ArgoCD — Advanced

## Progressive Delivery with Argo Rollouts

```yaml
# Install Argo Rollouts (companion to ArgoCD)
kubectl create namespace argo-rollouts
kubectl apply -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml

# Rollout resource replaces Deployment for progressive delivery
apiVersion: argoproj.io/v1alpha1
kind: Rollout
metadata:
  name: my-app
spec:
  replicas: 10
  selector:
    matchLabels: { app: my-app }
  template:
    spec:
      containers:
      - name: app
        image: myapp:1.0
        resources:
          requests: { cpu: 100m, memory: 128Mi }

  strategy:
    canary:
      # Shift traffic gradually
      steps:
        - setWeight: 10           # 10% to new version
        - pause: { duration: 5m } # Wait 5 minutes
        - setWeight: 25
        - pause: { duration: 10m }
        - analysis:               # Run automated analysis
            templates:
              - templateName: success-rate
            args:
              - name: service-name
                value: my-app
        - setWeight: 50
        - pause: {}               # Pause indefinitely (manual approval)
        - setWeight: 100

      # Traffic routing with Nginx
      trafficRouting:
        nginx:
          stableIngress: my-app-stable
          annotationPrefix: nginx.ingress.kubernetes.io

      # Automatic rollback on failure
      antiAffinity:
        requiredDuringSchedulingIgnoredDuringExecution: {}
```

```yaml
# Analysis Template — automated quality gate
apiVersion: argoproj.io/v1alpha1
kind: AnalysisTemplate
metadata:
  name: success-rate
spec:
  args:
    - name: service-name
  metrics:
    - name: success-rate
      interval: 1m
      count: 5                  # Run 5 times
      successCondition: result[0] >= 0.95   # 95% success rate
      failureLimit: 1
      provider:
        prometheus:
          address: http://prometheus:9090
          query: |
            sum(rate(http_requests_total{service="{{args.service-name}}",status!~"5.."}[2m]))
            / sum(rate(http_requests_total{service="{{args.service-name}}"}[2m]))
```

## High Availability Setup

```yaml
# ArgoCD HA mode — for production clusters
# Replaces single-instance install

# 3 replica API server
apiVersion: apps/v1
kind: Deployment
metadata:
  name: argocd-server
  namespace: argocd
spec:
  replicas: 3
  template:
    spec:
      containers:
      - name: argocd-server
        args:
          - argocd-server
          - --staticassets
          - /shared/app
          - --repo-server-timeout-seconds
          - "300"

# Redis HA (Sentinel mode)
# argocd-redis-ha chart handles this
helm install argocd-redis-ha bitnami/redis \
    --set sentinel.enabled=true \
    --set replica.replicaCount=3
```

## GitOps Security — Least Privilege

```bash
# ArgoCD repo-server runs with read-only access to Git
# ArgoCD application controller needs limited cluster access

# Create minimal RBAC for application controller
kubectl create clusterrole argocd-application-controller \
    --verb=get,list,watch,create,update,patch,delete \
    --resource=deployments,services,configmaps,secrets,pods,replicasets

# Separate service accounts per project
# Each AppProject can have its own service account

# Disable admin account in production
argocd account update-password --account admin --current-password xxx --new-password yyy
# Better: disable admin entirely, use SSO
kubectl patch configmap argocd-cm -n argocd -p '{"data": {"admin.enabled": "false"}}'
```

## SSO Integration (GitHub/Google)

```yaml
# argocd-cm ConfigMap — OIDC with GitHub
apiVersion: v1
kind: ConfigMap
metadata:
  name: argocd-cm
  namespace: argocd
data:
  url: https://argocd.yourdomain.com
  oidc.config: |
    name: GitHub
    issuer: https://github.com
    clientID: $oidc.github.clientID
    clientSecret: $oidc.github.clientSecret
    requestedScopes:
      - openid
      - profile
      - email
      - read:org

---
# argocd-rbac-cm — map SSO groups to ArgoCD roles
apiVersion: v1
kind: ConfigMap
metadata:
  name: argocd-rbac-cm
  namespace: argocd
data:
  policy.csv: |
    # GitHub org/team → ArgoCD role mapping
    g, myorg:platform-team, role:admin
    g, myorg:backend-team, proj:team-backend:developer
    g, myorg:frontend-team, proj:team-frontend:developer
  policy.default: role:readonly    # Default role for authenticated users
```
