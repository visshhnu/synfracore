# OpenShift — Advanced

## OCP Cluster Upgrades

OCP upgrades are managed by the **Cluster Version Operator (CVO)** — it's not a manual process like upgrading vanilla Kubernetes.

### Upgrade Channels

| Channel | Purpose |
|---|---|
| `stable-4.x` | Production — most tested, recommended for enterprise |
| `fast-4.x` | Slightly ahead of stable — early access to fixes |
| `candidate-4.x` | Pre-release — testing only |
| `eus-4.x` | Extended Update Support — even versions only (4.12, 4.14, 4.16). Allows skipping odd versions |

**Golden rule:** Always upgrade sequentially. `4.12 → 4.13 → 4.14` ✅. `4.12 → 4.14` ❌ (unless both are EUS).

### Upgrade Process

```bash
# Step 1: Verify cluster is healthy before starting
oc get co              # all AVAILABLE=True, PROGRESSING=False, DEGRADED=False
oc get nodes           # all Ready
oc get mcp             # all UPDATED=True, DEGRADED=False

# Step 2: Check what updates are available
oc adm upgrade
# Example output:
# Cluster version is 4.14.12
# Updates:
#   VERSION: 4.14.15   IMAGE: quay.io/openshift-release-dev/ocp-release@sha256:...
#   VERSION: 4.15.0    IMAGE: quay.io/openshift-release-dev/ocp-release@sha256:...

# Step 3: Review Red Hat release notes for target version
# https://docs.openshift.com/container-platform/4.15/release_notes/

# Step 4: Apply upgrade
oc adm upgrade --to-latest=true          # apply latest available
oc adm upgrade --to=4.14.15             # apply specific version

# Step 5: Monitor — this is critical (upgrade takes 1-3 hours)
watch oc get clusterversion              # shows overall progress
watch oc get co                          # operators upgrade sequentially
watch oc get nodes                       # workers drain+reboot via MachineConfigPool

# Step 6: Verify completion
oc get clusterversion
# DESIRED=4.14.15, CURRENT=4.14.15, AVAILABLE=True, PROGRESSING=False
```

**What happens during upgrade:**
1. CVO downloads new release payload
2. Control plane operators update first (one at a time)
3. Workers update via MachineConfigPool — each worker drains, reboots, comes back
4. Cluster Operators return to Available state

**Best practice:** Always upgrade non-prod first. Validate for 1-2 days. Then upgrade prod.

## Monitoring Stack

OCP ships with a complete monitoring stack in `openshift-monitoring`:

```
Prometheus    → metrics collection (cluster + user workloads)
Alertmanager  → routes alerts (email, Slack, PagerDuty)
Thanos Querier → unified query across multiple Prometheus instances
Grafana       → dashboards (deprecated in 4.10+; use community operator)
```

### Enabling User Workload Monitoring

By default, Prometheus only monitors OCP platform components. Enable it for your apps:

```bash
# Edit the cluster monitoring configmap
oc edit configmap cluster-monitoring-config -n openshift-monitoring

# Add this under data:
data:
  config.yaml: |
    enableUserWorkload: true
    prometheusK8s:
      retention: 7d               # keep 7 days of metrics
      volumeClaimTemplate:
        spec:
          storageClassName: gp3
          resources:
            requests:
              storage: 40Gi
```

Now a separate Prometheus instance appears in `openshift-user-workload-monitoring`. Point your ServiceMonitor at it.

### ServiceMonitor — Scrape Your App Metrics

```yaml
# Your app must expose a /metrics endpoint (Prometheus format)
# Then create a ServiceMonitor:
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: myapp-monitor
  namespace: production
spec:
  selector:
    matchLabels:
      app: myapp             # selects the Service to scrape
  endpoints:
  - port: metrics            # port name on the Service
    path: /metrics
    interval: 30s
```

### PrometheusRule — Custom Alerts

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
    - alert: MyAppHighErrorRate
      expr: rate(http_requests_total{status=~"5.."}[5m]) > 0.1
      for: 5m
      labels:
        severity: critical
      annotations:
        summary: "High error rate on myapp"
        description: "Error rate is {{ $value }} requests/sec"

    - alert: MyAppPodRestarting
      expr: rate(kube_pod_container_status_restarts_total{namespace="production"}[15m]) > 0
      for: 10m
      labels:
        severity: warning
      annotations:
        summary: "Pod {{ $labels.pod }} is restarting frequently"
```

### Configure Alertmanager

```yaml
# Create secret with Alertmanager config
cat <<EOF | oc apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: alertmanager-main
  namespace: openshift-monitoring
stringData:
  alertmanager.yaml: |
    global:
      smtp_smarthost: 'smtp.gmail.com:587'
      smtp_from: 'alerts@company.com'
    route:
      group_by: ['alertname', 'namespace']
      group_wait: 30s
      group_interval: 5m
      repeat_interval: 4h
      receiver: default
      routes:
      - match:
          severity: critical
        receiver: pagerduty
      - match:
          severity: warning
        receiver: slack
    receivers:
    - name: default
      email_configs:
      - to: 'ops@company.com'
    - name: pagerduty
      pagerduty_configs:
      - service_key: '<pagerduty-key>'
    - name: slack
      slack_configs:
      - api_url: 'https://hooks.slack.com/services/xxx/yyy/zzz'
        channel: '#alerts'
        text: '{{ .CommonAnnotations.summary }}'
EOF
```

## OpenShift Virtualization (KubeVirt)

OpenShift Virtualization allows you to run **virtual machines alongside containers** on the same OCP cluster. It uses KubeVirt under the hood.

### Why Run VMs on OCP?

- Migrate legacy workloads that can't be containerised (Windows apps, licensed software)
- Unified platform — same RBAC, networking, storage, monitoring for VMs and containers
- Live migration of VMs between nodes — no downtime during node maintenance
- Consolidate hypervisor + container platforms into one

### Key Components

| Component | Purpose |
|---|---|
| **virt-api** | Handles VM API requests |
| **virt-controller** | Creates and manages VirtualMachineInstance pods |
| **virt-handler** | Node-level agent — manages VMs on each node |
| **virt-launcher** | Pod that wraps each VM (one per VM) |
| **CDI** (Containerized Data Importer) | Imports VM disk images into PVCs |

### Creating a Virtual Machine

```bash
# Install OpenShift Virtualization operator first via OperatorHub
# Then create a HyperConverged CR to deploy all components

# Create a VM
cat <<EOF | oc apply -f -
apiVersion: kubevirt.io/v1
kind: VirtualMachine
metadata:
  name: rhel9-vm
  namespace: production
spec:
  running: true
  template:
    metadata:
      labels:
        kubevirt.io/vm: rhel9-vm
    spec:
      domain:
        cpu:
          cores: 2
        memory:
          guest: 4Gi
        devices:
          disks:
          - name: rootdisk
            disk:
              bus: virtio
          - name: cloudinitdisk
            disk:
              bus: virtio
          interfaces:
          - name: default
            masquerade: {}         # pod network
          - name: secondary
            bridge: {}             # Multus additional network
      networks:
      - name: default
        pod: {}
      - name: secondary
        multus:
          networkName: storage-network
      volumes:
      - name: rootdisk
        dataVolume:
          name: rhel9-dv
      - name: cloudinitdisk
        cloudInitNoCloud:
          userData: |
            #cloud-config
            user: cloud-user
            password: redhat
            chpasswd:
              expire: false
EOF
```

### Live Migration

Live migration moves a running VM from one node to another **with zero downtime** — VM keeps running, memory is transferred incrementally.

```bash
# Trigger live migration
cat <<EOF | oc apply -f -
apiVersion: kubevirt.io/v1
kind: VirtualMachineInstanceMigration
metadata:
  name: migrate-rhel9-vm
  namespace: production
spec:
  vmiName: rhel9-vm
EOF

# Check migration status
oc get vmim migrate-rhel9-vm -n production

# Monitor migration
oc describe vmim migrate-rhel9-vm -n production

# Live migration requirements:
# - Shared storage (RWX) — both nodes must access same PVC simultaneously
# - Network connectivity between nodes on migration network
# - CPU compatibility between source and destination node
```

**Common live migration failure reasons:**
- VM uses RWO storage — cannot be mounted on two nodes simultaneously (need RWX)
- CPU model mismatch between nodes (use `cpu.model: host-model` for compatibility)
- Insufficient memory on destination node
- No live migration network defined in HyperConverged config

### Block vs File Storage for VMs

| Storage Type | When to Use | Examples |
|---|---|---|
| **Block (RWO)** | Single VM, best performance, like a real hard disk | AWS EBS, Azure Disk, iSCSI, FC |
| **File (RWX)** | Live migration, shared access, multiple pods/VMs | NFS, CephFS, Azure Files |
| **Object** | Large unstructured data, CDI import source | S3, Swift |

```
For VMs: Use block storage (RWO) for best performance
For live migration: You NEED RWX — the VM disk must be accessible from both source and destination node simultaneously
For OCP DataVolumes: CephFS (ODF) is the recommended RWX solution in OCP
```

## Logging Stack

### Loki (OCP 4.12+) — Modern Logging

```bash
# Install Loki Operator via OperatorHub
# Then create LokiStack CR:
cat <<EOF | oc apply -f -
apiVersion: loki.grafana.com/v1
kind: LokiStack
metadata:
  name: logging-loki
  namespace: openshift-logging
spec:
  size: 1x.small            # 1x.extra-small, 1x.small, 1x.medium
  storage:
    schemas:
    - version: v12
      effectiveDate: '2023-10-15'
    secret:
      name: logging-loki-s3  # S3 bucket credentials
      type: s3
  storageClassName: gp3
  tenants:
    mode: openshift-logging
EOF

# Install Cluster Logging Operator
# Create ClusterLogging CR to deploy Vector collector
cat <<EOF | oc apply -f -
apiVersion: logging.openshift.io/v1
kind: ClusterLogging
metadata:
  name: instance
  namespace: openshift-logging
spec:
  managementState: Managed
  logStore:
    type: lokistack
    lokistack:
      name: logging-loki
  collection:
    type: vector           # replaces Fluentd in newer OCP
EOF
```

## OpenShift Pipelines (Tekton)

```bash
# Install via OpenShift Pipelines operator

# Key objects:
# Task        — reusable unit of work (step: build, test, push)
# TaskRun     — one execution of a Task
# Pipeline    — chain of Tasks
# PipelineRun — one execution of a Pipeline
# Workspace   — shared storage between Tasks
# Trigger     — event-based pipeline execution

# Example Pipeline
cat <<EOF | oc apply -f -
apiVersion: tekton.dev/v1beta1
kind: Pipeline
metadata:
  name: build-and-deploy
  namespace: myproject
spec:
  params:
  - name: image-url
    type: string
  workspaces:
  - name: source
  tasks:
  - name: clone
    taskRef:
      name: git-clone
      kind: ClusterTask
    workspaces:
    - name: output
      workspace: source
    params:
    - name: url
      value: https://github.com/org/myapp

  - name: build
    taskRef:
      name: buildah         # builds OCI image using Buildah
      kind: ClusterTask
    runAfter: [clone]
    workspaces:
    - name: source
      workspace: source
    params:
    - name: IMAGE
      value: $(params.image-url)

  - name: deploy
    taskRef:
      name: openshift-client
      kind: ClusterTask
    runAfter: [build]
    params:
    - name: SCRIPT
      value: oc rollout restart deployment/myapp -n production
EOF

# Trigger via tkn CLI
tkn pipeline start build-and-deploy \
  -p image-url=image-registry.openshift-image-registry.svc:5000/myproject/myapp:latest \
  -w name=source,claimName=pipeline-pvc \
  -n myproject

# Watch logs
tkn pipelinerun logs --last -f -n myproject
```
