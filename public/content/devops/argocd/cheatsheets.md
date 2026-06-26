# ArgoCD Quick Reference

```bash
# ArgoCD CLI
argocd login argocd.example.com
argocd app list
argocd app get myapp
argocd app sync myapp
argocd app sync myapp --force
argocd app rollback myapp 5
argocd app history myapp
argocd app delete myapp

# App of Apps
kubectl apply -f root-app.yaml -n argocd

# ArgoCD Application manifest
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: myapp
  namespace: argocd
spec:
  project: default
  source:
    repoURL: https://github.com/org/repo
    targetRevision: HEAD
    path: k8s/overlays/production
  destination:
    server: https://kubernetes.default.svc
    namespace: production
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
    - CreateNamespace=true
```
