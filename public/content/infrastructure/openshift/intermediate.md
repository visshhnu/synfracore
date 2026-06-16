# OpenShift — Intermediate

## Deployments and Application Management

### Health Probes — Critical for Zero-Downtime

Missing `readinessProbe` is the #1 cause of downtime during rolling updates.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp
  namespace: production
spec:
  replicas: 3
  selector:
    matchLabels:
      app: myapp
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 25%          # allow 25% extra pods during update
      maxUnavailable: 0      # never take pods down before new ones ready
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
      - name: myapp
        image: myapp:v2
        ports:
        - containerPort: 8080
        resources:
          requests:
            cpu: 100m        # scheduler uses this to place pod
            memory: 128Mi
          limits:
            cpu: 500m        # hard cap — pod throttled if exceeded
            memory: 512Mi    # hard cap — pod OOMKilled if exceeded
        # readinessProbe: pod only gets traffic when this passes
        readinessProbe:
          httpGet:
            path: /health/ready
            port: 8080
          initialDelaySeconds: 10  # wait 10s after container starts
          periodSeconds: 5         # check every 5s
          failureThreshold: 3      # fail 3 times before removing from service
        # livenessProbe: restart pod if this fails (deadlock detection)
        livenessProbe:
          httpGet:
            path: /health/live
            port: 8080
          initialDelaySeconds: 30
          periodSeconds: 10
          failureThreshold: 3
        # startupProbe: delays liveness/readiness for slow-starting apps
        startupProbe:
          httpGet:
            path: /health/started
            port: 8080
          failureThreshold: 30     # allow 30 * 10s = 5 minutes to start
          periodSeconds: 10
```

| Probe | Purpose | Consequence of Failure |
|---|---|---|
| `livenessProbe` | Is the container alive? | Container restarted |
| `readinessProbe` | Ready for traffic? | Removed from Service endpoints |
| `startupProbe` | Done starting? | Delays liveness/readiness checks |

### Deployment Strategies

```yaml
# Rolling Update (default) — gradual replacement, zero downtime
strategy:
  type: RollingUpdate
  rollingUpdate:
    maxSurge: 1         # 1 extra pod during update
    maxUnavailable: 0   # never take a pod down before new one ready

# Recreate — kill all then start new (causes downtime)
strategy:
  type: Recreate
  # Use when: app cannot run two versions simultaneously (DB migrations, etc.)
```

**Blue/Green on OCP (zero downtime, instant rollback):**
```bash
# Deploy green (new version)
oc apply -f deployment-green.yaml

# Wait for green to be ready
oc rollout status deployment/myapp-green -n production

# Test green via direct port-forward
oc port-forward deployment/myapp-green 8080:8080 -n production

# Switch Route traffic from blue to green
oc patch route myapp -n production \
  -p '{"spec":{"to":{"name":"myapp-green"}}}'

# Instant rollback if something wrong — switch back
oc patch route myapp -n production \
  -p '{"spec":{"to":{"name":"myapp-blue"}}}'
```

**Canary Deployment — Route weights:**
```yaml
# Split 90% blue / 10% green using Route alternateBackends
apiVersion: route.openshift.io/v1
kind: Route
metadata:
  name: myapp
spec:
  to:
    kind: Service
    name: myapp-blue
    weight: 90
  alternateBackends:
  - kind: Service
    name: myapp-green
    weight: 10
```

## ConfigMaps and Secrets

```bash
# ConfigMap — non-sensitive configuration
oc create configmap app-config \
  --from-literal=DB_HOST=postgres-service \
  --from-literal=DB_PORT=5432 \
  --from-literal=APP_ENV=production

# ConfigMap from file
oc create configmap nginx-config --from-file=nginx.conf

# Secret — sensitive data (base64-encoded in etcd)
oc create secret generic db-credentials \
  --from-literal=password=mypassword \
  --from-literal=username=dbuser

# TLS Secret
oc create secret tls myapp-tls \
  --cert=tls.crt \
  --key=tls.key

# Use in deployment
containers:
- name: myapp
  envFrom:
  - configMapRef:
      name: app-config       # all keys become env vars
  env:
  - name: DB_PASSWORD
    valueFrom:
      secretKeyRef:
        name: db-credentials
        key: password        # specific secret key
  volumeMounts:
  - name: config-volume
    mountPath: /etc/myapp
volumes:
- name: config-volume
  configMap:
    name: app-config          # mount as files
```

**Important:** OCP Secrets are base64-encoded, not encrypted by default. For true encryption:
- Enable etcd encryption: `oc patch apiserver cluster --type merge --patch '{"spec":{"encryption":{"type":"aescbc"}}}'`
- Or use HashiCorp Vault / Azure Key Vault with Vault Agent injector

## Operators and OperatorHub

Operators extend OCP with new capabilities — they are controllers that manage complex stateful applications.

### How Operators Work

```
OperatorHub → Install via OLM → Creates CRDs → You create CR → Operator reconciles
```

1. **Subscription** — tells OLM which operator to install, from which channel, with which approval
2. **ClusterServiceVersion (CSV)** — the operator's metadata, permissions, and deployment spec
3. **Custom Resource Definition (CRD)** — new API types the operator introduces (e.g. `PostgresCluster`)
4. **Custom Resource (CR)** — your instance of the CRD (e.g. `my-postgres`)
5. **Operator controller** — watches for CRs, reconciles the actual state with desired state

```bash
# Check OperatorHub catalogue sources
oc get catalogsource -n openshift-marketplace

# List installed operators
oc get operators
oc get csv -n openshift-operators    # ClusterServiceVersions

# Check operator status
oc get csv -n openshift-operators -o wide
# Look for PHASE: Succeeded

# Install operator via YAML (Subscription)
cat <<EOF | oc apply -f -
apiVersion: operators.coreos.com/v1alpha1
kind: Subscription
metadata:
  name: openshift-gitops-operator
  namespace: openshift-operators
spec:
  channel: latest
  installPlanApproval: Automatic   # or Manual for production control
  name: openshift-gitops-operator
  source: redhat-operators
  sourceNamespace: openshift-marketplace
EOF

# Approve manual install plan
oc get installplan -n openshift-operators
oc patch installplan <name> -n openshift-operators \
  --type merge --patch '{"spec":{"approved":true}}'
```

### Key Operators Every OCP Engineer Should Know

| Operator | Purpose | Namespace |
|---|---|---|
| OpenShift GitOps | ArgoCD for GitOps | openshift-gitops |
| OpenShift Pipelines | Tekton CI/CD | openshift-pipelines |
| Cluster Logging | EFK/Loki log aggregation | openshift-logging |
| OpenShift Data Foundation | Ceph storage (RWX) | openshift-storage |
| Advanced Cluster Management | Multi-cluster management | open-cluster-management |
| OpenShift Virtualization | KubeVirt — VMs on OCP | openshift-cnv |
| Cert Manager | TLS certificate automation | cert-manager |
| External Secrets | Vault/AWS SM integration | external-secrets |

## Networking — OVN-Kubernetes and Multus

### OVN-Kubernetes (Default CNI)

OVN-Kubernetes (Open Virtual Network) is the default network plugin in OCP 4.x. It provides:
- Pod networking with VXLAN/Geneve overlay
- Network Policies (L3/L4 filtering)
- Egress IP — assign stable external IP to a namespace
- EgressFirewall — control what external IPs a namespace can reach

```bash
# Check CNI plugin
oc get network.config/cluster -o yaml | grep networkType

# View cluster network config
oc get network.config/cluster

# Network Policies — control pod-to-pod traffic
cat <<EOF | oc apply -f -
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-api-to-db
  namespace: production
spec:
  podSelector:
    matchLabels:
      app: database           # this policy applies to DB pods
  ingress:
  - from:
    - podSelector:
        matchLabels:
          app: api            # ONLY allow traffic from API pods
    ports:
    - protocol: TCP
      port: 5432              # on PostgreSQL port only
EOF

# Deny all ingress by default (then allow specific)
cat <<EOF | oc apply -f -
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: deny-all-ingress
  namespace: production
spec:
  podSelector: {}             # applies to ALL pods in namespace
  policyTypes:
  - Ingress                   # no ingress allowed unless another policy allows it
EOF
```

### Multus — Multiple Network Interfaces

Multus is a meta-CNI plugin that allows pods to have **multiple network interfaces**. Critical for:
- Telecom/NFV workloads needing separate management and data plane networks
- High-performance networking with SR-IOV or DPDK
- Separating storage traffic from application traffic

```yaml
# NetworkAttachmentDefinition — define the additional network
apiVersion: k8s.cni.cncf.io/v1
kind: NetworkAttachmentDefinition
metadata:
  name: storage-network
  namespace: production
spec:
  config: '{
    "cniVersion": "0.3.1",
    "type": "macvlan",
    "master": "eth1",
    "mode": "bridge",
    "ipam": {
      "type": "static",
      "addresses": [{"address": "192.168.100.0/24"}]
    }
  }'

# Attach to a pod
apiVersion: v1
kind: Pod
metadata:
  name: myapp
  annotations:
    k8s.v1.cni.cncf.io/networks: storage-network   # attach extra NIC
spec:
  containers:
  - name: myapp
    image: myapp:latest
```

```bash
# Check Multus is installed
oc get network-attachment-definitions -A

# Check pod's network interfaces
oc exec -it <pod> -n <ns> -- ip addr show
# Pod will have eth0 (primary, from OVN) + net1 (secondary, from Multus)
```

## MachineConfig and Node Management

```bash
# MachineConfig — manage OS-level config on nodes
# Creating a MachineConfig triggers rolling drain+reboot of affected nodes

# Example: add a custom kernel argument
cat <<EOF | oc apply -f -
apiVersion: machineconfiguration.openshift.io/v1
kind: MachineConfig
metadata:
  labels:
    machineconfiguration.openshift.io/role: worker
  name: worker-custom-kernel-args
spec:
  kernelArguments:
    - transparent_hugepage=always
    - intel_iommu=on
EOF

# MachineConfigPool status
oc get mcp
# NAME     CONFIG        UPDATED   UPDATING   DEGRADED
# master   ...           True      False      False
# worker   ...           False     True       False   ← update in progress

# Pause MCP to batch multiple MachineConfig changes (apply all at once, one reboot)
oc patch mcp worker --type merge --patch '{"spec":{"paused":true}}'
# Apply all your MachineConfigs
oc patch mcp worker --type merge --patch '{"spec":{"paused":false}}'
# Now ONE rolling reboot applies all changes

# Drain a node for maintenance
oc adm drain <nodename> --ignore-daemonsets --delete-emptydir-data
# Bring it back
oc adm uncordon <nodename>
```

## Helm on OpenShift

```bash
# Install Helm chart
helm install myapp ./mychart -n myproject -f values-prod.yaml

# Upgrade
helm upgrade myapp ./mychart -n myproject -f values-prod.yaml

# Rollback to revision 2
helm rollback myapp 2 -n myproject

# List releases
helm list -n myproject
helm list -A    # all namespaces

# View release history
helm history myapp -n myproject

# Dry run (preview without applying)
helm upgrade --dry-run myapp ./mychart -n myproject -f values.yaml

# Uninstall
helm uninstall myapp -n myproject

# Common values.yaml pattern for environment differences
# values-dev.yaml:  replicas: 1, resources.requests.cpu: 100m
# values-prod.yaml: replicas: 3, resources.requests.cpu: 500m
```

## GitOps with ArgoCD on OpenShift

```bash
# OpenShift GitOps operator installs ArgoCD in openshift-gitops namespace
# Access ArgoCD UI:
oc get route openshift-gitops-server -n openshift-gitops

# Get admin password
oc get secret openshift-gitops-cluster -n openshift-gitops \
  -o jsonpath='{.data.admin\.password}' | base64 -d

# ArgoCD Application — links Git repo to OCP namespace
cat <<EOF | oc apply -f -
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: myapp-production
  namespace: openshift-gitops
spec:
  project: default
  source:
    repoURL: https://github.com/org/myapp-config
    targetRevision: main
    path: overlays/production        # Kustomize overlay or Helm chart path
  destination:
    server: https://kubernetes.default.svc
    namespace: production
  syncPolicy:
    automated:                       # auto-sync on Git changes
      prune: true                    # delete resources removed from Git
      selfHeal: true                 # fix drift (manual changes in cluster)
    syncOptions:
    - CreateNamespace=true
EOF

# Check sync status
oc get application myapp-production -n openshift-gitops
# Status: Synced = cluster matches Git
# Status: OutOfSync = drift detected (someone changed cluster manually)

# Manual sync
argocd app sync myapp-production  # using argocd CLI
# Or via web console
```
