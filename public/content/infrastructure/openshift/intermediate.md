# OpenShift — Cluster Administration

## Control Plane Architecture Deep Dive

The OCP control plane runs on **master nodes** — always 3 for HA. Each master runs:

```
┌─────────────────────────────────────────────────────────┐
│                  Master Node (×3)                       │
│                                                         │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  │
│  │  API Server  │  │    etcd      │  │  Controller  │  │
│  │  (kube-api)  │  │  (database)  │  │   Manager    │  │
│  └──────────────┘  └──────────────┘  └──────────────┘  │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  │
│  │  Scheduler   │  │   kubelet    │  │ CRI-O        │  │
│  │              │  │  (manages    │  │ (container   │  │
│  │              │  │   node)      │  │  runtime)    │  │
│  └──────────────┘  └──────────────┘  └──────────────┘  │
└─────────────────────────────────────────────────────────┘
```

## etcd — The Cluster Brain

etcd stores **all cluster state** — every object (pod, deployment, secret, configmap, node) as key-value pairs. If etcd is unhealthy, the cluster stops accepting writes.

### Where etcd Runs
In OCP 4.x, etcd runs as **static pods** on all 3 control plane nodes — managed by the etcd Operator.

```bash
# Check etcd health
oc get etcd cluster -o yaml | grep -A10 conditions

# View etcd pods
oc get pods -n openshift-etcd

# Check etcd member list (run inside etcd pod)
oc rsh -n openshift-etcd etcd-master-0
etcdctl member list \
  --endpoints=https://localhost:2379 \
  --cacert=/etc/kubernetes/static-pod-certs/configmaps/etcd-serving-ca/ca-bundle.crt \
  --cert=/etc/kubernetes/static-pod-certs/secrets/etcd-all-certs/etcd-peer-master-0.crt \
  --key=/etc/kubernetes/static-pod-certs/secrets/etcd-all-certs/etcd-peer-master-0.key

# Defrag etcd (frees space — run periodically)
etcdctl defrag --endpoints=https://localhost:2379 ...
```

### etcd Performance Requirements
```bash
# Test etcd disk latency (must be under 10ms p99)
# Slow disk = slow cluster API response
fio --rw=write --ioengine=sync --fdatasync=1 --filename=/var/lib/etcd/test \
    --size=22m --bs=2300 --name=mytest

# Monitor etcd latency
oc get --raw /metrics | grep etcd_disk_wal_fsync_duration
# p99 should be < 10ms — if higher, upgrade disk to SSD/NVMe
```

### etcd Backup — Critical for Disaster Recovery

```bash
# ALWAYS backup etcd before:
# - Cluster upgrades
# - Infrastructure changes
# - Deleting critical resources

# SSH into a control plane node
ssh core@master-0.cluster.example.com

# Run the backup script (built into OCP)
sudo /usr/local/bin/cluster-backup.sh /home/core/backup/

# Output:
# snapshot_2026_01_15_120000.db        ← etcd snapshot
# static_kuberesources_2026_01_15.tar.gz ← static pod manifests

# Copy backup off the node immediately
scp core@master-0:/home/core/backup/* /safe/backup/location/

# Restore from backup (disaster recovery only)
sudo -E /usr/local/bin/cluster-restore.sh /home/core/backup/
```

## API Server — How to Manage It

The API server is the **only entry point** for all cluster operations. All `oc` and `kubectl` commands go through it.

```bash
# Check API server health
oc get clusteroperator kube-apiserver
# AVAILABLE=True, PROGRESSING=False, DEGRADED=False = healthy

# View API server pods (one per master)
oc get pods -n openshift-kube-apiserver

# Check API server audit logs (who did what)
oc adm node-logs master-0 --path=kube-apiserver/audit.log | head -50

# Check API server error rate
oc get --raw /metrics | grep apiserver_request_total

# Restart API server (rarely needed — operator handles this)
# DO NOT manually delete API server pods — the operator will recreate them
# If needed: oc delete pod <apiserver-pod> -n openshift-kube-apiserver

# Check API server certificates expiry
oc get secret -n openshift-kube-apiserver \
  -o jsonpath='{range .items[*]}{.metadata.name}{" "}{.data.tls\.crt}{"\n"}{end}' \
  | grep -v "^$" | while read name cert; do
    expiry=$(echo $cert | base64 -d | openssl x509 -noout -enddate 2>/dev/null)
    echo "$name: $expiry"
  done
```

## kubelet — Node Agent

kubelet runs on **every node** (masters and workers). It:
- Receives pod specs from API server
- Ensures containers are running via CRI-O
- Reports node status back to API server
- Runs liveness/readiness probes

```bash
# Check kubelet status on a node
oc adm node-logs <nodename> --unit=kubelet | tail -50
# or ssh into the node:
ssh core@worker-1.cluster.example.com
sudo systemctl status kubelet

# View kubelet configuration
oc get configmap kubelet-config-1.27 -n openshift-config-managed -o yaml

# Kubelet logs — most useful for pod scheduling issues
oc adm node-logs worker-1 --unit=kubelet | grep -i "error\|fail\|warning" | tail -30

# Check node conditions (kubelet reports these)
oc describe node worker-1 | grep -A20 "Conditions:"
# DiskPressure=False    ← OK
# MemoryPressure=False  ← OK
# PIDPressure=False     ← OK
# Ready=True            ← kubelet healthy

# Restart kubelet (node stays up, pods may restart)
ssh core@worker-1.cluster.example.com
sudo systemctl restart kubelet
```

## Controller Manager and Scheduler

```bash
# Controller Manager — runs control loops
# Watches desired state vs actual state and reconciles
# Example: Deployment controller ensures N replicas always running

# Check controller manager
oc get pods -n openshift-kube-controller-manager
oc get clusteroperator kube-controller-manager

# Scheduler — places pods on nodes
oc get pods -n openshift-kube-scheduler
oc get clusteroperator kube-scheduler

# Debug scheduler decisions
oc describe pod <pending-pod> -n <ns>
# Events section shows WHY scheduler couldn't place it:
# "0/3 nodes available: 3 Insufficient memory"
# "0/3 nodes available: 3 node(s) had taint"
# "0/3 nodes available: 3 node(s) didn't match node selector"
```

## Node Management

```bash
# List all nodes with status
oc get nodes
oc get nodes -o wide    # includes IP, OS, kernel version

# Node details — CPU, memory, conditions, allocated resources
oc describe node worker-1

# Node resource usage
oc adm top nodes

# Mark node unschedulable (stop new pods landing on it)
oc adm cordon worker-1

# Drain node for maintenance (evicts all pods)
oc adm drain worker-1 \
  --ignore-daemonsets \
  --delete-emptydir-data \
  --grace-period=30

# After maintenance — bring node back
oc adm uncordon worker-1

# Add label to node (for nodeSelector scheduling)
oc label node worker-1 disk=ssd
oc label node worker-2 role=gpu

# Add taint (repels pods without matching toleration)
oc adm taint node worker-1 key=value:NoSchedule

# Remove taint
oc adm taint node worker-1 key:NoSchedule-

# Node logs (system journal)
oc adm node-logs worker-1 --unit=crio          # container runtime logs
oc adm node-logs worker-1 --unit=kubelet        # kubelet logs
oc adm node-logs worker-1 --path=openshift-apiserver/audit.log
```

## CRI-O — Container Runtime

OCP uses **CRI-O** (not Docker) as the container runtime. kubelet talks to CRI-O via CRI (Container Runtime Interface).

```bash
# SSH into a node to use crictl (CRI-O client)
ssh core@worker-1.cluster.example.com

# List running containers
sudo crictl ps

# List pods
sudo crictl pods

# Check container logs
sudo crictl logs <container-id>

# Pull an image manually
sudo crictl pull quay.io/openshift-release-dev/ocp-v4.0-art-dev:latest

# CRI-O logs
sudo journalctl -u crio -f
```

## Machine Config Operator (MCO)

MCO manages the OS configuration of all nodes via **MachineConfig** objects. Changes trigger a rolling reboot of affected nodes.

```bash
# Check MachineConfigPool status
oc get mcp
# NAME     CONFIG                     UPDATED  UPDATING  DEGRADED
# master   rendered-master-abc123     True     False     False
# worker   rendered-worker-def456     False    True      False  ← updating

# Pause worker MCP (batch multiple MC changes → single reboot)
oc patch mcp worker --type merge -p '{"spec":{"paused":true}}'
# Apply all your MachineConfigs here
oc patch mcp worker --type merge -p '{"spec":{"paused":false}}'
# ONE rolling reboot applies all changes

# Check what changed in a MachineConfig
oc describe mc rendered-worker-def456 | grep -A20 "Config:"

# View all MachineConfigs
oc get mc | sort

# Create a MachineConfig (adds a file to all workers)
cat <<EOF | oc apply -f -
apiVersion: machineconfiguration.openshift.io/v1
kind: MachineConfig
metadata:
  labels:
    machineconfiguration.openshift.io/role: worker
  name: worker-custom-sysctl
spec:
  config:
    ignition:
      version: 3.4.0
    storage:
      files:
      - path: /etc/sysctl.d/99-custom.conf
        contents:
          source: data:,net.ipv4.ip_forward%3D1
        mode: 0644
EOF
```

## Cluster Operators — The Health Dashboard

Cluster Operators (COs) are the controllers that manage all OCP platform components. They are your primary health indicator.

```bash
# Check ALL cluster operators at once
oc get co

# What you want to see:
# NAME                        AVAILABLE  PROGRESSING  DEGRADED
# authentication              True       False         False   ✅
# console                     True       False         False   ✅
# dns                         True       False         False   ✅
# etcd                        True       False         False   ✅
# ingress                     True       False         False   ✅
# kube-apiserver              True       False         False   ✅
# ...

# If any CO shows DEGRADED=True or AVAILABLE=False:
oc describe co <operator-name>
# Read the "Status → Conditions" section for exact reason

# Check a specific operator's pods
oc get pods -n openshift-ingress
oc get pods -n openshift-etcd
oc get pods -n openshift-kube-apiserver

# Get operator logs
oc logs -n openshift-ingress deployment/ingress-operator
```

## Cluster Version Operator (CVO) — Managing Upgrades

```bash
# Current cluster version
oc get clusterversion
# NAME      VERSION  AVAILABLE  PROGRESSING  SINCE   STATUS
# version   4.15.3   True       False         2d      Cluster version is 4.15.3

# Check available updates
oc adm upgrade

# Apply update
oc adm upgrade --to-latest=true
# or specific version:
oc adm upgrade --to=4.15.10

# Monitor upgrade progress
watch oc get clusterversion    # overall status
watch oc get co                # operators updating one by one
watch oc get nodes             # workers draining and rebooting
watch oc get mcp               # machine config pool rolling update

# Pause upgrade (if issues found)
oc patch clusterversion version \
  --type merge -p '{"spec":{"overrides":[{"kind":"Deployment","name":"cluster-version-operator","namespace":"openshift-cluster-version","unmanaged":true}]}}'

# Check upgrade history
oc get clusterversion -o jsonpath='{.items[0].status.history}' | python3 -m json.tool
```

## Must-Gather — Support Bundle Collection

```bash
# Collect full diagnostic bundle for Red Hat support
oc adm must-gather

# Creates must-gather.local.<timestamp>/ directory with:
# - All pod logs from all namespaces
# - All cluster operator status
# - Events from last hour
# - Node configs and conditions
# - etcd member status

# Gather for specific operator
oc adm must-gather --image=registry.redhat.io/openshift4/ose-network-tools:latest

# Gather with custom destination
oc adm must-gather --dest-dir=/tmp/must-gather/

# Upload to Red Hat support case
tar -czf must-gather.tar.gz must-gather.local.*/
# Upload via access.redhat.com/support
```
