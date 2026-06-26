# OpenShift OCP 4.x

> **Enterprise Kubernetes — SCC, Routes, Operators, Day-2 Operations**

**Category:** Containers & Orchestration  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is OpenShift OCP 4.x?

Red Hat OpenShift Container Platform (OCP) is enterprise Kubernetes with built-in CI/CD (Tekton), integrated monitoring (Prometheus+Grafana), web console, OAuth server, Security Context Constraints (SCC), and Operator framework. Key differences: OCP uses Routes (HAProxy-based) instead of Ingress, has built-in image registry, SCCs replace PodSecurityPolicy, and oc CLI is a superset of kubectl with OCP-specific commands.

## Why OpenShift OCP 4.x?

OCP has four node types: Control Plane (run etcd, API server, Scheduler), Worker (run workloads), Infrastructure (run platform components like Ingress, Registry, Monitoring — reduces licensing), Bootstrap (temporary, decommissioned after install). CVO manages OCP upgrades. MCO manages OS-level config on nodes via MachineConfig objects. OLM manages operator installation and upgrades.

---

## Learning Modules

### Module 01 — What is OpenShift?
*OCP vs vanilla Kubernetes*

Red Hat OpenShift Container Platform (OCP) is enterprise Kubernetes with built-in CI/CD (Tekton), integrated monitoring (Prometheus+Grafana), web console, OAuth server, Security Context Constraints (SCC), and Operator framework. Key differences: OCP uses Routes (HAProxy-based) instead of Ingress, has built-in image registry, SCCs replace PodSecurityPolicy, and oc CLI is a superset of kubectl with OCP-specific commands.

**Topics covered:**

- OCP vs Kubernetes differences — 🟢 Beginner
- Routes vs Ingress — 🟢 Beginner
- SCC vs PodSecurityPolicy — 🟡 Intermediate
- oc CLI vs kubectl — 🟢 Beginner
- DeploymentConfig vs Deployment — 🟡 Intermediate

### Module 02 — OCP Architecture
*Control plane, node types, core components*

OCP has four node types: Control Plane (run etcd, API server, Scheduler), Worker (run workloads), Infrastructure (run platform components like Ingress, Registry, Monitoring — reduces licensing), Bootstrap (temporary, decommissioned after install). CVO manages OCP upgrades. MCO manages OS-level config on nodes via MachineConfig objects. OLM manages operator installation and upgrades.

**Topics covered:**

- Control Plane nodes (3 for HA) — 🟢 Beginner
- Worker and Infrastructure nodes — 🟡 Intermediate
- etcd — cluster state store — 🟡 Intermediate
- Cluster Version Operator (CVO) — 🟡 Intermediate
- Machine Config Operator (MCO) — 🔴 Advanced
- OLM — Operator Lifecycle Manager — 🟡 Intermediate

### Module 03 — Security Context Constraints
*OCP\*

SCCs are OCP's security policy for pods — stricter than vanilla Kubernetes. Default SCC "restricted" prevents running as root. Common error: "unable to validate against any security context constraint" — fix by adding SCC to the pod's ServiceAccount. Never use "privileged" SCC in production. Create custom SCCs with minimum required permissions.

**Topics covered:**

- SCC types: restricted → privileged — 🟡 Intermediate
- anyuid SCC for legacy apps — 🟡 Intermediate
- Adding SCC to ServiceAccount — 🟡 Intermediate
- Creating custom SCC — 🔴 Advanced
- Debugging SCC errors — 🔴 Advanced

### Module 04 — Routes & Networking
*HAProxy routes, TLS termination*

Routes are OCP's equivalent of Kubernetes Ingress, but more powerful. Three TLS modes: Edge (TLS terminated at router, plain to pod), Passthrough (TLS all the way to pod — router cannot inspect), Re-encrypt (TLS to router, new cert to pod). Route weights enable A/B deployments — split traffic between two services by percentage.

**Topics covered:**

- oc expose svc — create route — 🟢 Beginner
- Edge TLS termination — 🟡 Intermediate
- Passthrough TLS — 🟡 Intermediate
- Re-encrypt TLS — 🔴 Advanced
- Route weights and A/B traffic — 🔴 Advanced

### Module 05 — Operators & OLM
*OperatorHub, CRDs, day-2 operations*

Operators extend OCP with new capabilities (databases, monitoring, GitOps). OLM manages their lifecycle. Subscription controls which channel and approval strategy (Automatic vs Manual — use Manual for production to control upgrade timing). MachineConfig manages OS-level config: kernel args, systemd units. Applying MachineConfig triggers rolling node drain + reboot.

**Topics covered:**

- OperatorHub and operator install — 🟡 Intermediate
- Subscription and approval strategy — 🟡 Intermediate
- ClusterServiceVersion (CSV) — 🟡 Intermediate
- MachineConfig and node management — 🔴 Advanced
- MachineConfigPool (MCP) — 🔴 Advanced

### Module 06 — CI/CD on OCP
*Jenkins, Tekton pipelines*

Two CI/CD approaches on OCP: Jenkins (legacy but common in enterprise) uses Kubernetes plugin to run ephemeral agent pods. Tekton (OpenShift Pipelines) is the strategic direction — cloud-native, K8s-native, event-driven. Tekton objects: Task (unit of work), Pipeline (chain of Tasks), PipelineRun (execution), Trigger (webhook → PipelineRun).

**Topics covered:**

- Jenkins on OCP with Kubernetes plugin — 🟡 Intermediate
- Tekton Pipeline and Task objects — 🔴 Advanced
- EventListener and Triggers — 🔴 Advanced
- oc set image for rolling deploy — 🟢 Beginner

### Module 07 — Essential oc Commands
*Day-2 operations cheatsheet*

The oc CLI extends kubectl with OCP-specific commands. oc new-project creates both a Namespace and a Project (OCP abstraction). oc adm commands are admin-level operations. oc debug creates a copy of a pod for troubleshooting. Always use oc rollout status to verify deployments completed.

**Topics covered:**

- Login, projects, get all — 🟢 Beginner
- Scale, rollout, rollback — 🟢 Beginner
- Debug pod, exec, logs — 🟡 Intermediate
- Describe, events, resource usage — 🟢 Beginner

---

## Production Example


---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is OpenShift OCP 4.x and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does OpenShift OCP 4.x work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of OpenShift OCP 4.x?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in OpenShift OCP 4.x?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with OpenShift OCP 4.x?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe OpenShift OCP 4.x in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for OpenShift OCP 4.x?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does OpenShift OCP 4.x compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain What is OpenShift? in OpenShift OCP 4.x."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain OCP Architecture in OpenShift OCP 4.x."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [OpenShift Documentation](https://docs.openshift.com/container-platform/4.16/welcome/index.html)
- [OCP Release Notes](https://docs.openshift.com/container-platform/4.16/release_notes/ocp-4-16-release-notes.html)
- [SCC Documentation](https://docs.openshift.com/container-platform/4.16/authentication/managing-security-context-constraints.html)
- [oc CLI Reference](https://docs.openshift.com/container-platform/4.16/cli_reference/openshift_cli/getting-started-cli.html)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*