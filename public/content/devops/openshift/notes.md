# OpenShift Key Notes & Exam Tips

## OCP vs Kubernetes — What Actually Differs

**OpenShift Container Platform (OCP)**

**Complete Technical Knowledge Document**

*Administration | Configuration | Architecture | Operations | Interview Prep*

Prepared for: B. Vishnu  |  Target Role: OCP Administrative Support (HCL)

OCP Version Reference: 4.x (4.14 / 4.15 / 4.16)

**SECTION 1 — OCP ARCHITECTURE OVERVIEW**

**1.1  What is OpenShift?**

Red Hat OpenShift Container Platform (OCP) is an enterprise Kubernetes distribution built on top of upstream Kubernetes. It adds enterprise features: built-in CI/CD (Tekton), developer experience tooling, integrated monitoring (Prometheus + Grafana), a web console, security policies (SCCs), an OAuth server, and an Operator framework — all managed and supported by Red Hat.

**Key difference from vanilla Kubernetes:**

| **Feature** | **Kubernetes vs OpenShift** |
| --- | --- |
| Ingress | Kubernetes Ingress  →  OpenShift Routes (HAProxy by default) |
| Deployment | Deployment  →  OCP also supports DeploymentConfig (legacy) |
| Image builds | External CI  →  OCP has BuildConfig + ImageStream built-in |
| Security | Basic RBAC  →  OCP adds Security Context Constraints (SCCs) |
| Auth | External IdP only  →  OCP has OAuth server + HTPasswd / LDAP |
| Registry | External  →  OCP has integrated Internal Image Registry |
| CLI | kubectl  →  oc (superset of kubectl) |
| Monitoring | Optional add-on  →  Built-in Prometheus + Grafana + Alertmanager |
| Updates | Manual  →  Managed via Cluster Version Operator (CVO) |

**1.2  OCP Clust

---

## Key Architecture Points to Remember

- **RHCOS** — Red Hat CoreOS: immutable OS, managed entirely by Machine Config Operator (MCO). Never SSH and manually configure nodes.
- **etcd** — always 3 or 5 members for quorum. Backup with `oc get etcd -o yaml` and `etcdctl snapshot save`.
- **CVO** (Cluster Version Operator) — manages upgrades. Check `oc get clusterversion` before any upgrade.
- **OLM** (Operator Lifecycle Manager) — installs Operators from OperatorHub. Never install Operators manually outside OLM in production.
- **SCCs** — OpenShift's security model. `restricted-v2` is default (most restrictive). Only add `anyuid`/`privileged` when absolutely required.
- **Routes** — HAProxy-based. TLS termination at edge (most common), passthrough, or re-encrypt.
- **ImageStreams** — internal image tracking. Allows rolling updates when upstream image changes.
- **BuildConfigs** — OCP-native CI: S2I (source-to-image) or Dockerfile builds inside the cluster.

## Production Checklist

- [ ] 3 control plane nodes minimum (HA)
- [ ] etcd on dedicated fast SSD (NVMe preferred)
- [ ] Infrastructure nodes for monitoring/registry/ingress (saves licensing)
- [ ] Wildcard DNS for *.apps.<cluster>.<domain>
- [ ] API DNS for api.<cluster>.<domain>
- [ ] Image registry backed by persistent storage (OBS/NFS/Ceph)
- [ ] NetworkPolicy: default-deny, allow only what's needed
- [ ] Resource quotas per namespace
- [ ] PodDisruptionBudgets for HA applications
- [ ] Upgrade: always check `oc get co` before and after
