# OpenShift OCP 4.x — PYQ (Previously Asked / Practice Questions)

**Framing note:** Red Hat doesn't publish a leaked-question archive for its OpenShift certifications (e.g., EX280). What follows is built from this guide's own Learning Modules material, framed as practice questions grounded in real, documented OCP behavior. `(needs verification — recheck against current Red Hat certification exam objectives before treating as exam-representative)`

---

### 1. (Domain: OCP vs Kubernetes) What are the key architectural differences between OpenShift and vanilla Kubernetes?

**Answer:** OCP replaces Ingress with Routes (HAProxy-based), replaces PodSecurityPolicy with Security Context Constraints (SCC), ships a built-in image registry, and extends kubectl with the `oc` CLI, which is a superset adding OCP-specific commands. OCP also bundles CI/CD (Tekton), integrated monitoring (Prometheus+Grafana), a web console, and an OAuth server out of the box — vanilla Kubernetes leaves all of these as separate installs.

---

### 2. (Domain: Networking) How do Routes differ from Kubernetes Ingress, specifically around TLS handling?

**Answer:** Routes support three distinct TLS termination modes: Edge (TLS terminated at the router, plain HTTP to the pod), Passthrough (TLS carried all the way to the pod — the router cannot inspect the traffic at all), and Re-encrypt (TLS terminated at the router, then re-encrypted with a new certificate to the pod). Vanilla Ingress typically only handles the Edge-equivalent case natively; Passthrough and Re-encrypt are OCP-specific route capabilities.

---

### 3. (Domain: Security) A pod fails to start with "unable to validate against any security context constraint." What's the fix?

**Answer:** This means the pod's ServiceAccount hasn't been granted an SCC permitting whatever security context the pod is requesting (e.g., running as a specific UID or as root). The fix is adding the appropriate SCC to that ServiceAccount — not defaulting to the "privileged" SCC, which should never be used in production. For a legacy app genuinely requiring a fixed UID, the `anyuid` SCC is the more scoped, appropriate option over broadly granting `privileged`.

---

### 4. (Domain: Architecture) What are OCP's four node types, and why does the Infrastructure node type exist specifically?

**Answer:** Control Plane (runs etcd, API server, Scheduler), Worker (runs actual workloads), Infrastructure (runs platform components like Ingress, Registry, and Monitoring), and Bootstrap (temporary, decommissioned after cluster install). The Infrastructure node type exists specifically to isolate platform-component workloads onto separately-licensed nodes, reducing the subscription cost that would otherwise apply if those components ran on standard Worker nodes.

---

### 5. (Domain: Day-2 Operations) What's the difference between what CVO and MCO each manage?

**Answer:** CVO (Cluster Version Operator) manages OCP's own platform upgrades — the version of OpenShift itself. MCO (Machine Config Operator) manages OS-level configuration on the underlying nodes — kernel arguments, systemd units — via MachineConfig objects. Applying a MachineConfig change triggers a rolling node drain and reboot, since OS-level changes require the node to actually restart to take effect.

---

### 6. (Domain: Operators) Why would a production team choose Manual approval strategy over Automatic for an Operator Subscription?

**Answer:** Manual approval strategy requires explicit human approval before an Operator's upgrade is actually applied, giving the team control over exactly when an upgrade happens — important because an Operator upgrade can itself introduce breaking changes to whatever it manages (a database, a monitoring stack). Automatic approval applies upgrades as soon as they're available in the subscribed channel, which trades that control for less operational overhead — a reasonable choice for lower-stakes environments, but riskier for production without a way to control timing.

---

### 7. (Domain: CLI) Why does `oc new-project` create two objects (a Namespace and a Project) instead of just one?

**Answer:** Project is an OCP-specific abstraction layered on top of the underlying Kubernetes Namespace, adding OCP-specific metadata and access controls beyond what a plain Namespace provides. `oc new-project` creates both together so the project is immediately usable with OCP's own tooling and permission model, not just as a bare Kubernetes namespace.

---

### 8. (Domain: CI/CD) Why is Tekton described as the "strategic direction" for CI/CD on OCP, with Jenkins as "legacy but common"?

**Answer:** Tekton (OpenShift Pipelines) is cloud-native and Kubernetes-native by design — its Task, Pipeline, PipelineRun, and Trigger objects are themselves Kubernetes custom resources, integrating directly with the platform's own primitives and event-driven model. Jenkins on OCP instead runs via the Kubernetes plugin, spinning up ephemeral agent pods — functional and still common in enterprises with existing Jenkins investment, but architecturally bolted onto Kubernetes rather than native to it, which is why Tekton is the platform's forward-looking direction.

---

### 9. (Domain: Troubleshooting) What does `oc debug` actually do, and why is it preferable to directly modifying a broken pod?

**Answer:** `oc debug` creates a new, temporary copy of a pod (or node) specifically for troubleshooting — letting you inspect and experiment without touching the original resource's actual running state. This matters because directly modifying a broken production pod risks compounding the problem or destroying diagnostic evidence of what actually went wrong; a debug copy isolates that risk entirely.

---

### 10. (Domain: Deployments) Why should `oc rollout status` always be checked after a deployment, rather than assuming `oc set image` succeeded once the command returns?

**Answer:** `oc set image` only submits the change — it returns as soon as the update is accepted, not once the rollout has actually completed and new pods are healthy. `oc rollout status` blocks and reports the real, live progress of the rollout, which is the only way to confirm the deployment genuinely succeeded rather than assuming success from the initial command's return alone.
