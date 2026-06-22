# ArgoCD Interview Questions

## Core Concepts

**Q: What is ArgoCD and how does it implement GitOps?**

ArgoCD is a declarative GitOps continuous delivery tool for Kubernetes. It follows the GitOps principle: Git is the single source of truth for both application code AND infrastructure configuration.

**GitOps principles ArgoCD implements:**
1. **Declarative**: Desired state described in Git (YAML manifests, Helm charts, Kustomize)
2. **Versioned and immutable**: Every change tracked in Git history — full auditability
3. **Pulled automatically**: ArgoCD continuously syncs cluster to match Git (pull, not push)
4. **Continuously reconciled**: ArgoCD detects drift and can auto-correct

**How it works:**
```
Developer pushes to Git → ArgoCD detects change → compares desired (Git) vs actual (K8s)
→ shows diff → syncs cluster to match Git → reports status
```

Without ArgoCD: CI pipeline pushes to cluster (push model — credentials in CI).
With ArgoCD: ArgoCD pulls from Git and pushes to cluster (no CI cluster access needed).

---

**Q: Explain ArgoCD architecture.**

```
[Git Repository] ← ArgoCD watches
[ArgoCD Server]
  ├── API Server: REST/gRPC API, web UI backend, auth
  ├── Repository Server: Clones repos, generates manifests (Helm, Kustomize, plain YAML)
  ├── Application Controller: Watches K8s state, compares with desired state, syncs
  └── Redis: Caching
[Kubernetes Cluster(s)] ← ArgoCD manages
```

ArgoCD runs in a Kubernetes cluster and can manage:
- The same cluster it runs in (in-cluster)
- External clusters (multi-cluster management)

---

**Q: What is an ArgoCD Application? Explain the spec.**

An `Application` is the core ArgoCD CRD — defines what to deploy and where.

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: my-app
  namespace: argocd
  finalizers:
    - resources-finalizer.argocd.argoproj.io  # Cascade deletes resources on app deletion
spec:
  project: default
  
  source:
    repoURL: https://github.com/myorg/myapp-config
    targetRevision: HEAD    # Branch, tag, or commit SHA
    path: manifests/prod    # Path within repo
    # OR for Helm:
    # chart: myapp
    # helm:
    #   values: |
    #     image.tag: v2.0
    
  destination:
    server: https://kubernetes.default.svc  # Target cluster
    namespace: production
    
  syncPolicy:
    automated:
      prune: true       # Delete resources removed from Git
      selfHeal: true    # Auto-correct drift (someone manually changed cluster)
    syncOptions:
      - CreateNamespace=true  # Create namespace if not exists
      - PrunePropagationPolicy=foreground
      
  ignoreDifferences:  # Don't consider these fields when detecting drift
    - group: apps
      kind: Deployment
      jsonPointers:
        - /spec/replicas  # Ignore replica count (managed by HPA)
```

---

**Q: Explain sync strategies — automated vs manual, and sync options.**

**Manual sync** (default): ArgoCD detects drift and reports `OutOfSync`. Operator reviews and manually clicks sync or runs `argocd app sync myapp`.

**Automated sync**: ArgoCD auto-syncs when Git changes.
```yaml
syncPolicy:
  automated:
    prune: false    # Don't delete resources removed from Git (safe default)
    selfHeal: false # Don't auto-correct manual cluster changes (safe default)
```

**Production recommendation**: 
- `prune: true` — important, or deleted resources stay forever
- `selfHeal: true` — dangerous if you make emergency cluster changes; consider disabling

**Sync options:**
- `--force`: Force sync even if no diff detected
- `--replace`: Replace resources (use `kubectl replace` instead of apply) — for immutable fields
- `RespectIgnoreDifferences`: Respect the `ignoreDifferences` spec during sync
- `ApplyOutOfSyncOnly`: Only apply changed resources (not all)

---

**Q: What is an AppProject? Why use them?**

AppProject provides multi-tenancy and RBAC in ArgoCD — restricts what applications can do.

```yaml
apiVersion: argoproj.io/v1alpha1
kind: AppProject
metadata:
  name: team-backend
  namespace: argocd
spec:
  description: Backend team's applications
  
  sourceRepos:          # Only these repos allowed
    - https://github.com/myorg/backend-*
    
  destinations:         # Only these clusters/namespaces
    - namespace: backend-*
      server: https://kubernetes.default.svc
      
  clusterResourceWhitelist:  # What cluster-level resources can be managed
    - group: ''
      kind: Namespace
      
  namespaceResourceBlacklist:  # What CAN'T be created in namespace
    - group: ''
      kind: ResourceQuota
      
  roles:
    - name: developer
      description: Can sync but not delete
      policies:
        - p, proj:team-backend:developer, applications, get, team-backend/*, allow
        - p, proj:team-backend:developer, applications, sync, team-backend/*, allow
      groups:
        - github-org:backend-team
```

---

**Q: Explain App of Apps pattern and ApplicationSet.**

**App of Apps**: One ArgoCD Application manages other ArgoCD Applications.
```yaml
# "root" application manages the applications themselves
source:
  path: argocd-apps/    # Contains Application CRDs
```
Use case: Bootstrap entire cluster by deploying one application that creates all others.

**ApplicationSet** (more powerful): Automatically generate Applications from a template.

```yaml
apiVersion: argoproj.io/v1alpha1
kind: ApplicationSet
metadata:
  name: guestbook
spec:
  generators:
    # Generate one app per cluster
    - clusters:
        selector:
          matchLabels:
            environment: production
    # OR generate one app per directory in repo
    - git:
        repoURL: https://github.com/myorg/apps
        revision: HEAD
        directories:
          - path: apps/*
    # OR generate from list
    - list:
        elements:
          - cluster: dev
            url: https://dev.cluster.local
          - cluster: prod
            url: https://prod.cluster.local
  template:
    metadata:
      name: '{{cluster}}-guestbook'
    spec:
      project: default
      source:
        path: guestbook
      destination:
        server: '{{url}}'
        namespace: guestbook
```

---

**Q: How does ArgoCD handle secrets?**

ArgoCD does NOT store secrets — it should never see secret values. Approaches:

1. **Sealed Secrets** (Bitnami): Encrypt secrets before committing to Git.
   ```bash
   kubeseal --cert=cert.pem < secret.yaml > sealed-secret.yaml
   # Commit sealed-secret.yaml to Git safely
   ```

2. **External Secrets Operator**: ArgoCD deploys ExternalSecret CRDs; operator pulls from Vault/AWS Secrets Manager at runtime.
   ```yaml
   apiVersion: external-secrets.io/v1beta1
   kind: ExternalSecret
   spec:
     secretStoreRef:
       name: vault-backend
     data:
       - secretKey: password
         remoteRef:
           key: myapp/db
           property: password
   ```

3. **Vault Agent Injection**: HashiCorp Vault sidecar injects secrets into pods.

4. **SOPS** (Mozilla Secrets OPerationS): Encrypt files in Git, decrypt during deployment.

---

**Q: How do you implement progressive delivery with ArgoCD?**

**ArgoCD Rollouts** (separate controller) enables advanced deployment strategies:

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Rollout
spec:
  strategy:
    canary:
      steps:
        - setWeight: 10          # Send 10% traffic to new version
        - pause: {duration: 5m}  # Wait 5 minutes
        - analysis:              # Run automated analysis
            templates:
              - templateName: success-rate
        - setWeight: 50          # Increase to 50%
        - pause: {duration: 10m}
        - setWeight: 100         # Full rollout
      trafficRouting:
        nginx:
          stableIngress: myapp-stable
```

**AnalysisTemplate**: Query Prometheus to decide whether to promote or abort.
```yaml
apiVersion: argoproj.io/v1alpha1
kind: AnalysisTemplate
spec:
  metrics:
    - name: success-rate
      interval: 1m
      successCondition: result[0] >= 0.95
      provider:
        prometheus:
          address: http://prometheus:9090
          query: |
            sum(rate(http_requests_total{status!~"5.."}[5m]))
            / sum(rate(http_requests_total[5m]))
```

## Revision Notes
```
GITOPS PRINCIPLES: Declarative + Versioned + Pull-based + Continuously reconciled

ARGOCD COMPONENTS:
API Server: UI/API | Repo Server: manifest generation | App Controller: sync engine

APPLICATION CRD: source(repo+path) + destination(cluster+namespace) + syncPolicy
SYNC POLICY:
automated: false = manual | prune: true = delete removed resources
selfHeal: true = auto-correct drift (careful with emergency changes)

APPPROJECT: multi-tenancy, RBAC, restrict repos/clusters/resources per team

APP OF APPS: root app manages other apps (bootstrap pattern)
APPLICATIONSET: generate apps from template (clusters, directories, lists)

SECRETS: Never in Git in plain text
Sealed Secrets: encrypt before Git | External Secrets: pull from Vault at runtime
SOPS: file-level encryption | Vault Agent: sidecar injection

PROGRESSIVE DELIVERY (ArgoCD Rollouts):
Canary: gradual traffic shift with automated analysis
Blue-Green: instant switch with rollback capability
AnalysisTemplate: query Prometheus metrics to decide promote/abort
```
