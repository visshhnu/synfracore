# Kubernetes Certification Guide

## Certifications Available

| Cert | Full Name | Level | Passing Score |
|------|-----------|-------|--------------|
| **CKA** | Certified Kubernetes Administrator | Intermediate | 66% |
| **CKAD** | Certified Kubernetes Application Developer | Intermediate | 66% |
| **CKS** | Certified Kubernetes Security Specialist | Advanced | 67% |

All three are **performance-based** (hands-on tasks, not multiple choice). CKS requires CKA first.

---

## CKA Exam Domains & Weights

| Domain | Weight |
|--------|--------|
| Cluster Architecture, Installation & Configuration | 25% |
| Workloads & Scheduling | 15% |
| Services & Networking | 20% |
| Storage | 10% |
| Troubleshooting | 30% |

## CKAD Exam Domains & Weights

| Domain | Weight |
|--------|--------|
| Application Design & Build | 20% |
| Application Deployment | 20% |
| Application Observability & Maintenance | 15% |
| Application Environment, Configuration & Security | 25% |
| Services & Networking | 20% |

---

## Must-Know Commands for Exam

```bash
# Time-savers (set at start of exam)
alias k=kubectl
export do='--dry-run=client -o yaml'
export now='--grace-period=0 --force'

# Generate manifests fast
k run nginx --image=nginx $do > pod.yaml
k create deploy nginx --image=nginx --replicas=3 $do > deploy.yaml
k create svc clusterip my-svc --tcp=80:80 $do > svc.yaml

# Troubleshooting (30% of CKA!)
k get events --sort-by=.lastTimestamp -n kube-system
k logs pod-name --previous
k describe pod pod-name | grep -A5 Events
k exec -it pod-name -- /bin/sh
crictl ps  # check container runtime on node
systemctl status kubelet
journalctl -u kubelet -n 50

# Cluster operations
k cordon node01   # mark unschedulable
k drain node01 --ignore-daemonsets --delete-emptydir-data
k uncordon node01
k certificate approve <csr-name>
kubeadm token create --print-join-command
```

---

## Critical Topics by Weight

**Troubleshooting (30% CKA — most important!)**
- Pod not starting: check Events, describe pod, inspect logs
- Node NotReady: check kubelet status and logs
- Network issues: check Services, Endpoints, DNS with nslookup
- etcd backup/restore: `etcdctl snapshot save/restore`

**Cluster Architecture (25%)**
- kubeadm cluster setup and upgrade
- etcd backup/restore with etcdctl
- RBAC: ClusterRole, Role, RoleBinding, ClusterRoleBinding
- Certificate management with kubeadm

**Services & Networking (20%)**
- ClusterIP, NodePort, LoadBalancer, ExternalName
- Ingress: rules, TLS, annotations
- Network policies: ingress/egress rules
- CoreDNS: service discovery patterns

---

## Exam Day Strategy

```
BEFORE STARTING:
  1. Set aliases immediately (alias k=kubectl, export do, export now)
  2. Set context for each question: kubectl config use-context <name>
  3. Note the question number you're on

DURING EXAM:
  kubernetes.io/docs is OPEN — bookmark these pages:
    kubectl cheat sheet | network policies | RBAC | volumes | ingress

  Time management: 2 hours, ~15-20 tasks
    Easy (2min): k run, k create, k expose
    Medium (5min): deployments, configmaps, RBAC
    Hard (10-15min): cluster upgrade, etcd backup, network policy

  Mark and skip hard questions — return if time permits
  Always verify your answer: k get / k describe after applying
```

---

## Study Resources

- **killer.sh** — 2 free exam simulations (included with registration)
- **KodeKloud** — CKA/CKAD interactive labs (best hands-on practice)
- **Mumshad Mannambeth** — Udemy courses (most popular prep)
- **kubernetes.io/docs** — official documentation (open during exam)
- **k8s.io/examples** — reference manifests

## Revision Notes
```
CKA: admin focus — troubleshoot, upgrade cluster, etcd backup, RBAC
CKAD: developer focus — pods, deployments, config, probes, HPA, Helm
CKS: security focus — OPA, Falco, image scanning, network policy, RBAC

EXAM FORMAT: performance-based, 2 hours, multiple clusters
killer.sh: harder than real exam — good preparation benchmark

MUST KNOW FOR CKA:
  - etcdctl snapshot save/restore (always tested)
  - kubeadm upgrade (cluster upgrade process)
  - RBAC: create role+binding for serviceaccount
  - Network Policy: isolate namespace traffic
  - Node troubleshooting: kubelet service + logs
```
