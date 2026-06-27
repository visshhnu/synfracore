# OpenShift Troubleshooting Guide

## Issue 1: Pod stuck in Error or CrashLoopBackOff in OpenShift

**Symptom:** `oc get pods` shows `STATUS: CrashLoopBackOff` or `Error`. Pod keeps restarting.

**Root cause:** Application crash, missing ConfigMap/Secret, or Security Context Constraint (SCC) blocking container execution.

**Debug steps:**
```bash
# Check pod events and status
oc describe pod <pod-name> -n <project>

# Read container logs
oc logs <pod-name> -n <project>
oc logs <pod-name> -n <project> --previous

# Check SCC violations (common in OpenShift)
oc get events -n <project> | grep SCC
oc get pod <pod-name> -o yaml | grep -i scc
```

**Fix:**
```bash
# SCC issue: pod needs elevated privileges
oc adm policy add-scc-to-serviceaccount anyuid -z default -n <project>
# Or create ServiceAccount and bind specific SCC
oc create sa myapp-sa -n <project>
oc adm policy add-scc-to-serviceaccount privileged -z myapp-sa -n <project>

# Then update deployment to use SA
oc set serviceaccount deployment/myapp myapp-sa -n <project>
```

**Prevention:** Use custom SCC with minimal permissions instead of `anyuid`. Use `oc adm policy who-can use scc/anyuid` to audit.

---

## Issue 2: Route not accessible — 503 Application Not Available

**Symptom:** Accessing the OpenShift Route URL returns `503 Application Not Available` or HAProxy timeout.

**Root cause:** Service has no healthy endpoints, wrong target port in Route, or Pod not in Ready state.

**Debug steps:**
```bash
# Check if service has endpoints
oc get endpoints <service-name> -n <project>

# Check route → service mapping
oc describe route <route-name> -n <project>
# Look for: Service, Target Port, TLS settings

# Check pod readiness
oc get pods -n <project> -o wide
oc describe pod <pod-name> | grep -A5 "Readiness"

# Test service directly from within cluster
oc run test --image=busybox --restart=Never -- wget -O- http://<service>:<port>
```

**Fix:**
```bash
# Ensure Route target port matches container port
oc patch route myapp -p '{"spec":{"port":{"targetPort":"8080-tcp"}}}'

# Add readinessProbe if missing
oc set probe deployment/myapp   --readiness --get-url=http://:8080/health   --period-seconds=10 --failure-threshold=3
```

---

## Issue 3: ImagePullBackOff — cannot pull from internal registry

**Symptom:** Pod shows `ImagePullBackOff`. Event shows `unauthorized: authentication required`.

**Root cause:** Missing pull secret, wrong registry URL, or image not pushed to correct project namespace.

**Debug steps:**
```bash
# Check pod events
oc describe pod <pod-name> | grep -A5 "Events"

# Verify image exists in registry
oc get imagestream -n <project>
oc get imagestreamtag <name>:<tag> -n <project>

# Check pull secret
oc get secrets -n <project> | grep pull
oc get sa default -n <project> -o yaml | grep imagePullSecret
```

**Fix:**
```bash
# Link pull secret to service account
oc secrets link default <pull-secret-name> --for=pull -n <project>

# For external registry: create secret
oc create secret docker-registry my-registry-secret   --docker-server=registry.example.com   --docker-username=user   --docker-password=pass   -n <project>
oc secrets link default my-registry-secret --for=pull
```

---

## Issue 4: Builds failing — BuildConfig stuck or erroring

**Symptom:** `oc get builds` shows `Failed` or `Pending`. Source-to-Image (S2I) builds fail.

**Debug steps:**
```bash
# Check build logs
oc logs build/<build-name> -n <project>
oc logs bc/<buildconfig-name> -n <project>

# Get build events
oc describe build <build-name> -n <project>

# Check builder pod
oc get pods -n <project> | grep build
oc logs <build-pod-name> -n <project>
```

**Fix:**
```bash
# Trigger new build with more verbosity
oc start-build <buildconfig-name> --follow -n <project>

# If S2I fails on dependencies: clear cache
oc start-build <buildconfig-name> --build-arg=NOCACHE=1

# Fix resource limits if OOMKilled
oc set resources bc/<name> --limits=memory=1Gi --requests=memory=512Mi
```

---

## Issue 5: Project namespace stuck in Terminating

**Symptom:** `oc get projects` shows project stuck in `Terminating` for hours.

**Root cause:** Finalizers on resources (often custom resources) blocking namespace deletion.

**Debug steps:**
```bash
# Check what's still in the namespace
oc get all -n <project>
oc api-resources --verbs=list --namespaced -o name |   xargs -I{} oc get {} -n <project> 2>/dev/null | grep -v "No resources"

# Check for stuck finalizers
oc get namespace <project> -o yaml | grep finalizers -A5
```

**Fix:**
```bash
# Remove finalizers from stuck resources (example: CRD instances)
oc patch <resource>/<name> -n <project>   -p '{"metadata":{"finalizers":[]}}' --type=merge

# Nuclear option: force remove namespace finalizer
kubectl get namespace <project> -o json |   jq '.spec.finalizers = []' |   kubectl replace --raw /api/v1/namespaces/<project>/finalize -f -
```

**Prevention:** Always delete CRD instances before the CRD itself. Use `oc delete namespace` and wait for completion before recreating.
