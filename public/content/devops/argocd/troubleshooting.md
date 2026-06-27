# ArgoCD Troubleshooting Guide

## Issue 1: Application stuck in Progressing state

**Symptom:** ArgoCD app shows `Status: Progressing` for more than 10 minutes. Never becomes Healthy.

**Root Cause:** Kubernetes resource not becoming ready — pods crash, pull errors, or health check failing.

**Debug steps:**
```bash
# Check ArgoCD application status
argocd app get myapp
argocd app logs myapp

# Check Kubernetes resources
kubectl get pods -n production -l app=myapp
kubectl describe pod <pod-name> -n production
kubectl get events -n production --sort-by='.lastTimestamp' | tail -20
```

**Fix:**
```bash
# Force sync to trigger fresh deployment
argocd app sync myapp --force

# Check if there's a health check customization needed
# In Application spec, add ignoreDifferences for non-critical fields
spec:
  ignoreDifferences:
    - group: apps
      kind: Deployment
      jsonPointers:
        - /spec/replicas   # if HPA manages replicas externally
```

---

## Issue 2: Out of Sync — ArgoCD shows diff but shouldn't

**Symptom:** ArgoCD shows `OutOfSync` on resources you didn't change. Constant sync loop.

**Root Cause:** Fields mutated by controllers (e.g., `kubectl.kubernetes.io/last-applied-configuration`), or resources managed by HPA/VPA.

**Fix:**
```yaml
# In Application or ApplicationSet:
spec:
  syncPolicy:
    syncOptions:
      - RespectIgnoreDifferences=true
  ignoreDifferences:
    - group: apps
      kind: Deployment
      managedFieldsManagers:
        - kube-controller-manager
    - group: ""
      kind: ServiceAccount
      jsonPointers:
        - /imagePullSecrets
```

---

## Issue 3: ArgoCD cannot connect to Git repository

**Symptom:** `ComparisonError: rpc error: code = Unknown desc = Failed to fetch`. Repository unreachable.

**Debug steps:**
```bash
# Test from ArgoCD server pod
kubectl exec -it argocd-server-pod -n argocd -- git ls-remote https://github.com/org/repo

# Check repository credentials
argocd repo list
argocd repo get https://github.com/org/repo
```

**Fix:**
```bash
# Re-add repository with credentials
argocd repo add https://github.com/org/repo   --username myuser   --password mytoken

# For SSH repositories
argocd repo add git@github.com:org/repo.git   --ssh-private-key-path ~/.ssh/id_rsa

# Check network policies allowing ArgoCD → GitHub
kubectl get networkpolicy -n argocd
```

---

## Issue 4: Sync failing — resource already exists

**Symptom:** Sync fails with `the server was unable to create resource... already exists`.

**Root Cause:** Resource exists in cluster but was not created by ArgoCD (no ArgoCD labels).

**Fix:**
```bash
# Option 1: Import existing resources to ArgoCD management
kubectl annotate deployment myapp -n production   argocd.argoproj.io/managed-by=myapp-argocd-project

# Option 2: Delete and let ArgoCD recreate
kubectl delete deployment myapp -n production
argocd app sync myapp

# Option 3: Use --replace flag in sync
argocd app sync myapp --replace
```

---

## Issue 5: ArgoCD image updater not updating image tag

**Symptom:** New image pushed to registry but ArgoCD Image Updater doesn't update the deployment.

**Debug steps:**
```bash
# Check Image Updater logs
kubectl logs -n argocd -l app.kubernetes.io/name=argocd-image-updater --tail=100

# Check Application annotations
kubectl get application myapp -n argocd -o yaml | grep image-updater

# Verify registry access
kubectl exec -it argocd-image-updater-pod -n argocd --   argocd-image-updater test --registries ghcr.io/org/myapp
```

**Fix:**
```yaml
# Ensure correct annotations on ArgoCD Application
metadata:
  annotations:
    argocd-image-updater.argoproj.io/image-list: myapp=ghcr.io/org/myapp
    argocd-image-updater.argoproj.io/myapp.update-strategy: semver
    argocd-image-updater.argoproj.io/myapp.tag-match: v*
    argocd-image-updater.argoproj.io/myapp.allow-tags: "regexp:^v[0-9]+\.[0-9]+\.[0-9]+"
```
