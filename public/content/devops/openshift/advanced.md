# OpenShift — Monitoring, Upgrades, CI/CD & Security

## Section 5: Monitoring, Logging & Troubleshooting

**&**** TROUBLESHOOTING**

**5.1  OCP Built-in Monitoring Stack**

- Prometheus — metrics collection from all cluster components and user workloads

- Alertmanager — routes alerts to email, Slack, PagerDuty, etc.

- Grafana — dashboards (OCP 4.10 deprecated built-in Grafana; use community Grafana operator)

- Thanos — long-term metrics storage and multi-cluster querying

- User Workload Monitoring — enable to collect metrics from your own application pods

- Enable user workload monitoring: edit configmap cluster-monitoring-config in openshift-monitoring namespace — set enableUserWorkload: true

**5.2  Logging Stack (EFK / Loki)**

| **Component** | **Role** |
| --- | --- |
| Loki (OCP 4.12+) | Log aggregation backend — replaces Elasticsearch in newer OCP |
| Elasticsearch (legacy) | Full-text search and storage for logs — used in OCP < 4.12 |
| Fluentd / Vector | Log collector on each node — ships pod logs to Elasticsearch/Loki |
| Kibana / Grafana | Log visualisation and search UI |
| Cluster Logging Operator | Manages the entire logging stack via ClusterLogging CRD |

**5.3  Common Troubleshooting Commands**

| **Scenario** | **Command** |
| --- | --- |
| Check all pods across cluster | oc get pods -A │ grep -v Running │ grep -v Completed |
| Pod logs | oc logs <pod> -n <ns>  │  oc logs <pod> -c <container> -n <ns>  │  oc logs -f <pod> (follow) |
| Previous container logs | oc logs <pod> --previous -n <ns>   # logs from last crash |
| Pod details + events | oc describe pod <pod> -n <ns>   # most useful troubleshooting command |
| Get pod yaml | oc get pod <pod> -n <ns> -o yaml |
| Exec into pod | oc exec -it <pod> -n <ns> -- /bin/bash |
| Node status | oc get nodes  │  oc describe node <node> |
| Node resource usage | oc adm top nodes  │  oc adm top pods -n <ns> |
| Cluster operator status | oc get co  — check Degraded column |
| Events in namespace | oc get events -n <ns> --sort-by='.lastTimestamp' |
| Check etcd health | oc get etcd -o=jsonpath='{range .items[0].status.conditions[*]}{.type}{" "}{.status}{"\n"}{end}' |
| Must-gather (support dump) | oc adm must-gather — collects full cluster diagnostic bundle |

**5.4  Common Pod Failure States ****&**** Root Causes**

| **Status** | **Cause ****&**** Fix** |
| --- | --- |
| CrashLoopBackOff | App is crashing on startup. Check: oc logs <pod> --previous, check env vars, missing config, app errors |
| OOMKilled | Container exceeded memory limit. Fix: increase limits, check for memory leaks, add JVM heap limits |
| Pending — Insufficient resources | No node has enough CPU/memory. Check: oc describe pod (events), check node capacity with oc adm top nodes |
| Pending — PVC not bound | No PV available matching PVC. Check StorageClass, check PV status, check capacity |
| ImagePullBackOff | Cannot pull container image. Check: image name/tag, pull secret, registry access, network policy |
| Error — SCC violation | Pod security rejected. Fix: oc adm policy add-scc-to-user <scc> -z <serviceaccount> |
| Terminating — stuck | Pod stuck in terminating. Force delete: oc delete pod <pod> --grace-period=0 --force |

---

## Section 6: Cluster Upgrades & Operators

**&**** OPERATORS**

**6.1  OCP Cluster Upgrade Process**

- OCP upgrades are managed by the Cluster Version Operator (CVO) — controlled via ClusterVersion object

- Update channels: stable-4.x, fast-4.x, candidate-4.x, eus-4.x (Extended Update Support — even versions only)

- Always upgrade sequentially — never skip minor versions (e.g. 4.12 → 4.13 → 4.14, not 4.12 → 4.14 directly)

- Check available updates: oc adm upgrade

- Apply upgrade: oc adm upgrade --to-latest=true  OR  oc adm upgrade --to=<specific-version>

- Monitor upgrade: oc get clusterversion  |  oc get co  |  watch oc get nodes

- Upgrade takes 1-3 hours — control plane upgrades first, then workers (via MachineConfigPool)

*Best practice: always upgrade non-prod first, validate for 1-2 days, then upgrade prod. Always check Red Hat upgrade path documentation.*

**6.2  Operator Lifecycle Manager (OLM)**

- Operators extend OCP with new capabilities (databases, monitoring, GitOps, etc.)

- OperatorHub: catalogue of available operators — accessible in OCP web console

- Install an operator: Web Console > OperatorHub > Search > Install > Select namespace/cluster scope

- Subscription object controls: operator source, channel (e.g. stable), approval strategy (Automatic/Manual)

- Manual approval: administrator must approve each update — use for production to control upgrade timing

- Check operator status: oc get csv -n <operator-namespace>  — CSV = ClusterServiceVersion

- Check installed operators: oc get operators

**6.3  MachineConfig ****&**** Node Management**

- MachineConfig manages OS-level config on nodes: kernel args, systemd units, file contents, SSH keys

- MachineConfigPool (MCP) groups nodes: master pool and worker pool by default; can create custom pools

- Applying a new MachineConfig triggers a rolling drain + reboot of nodes in the pool

- Check MachineConfigPool status: oc get mcp — look for UPDATED, UPDATING, DEGRADED columns

- Pause MCP to batch changes: oc patch mcp worker --type merge --patch '{"spec":{"paused":true}}'

---

## Section 7: CI/CD on OpenShift

**7.1  Jenkins + OpenShift Integration**

- Jenkins deployed on OCP using the Jenkins Operator or via OCP's built-in Jenkins template

- Kubernetes plugin for Jenkins: runs build agents as ephemeral pods in OCP — scales to zero when idle

- OpenShift Jenkins Pipeline plugin: provides oc CLI commands directly in Jenkinsfiles

- Service Account with edit role needed for Jenkins to deploy to target namespace

**Typical Jenkins → OCP pipeline stages:**

- Stage 1 — Checkout: git clone from repository

- Stage 2 — Build: mvn/gradle/npm build inside Jenkins agent pod

- Stage 3 — Test: run unit and integration tests

- Stage 4 — Image Build: docker build + push to OCP internal registry or Nexus

- Stage 5 — Deploy: oc apply -f manifests/ or helm upgrade or oc set image

- Stage 6 — Verify: oc rollout status deployment/<name> — wait for rollout to complete

- Stage 7 — Notify: Slack/email notification on success/failure

**7.2  OpenShift Pipelines (Tekton)**

- Tekton is the cloud-native CI/CD built into OCP — installed via OpenShift Pipelines operator

- Key objects: Task, TaskRun, Pipeline, PipelineRun, Workspace, Trigger, EventListener

- Tasks are reusable units of work — a Pipeline chains Tasks together

- Triggers enable event-driven pipelines (GitHub webhook → TriggerBinding → PipelineRun)

- tkn CLI: tkn pipeline list, tkn pipelinerun logs <run> -f

*Many enterprise shops still use Jenkins — if asked, explain that OpenShift Pipelines (Tekton) is the strategic direction but Jenkins remains common in brownfield environments*

---

## Deep Dive: Enterprise Architecture

# OpenShift OCP — Deep Dive Part 2
## Networking · Security · RBAC · SSO · LDAP · Secrets · Network Policies · PV/PVC · GitOps
## Merged from SynfraAI OCP Master Pack + Architecture Pack + Extended Real-World Scenarios
### Every topic: What it is → How to design → Where to configure → Real challenges → Interview answers

---

## PART 1: OCP NETWORKING — COMPLETE DESIGN

### Three Networking Concerns You Must Design First

```
1. EAST-WEST traffic    — pod to pod, service to service inside cluster
2. NORTH-SOUTH traffic  — external traffic coming INTO the cluster
3. EGRESS traffic       — traffic leaving the cluster to databases, APIs, internet
```

### What to Design Before You Write Any YAML

```
Step 1: CIDR Planning
  - Pod CIDR:     10.128.0.0/14  (pods get IPs from here)
  - Service CIDR: 172.30.0.0/16  (cluster IPs for Services)
  - Node CIDR:    defined by your VNet subnets
  - NEVER overlap these with your corporate network

Step 2: DNS Strategy
  - Internal:  <service>.<namespace>.svc.cluster.local
  - External:  configure custom DNS for routes and ingress
  - Upstream:  point cluster DNS to corporate DNS for internal domains

Step 3: Ingress and Route Exposure
  - Which apps are public? Which are internal only?
  - Route vs Ingress decision
  - TLS termination location (edge / passthrough / reencrypt)
  - Wildcard certificate strategy

Step 4: Egress Control
  - What can pods reach outside the cluster?
  - Egress firewall rules (OCP EgressNetworkPolicy)
  - NAT gateway for egress IP control

Step 5: Default Network Policy
  - Default deny-all in sensitive namespaces
  - Allow only explicitly needed paths

Step 6: Private vs Public Cluster
  - Private: API server not internet-facing (banking standard)
  - Public: API server reachable from internet (dev/test only)
```

### OCP-Specific Networking: SDN and OVN-Kubernetes

**OpenShift SDN (older, being deprecated):**
- OpenvSwitch-based networking
- Three modes: ovs-subnet (flat), ovs-multitenant (namespace isolation), ovs-networkpolicy

**OVN-Kubernetes (current standard in OCP 4.x):**
- Open Virtual Network — more powerful and scalable
- Full NetworkPolicy support
- Better performance and multi-tenant isolation
- Required for newer OCP features (EgressIP, EgressFirewall)

```bash
# Check which network plugin is active
oc get network.config.openshift.io/cluster -o jsonpath='{.spec.networkType}'
# Returns: OVNKubernetes  or  OpenShiftSDN
```

### Routes in OCP — The Native Exposure Pattern

**Route types and when to use each:**

| Route Type | TLS | Use Case |
|---|---|---|
| `edge` | TLS terminates at HAProxy router | Most common — app speaks HTTP inside cluster |
| `passthrough` | TLS goes all the way to pod | App handles its own TLS (databases, mTLS) |
| `reencrypt` | TLS terminates at router + new TLS to pod | Maximum security — encrypted all the way |
| No TLS | Plain HTTP | Dev/test only, NEVER production |

**Edge Route (most common enterprise pattern):**
```yaml
apiVersion: route.openshift.io/v1
kind: Route
metadata:
  name: payment-api-route
  namespace: payment-production
spec:
  host: payments.mycompany.com      # custom hostname
  path: /api                        # path-based routing
  to:
    kind: Service
    name: payment-api-svc
    weight: 100
  port:
    targetPort: http
  tls:
    termination: edge               # TLS ends at HAProxy router
    insecureEdgeTerminationPolicy: Redirect   # force HTTPS
    certificate: |-                 # PEM cert (or use cert-manager)
      -----BEGIN CERTIFICATE-----
      ...
    key: |-
      -----BEGIN RSA PRIVATE KEY-----
      ...
```

**Wildcard route for all subdomains:**
```yaml
spec:
  host: "*.apps.mycompany.com"
  wildcardPolicy: Subdomain
```

**Where routes are configured:**
- Application team creates Route YAML in their namespace
- Platform team controls which routes are allowed via Router configuration
- TLS certs come from cert-manager or manual cert injection

### Ingress Controller Configuration (Rou
