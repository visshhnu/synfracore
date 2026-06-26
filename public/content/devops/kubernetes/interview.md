# Kubernetes Interview Q&A

ggering even though pods are Pending. Check: pods might have node selector or affinity rules that no existing node satisfies — CA cannot create a node matching those constraints.

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

**Where configured:** NetworkPolicy YAML in each namespace. For AKS use Azure CNI with Calico or Azure Network Policy engine (--network-policy azure or calico).

**Real challenge:** After applying deny-all, application breaks because DNS stopped working. Always add explicit DNS egress rule to kube-system namespace port 53.

---

**Q11. What is Kubernetes RBAC and how do you configure it with Azure AD?**

**A:** RBAC controls who can do what inside the Kubernetes cluster.

**Four objects:**
- **Role** — permissions within ONE namespace
- **ClusterRole** — permissions across ALL namespaces
- **RoleBinding** — binds Role to user/group in one namespace
- **ClusterRoleBinding** — binds ClusterRole cluster-wide

**Azure AD integration:**
```yaml
# Give Azure AD group "dev-team" view access in dev namespace only
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: dev-team-view
  namespace: development
subjects:
- kind: Group
  name: "<azure-ad-group-object-id>"    # Azure AD group ID
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: view                             # built-in read-only role
  apiGroup: rbac.authorization.k8s.io
```

**Common built-in roles:**
| Role | Permissions |
|---|---|
| cluster-admin | Everything |
| admin | Full namespace access |
| edit | Create/modify resources (no RBAC) |
| view | Read-only |

**Where configured:** Enable Azure RBAC: `az aks update --enable-azure-rbac --enable-aad`. RBAC YAML files managed via GitOps.

**Real challenge:** Developer accidentally gets cluster-admin. Solution: use Azure AD Privileged Identity Management (PIM) — elevated access requires approval and is time-limited. No standing cluster-admin for individuals.

---

**Q12. What happens when a pod has no resource limits set? What are the consequences?**

**A:** Without resource limits:
1. A pod can consume ALL CPU and memory on the node
2. Other pods on the same node get starved — they slow down or get OOMKilled
3. Node becomes NotReady — kubelet cannot function
4. Cascading failures across the cluster — all pods on that node affected

This is called the "noisy neighbour" problem.

**QoS Classes (Quality of Service):**
- `Guaranteed` — requests = limits → highest priority, evicted last
- `Burstable` — requests < limits → medium priority
- `BestEffort` — no requests or limits → evicted FIRST under memory pressure

**Best practice — always set both:**
```yaml
resources:
  requests:
    cpu: "250m"       # 0.25 CPU cores reserved for scheduling
    memory: "256Mi"   # 256MB reserved for scheduling
  limits:
    cpu: "500m"       # hard cap — throttled if exceeded
    memory: "512Mi"   # hard cap — OOMKilled if exceeded
```

**Where configured:** In every container spec. Enforce via LimitRange in each namespace (sets default limits for pods that don't specify):
```yaml
apiVersion: v1
kind: LimitRange
metadata:
  name: default-limits
  namespace: production
spec:
  limits:
  - default:
      cpu: "500m"
      memory: "512Mi"
    defaultRequest:
      cpu: "100m"
      memory: "128Mi"
    type: Container
```

**Real challenge:** Production node goes NotReady at 3am. Root cause: one pod with no memory limit had a memory leak — consumed all 16GB RAM on the node. Solution: enforce LimitRange + ResourceQuota in every namespace.

---

**Q13. How do you do a zero-downtime deployment in AKS?**

**A:** Multiple layers working together:

**Layer 1 — Rolling Update strategy:**
```yaml
spec:
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxUnavailable: 0      # never take a pod down before new one is ready
      maxSurge: 1            # only one extra pod at a time
```

**Layer 2 — Readiness Probe (critical):**
```yaml
readinessProbe:
  httpGet:
    path: /health
    port: 8080
  initialDelaySeconds: 10
  periodSeconds: 5
  failureThreshold: 3
```
K8s only sends traffic to pods passing readiness. New pod gets traffic ONLY when it's truly ready.

**Layer 3 — preStop hook (drain connections):**
```yaml
lifecycle:
  preStop:
    exec:
      command: ["/bin/sh", "-c", "sleep 15"]
```
Gives load balancer 15 seconds to stop routing before pod terminates. Prevents in-flight requests being dropped.

**Layer 4 — PodDisruptionBudget:**
```yaml
spec:
  minAvailable: 2     # always keep at least 2 pods running
  selector:
    matchLabels:
      app: payment-api
```

**Where configured:** In Deployment YAML (strategy, probes, lifecycle). PDB as separate resource. Managed via Helm chart and GitOps.

**Real challenge:** Rolling update stalls — new pod keeps failing readiness probe. Deployment stuck at 50%. Solution: check new pod logs for application startup errors. Common cause: wrong environment variable or missing secret reference in new version.

---

**Q14. What is the CSI driver and how does it work with Azure Key Vault?**

**A:** CSI (Container Storage Interface) is a standardised interface allowing Kubernetes to use external storage and secret systems as volumes.

The Secrets Store CSI Driver specifically mounts secrets from external stores (Key Vault, Vault, AWS Secrets Manager) as files inside pods.

**Flow:**
1. CSI Driver DaemonSet runs on every AKS node
2. Pod references a SecretProviderClass volume
3. When pod starts — kubelet calls CSI driver on that node
4. CSI driver authenticates to Key Vault using pod's Workload Identity
5. Fetches specified secrets and mounts them as files at `/mnt/secrets/`
6. Optional: sync to K8s Secret for apps expecting env vars

**Where configured:**
```bash
# Install via AKS add-on
az aks enable-addons --addons azure-keyvault-secrets-provider -n myaks -g myrg
```

```yaml
# SecretProviderClass in namespace
apiVersion: secrets-store.csi.x-k8s.io/v1
kind: SecretProviderClass
metadata:
  name: kv-secrets
  namespace: production
spec:
  provider: azure
  parameters:
    keyvaultName: "prod-keyvault"
    clientID: "<workload-identity-client-id>"
    tenantID: "<tenant-id>"
    objects: |
      array:
        - |
          objectName: db-password
          objectType: secret
```

**Real challenge:** Pod fails to start with `failed to mount secret`. Common causes:
1. Workload Identity not configured correctly — check federation
2. Key Vault access policy not granted to the Managed Identity
3. Secret name in SecretProviderClass doesn't match Key Vault secret name exactly
4. CSI driver add-on not enabled on cluster

---

**Q15. What are Taints and Tolerations? Give a real use case.**

**A:**
- **Taint** — applied to a NODE — repels pods that don't tolerate it
- **Toleration** — applied to a POD — allows it to schedule on tainted nodes

**Analogy:** A taint is a "No Entry" sign on a node. A toleration is a "special pass" for pods that need to enter anyway.

**Real use cases:**
1. Dedicated GPU nodes — taint with `gpu=true:NoSchedule`, only ML workloads have toleration
2. Production-only nodes — taint with `environment=prod:NoSchedule`, only prod pods tolerate
3. Spot/preemptible nodes — taint with `kubernetes.azure.com/scalesetpriority=spot:NoSchedule`
4. System node pool — taint with `CriticalAddonsOnly=true:NoSchedule`

**Where configured:**
```bash
# Add taint to node
kubectl taint nodes gpu-node-1 gpu=true:NoSchedule

# Pod toleration
spec:
  tolerations:
  - key: "gpu"
    operator: "Equal"
    value: "true"
    effect: "NoSchedule"
```

**Real challenge:** After adding new GPU node pool, regular application pods start scheduling onto expensive GPU nodes. Solution: add taint to GPU node pool during creation `--node-taints gpu=true:NoSchedule` — regular pods cannot schedule there without explicit toleration.

---

## 

---

## Senior-Level Kubernetes Questions

**Q: Explain Kubernetes control plane components and their failure impact.**
- API Server: if down, no kubectl/oc commands work; existing pods keep running
- etcd: if quorum lost, cluster state can't be updated; existing workloads continue
- Scheduler: new pods stay Pending; existing pods unaffected
- Controller Manager: ReplicaSets won't scale; Deployments won't reconcile

**Q: How does pod scheduling work? What affects placement?**
Scheduler finds feasible nodes (passes all constraints) → scores them → places on highest scorer.
Constraints: node selector, nodeAffinity, podAffinity/antiAffinity, taints/tolerations, resource requests.
Priority: resource availability, pod priority class, topology spread constraints.

**Q: Difference between Deployment, StatefulSet, DaemonSet?**
- Deployment: stateless apps, pods are interchangeable, rolling updates
- StatefulSet: stateful apps (databases), stable network identity, ordered deployment, persistent volumes per pod
- DaemonSet: one pod per node (log collectors, monitoring agents, CNI plugins)

**Q: What is a PodDisruptionBudget and when do you use it?**
Limits disruption during voluntary operations (node drain, rolling update). `minAvailable: 2` ensures at least 2 pods always running. Critical for HA — without PDB, node drain could take all pods of a deployment offline.

**Q: How does HPA work and what are its limitations?**
HPA queries metrics (CPU, memory, custom) every 15s. Scales between min/max replicas. Limitations: can't scale to 0 (use KEDA), slow to react to sudden spikes, doesn't consider pod startup time.
