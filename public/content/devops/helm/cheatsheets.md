# Helm Quick Reference

```bash
# Install/Upgrade
helm install myapp ./chart -f values.yaml -n production
helm upgrade myapp ./chart -f values.yaml --install -n production
helm upgrade myapp ./chart --set image.tag=v2.0 --atomic

# View
helm list -A
helm status myapp -n production
helm history myapp -n production
helm get values myapp -n production
helm get manifest myapp -n production

# Rollback
helm rollback myapp 2 -n production   # rollback to revision 2

# Test
helm template myapp ./chart -f values.yaml    # render without applying
helm lint ./chart                              # lint for errors
helm diff upgrade myapp ./chart              # show diff (helm-diff plugin)
helm test myapp -n production                 # run test hooks

# Registry (OCI)
helm registry login registry.example.com
helm push mychart-0.1.0.tgz oci://registry.example.com/charts
helm install myapp oci://registry.example.com/charts/mychart --version 0.1.0

# Chart structure
# Chart.yaml    — metadata (name, version, description)
# values.yaml   — default values
# templates/    — Kubernetes YAML templates with {{ }} expressions
# charts/       — dependency charts
```
