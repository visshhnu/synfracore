# OpenShift — Interview Questions

Real questions from enterprise OCP interviews — admin, operations, and architecture focus. Based on actual HPE/telecom production experience with OCP 4.14-4.16.

---

## Architecture

**What is the difference between OpenShift and vanilla Kubernetes?**
OpenShift is Red Hat's enterprise Kubernetes distribution. Kubernetes provides the container orchestration engine — OpenShift adds everything enterprises need on top: built-in HAProxy Router (Routes instead of Ingress), integrated OAuth authentication server, Security Context Constraints (SCCs) for pod-level security, built-in Prometheus/Alertmanager monitoring stack, internal image registry, Operator Lifecycle Manager (OLM) for operator management, and the Cluster Version Operator (CVO) for managed upgrades. The CLI is `oc` (superset of kubectl). For production enterprise workloads, especially in telecom, banking, and healthcare, OpenShift is the dominant choice because one Red Hat support contract covers the entire platform.

**What is etcd and why does it need 3 or 5 nodes?**
etcd is the distributed key-value store where ALL cluster state is stored — every object (pod, deployment, service, configmap, secret) is stored in etcd. It uses the Raft consensus algorithm which requires a quorum: more than half the nodes must be available to accept writes. With 3 nodes: can tolerate 1 failure (2/3 quorum). With 5 nodes: can tolerate 2 failures. You NEVER run 2 control plane nodes — 2 nodes with 1 failure = no quorum, cluster becomes read-only. Always 3 minimum. etcd also requires fast SSD storage — use `fio` to test, p99 fsync latency must be under 10ms. Slow etcd = slow cluster response.

**What are the different node types in OCP?**
Control Plane nodes (Masters) run etcd, API server, Controller Manager, and Scheduler — always 3 for HA. Worker nodes (Compute) run application workloads. Infrastructure nodes run platform components like HAProxy Router, Internal Registry, Monitoring, and Logging — separating these reduces Red Hat licensing costs because infrastructure nodes are licensed differently. Bootstrap node is temporary — only used during install, then decommissioned.

**What is a DeploymentConfig vs a Deployment?**
DeploymentConfig is OCP-specific (legacy) — it predates the standard Kubernetes Deployment object. It had features like lifecycle hooks and image change triggers. In OCP 4.x, the standard Kubernetes Deployment is preferred because it's ecosystem-standard, has better tooling support, and Red Hat has aligned OCP with upstream Kubernetes. DeploymentConfig is still supported for backward compatibility but should not be used for new workloads. ImageStreams and image change triggers that DeploymentConfig relied on are now better handled by external CI.

---

## Security Context Constraints (SCCs)

**What are SCCs and why are they the most important OCP-specific concept?**
Security Context Constraints (SCCs) control what a pod is allowed to do at the OS level — whether it can run as root, use privileged mode, access host networking, mount host paths, or use specific volume types. Every pod gets an SCC assigned at admission. The default `restricted` SCC prevents running as root and is applied to all pods automatically. This is the most common source of failures when migrating workloads from vanilla Kubernetes to OCP — images that run as root on K8s fail the `restricted` SCC on OCP. Vanilla Kubernetes doesn't have SCCs (it has Pod Security Admission since 1.25, but it's less granular).

**A pod fails with an SCC violation error. What do you do?**
First, read the exact error: `unable to validate against any security context constraint: [provider "restricted"...]`. This tells you which SCC was tried. Check which SCC the pod needs: look at what user the container runs as (`RUN whoami` or check Dockerfile USER). If it needs to run as root, grant `anyuid` to the service account: `oc adm policy add-scc-to-user anyuid -z <serviceaccount> -n <namespace>`. Verify: `oc get pod <pod> -o yaml | grep scc`. For production, always use the least permissive SCC possible — don't just grant `privileged` for everything. Never grant `privileged` unless it's a system-level workload like a monitoring agent or storage driver.

**What SCC would you grant to a legacy application that must run as root?**
`anyuid` — it allows the pod to run as any UID including root. I would: (1) create a dedicated service account for the app, (2) grant anyuid to that specific service account only (`oc adm policy add-scc-to-user anyuid -z myapp-sa -n myproject`), (3) reference that service account in the deployment spec. I would NOT grant anyuid to the `default` service account because that affects all pods in the namespace that don't specify a service account.

---

## Networking

**What are Routes and how are they different from Kubernetes Ingress?**
In standard Kubernetes, Ingress is the HTTP/HTTPS routing resource — but you need a separate Ingress controller (Nginx, Traefik, etc.) to make it work. OpenShift Routes are OCP's native equivalent — they're built on top of HAProxy which comes pre-configured in OCP as the Ingress Operator. Routes are easier to use and support three TLS modes: Edge (TLS terminates at the Router, traffic goes to pod unencrypted), Passthrough (TLS goes all the way to the pod — pod handles TLS), and Reencrypt (TLS terminates at Router, re-encrypted to pod). OCP also supports standard Kubernetes Ingress — it automatically converts Ingress objects to Routes internally.

**Explain the three Route TLS termination types.**
Edge termination: TLS terminates at the HAProxy Router. Traffic between Router and pod is unencrypted (HTTP). Use when: you want SSL offloading at the load balancer, pod doesn't need TLS. Most common for web apps. Passthrough termination: TLS goes end-to-end to the pod. The Router doesn't see the decrypted traffic. Use when: you need end-to-end encryption, database connections, or MTLS. Reencrypt termination: TLS terminates at the Router (Router decrypts), then re-encrypts traffic to the pod using a different certificate. Use when: compliance requires encryption in transit everywhere but you also want Router-level SSL inspection or WAF.

**What is Multus and when do you need it?**
Multus is a meta-CNI plugin that allows pods to have multiple network interfaces. By default, a pod has one interface: eth0 (connected to the cluster network via OVN-Kubernetes). With Multus, you can attach additional interfaces — for example, a data plane network with SR-IOV for high-performance packet processing alongside the management eth0. This is essential in telecom/NFV workloads where you need separate management and data plane networks, or in storage environments where you need to separate storage traffic from application traffic. Multus is installed by default in OCP 4.x.

---

## Operations

**Walk me through how you upgrade an OCP cluster.**
(1) Verify cluster health first: `oc get co` — all operators Available=True, Degraded=False. `oc get nodes` — all Ready. `oc get mcp` — workers all Updated=True. (2) Check what's available: `oc adm upgrade`. Review Red Hat release notes for the target version. (3) Always upgrade non-prod first — validate for 1-2 days. (4) Apply: `oc adm upgrade --to-latest=true` or `--to=<specific-version>`. (5) Monitor: `watch oc get clusterversion` for overall status, `watch oc get co` as operators upgrade sequentially, `watch oc get nodes` as workers drain and reboot via MachineConfigPool. (6) Total time is 1-3 hours. Control plane upgrades first, then workers roll through. Never skip minor versions — 4.12 → 4.13 → 4.14, never 4.12 → 4.14 directly unless using EUS channel.

**A pod is stuck in CrashLoopBackOff. Walk me through your exact troubleshooting steps.**
(1) `oc describe pod <pod> -n <ns>` — check the Events section at the bottom. This immediately shows OOMKilled, ImagePullBackOff, or other admission errors. (2) `oc logs <pod> --previous -n <ns>` — logs from the container that just crashed. Most important command — shows the actual application error. (3) Check exit code in describe output: exit code 137 = OOMKilled (increase memory limits), exit code 1 = app crashed (check logs), exit code 2 = misuse of shell builtin. (4) If OOMKilled: increase `resources.limits.memory` in the deployment spec. For Java apps, explicitly set JVM heap: `-Xmx512m`. (5) If liveness probe is too aggressive (fails before app finishes starting): add `startupProbe` or increase `initialDelaySeconds`. (6) If missing config: `oc exec` into a healthy pod or `oc exec -it <pod> -- env` to verify environment variables and mounted files.

**How do you perform a zero-downtime deployment on OCP?**
Four things must be in place: (1) `readinessProbe` configured — this is the most critical. Without it, traffic hits pods before they're ready and users see errors. (2) `RollingUpdate` strategy with `maxUnavailable: 0` — never take a pod down before a new one is ready. (3) Adequate resource requests so the scheduler can actually place new pods on available nodes. (4) `PodDisruptionBudget` — ensures minimum pods stay available even during node maintenance. For critical releases: use Blue/Green — deploy the new version as a separate Deployment, test it via port-forward, then switch the Route to point to the new service. Instant rollback = switch Route back. Takes 2 minutes, zero user impact.

---

## Storage

**Explain RWO vs RWX and when you need each.**
ReadWriteOnce (RWO) means only one pod on one node can mount the volume for reading and writing. This is block storage (AWS EBS, Azure Disk, iSCSI). It gives the best performance because it's like a direct-attached disk. Use for: single-instance databases, stateful apps with one replica. ReadWriteMany (RWX) means multiple pods on multiple nodes can mount and read/write simultaneously. This is file storage (NFS, CephFS/ODF, Azure Files). Use when: you need horizontal scaling with shared file state, or live migration of VMs (the VM disk must be mounted on both source and destination node at the same time). For live migration with OpenShift Virtualization, RWX is mandatory — the VM cannot migrate if it's on RWO storage.

---

## KubeVirt and OpenShift Virtualization

**What is OpenShift Virtualization and why would you run VMs on OCP?**
OpenShift Virtualization (built on KubeVirt) allows running VMs alongside containers on the same OCP cluster. VMs run as pods (virt-launcher pods), managed by the same RBAC, networking, storage, and monitoring as containers. Reasons to use it: (1) Migrate legacy applications that can't be containerised — Windows apps, licensed software with hardware bindings. (2) Unified platform — one team manages both VMs and containers instead of separate vSphere + OCP teams. (3) Live migration — move VMs between nodes with zero downtime. (4) Consolidation — eliminate separate hypervisor licensing.

**What is live migration and what are its requirements?**
Live migration moves a running VM from one OCP node to another with no downtime. The VM keeps running — memory pages are transferred incrementally to the destination, then a final fast cutover happens. Requirements: (1) Shared storage — the VM disk must be on RWX storage (CephFS/ODF or NFS) so both source and destination can mount it simultaneously. RWO storage blocks live migration. (2) CPU compatibility — source and destination nodes must have compatible CPU features. Use `cpu.model: host-model` for maximum compatibility. (3) Sufficient resources on destination node. (4) Live migration network — a dedicated network interface for migrating memory traffic (optional but recommended in production to not saturate the primary network).

---

## CI/CD on OpenShift

**Compare Jenkins and OpenShift Pipelines (Tekton) for CI/CD on OCP.**
Jenkins is the traditional choice — mature ecosystem, huge plugin library, most teams already know it. In OCP, Jenkins runs as a pod using the Jenkins Operator, with build agents running as ephemeral pods (scales to zero when idle). OpenShift Pipelines (Tekton) is the cloud-native approach built into OCP — pipeline definitions are Kubernetes objects (Pipeline, Task, PipelineRun), Git-native, event-driven via Triggers. Tekton is the strategic direction Red Hat is investing in. In practice: greenfield projects should use Tekton. Brownfield enterprises with existing Jenkins investments should keep Jenkins — migrating is high cost for low benefit. Both can coexist.

**What is GitOps and how does ArgoCD work on OCP?**
GitOps means Git is the single source of truth for what should be running in the cluster. No direct `kubectl apply` in production — every change goes through Git first (PR → review → merge → deploy). ArgoCD (OpenShift GitOps operator) watches a Git repository and continuously reconciles the cluster state with Git. If someone manually changes something in the cluster (drift), ArgoCD detects it and can automatically revert it. Key benefit: rollback = `git revert`. Full audit trail in Git history. At HPE, every production deployment went through ArgoCD — no one could `oc apply` directly to production. If the cluster and Git diverged, ArgoCD would alert immediately.
