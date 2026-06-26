# Argo Rollouts Cheatsheet

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Rollout
spec:
  replicas: 10
  strategy:
    canary:
      steps:
      - setWeight: 10       # 10% traffic to new version
      - pause: {duration: 5m}
      - analysis:
          templates: [{templateName: success-rate}]
      - setWeight: 50
      - pause: {duration: 10m}
      - setWeight: 100
      canaryService: myapp-canary
      stableService: myapp-stable
---
kubectl argo rollouts get rollout myapp
kubectl argo rollouts promote myapp
kubectl argo rollouts abort myapp
kubectl argo rollouts undo myapp
```
