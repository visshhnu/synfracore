# Kubernetes -- Portfolio Projects

Three projects that prove production Kubernetes skills. These mirror what you will build at any company using K8s.

---

## Project 1: Stateful WordPress on Kubernetes

**Level:** Beginner | **Time:** 1-2 days | **GitHub:** `k8s-stateful-wordpress`

**What you build:** WordPress + MySQL on Kubernetes using Deployments, PersistentVolumeClaims, ConfigMaps, and Secrets.

### Key manifests
```yaml
# secret.yaml
apiVersion: v1
kind: Secret
metadata: {name: mysql-secret}
type: Opaque
data:
  password: BASE64_ENCODED_PASSWORD

---
# mysql-pvc.yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata: {name: mysql-pvc}
spec:
  accessModes: [ReadWriteOnce]
  resources:
    requests: {storage: 10Gi}

---
# mysql-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata: {name: mysql}
spec:
  replicas: 1
  selector:
    matchLabels: {app: mysql}
  template:
    spec:
      containers:
      - name: mysql
        image: mysql:8.0
        env:
        - name: MYSQL_ROOT_PASSWORD
          valueFrom:
            secretKeyRef: {name: mysql-secret, key: password}
        volumeMounts:
        - name: storage
          mountPath: /var/lib/mysql
      volumes:
      - name: storage
        persistentVolumeClaim:
          claimName: mysql-pvc
```

### Steps
1. Set up minikube or kind cluster locally
2. Write all manifests by hand (no Helm yet)
3. Apply in order: Secret, PVC, Deployment, Service
4. Test persistence: delete pod, verify data survives restart
5. Add Ingress with host-based routing
6. Add HPA for WordPress (not MySQL)
7. Write troubleshooting guide for CrashLoopBackOff

---

## Project 2: GitOps Platform with ArgoCD

**Level:** Intermediate | **Time:** 3 days | **GitHub:** `k8s-gitops-platform`

**What you build:** A GitOps-managed cluster where ALL changes go through Git, ArgoCD auto-syncs, and self-heals drift.

### Repository structure
```
k8s-gitops-platform/
+-- apps/
|   +-- api/ (deployment.yaml, service.yaml, hpa.yaml)
|   +-- monitoring/ (prometheus.yaml, grafana.yaml)
+-- infra/
|   +-- argocd/
|   +-- cert-manager/
+-- argocd-apps/
    +-- api.yaml
    +-- monitoring.yaml
```

### ArgoCD Application
```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: production-api
  namespace: argocd
spec:
  source:
    repoURL: https://github.com/yourname/k8s-gitops-platform
    targetRevision: HEAD
    path: apps/api
  destination:
    server: https://kubernetes.default.svc
    namespace: production
  syncPolicy:
    automated:
      prune: true       # Delete resources removed from Git
      selfHeal: true    # Fix manual kubectl changes
```

### Steps
1. Install ArgoCD on the cluster
2. Push K8s manifests to GitHub
3. Create ArgoCD Application pointing to repo
4. Make a change in Git, watch ArgoCD auto-sync
5. Try `kubectl delete deployment api` -- ArgoCD restores it
6. Add Slack notifications for sync events
7. Add ApplicationSet for dev/staging/prod namespaces

---

## Project 3: Custom Kubernetes Operator

**Level:** Advanced | **Time:** 4-5 days | **GitHub:** `database-provisioner-operator`

**What you build:** A Kubernetes Operator that provisions PostgreSQL on demand via a custom `DatabaseClaim` CRD.

### Custom Resource
```yaml
apiVersion: db.synfracore.io/v1
kind: DatabaseClaim
metadata: {name: my-app-db, namespace: team-backend}
spec:
  engine: postgres
  size: small
  dbName: myappdb
# Operator sees this and provisions a full PostgreSQL StatefulSet + Service + Secret automatically
```

### Steps
1. Scaffold with Kubebuilder: `kubebuilder init && kubebuilder create api`
2. Implement Reconcile loop (compare desired vs actual state)
3. On DatabaseClaim created: deploy PostgreSQL + create Secret with credentials
4. On DatabaseClaim deleted: clean up all resources
5. Add status conditions: Provisioning, Ready, Failed
6. Write unit tests with envtest
7. Package as Helm chart

---

## Portfolio Checklist
- [ ] Architecture diagram in every README
- [ ] `kubectl apply -f .` works from a clean cluster
- [ ] Project 2 demonstrates live GitOps (commit to Git triggers deploy)
- [ ] Can explain: StatefulSet vs Deployment for databases
- [ ] HPA configured and tested with load testing
