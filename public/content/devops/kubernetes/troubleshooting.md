# Kubernetes Troubleshooting Guide

## Issue 1: Pod stuck in CrashLoopBackOff

**Symptom:** `kubectl get pods` shows `STATUS: CrashLoopBackOff`. Pod restarts repeatedly.

**Root cause:** Application crashes on startup — misconfigured environment variables, missing config/secrets, dependency not reachable, or OOMKilled.

**Debug steps:**
```bash
# Check exit code and reason
kubectl describe pod <pod-name> -n <namespace>
# Look for: "Last State", "Exit Code", "Reason"
# Exit code 137 = OOMKilled; Exit code 1 = app error; Exit code 2 = config error

# Read logs from the crashing container
kubectl logs <pod-name> -n <namespace>
kubectl logs <pod-name> -n <namespace> --previous  # logs from last crash

# If container exits too fast to get logs:
kubectl run debug --image=busybox --restart=Never -- sleep 3600
kubectl exec -it debug -- sh  # inspect from inside
```

**Fix patterns:**
```bash
# OOMKilled: increase memory limit
kubectl set resources deployment myapp --limits=memory=512Mi

# Missing secret: check if secret exists
kubectl get secret my-secret -n production
kubectl describe secret my-secret | grep Data

# Config error: override command to debug
# In deployment spec:
command: ["sleep", "infinity"]   # override to keep container alive for inspection
```

**Prevention:** Set readinessProbe — pod won't receive traffic until healthy. Set resource requests/limits. Test locally with same env vars.

---

## Issue 2: Pod stuck in Pending state

**Symptom:** Pod shows `STATUS: Pending` indefinitely. Never gets scheduled.

**Root cause:** Insufficient cluster resources (CPU/memory), node selector or affinity rules not matching, PVC not bound, or namespace resource quota exceeded.

**Debug steps:**
```bash
kubectl describe pod <pod-name> -n <namespace>
# Look at Events section at the bottom:
# "0/3 nodes are available: 3 Insufficient cpu" → need more CPU
# "0/3 nodes are available: node(s) didn't match node selector" → selector mismatch
# "persistentvolumeclaim not found" → PVC missing

# Check node resources
kubectl describe nodes | grep -A5 "Allocated resources"

# Check resource quotas
kubectl describe resourcequota -n <namespace>
```

**Fix:**
```bash
# Scale up node group (EKS example)
aws eks update-nodegroup-config --cluster mycluster   --nodegroup-name workers   --scaling-config minSize=2,maxSize=10,desiredSize=5

# Remove tight node selector if blocking
kubectl patch deployment myapp -p '{"spec":{"template":{"spec":{"nodeSelector":null}}}}'

# Delete and recreate stuck PVC
kubectl delete pvc my-pvc
kubectl apply -f pvc.yaml
```

---

## Issue 3: Service not routing traffic to pods

**Symptom:** `curl http://my-service:8080` → `Connection refused`. Pod is Running. Service exists.

**Root cause:** Label selector mismatch between Service and Pods, wrong port, or endpoints empty.

**Debug steps:**
```bash
# Check endpoints — empty = selector doesn't match any pods
kubectl get endpoints my-service -n production
# Should show pod IPs: "10.0.0.5:8080,10.0.0.6:8080"
# If empty: selector is wrong

# Compare service selector vs pod labels
kubectl describe service my-service | grep Selector
kubectl get pods --show-labels | grep <app-name>

# Test from inside cluster
kubectl run test --image=busybox --restart=Never -- wget -O- http://my-service:8080
```

**Fix:**
```yaml
# Ensure service selector matches pod labels exactly
# Service:
spec:
  selector:
    app: myapp       # must match exactly
    version: v1      # all labels in selector must match

# Pod (in deployment template):
metadata:
  labels:
    app: myapp
    version: v1      # must have ALL labels the service selects on
```

---

## Issue 4: RBAC — Forbidden errors for service accounts

**Symptom:** Pod logs show `RBAC: user "system:serviceaccount:ns:myapp" is forbidden to get pods`.

**Root cause:** Service account missing role binding, wrong namespace, or cluster-scoped resource needing ClusterRole.

**Debug steps:**
```bash
# Test permissions for service account
kubectl auth can-i list pods   --as=system:serviceaccount:production:myapp-sa   -n production

# List role bindings for namespace
kubectl get rolebindings,clusterrolebindings -n production   -o wide | grep myapp
```

**Fix:**
```yaml
# Create Role and bind to service account
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: myapp-role
  namespace: production
rules:
  - apiGroups: [""]
    resources: ["pods", "configmaps"]
    verbs: ["get", "list", "watch"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: myapp-rolebinding
  namespace: production
subjects:
  - kind: ServiceAccount
    name: myapp-sa
    namespace: production
roleRef:
  kind: Role
  apiGroup: rbac.authorization.k8s.io
  name: myapp-role
```

---

## Issue 5: kubectl commands slow or API server timeout

**Symptom:** `kubectl get pods` takes 30+ seconds. API server logs show high latency.

**Root cause:** etcd performance degradation, too many watch connections, large secret/configmap, or cluster overloaded.

**Debug steps:**
```bash
# Check API server latency
kubectl get --raw /metrics | grep apiserver_request_duration

# Check etcd health
kubectl exec -it etcd-master -n kube-system -- etcdctl endpoint health

# Check component status
kubectl get componentstatuses
kubectl top nodes
kubectl top pods -n kube-system
```

**Fix:**
```bash
# Compact etcd if fragmented
ETCDCTL_API=3 etcdctl defrag --endpoints=https://127.0.0.1:2379   --cacert=/etc/kubernetes/pki/etcd/ca.crt   --cert=/etc/kubernetes/pki/etcd/server.crt   --key=/etc/kubernetes/pki/etcd/server.key

# Reduce watch connections: check for excessive list-watch calls
kubectl get events -A --field-selector reason=BackOff | wc -l

# Restart API server pod if unresponsive (kubeadm clusters)
mv /etc/kubernetes/manifests/kube-apiserver.yaml /tmp/
sleep 10
mv /tmp/kube-apiserver.yaml /etc/kubernetes/manifests/
```

**Prevention:** Monitor etcd disk I/O — it must have fast SSDs (< 10ms write latency). Set API server --max-requests-inflight. Use Vertical Pod Autoscaler for kube-system components.
