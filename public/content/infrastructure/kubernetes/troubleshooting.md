# Kubernetes Troubleshooting Guide

## Issue 1: CrashLoopBackOff

**Symptoms:** Pod status shows \`CrashLoopBackOff\`. Pod keeps restarting.

**Diagnosis:**
\`\`\`bash
kubectl describe pod <pod-name>    # Check Events section
kubectl logs <pod-name>            # Current logs
kubectl logs <pod-name> --previous # Logs from crashed container
\`\`\`

**Root Causes & Fixes:**

1. **Application error at startup** — Check logs for stack traces
2. **Missing environment variable/secret** — Check if referenced Secret/ConfigMap exists
3. **OOMKilled** — \`kubectl describe pod\` shows "OOMKilled", increase memory limits
4. **Liveness probe failing** — Check \`/health\` endpoint is responding correctly
5. **Wrong entrypoint/command** — Verify CMD in Dockerfile matches container spec
6. **Permission denied** — Check if container needs elevated permissions or file permissions

---

## Issue 2: Pod Stuck in Pending

**Symptoms:** Pod stays in \`Pending\` state, never starts.

\`\`\`bash
kubectl describe pod <pod-name>   # Look at Events
\`\`\`

**Root Causes:**

1. **Insufficient resources** — "0/3 nodes are available: insufficient memory"
   \`\`\`bash
   kubectl describe nodes | grep -A 5 "Allocated resources"
   kubectl get pods -A --field-selector=status.phase=Running | awk '{print $1, $2}' | head -20
   \`\`\`
   Fix: Add more nodes, reduce resource requests, or delete unused pods

2. **NodeSelector/Affinity mismatch** — Pod requires labels that no node has
   \`\`\`bash
   kubectl get nodes --show-labels
   \`\`\`

3. **Taint/Toleration mismatch** — Node is tainted, pod doesn't tolerate it
   \`\`\`bash
   kubectl describe nodes | grep Taints
   \`\`\`

4. **PVC not bound** — Pod needs storage that doesn't exist
   \`\`\`bash
   kubectl get pvc -n <namespace>
   kubectl describe pvc <pvc-name>
   \`\`\`

---

## Issue 3: ImagePullBackOff / ErrImagePull

\`\`\`bash
kubectl describe pod <pod-name>   # Shows exact error
\`\`\`

**Root Causes:**
1. **Wrong image name/tag** — Typo in image name
2. **Private registry, missing imagePullSecret**
   \`\`\`bash
   kubectl create secret docker-registry regcred \
     --docker-server=registry.io \
     --docker-username=user \
     --docker-password=pass
   # Add to pod spec:
   # imagePullSecrets:
   # - name: regcred
   \`\`\`
3. **Registry unreachable** — Network policy blocking egress

---

## Issue 4: Service Not Routing Traffic

\`\`\`bash
# 1. Check service exists and has correct selector
kubectl describe svc myservice

# 2. Check endpoints (should show pod IPs, not <none>!)
kubectl get endpoints myservice

# 3. Verify pod labels match service selector
kubectl get pods --show-labels | grep app=myapp

# 4. Test from inside cluster
kubectl run debug --image=curlimages/curl --rm -it -- \
  curl http://myservice.default.svc.cluster.local
\`\`\`

**Most common cause:** Labels on pods don't match the Service selector.

---

## Issue 5: Node NotReady

\`\`\`bash
kubectl describe node <node-name>   # Check conditions and events

# SSH to node and check
sudo systemctl status kubelet
sudo journalctl -u kubelet -f

# Common fixes
sudo systemctl restart kubelet
sudo systemctl restart containerd
\`\`\`

**Common causes:** kubelet crashed, disk pressure (disk > 85%), memory pressure, network plugin issues.

---

## Issue 6: Debugging Toolkit

\`\`\`bash
# Create a debug pod
kubectl run debug --image=ubuntu --rm -it -- bash

# Ephemeral container (K8s 1.23+)
kubectl debug -it <pod> --image=busybox --target=<container>

# Port forward to access service locally
kubectl port-forward svc/myservice 8080:80

# Copy files from pod
kubectl cp mypod:/var/log/app.log ./app.log

# Check cluster events (sorted by time)
kubectl get events --sort-by='.lastTimestamp' -A

# Watch pod status changes
kubectl get pods -w
\`\`\`