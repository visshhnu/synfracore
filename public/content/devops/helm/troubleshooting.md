# Helm Troubleshooting Guide

## Issue 1: Release stuck in pending-upgrade state

**Symptom:** `helm status myapp` shows `STATUS: pending-upgrade` — no rollback or upgrade possible.

**Root Cause:** A previous upgrade was interrupted (pod OOMKilled, network timeout, CI canceled).

**Fix:**
```bash
# Check release history
helm history myapp -n production

# Roll back to last good revision
helm rollback myapp 2 -n production   # or whatever last good revision was

# If rollback fails too (stuck state), force-reset:
kubectl delete secret -n production -l "owner=helm,name=myapp,status=pending-upgrade"
# Then retry the upgrade
helm upgrade myapp ./chart -n production
```

---

## Issue 2: Template rendering error

**Symptom:** `Error: template: mychart/templates/deployment.yaml:23:14: executing ... error calling ...`

**Debug steps:**
```bash
# Render templates without installing
helm template myapp ./chart -f values.yaml 2>&1

# Lint for issues
helm lint ./chart -f values.yaml

# Debug specific value
helm template myapp ./chart --set image.tag=v1.0 --debug 2>&1 | head -50
```

**Common template errors:**
```yaml
# Wrong: accessing non-existent key
{{ .Values.config.database.host }}  # fails if config.database doesn't exist

# Right: use default or check existence
{{ .Values.config.database.host | default "localhost" }}
{{ if .Values.config.database }}{{ .Values.config.database.host }}{{ end }}
```

---

## Issue 3: Values not taking effect after upgrade

**Symptom:** `helm upgrade` succeeds but the deployment still uses old values.

**Debug steps:**
```bash
# Check what values are actually set
helm get values myapp -n production

# Check merged values (user + chart defaults)
helm get values myapp -n production --all
```

**Fix:**
```bash
# Ensure you're passing values correctly
helm upgrade myapp ./chart     -f values.yaml \              # base values
    -f values-production.yaml \   # environment override
    --set image.tag=$(git rev-parse --short HEAD)  # runtime override

# --set overrides -f files
# Later -f files override earlier -f files
```

---

## Issue 4: Chart dependency not found

**Symptom:** `Error: found in Chart.yaml, but missing in charts/ directory: postgresql`

**Fix:**
```bash
helm dependency update ./chart   # downloads dependencies to charts/ dir
helm dependency list ./chart     # verify status (ok/missing)

# In CI, always run dependency update before install/upgrade
helm dependency build ./chart
helm upgrade --install myapp ./chart
```

---

## Issue 5: imagePullBackOff after Helm upgrade

**Symptom:** Pods go into `ImagePullBackOff` state after a Helm upgrade.

**Debug steps:**
```bash
kubectl describe pod -l app=myapp -n production | grep -A10 Events
kubectl get events -n production --sort-by='.lastTimestamp' | tail -20
```

**Root Cause & Fix:**
```bash
# Check what image tag was set
helm get manifest myapp -n production | grep image:

# Wrong registry URL
helm upgrade myapp ./chart --set image.repository=registry.example.com/myapp

# Wrong tag
helm upgrade myapp ./chart --set image.tag=v1.2.3

# Image pull secret missing
kubectl create secret docker-registry regcred     --docker-server=registry.example.com     --docker-username=user     --docker-password=pass
# Then add to chart values.yaml:
# imagePullSecrets:
#   - name: regcred
```

**Prevention:**
- Use `--atomic` flag: rolls back automatically on failure
- Use `--wait`: waits for pods to be ready before marking success
```bash
helm upgrade --install myapp ./chart --atomic --wait --timeout=5m
```
