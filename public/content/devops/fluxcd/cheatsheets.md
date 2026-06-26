# FluxCD Cheatsheet

```bash
# Install
flux install
flux check

# Bootstrap (GitHub)
flux bootstrap github --owner=<org> --repository=<repo> --path=clusters/production

# Sources
flux create source git myapp --url=https://github.com/org/repo --branch=main
flux get sources git

# Kustomization
flux create kustomization myapp --source=myapp --path=./k8s --prune=true --interval=5m
flux get kustomizations
flux reconcile kustomization myapp

# HelmRelease
flux create helmrelease myapp --chart=myapp --source=HelmRepository/stable --chart-version=">=1.0.0"
flux get helmreleases

# Debug
flux logs --all-namespaces
flux events
```
