# Kubernetes — Production Hardening, RBAC & HPA

KUBERNETES & AKS (25 Questions)

---

**Q7. What is the difference between AKS system node pool and user node pool?**

**A:**
| | System Node Pool | User Node Pool |
|---|---|---|
| Purpose | Runs Kubernetes system pods | Runs application workloads |
| Required | Yes — at least one mandatory | Optional |
| OS | Linux only | Linux or Windows |
| Taint | CriticalAddonsOnly=true | No taint by default |
| What runs | CoreDNS, kube-proxy, metrics-server | Your application pods |

**Best practice:** Never run application pods on system node pool. Use taint `CriticalAddonsOnly=true:NoSchedule` — prevents app pods from scheduling there.

**Where configured:**
```bash
az aks nodepool add --cluster-name myaks \
  --name apppool --mode User \
  --node-count 3 --vm-size Standard_D4s_v3 \
  --enable-cluster-autoscaler --min-count 2 --max-count 10
```

**Real challenge:** System pods evicted because app pods consumed all node resources. Solution: Always use separate node pools. Add resource quotas to application namespaces.

---

**Q8. How does Cluster Autoscaler work in AKS? What are its limitations?**

**A:** Cluster Autoscaler (CA) automatically adds or removes nodes based on pod scheduling demands.

**Scale-up trigger:** A pod is in Pending state because no node has enough resources → CA provisions a new node from the VMSS node pool.

**Scale-down trigger:** A node has been underutilised (below 50% CPU and memory) for 10 minutes → CA evicts pods and removes the node.

**Limitations:**
1. Scale-up takes 3-5 minutes (VM provisioning time) — not instant like HPA
2. Cannot scale below minimum node count
3. Pods with PodDisruptionBudgets may block scale-down
4. Node with local storage (emptyDir, hostPath) — CA won't remove it
5. DaemonSet pods count against utilisation but CA ignores them for scale-down

**Where configured:**
```bash
az aks update --enable-cluster-autoscaler \
  --min-count 2 --max-count 20 \
  --name myaks --resource-group myrg
```

**Real challenge:** CA not triggering even though pods are Pending. Check: pods might have node selector or affinity rules that no existing node satisfies — CA cannot create a node matching those constraints.

---

**Q9. What is Workload Identity in AKS and why is it better than using Service Principals?**

**A:** Workload Identity allows pods to authenticate to Azure services (Key Vault, Storage, SQL) using a Kubernetes ServiceAccount federated with Azure Managed Identity — no stored credentials.

**Why better than Service Principals:**
| Service Principal | Workload Identity |
|---|---|
| client_id + client_secret stored somewhere | No secrets stored anywhere |
| Secret expires — must rotate | Tokens are short-lived (1 hour), auto-renewed |
| Secret can leak to Git/logs | Nothing to leak |
| All pods share one credential | Each pod type gets its own identity |
| Manual rotation needed | Automatic — Azure handles it |

**How it works:**
1. AKS cluster enabled with OIDC issuer — acts as token issuer
2. Create Azure Managed Identity
3. Create Kubernetes ServiceAccount
4. Federate them: "trust tokens from this AKS + this ServiceAccount"
5. Pod uses ServiceAccount → gets Azure token → accesses Key Vault

**Where configured:**
```bash
# Enable on AKS
az aks update --enable-oidc-issuer --enable-workload-identity -n myaks -g myrg

# Federate identity with K8s ServiceAccount
az identity federated-credential create \
  --identity-name payment-identity \
  --issuer $OIDC_ISSUER \
  --subject "system:serviceaccount:production:payment-sa"
```

**Real challenge:** Workload Identity token not being injected into pod. Check: pod's ServiceAccount must have annotation `azure.workload.identity/client-id` AND pod must have label `azure.workload.identity/use: "true"`.

---

**Q10. How do you implement Zero Trust network security in Kubernetes?**

**A:** Zero Trust in Kubernetes = deny all traffic by default, allow only explicitly defined paths.

**Step 1 — Default deny all ingress and egress in every namespace:**
```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: default-deny-all
  namespace: payment-ns
spec:
  podSelector: {}       # applies to ALL pods in namespace
  policyTypes:
  - Ingress
  - Egress
```

**Step 2 — Allow only what is needed:**
```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-payment-to-db
  namespace: payment-ns
spec:
  podSelector:
    matchLabels:
      app: payment-api    # FROM: payment API pods
  policyTypes:
  - Egress
  egress:
  - to:
    - podSelector:
        matchLabels:
          app: payment-db   # TO: only payment database pods
    ports:
    - port: 5432
```

**Step 3 — Allow DNS (port 53) — otherwise nothing resolves:**
```yaml
egress:
- to:
  - namespaceSelector:
      matchLabels:
        kubernetes.io/metadata.name: kube-system
  ports:
  - port: 53
    protocol: UDP
```

**Where configured:** NetworkPolicy YAML in each namespace. For AKS use Azure CNI with Calico or Azure Network Policy eng

---

## Advanced Kubernetes Patterns

KUBERNETES — Deep Troubleshooting**

**Q: Pod is in ****CrashLoopBackOff****. How do you troubleshoot?**

# Step 1: Check pod status and events

kubectl get pod <pod-name> -n <namespace>

kubectl describe pod <pod-name> -n <namespace>

# Step 2: Check logs — current and previous crash

kubectl logs <pod-name> -n <namespace>

kubectl logs <pod-name> -n <namespace> --previous

# Step 3: Check resource limits (OOMKilled is common cause)

kubectl get pod <pod-name> -o jsonpath='{.spec.containers[*].resources}'

# Step 4: Exec into pod if it starts briefly

kubectl exec -it <pod-name> -- /bin/sh

# Step 5: Check ConfigMaps/Secrets mounted correctly

kubectl get configmap <name> -o yaml

kubectl get secret <name> -o yaml | base64 --decode

**Your answer:** "In our HPE/Vodafone environment running 50+ pods, I dealt with this regularly. Most common causes were OOMKilled (fix: adjust memory limits), missing environment variables from misconfigured secrets, or application startup failures. I always check --previous logs first as the current logs may be empty after restart."

**Q: Node is ****NotReady****. What do you do?**

# Step 1: Check node status

kubectl get nodes

kubectl describe node <node-name>

# Step 2: Check node conditions

kubectl get node <node-name> -o jsonpath='{.status.conditions}'

# Step 3: SSH to node and check kubelet

systemctl status kubelet

journalctl -u kubelet -n 100

# Step 4: Check disk/memory pressure

df -h

free -m

top

# Step 5: Check container runtime

systemctl status containerd   # or docker

crictl ps

# Step 6: Check network plugin (CNI)

kubectl get pods -n kube-system | grep -i cni

**Your answer:** "Common causes are kubelet crash, disk pressure, memory pressure, or CNI plugin failure. I check kubelet logs first — in our production environment this was usually disk pressure on /var/lib/docker or a network plugin issue."

**Q: Deployment is stuck — pods not rolling out. How do you debug?**

# Check rollout status

kubectl rollout status deployment/<name> -n <namespace>

# Check deployment events

kubectl describe deployment <name> -n <namespace>

# Check if new ReplicaSet is created

kubectl get rs -n <namespace>

# Check if image pull is failing

kubectl get events -n <namespace> --sort-by='.lastTimestamp'

# Rollback if needed

kubectl rollout undo deployment/<name> -n <namespace>

# Check rollout history

kubectl rollout history deployment/<name> -n <namespace>

**Q: How do you debug a service that is not reachable inside the cluster?**

# Step 1: Check service exists and has endpoints

kubectl get svc <service-name> -n <namespace>

kubectl get endpoints <service-name> -n <namespace>

# Step 2: Check pod labels match service selector

kubectl get pods --show-labels -n <namespace>

kubectl describe svc <service-name> -n <namespace>

# Step 3: Test connectivity from another pod

kubectl run test-pod --image=busybox --rm -it -- wget -qO- http://<service-name>:<port>

# Step 4: Check NetworkPolicy blocking traffic

kubectl get networkpolicy -n <namespace>

# Step 5: Check kube-proxy

kubectl get pods -n kube-system | grep kube-proxy

kubectl logs -n kube-system <kube-proxy-pod>

**Q: How do you handle ****PersistentVolume**** issues — pod stuck in Pending?**

# Check PVC status

kubectl get pvc -n <namespace>

kubectl describe pvc <pvc-name> -n <namespace>

# Check StorageClass

kubectl get storageclass

kubectl describe storageclass <name>

# Check PV availability

kubectl get pv

# Common issues:

# 1. StorageClass not found → check spelling in PVC spec

# 2. No available PV matching request → check capacity/access mode

# 3. PV in Released state → manually delete and recreate

**2.2 OPENSHIFT — Corporate Interview Q****&****A**

**Q: How is OpenShift different from vanilla Kubernetes?**

"OpenShift adds enterprise security, developer workflow, and operational tooling on top of Kubernetes:

- **Security Context Constraints (SCC)**: OpenShift's RBAC extension. Pods cannot run as root by default
