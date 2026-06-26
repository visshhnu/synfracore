# OpenShift — Day-2 Administration & Application Deployment

## Section 3: Day-2 Administration

**3.1  RBAC — Users, Groups, Roles**

OCP has two levels of RBAC: Cluster-level (ClusterRole/ClusterRoleBinding) and Project-level (Role/RoleBinding).

| **Resource** | **Purpose** |
| --- | --- |
| ClusterRole | Permissions that apply cluster-wide (e.g. cluster-admin, view all namespaces) |
| ClusterRoleBinding | Binds a ClusterRole to a user/group cluster-wide |
| Role | Permissions scoped to a single Project/Namespace |
| RoleBinding | Binds a Role to a user/group within a Project |
| ServiceAccount | Non-human identity for pods/processes to interact with the API |

**Common RBAC commands:**

- oc adm policy add-role-to-user edit <user> -n <project>   # grant edit in a project

- oc adm policy add-cluster-role-to-user cluster-admin <user>   # full admin

- oc adm policy add-scc-to-user anyuid -z <serviceaccount> -n <project>   # grant SCC

- oc get rolebindings -n <project>   # view all role bindings in a project

**3.2  Security Context Constraints (SCCs) — OCP-Specific**

*SCCs are the most important OCP-specific concept. Vanilla K8s does not have SCCs.*

SCCs control what a pod is allowed to do at the OS level — whether it can run as root, use host networking, mount specific volumes, etc.

| **SCC Name** | **Access Level** |
| --- | --- |
| restricted (default) | Most restrictive — no root, no host access. Applied to all pods by default |
| nonroot | Can run as any non-root UID |
| anyuid | Can run as any UID including root — required for many legacy images |
| privileged | Full host access — only for system-level workloads (e.g. monitoring agents) |
| hostnetwork | Pod shares the host network namespace |
| hostpath | Pod can mount any host path |

- To check which SCC a pod is using: oc get pod <pod> -o yaml | grep scc

- To grant anyuid to a service account: oc adm policy add-scc-to-user anyuid -z <sa> -n <ns>

**3.3  Projects ****&**** Namespaces**

- In OCP, a Project is a Kubernetes Namespace with additional metadata (annotations, labels, display name, description)

- Create project: oc new-project <name> --display-name='My App' --description='Description'

- OCP system namespaces start with openshift- and kube- — never deploy app workloads here

- ResourceQuotas limit total resources per project (CPU, memory, pods, PVCs)

- LimitRanges set default and max resource limits per pod/container within a project

**ResourceQuota example — set in the project:**

- Limits: pods=10, requests.cpu=4, requests.memory=8Gi, persistentvolumeclaims=4

- oc create quota <name> --hard=pods=10,requests.cpu=4 -n <project>

**3.4  Networking — Routes ****&**** Services**

| **Object** | **Purpose** |
| --- | --- |
| Service (ClusterIP) | Internal load balancer for pods — stable DNS name inside cluster |
| Service (NodePort) | Exposes service on a static port on each node |
| Service (LoadBalancer) | Cloud LB — creates external IP (cloud environments only) |
| Route (OCP-specific) | Exposes service externally via HAProxy Router — HTTP/HTTPS with hostnames |
| Ingress (K8s standard) | Also supported in OCP — OCP converts Ingress to Route automatically |
| Network Policy | Controls pod-to-pod traffic at the namespace level (allow/deny rules) |

- Create edge route (HTTPS termination at router): oc create route edge --service=<svc> --hostname=<host> --cert=cert.pem --key=key.pem

- Create passthrough route (TLS goes to pod): oc create route passthrough --service=<svc>

- Create reencrypt route (TLS terminated and re-encrypted to pod): oc create route reencrypt --service=<svc>

**3.5  Storage — Persistent Volumes**

| **Term** | **Meaning** |
| --- | --- |
| PersistentVolume (PV) | Cluster-level storage resource — provisioned by admin or dynamically |
| PersistentVolumeClaim (PVC) | Request for storage by a pod — bound to a PV |
| StorageClass | Template for dynamic provisioning — defines provisioner + parameters |
| Access Modes | ReadWriteOnce (RWO), ReadOnlyMany (ROX), ReadWriteMany (RWX) |
| Reclaim Policy | Retain (keep data), Delete (delete on PVC delete), Recycle (deprecated) |

- Check storage classes: oc get storageclass

- Check PVs: oc get pv  |  check PVCs: oc get pvc -n <project>

- RWX is required for workloads that need shared storage across multiple pods — use NFS, CephFS, or cloud equivalents

---

## Section 4: Deployments & Application Management

**&**** APPLICATION MANAGEMENT**

**4.1  Deployment Strategies**

| **Strategy** | **How It Works** |
| --- | --- |
| Rolling Update (default) | Gradually replaces old pods with new — zero downtime if configured correctly. maxSurge & maxUnavailable control speed |
| Recreate | Terminates ALL old pods first, then starts new — causes downtime. Use when shared state must not exist |
| Blue/Green | Run old (blue) and new (green) in parallel — switch traffic via Route. Zero downtime, easy rollback |
| Canary | Route small % of traffic to new version — validate before full rollout. Use Route weight or service mesh |

*At HPE, we used Rolling for routine releases, Blue/Green for major version upgrades to allow instant rollback*

**4.2  Deployment Object — Key Spec Fields**

- replicas — desired number of pods

- selector.matchLabels — how Deployment finds its pods (must match pod template labels)

- strategy.type — RollingUpdate or Recreate

- strategy.rollingUpdate.maxSurge — extra pods allowed during update (e.g. 25%)

- strategy.rollingUpdate.maxUnavailable — pods that can be down during update (e.g. 25%)

- template.spec.containers[].resources.requests — CPU/memory scheduler uses to place pod

- template.spec.containers[].resources.limits — hard cap; pod OOMKilled if memory exceeded

- template.spec.containers[].readinessProbe — pod only receives traffic when this passes

- template.spec.containers[].livenessProbe — pod restarted if this fails

**4.3  Health Probes — Critical for Zero-Downtime**

| **Probe** | **When to Use** |
| --- | --- |
| livenessProbe | Is the container alive? Restart if it fails. Use for deadlock detection |
| readinessProbe | Is the container ready for traffic? Remove from Service endpoints if it fails. MUST be set for zero-downtime rolling updates |
| startupProbe | Is the container done starting? Delays liveness/readiness checks. Use for slow-starting apps |

*Missing readinessProbe is the #1 cause of downtime during rolling updates — traffic hits pods before they**'**re ready*

**4.4  Helm on OpenShift**

- Helm is the package manager for Kubernetes/OCP — a Chart bundles all K8s/OCP manifests

- helm install <release> <chart> -n <namespace> -f values.yaml

- helm upgrade <release> <chart> -n <namespace> -f values-prod.yaml

- helm rollback <release> <revision> -n <namespace>

- helm list -n <namespace>  — list installed releases

- values.yaml overrides allow environment-specific config (dev/test/prod) without changing the chart

**4.5  ArgoCD GitOps on OpenShift**

- ArgoCD is installed via OLM (OpenShift GitOps operator) — available in OperatorHub

- An Application object in ArgoCD links a Git repo path to a target OCP namespace

- Sync policies: Manual (you approve) or Automated (ArgoCD auto-syncs on Git change)

- Drift detection: ArgoCD compares live cluster state vs Git — shows OutOfSync if someone manually changes resources

- App of Apps pattern: one ArgoCD Application manages multiple child Applications — used for multi-service environments

*At HPE, ArgoCD was our single source of truth for production deployments — every config change went through Git first*
