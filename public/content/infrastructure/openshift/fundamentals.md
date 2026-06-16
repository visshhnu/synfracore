# OpenShift — Fundamentals

## Installation Methods

| Method | When to Use |
|---|---|
| **IPI** — Installer Provisioned Infrastructure | OCP installs AND manages cloud infra (AWS, Azure, GCP, vSphere). Recommended for cloud |
| **UPI** — User Provisioned Infrastructure | You provision nodes manually. Required for bare-metal, restricted networks, on-prem |
| **Assisted Installer** | Web-based guided install via Red Hat Console — best for on-prem/bare-metal |
| **Agent-based Installer** | Disconnected/air-gapped environments — ISO-based, no internet required |
| **Single Node OpenShift (SNO)** | All OCP roles on one node — edge/lab only, no HA |

## Pre-Installation Checklist

Before running `openshift-install create cluster`:

```
DNS:
  api.<cluster>.<domain>         → must resolve to load balancer / VIP
  *.apps.<cluster>.<domain>      → wildcard, must resolve to ingress VIP

Pull Secret:
  Download from cloud.redhat.com
  Required to pull all OCP images from registry.redhat.io

SSH Key pair:
  For node access post-install

Network — these must NOT overlap:
  Machine CIDR    → node IP range
  Cluster Network → pod CIDR (default 10.128.0.0/14)
  Service Network → service CIDR (default 172.30.0.0/16)

Firewall ports:
  6443   → OCP API server
  22623  → Machine Config Server (nodes call this)
  80/443 → Apps (Ingress/Router)
  2379-2380 → etcd (control plane internal)
  9000-9999 → Node services

Storage:
  etcd requires fast SSD
  Test with fio: p99 fsync latency must be ≤ 10ms
  Slow etcd = slow cluster
```

## install-config.yaml — Key Fields

This file is consumed ONCE during install. Edit it carefully before running the installer:

```yaml
apiVersion: v1
baseDomain: example.com               # root domain
metadata:
  name: mycluster                     # cluster name (becomes part of all DNS)
controlPlane:
  replicas: 3                         # ALWAYS 3 for HA. Never 2 (no quorum), never 1
compute:
  - replicas: 3                       # worker nodes (can scale post-install)
networking:
  clusterNetwork:
    - cidr: 10.128.0.0/14            # pod CIDR
      hostPrefix: 23
  serviceNetwork:
    - 172.30.0.0/16                  # service CIDR
  machineNetwork:
    - cidr: 192.168.1.0/24          # node CIDR
  networkType: OVNKubernetes         # default in OCP 4.x
platform:
  aws:                               # or azure, gcp, none (bare-metal UPI)
    region: ap-south-1
pullSecret: '{"auths": {...}}'       # from cloud.redhat.com
sshKey: ssh-rsa AAAA...             # your public key
fips: false                          # FIPS 140-2 — set at install time, CANNOT change later
```

## Post-Install Verification

```bash
# All nodes Ready?
oc get nodes

# All Cluster Operators healthy?
oc get co
# Every CO should show: AVAILABLE=True, PROGRESSING=False, DEGRADED=False
# If any show DEGRADED=True — that CO has a problem

# Cluster version and status
oc get clusterversion

# Any failing pods?
oc get pods -A | grep -v Running | grep -v Completed

# Access web console
# URL: https://console-openshift-console.apps.<cluster>.<domain>
```

## oc CLI — The OpenShift CLI

`oc` is a superset of `kubectl` — every `kubectl` command works as `oc`. Plus OCP-specific commands.

### Essential oc Commands

```bash
# ── AUTHENTICATION ────────────────────────────────────────
oc login https://api.<cluster>:6443 -u admin -p password
oc login --token=<token> --server=https://api.<cluster>:6443
oc whoami                                    # show current user
oc whoami --show-token                       # show auth token
oc logout

# ── PROJECTS (NAMESPACES) ────────────────────────────────
oc get projects                              # list all projects
oc projects                                  # list + show current
oc project <name>                            # switch to project
oc new-project myapp \
  --display-name='My Application' \
  --description='Production app'
oc delete project myapp

# ── RESOURCES ────────────────────────────────────────────
oc get all -n <ns>                           # everything in a namespace
oc get pods -n <ns>
oc get pods -o wide -n <ns>                  # with IP and node info
oc get pods -A                               # all namespaces
oc get pods -w -n <ns>                       # watch live
oc get svc -n <ns>
oc get routes -n <ns>
oc get deployments -n <ns>
oc get configmaps -n <ns>
oc get secrets -n <ns>
oc get pvc -n <ns>
oc get nodes
oc get co                                    # cluster operators
oc get clusterversion
oc get mcp                                   # machine config pools

# ── CREATING AND MANAGING ────────────────────────────────
oc apply -f manifest.yaml
oc apply -f ./directory/                     # apply all YAMLs in dir
oc create -f manifest.yaml
oc delete -f manifest.yaml
oc delete pod <pod> -n <ns>
oc delete pod <pod> -n <ns> --grace-period=0 --force   # force delete stuck pod
oc edit deployment/<name> -n <ns>            # live edit

# ── SCALING & ROLLOUTS ───────────────────────────────────
oc scale deployment/<name> --replicas=3 -n <ns>
oc rollout status deployment/<name> -n <ns>  # watch rollout progress
oc rollout history deployment/<name> -n <ns>
oc rollout undo deployment/<name> -n <ns>    # rollback to previous
oc rollout undo deployment/<name> --to-revision=2 -n <ns>
oc set image deployment/<name> <container>=<image>:<tag> -n <ns>

# ── DEBUGGING ────────────────────────────────────────────
oc describe pod <pod> -n <ns>               # most useful troubleshooting command
oc logs <pod> -n <ns>
oc logs <pod> -f -n <ns>                    # follow logs
oc logs <pod> --previous -n <ns>            # logs from crashed container
oc logs <pod> -c <container> -n <ns>        # specific container
oc exec -it <pod> -n <ns> -- /bin/bash      # shell into pod
oc exec -it <pod> -n <ns> -- /bin/sh        # if bash not available
oc exec <pod> -n <ns> -- env                # list env vars
oc get events -n <ns> --sort-by='.lastTimestamp'  # events sorted by time
oc adm top nodes                            # CPU/memory per node
oc adm top pods -n <ns>                    # CPU/memory per pod
oc port-forward pod/<pod> 8080:8080 -n <ns>
oc rsync <local>/ <pod>:/remote -n <ns>     # copy files to pod

# ── ADMIN COMMANDS ───────────────────────────────────────
oc adm must-gather                          # collect full diagnostic bundle for Red Hat support
oc adm upgrade                             # check available upgrades
oc adm upgrade --to-latest=true            # apply latest upgrade
oc adm node-logs <node>                    # node system logs
oc adm drain <node> --ignore-daemonsets    # drain node for maintenance
oc adm uncordon <node>                     # bring node back
oc api-resources | grep <keyword>          # find API resource names
oc cluster-info                            # cluster API and console URLs
```

## Projects — OCP's Namespaces

In OCP, a **Project** is a Kubernetes Namespace with additional metadata:

```bash
# Create project
oc new-project production \
  --display-name='Production Environment' \
  --description='Live production workloads'

# Projects get annotations automatically:
# openshift.io/display-name
# openshift.io/description
# openshift.io/requester (who created it)

# ResourceQuota — limit total resources in a project
oc create quota production-quota \
  --hard=pods=20,requests.cpu=8,requests.memory=16Gi,persistentvolumeclaims=10 \
  -n production

# LimitRange — default/max per pod in a project
cat <<EOF | oc apply -f -
apiVersion: v1
kind: LimitRange
metadata:
  name: default-limits
  namespace: production
spec:
  limits:
  - type: Container
    default:          # default LIMIT if not specified
      cpu: 500m
      memory: 256Mi
    defaultRequest:   # default REQUEST if not specified
      cpu: 100m
      memory: 128Mi
    max:              # maximum allowed
      cpu: "4"
      memory: 4Gi
