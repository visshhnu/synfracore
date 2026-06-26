# OpenShift — Interview Questions

Real questions from enterprise OCP interviews — telecom, banking, cloud-native production, banking production experience with OCP 4.14-4.16.

---

## OpenShift Core Concepts

**What is OpenShift?**
Red Hat OpenShift Container Platform (OCP) is an enterprise Kubernetes distribution — Kubernetes underneath, but with everything enterprises actually need already built in: built-in HAProxy Router (Routes), integrated OAuth server, Security Context Constraints (SCCs) for pod-level security, built-in Prometheus/Alertmanager monitoring, internal image registry, Operator Lifecycle Manager (OLM), and the Cluster Version Operator (CVO) for managed upgrades. The CLI is `oc` — a superset of kubectl. Used heavily in telecom (5G, NFV), banking, healthcare, and government environments.

**What is the difference between Kubernetes and OpenShift?**

| Feature | Kubernetes | OpenShift |
|---|---|---|
| Ingress | Kubernetes Ingress (needs controller) | Routes (HAProxy built-in) |
| Security | Basic RBAC | RBAC + SCCs |
| Auth | External IdP only | Built-in OAuth (HTPasswd, LDAP, OIDC) |
| CLI | kubectl | oc (superset — all kubectl commands work) |
| Monitoring | Optional add-on | Built-in Prometheus + Alertmanager |
| Updates | Manual | Managed by Cluster Version Operator |
| Builds | External CI | BuildConfig + ImageStream built-in |
| Registry | External only | Integrated Internal Registry |
| Developer Portal | None | Web Console with topology view |

Key phrase for interviews: *"OpenShift is Kubernetes with enterprise guardrails — security, observability, and developer experience baked in rather than bolted on."*

**What are OpenShift built-in components?**
- **etcd** — distributed key-value store, all cluster state
- **API Server** — central hub, all oc/kubectl commands go through it
- **Controller Manager** — reconciliation control loops
- **Scheduler** — places pods on nodes
- **OVN-Kubernetes** — default CNI, pod networking
- **Cluster Version Operator (CVO)** — manages cluster upgrades
- **Operator Lifecycle Manager (OLM)** — manages operators from OperatorHub
- **OpenShift OAuth Server** — authentication (HTPasswd, LDAP, OIDC)
- **Internal Image Registry** — stores images built inside OCP
- **Machine Config Operator (MCO)** — manages OS-level config on nodes
- **Ingress Operator** — manages HAProxy Router for Route objects

---

## Routes and Networking

**What are Routes in OpenShift?**
Routes are OCP's native HTTP/HTTPS routing resource — the equivalent of Kubernetes Ingress but built on HAProxy which comes pre-configured in OCP via the Ingress Operator. Routes expose services externally with a hostname: `http://myapp-myproject.apps.<cluster>.<domain>`. They support three TLS modes: Edge, Passthrough, and Reencrypt.

```bash
# Create routes
oc expose svc/myapp                          # plain HTTP
oc create route edge myapp --service=myapp --hostname=myapp.example.com --cert=tls.crt --key=tls.key
oc create route passthrough myapp --service=myapp
oc create route reencrypt myapp --service=myapp --dest-ca-cert=pod-ca.crt
```

**What is the difference between Route and Ingress?**
Kubernetes Ingress is a standard API resource but requires a separately installed controller (Nginx, Traefik, HAProxy) to function — it does nothing out of the box. OpenShift Route is OCP's native equivalent with HAProxy pre-installed and running. Routes support three TLS modes; Ingress only supports edge termination natively. OCP also accepts standard Kubernetes Ingress objects — it converts them to Routes internally. For OCP-specific work, always use Routes.

**Route TLS termination types:**

| Type | TLS terminates at | Traffic to Pod | Use when |
|---|---|---|---|
| Edge | HAProxy Router | HTTP (plain) | SSL offloading at LB |
| Passthrough | Pod itself | TLS end-to-end | Database, mTLS required |
| Reencrypt | Router, then re-encrypted | TLS (different cert) | Compliance: encrypt everywhere |

---

## Security Context Constraints (SCCs)

**What is SCC (Security Context Constraints)?**
SCCs are OCP-specific security policies that control what a pod is allowed to do at the OS level — whether it can run as root, use privileged mode, access host networking, mount host paths, or use specific volume types. Every pod gets an SCC assigned at admission time. The default `restricted` SCC prevents running as root and applies to all pods automatically. This is the most common source of failures when migrating workloads from vanilla Kubernetes to OCP — images that run as root on K8s fail the `restricted` SCC on OCP.

**SCC hierarchy (most to least restrictive):**
```
restricted   → no root, no host access (default for all pods)
nonroot      → any non-root UID
anyuid       → any UID including root
hostnetwork  → shares host network namespace
hostpath     → can mount any host path
privileged   → full host access (avoid in production)
```

```bash
# Check which SCC a pod is using
oc get pod <pod> -o yaml | grep scc

# Fix SCC violation — grant anyuid to a specific service account
oc adm policy add-scc-to-user anyuid -z <serviceaccount> -n <namespace>

# Check all SCCs
oc get scc

# Who can use anyuid?
oc adm policy who-can use scc anyuid
```

**Most common SCC error:**
```
Error: pods is forbidden: unable to validate against any security context constraint:
[provider "restricted": .spec.securityContext.runAsUser: Invalid value: 0:
must be in the ranges: [1000680000, 1000689999]]
```
Fix: `oc adm policy add-scc-to-user anyuid -z default -n <project>`

---

## Pods, Services, Deployments

**What are Pods, Services, Deployments in OpenShift?**
These are standard Kubernetes objects that work identically in OCP:
- **Pod** — smallest deployable unit, wraps one or more containers. Ephemeral, not managed directly in production.
- **Service** — stable network endpoint with a DNS name (`<svc>.<ns>.svc.cluster.local`). Routes traffic to pods matching its selector. Types: ClusterIP (internal), NodePort, LoadBalancer.
- **Deployment** — manages ReplicaSets, ensures N replicas always running, handles rolling updates and rollbacks. This is what you create and manage, not pods directly.

**What happens when you update a deployment?**
When you change a Deployment (new image, env var, resource limits), Kubernetes/OCP:
1. Creates a new ReplicaSet with the updated pod template
2. Gradually scales up new ReplicaSet (new pods) while scaling down old one
3. Respects `maxSurge` (how many extra pods allowed) and `maxUnavailable` (how many can be down)
4. Waits for `readinessProbe` to pass before routing traffic to new pods
5. Old ReplicaSet kept at 0 replicas (for rollback history)

**What is a rolling update?**
Rolling update replaces pods one by one (or in batches) without downtime. The critical settings:
```yaml
strategy:
  type: RollingUpdate
  rollingUpdate:
    maxSurge: 1         # allow 1 extra pod above desired count during update
    maxUnavailable: 0   # never take a pod down before replacement is ready
```
With `maxUnavailable: 0`, you always have full capacity. New pod must pass `readinessProbe` before old pod is terminated. Without `readinessProbe`, traffic hits pods before they're ready — users see errors.

**Difference between Deployment and ReplicaSet?**
ReplicaSet ensures N copies of a pod are running — it's a low-level controller. Deployment manages ReplicaSets — it creates a new ReplicaSet on every update, keeps old ones for rollback history, and handles the rolling update process. You always create Deployments, never ReplicaSets directly. `kubectl rollout undo` switches traffic back to the previous ReplicaSet.

**What is a namespace / project?**
Namespace is Kubernetes' way of dividing cluster resources into isolated groups. In OpenShift, a Project is a namespace with additional metadata (display name, description, requester annotation). Projects get automatically configured with: default network policies, LimitRanges, ResourceQuotas. Use projects to isolate teams, environments (dev/staging/prod), and applications from each other.

---

## Storage — PVC and StorageClass

**What is PVC and StorageClass?**
PersistentVolumeClaim (PVC) is a request for storage from a pod — size, access mode, storage class. StorageClass defines how storage is provisioned (which backend, what performance tier, what reclaim policy). When a PVC is created with a StorageClass, the CSI driver dynamically provisions a PersistentVolume (PV) automatically.

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: myapp-data
spec:
  accessModes: [ReadWriteOnce]    # RWO: one pod, one node
  resources:
    requests:
      storage: 10Gi
  storageClassName: gp3           # which StorageClass to use
```

**What storage options are used in OCP? (Ceph, Portworx)**

| Storage | Type | Access Modes | Use Case |
|---|---|---|---|
| **Ceph (ODF)** | Software-defined | RWO, RWX, ROX | Default in OCP on-prem, RWX for VMs live migration |
| **Portworx** | Software-defined | RWO, RWX | High-performance, enterprise SLA |
| **AWS EBS (gp3)** | Cloud block | RWO only | EC2/EKS/ROSA workloads |
| **AWS EFS** | Cloud file | RWX | Shared storage on AWS |
| **Azure Disk** | Cloud block | RWO only | AKS/ARO workloads |
| **Azure Files** | Cloud file | RWX | Shared storage on Azure |
| **NFS** | File | RWX | On-prem simple shared storage |

**How dynamic provisioning works:**
1. Pod spec requests a PVC
2. PVC specifies StorageClass
3. StorageClass controller (CSI driver) calls the storage backend API
4. Storage backend creates a volume (EBS volume, Ceph RBD, etc.)
5. PV is created and bound to the PVC
6. Pod mounts the PV

**RWO vs RWX — the critical difference:**
- **ReadWriteOnce (RWO):** Only one pod on one node can mount — block storage (EBS, Ceph RBD). Best performance.
- **ReadWriteMany (RWX):** Multiple pods on multiple nodes can mount — file storage (NFS, CephFS, EFS). Required for: horizontal scaling with shared files, live VM migration in OpenShift Virtualization.

---

## Jenkins on Kubernetes/OpenShift

**How Jenkins runs pipelines on Kubernetes?**
Jenkins uses the Kubernetes Plugin to dynamically create pods as build agents. Each pipeline run gets a fresh pod, runs the stages, then the pod is deleted. This gives: infinite scalability (pods created on demand), isolation (each build in its own pod), and clean environments (no residual state).

**What is the Kubernetes plugin in Jenkins?**
The Kubernetes Plugin connects Jenkins to a Kubernetes/OCP cluster and enables dynamic pod agents. Configure it in Jenkins: Manage Jenkins → Configure System → Cloud → Kubernetes. You specify: cluster API URL, credentials, namespace, and pod templates. Pod templates define what containers run in the agent pod.

**What is a JNLP container?**
JNLP (Java Network Launch Protocol) container is the mandatory sidecar in every Jenkins agent pod. It runs the Jenkins remoting agent that connects back to the Jenkins master and receives pipeline commands. Every Jenkins pod has: a `jnlp` container (handles Jenkins communication) + your build containers (maven, docker, kubectl, etc.). You don't need to configure the JNLP container — Jenkins injects it automatically.

**What happens when a pipeline is triggered?**
1. Developer pushes code → webhook fires to Jenkins
2. Jenkins pipeline starts, reaches a `agent { kubernetes { ... } }` block
3. Jenkins Kubernetes Plugin calls OCP API: creates a Pod in the configured namespace
4. Pod starts: `jnlp` container connects back to Jenkins master
5. Pipeline stages execute in the pod's containers
6. Pipeline completes → pod is automatically deleted
7. Next run starts a fresh pod

**How Jenkins creates dynamic pods?**
Via the Kubernetes plugin pod template in Jenkinsfile:
```groovy
pipeline {
  agent {
    kubernetes {
      yaml """
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: maven
    image: maven:3.9-eclipse-temurin-17
    command: [sleep, infinity]
  - name: docker
    image: docker:24-dind
    securityContext:
      privileged: true
"""
    }
  }
  stages {
    stage('Build') {
      steps {
        container('maven') {
          sh 'mvn clean package'
        }
      }
    }
  }
}
```

**How to configure Jenkins with OpenShift?**
```bash
# Option 1: Jenkins Operator (recommended)
oc apply -f jenkins-subscription.yaml  # Install via OperatorHub

# Option 2: Jenkins template
oc new-app jenkins-persistent -n jenkins-ns

# Grant Jenkins service account permission to create pods
oc adm policy add-role-to-user edit system:serviceaccount:jenkins-ns:jenkins -n build-ns

# Configure in Jenkins UI:
# Manage Jenkins → Configure System → Cloud → Kubernetes
# - Kubernetes URL: https://kubernetes.default.svc
# - Namespace: jenkins-ns
# - Credentials: ServiceAccount token
```

**How to troubleshoot Jenkins pipeline failure?**
```bash
# 1. Check Jenkins pod itself
oc get pods -n jenkins-ns
oc logs deployment/jenkins -n jenkins-ns

# 2. Check agent pods created by Jenkins
oc get pods -n build-ns -w   # watch them start and finish

# 3. Check agent pod logs (the actual build output)
oc logs <agent-pod> -c maven -n build-ns

# 4. Describe agent pod for scheduling issues
oc describe pod <agent-pod> -n build-ns
# Look at Events section — see if it's SCC violation, resource issue, image pull error

# 5. Common issues:
# SCC: grant anyuid to jenkins service account
# Resource quota exceeded: check quota with oc describe quota
# Image pull error: check imagePullSecret configured
# Network: check Jenkins can reach OCP API
```

**What happens if Jenkins pod is in Pending state?**
```bash
oc describe pod <jenkins-pod> -n jenkins-ns
# Check Events section:

# "0/3 nodes available: Insufficient memory"
# → Increase node size or add nodes, reduce Jenkins memory request

# "0/3 nodes available: node(s) had taint"
# → Add toleration to Jenkins pod spec for that taint

# "didn't match Pod's node affinity/selector"
# → Check nodeSelector in Jenkins deployment matches available nodes

# "persistentvolumeclaim not bound"
# → Check PVC: oc get pvc -n jenkins-ns
# → Check StorageClass availability: oc get sc
```

---

## GitOps with ArgoCD

**What is GitOps?**
GitOps means Git is the single source of truth for what should run in the cluster. Every change — new image, config update, resource limit change — goes through a Git pull request. No one runs `oc apply` directly in production. An operator (ArgoCD) continuously watches Git and reconciles the cluster to match. Benefits: full audit trail (git log), instant rollback (git revert), reproducible environments, drift detection.

**How ArgoCD works?**
```
Git Repository (source of truth)
       ↓ (ArgoCD watches for changes every 3 minutes or via webhook)
ArgoCD Application Controller
       ↓ (compares Git state vs cluster state)
If different: sync (apply the Git state to cluster)
       ↑
ArgoCD UI shows: Synced / OutOfSync / Unknown
```

ArgoCD is installed via the OpenShift GitOps Operator. It runs in `openshift-gitops` namespace. Access: `oc get route openshift-gitops-server -n openshift-gitops`.

**What is Sync vs OutOfSync in ArgoCD?**
- **Synced** — cluster state matches exactly what is in Git. Green status. No action needed.
- **OutOfSync** — cluster state differs from Git. This could mean: (1) someone manually changed something in the cluster (drift), (2) a new commit was pushed to Git but not yet applied, (3) auto-sync is off and approval is pending.
- **Unknown** — ArgoCD cannot determine status (API errors, missing cluster)

**Manual sync vs auto sync?**
```yaml
syncPolicy:
  automated:              # AUTO SYNC
    prune: true           # delete resources removed from Git
    selfHeal: true        # revert manual cluster changes automatically
```
Without `automated`: ArgoCD detects changes but you must click Sync manually or run `argocd app sync myapp`. With `automated`: ArgoCD applies changes immediately when Git changes, and reverts drift. For production: use auto-sync with approval gates on the Git repository (PR reviews, branch protection). For critical databases: manual sync is safer.

**ArgoCD auto sync additional options:**
```yaml
syncPolicy:
  automated:
    prune: true           # remove resources deleted from Git
    selfHeal: true        # fix drift automatically
    allowEmpty: false     # prevent syncing empty resource list (safety)
  retry:
    limit: 5              # retry failed sync up to 5 times
    backoff:
      duration: 5s        # wait 5s between retries
      factor: 2           # exponential backoff
      maxDuration: 3m     # max wait between retries
  syncOptions:
  - CreateNamespace=true        # create namespace if missing
  - PrunePropagationPolicy=foreground  # wait for child resources to delete
  - ApplyOutOfSyncOnly=true    # only apply changed resources (faster)
  - ServerSideApply=true       # use server-side apply for better conflict handling
  - Replace=true               # use kubectl replace instead of apply (for CRDs)
```

**What is drift in ArgoCD?**
Drift is when the actual cluster state differs from Git. Caused by: manual `oc apply`, manual `oc edit`, auto-scaling changing replica counts, mutation webhooks changing resources. With `selfHeal: true`, ArgoCD detects and reverts drift within the sync interval. Without selfHeal, drift is only reported, not fixed. In a large enterprise telecom org, selfHeal was enabled for all production apps — any manual change was automatically reverted within 3 minutes.

---

## Image Push → Deployment Flow

**How deployment happens after image is pushed to Quay?**
In a large telecom deployment, the full flow was:
```
1. Developer merges PR to main branch
2. Jenkins pipeline triggers (webhook from Bitbucket/GitHub)
3. Jenkins: mvn build → docker build → docker push to Quay
4. Quay: image scan (Clair) → if clean, notified
5. ArgoCD detects new image tag in Git (via image-updater or manual PR)
6. ArgoCD syncs → applies new Deployment with updated image
7. OCP rolling update: new pods pulled, old pods terminated
8. Application running new version
```

**What tools are involved after Quay push?**
- **Quay** — stores and scans the image
- **ArgoCD Image Updater** — detects new image tags in Quay, automatically creates a commit to Git updating the image tag
- **ArgoCD** — detects Git commit, syncs to cluster
- **OCP** — kubelet on each worker node pulls image from Quay when pod is scheduled
- **ImagePullSecret** — credentials for OCP to pull from private Quay registry

**How ArgoCD ensures cluster matches Git?**
ArgoCD runs a reconciliation loop (default every 3 minutes, or triggered by webhook). Each loop: fetch Git repo HEAD, fetch current cluster resources, compute diff, if diff exists and auto-sync enabled → apply changes. The comparison uses server-side dry-run to detect what would change.

**What if image is not updated in deployment?**
```bash
# Force pod restart to pull latest image (if using mutable tag like :latest)
oc rollout restart deployment/myapp -n production
# Note: always use specific image tags in production, never :latest

# Manually update image tag
oc set image deployment/myapp container=quay.io/org/myapp:v2.1.0 -n production

# Check what image is currently running
oc get deployment myapp -o jsonpath='{.spec.template.spec.containers[0].image}'

# Check if pods are on the new image
oc get pods -o jsonpath='{range .items[*]}{.metadata.name}{" "}{.spec.containers[0].image}{"\n"}{end}'
```

**If I change YAML, will it reflect automatically?**
Only if ArgoCD auto-sync is enabled AND the changed YAML is committed to Git. Direct `oc apply` in production is bypassed by ArgoCD if selfHeal is enabled — ArgoCD will revert it. The correct workflow: commit YAML change to Git → merge PR → ArgoCD detects → syncs to cluster.

**How to update image tag safely?**
```bash
# Safe approach — update in Git, let ArgoCD apply
# Update deployment YAML in git repo:
sed -i 's|image: quay.io/org/myapp:.*|image: quay.io/org/myapp:v2.1.0|' k8s/deployment.yaml
git add k8s/deployment.yaml
git commit -m "bump: myapp to v2.1.0"
git push
# ArgoCD detects commit → syncs → rolling update begins

# Monitor rollout
oc rollout status deployment/myapp -n production
```

**How to avoid updating multiple YAML files manually?**
Use Helm or Kustomize — define the image tag once, override per environment:
```yaml
# Helm values-production.yaml
image:
  repository: quay.io/org/myapp
  tag: v2.1.0    # change only here

# Kustomize overlays/production/kustomization.yaml
images:
- name: quay.io/org/myapp
  newTag: v2.1.0   # change only here
```

---

## Helm on OpenShift

**What is Helm?**
Helm is the package manager for Kubernetes/OpenShift. It packages K8s manifests into Charts — templated, versioned, deployable units. Like apt/yum but for Kubernetes applications.

**What is a Helm Chart?**
A directory structure containing: `Chart.yaml` (metadata), `values.yaml` (default configuration), `templates/` (YAML templates with Go templating), and optionally sub-charts and hooks.

**What is values.yaml?**
Default configuration file for a Helm chart. Every parameter that varies between environments goes here. Override for specific environments with `-f values-prod.yaml`.

**Structure of a Helm chart:**
```
mychart/
├── Chart.yaml          # chart name, version, description, dependencies
├── values.yaml         # default values (dev environment defaults)
├── values-staging.yaml # staging overrides
├── values-prod.yaml    # production overrides
└── templates/
    ├── deployment.yaml
    ├── service.yaml
    ├── route.yaml
    ├── configmap.yaml
    ├── _helpers.tpl    # reusable template snippets
    └── NOTES.txt       # shown to user after install
```

**How Helm simplifies deployments:**
```bash
# Without Helm: apply 10 separate YAML files
oc apply -f deployment.yaml -f service.yaml -f route.yaml -f configmap.yaml...

# With Helm: one command, all resources
helm install myapp ./mychart -n production -f values-prod.yaml
```

**How to upgrade application using Helm:**
```bash
helm upgrade myapp ./mychart -n production -f values-prod.yaml

# With specific image tag override
helm upgrade myapp ./mychart -n production \
  -f values-prod.yaml \
  --set image.tag=v2.1.0

# Rollback if upgrade failed
helm rollback myapp 1 -n production   # rollback to revision 1

# View history
helm history myapp -n production
```

**How Helm helps in central configuration:**
One `values.yaml` controls all configuration. Need to change DB_HOST for all services? Change once in values.yaml, run `helm upgrade`. No hunting through 20 YAML files. Use Helmfile or ArgoCD ApplicationSet to manage multiple apps with Helm across multiple clusters.

---

## Monitoring with Prometheus and Grafana

**How Prometheus collects metrics?**
Prometheus uses a **pull model** — it scrapes (HTTP GET) a `/metrics` endpoint on each target at a configured interval (default 30s). Targets are discovered via: ServiceMonitor CRDs, PodMonitor CRDs, static configs, or service discovery (OCP service discovery auto-discovers annotated services).

**What is /metrics endpoint?**
An HTTP endpoint that returns metrics in Prometheus text format:
```
# HELP http_requests_total Total HTTP requests
# TYPE http_requests_total counter
http_requests_total{method="GET",status="200"} 1234
http_requests_total{method="POST",status="500"} 12
```
Your application must expose this endpoint. Libraries: prometheus-client (Python), micrometer (Java/Spring), prom-client (Node.js).

**What is ServiceMonitor?**
A CRD (Custom Resource Definition) that tells Prometheus which Services to scrape and how:
```yaml
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: myapp-monitor
  namespace: production
spec:
  selector:
    matchLabels:
      app: myapp          # selects Services with this label
  endpoints:
  - port: metrics         # port name on the Service
    path: /metrics
    interval: 30s
```

**What is PodMonitor?**
Like ServiceMonitor but selects Pods directly instead of Services. Use when your pods don't have a Service, or when you want to scrape each pod individually (useful for sidecars or DaemonSets where each pod may have different metrics).

**How to configure monitoring in OCP?**
```yaml
# 1. Enable user workload monitoring (in cluster-monitoring-config)
data:
  config.yaml: |
    enableUserWorkload: true

# 2. Deploy your app with /metrics endpoint
# 3. Create ServiceMonitor pointing to your Service
# 4. Metrics appear in Prometheus automatically
# 5. Create Grafana dashboard using the metrics
```

**Difference between Prometheus and Grafana?**
- **Prometheus** — collects, stores, and queries time-series metrics. The data source. Has a basic UI for ad-hoc queries (PromQL). Fires alerts via Alertmanager.
- **Grafana** — visualisation layer. Queries Prometheus via PromQL, renders dashboards with graphs, tables, heatmaps. Does not collect data itself — it reads from Prometheus (or other data sources).

**How to create an alert in OpenShift?**
Via PrometheusRule CRD:
```yaml
apiVersion: monitoring.coreos.com/v1
kind: PrometheusRule
metadata:
  name: myapp-alerts
  namespace: production
spec:
  groups:
  - name: myapp.rules
    rules:
    - alert: MyAppHighCPU
      expr: rate(container_cpu_usage_seconds_total{namespace="production",pod=~"myapp-.*"}[5m]) > 0.8
      for: 5m
      labels:
        severity: warning
      annotations:
        summary: "High CPU on myapp"
        description: "CPU > 80% for 5 minutes on {{ $labels.pod }}"
```

**What is PrometheusRule?**
A CRD that defines alerting rules and recording rules for Prometheus. Alerting rules define when to fire an alert (expr evaluates to true). Recording rules pre-compute expensive queries for faster dashboard rendering.

**How AlertManager works?**
AlertManager receives alerts from Prometheus, groups them (avoids alert storms), deduplicates, silences, inhibits, and routes to receivers (email, Slack, PagerDuty, webhook):
```
Prometheus evaluates rule → fires alert to Alertmanager
→ Alertmanager: group + deduplicate + check silences
→ Route to receiver (Slack #alerts channel, PagerDuty on-call)
```

**Flow of alerting system:**
```
App /metrics endpoint
   ↓ (scraped every 30s)
Prometheus (evaluates PrometheusRules every 1m)
   ↓ (rule fires when condition true for `for:` duration)
Alertmanager (receives alert)
   ↓ (group_wait: 30s, group_interval: 5m)
Notification → Slack / PagerDuty / Email
```

**How to create CPU alert:**
```yaml
- alert: HighCPU
  expr: >
    rate(container_cpu_usage_seconds_total{
      container!="",
      namespace="production"
    }[5m]) > 0.9
  for: 10m
  labels:
    severity: critical
  annotations:
    summary: "Container {{ $labels.container }} CPU > 90%"
```

**How to create Memory alert:**
```yaml
- alert: HighMemory
  expr: >
    container_memory_working_set_bytes{container!="", namespace="production"} /
    container_spec_memory_limit_bytes{container!="", namespace="production"} > 0.85
  for: 5m
  labels:
    severity: warning
  annotations:
    summary: "Memory > 85% of limit on {{ $labels.pod }}"
```

**How to monitor certificate expiry:**
```yaml
- alert: CertExpiringSoon
  expr: (x509_cert_expiry - time()) / 86400 < 30
  for: 1h
  labels:
    severity: warning
  annotations:
    summary: "Certificate expiring in {{ $value }} days"
```
Or use `cert-manager` operator which handles automatic certificate renewal and fires events when certs are near expiry.

**How Prometheus checks application health (the `up` metric)?**
When Prometheus scrapes a target, it sets the `up` metric:
- `up == 1` — scrape succeeded, target is healthy
- `up == 0` — scrape failed (connection refused, timeout, HTTP error)

```yaml
- alert: AppDown
  expr: up{job="myapp"} == 0
  for: 1m
  labels:
    severity: critical
  annotations:
    summary: "Application {{ $labels.instance }} is DOWN"
```

**Difference between Liveness, Readiness, and Prometheus alert?**

| | Liveness Probe | Readiness Probe | Prometheus Alert |
|---|---|---|---|
| **Run by** | Kubelet | Kubelet | Prometheus |
| **Checks** | Is container alive? | Ready for traffic? | Is metric threshold breached? |
| **Action on failure** | Restarts container | Removes from Service endpoints | Fires alert to Alertmanager |
| **Response time** | Seconds | Seconds | Minutes (evaluation interval + `for` duration) |
| **Use for** | Deadlock detection | Startup completion | Business and infrastructure alerting |

---

## Secrets Management

**How are secrets managed in OpenShift?**
Default: OCP Secrets are base64-encoded and stored in etcd. Enable etcd encryption for true encryption at rest. For enterprise secret management, integrate with external systems:

```bash
# Basic secret
oc create secret generic db-creds --from-literal=password=mypassword

# Use in pod
env:
- name: DB_PASSWORD
  valueFrom:
    secretKeyRef:
      name: db-creds
      key: password

# Enable etcd encryption
oc patch apiserver cluster --type merge \
  --patch '{"spec":{"encryption":{"type":"aescbc"}}}'
```

**How Azure Key Vault is integrated with OpenShift?**
Using the Secrets Store CSI Driver + Azure Key Vault Provider:
1. Install Secrets Store CSI Driver on OCP
2. Create a `SecretProviderClass` pointing to Azure Key Vault
3. Pod mounts secrets via CSI volume — secrets fetched from Key Vault at pod start
4. Optionally sync to Kubernetes Secrets for env var use

**What is Managed Identity?**
An Azure identity assigned to a workload (pod) that allows it to authenticate to Azure services (Key Vault, Storage, etc.) without any credentials stored in the cluster. On AKS/ARO: Workload Identity (Pod Identity v2) assigns an Azure AD application to a Kubernetes Service Account. The pod gets an Azure token automatically — no keys or secrets needed.

**How does an app get a secret from Key Vault?**
```
Pod starts with Workload Identity service account
  ↓
Azure AD issues token to pod (via projected service account token)
  ↓
Secrets Store CSI Driver uses token to authenticate to Key Vault
  ↓
Fetches secret values from Key Vault
  ↓
Mounts secrets as files at /mnt/secrets/ in the pod
  (optionally syncs to Kubernetes Secret for env vars)
```

---

## Install Prometheus and Grafana on Kubernetes

**How do you install Prometheus and Grafana on Kubernetes?**
The easiest and most complete way is `kube-prometheus-stack` Helm chart:

```bash
# Add Helm repo
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# Install everything: Prometheus + Grafana + Alertmanager + node-exporter + kube-state-metrics
helm install monitoring prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  --create-namespace \
  --set grafana.adminPassword=admin123 \
  --set prometheus.prometheusSpec.retention=7d \
  --set prometheus.prometheusSpec.storageSpec.volumeClaimTemplate.spec.storageClassName=gp3 \
  --set prometheus.prometheusSpec.storageSpec.volumeClaimTemplate.spec.resources.requests.storage=40Gi

# Access Grafana (default: admin / prom-operator)
kubectl port-forward svc/monitoring-grafana 3000:80 -n monitoring
# Open http://localhost:3000

# On OpenShift: create Route instead
oc expose svc/monitoring-grafana -n monitoring

# Access Prometheus
kubectl port-forward svc/monitoring-kube-prometheus-prometheus 9090:9090 -n monitoring
```

**On OpenShift specifically:**
OCP 4.x ships with a complete monitoring stack in `openshift-monitoring`. Enable user workload monitoring instead of installing your own Prometheus:
```yaml
# Edit cluster-monitoring-config ConfigMap
data:
  config.yaml: |
    enableUserWorkload: true
```
This creates a separate Prometheus for your apps in `openshift-user-workload-monitoring`. Add ServiceMonitors to scrape your apps. Use the built-in Grafana or install community Grafana operator.
