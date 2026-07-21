# OpenShift — Learning Roadmap

## Estimated Time to Job-Ready
**8-10 weeks** of consistent learning (2-3 hours/day) — longer than plain Kubernetes because SCCs, Routes, and Operators are genuinely new surface area on top of everything Kubernetes already requires.

## Prerequisite Check

Before starting OpenShift specifically, you should already be comfortable with core Kubernetes: Pods, Deployments, Services, Ingress, and `kubectl` basics. OpenShift assumes that foundation and layers enterprise features on top of it — trying to learn both at once slows you down on both.

## Phase 1: OCP vs Kubernetes Foundation (Week 1-2)

Get the mental model right before touching a cluster.

- Understand exactly what OCP adds over vanilla Kubernetes: Routes, SCCs, built-in registry, OAuth, Operators, CVO-managed upgrades
- Install **OpenShift Local (CRC)** or get access to a sandbox cluster (Red Hat's free Developer Sandbox is the easiest path)
- Learn the `oc` CLI as a superset of `kubectl` — every `kubectl` command works, plus `oc login`, `oc new-project`, `oc new-app`
- Deploy your first app with `oc new-app` and expose it with `oc expose svc` — get a working Route end to end

## Phase 2: Cluster Architecture & Day-2 Basics (Week 3-4)

Learn how the cluster itself is put together and operated.

- Control plane vs worker vs infrastructure nodes — what runs where and why
- etcd, API server, Controller Manager, Scheduler, kubelet, CRI-O
- Cluster Operators (`oc get co`) as your primary health dashboard — learn to read AVAILABLE/PROGRESSING/DEGRADED
- Machine Config Operator and MachineConfigPools — how OS-level changes roll out
- Practice: cordon/drain/uncordon a node, read `oc describe node` output under resource pressure

## Phase 3: Security, Routes, and Real Workloads (Week 5-6)

This is where most OCP-specific interview and exam content lives.

- Security Context Constraints in depth — `restricted-v2` as default, when `anyuid` is actually appropriate, how to grant SCC to a ServiceAccount without over-granting
- Routes and the three TLS termination modes (edge/passthrough/reencrypt) — build all three yourself
- RBAC with `oc adm policy` — roles, cluster roles, `who-can`
- BuildConfig, ImageStream, and Source-to-Image (S2I) — deploy directly from a Git repo, not just a pre-built image
- Practice: deliberately trigger an SCC violation and fix it; you will hit this in production, so learn it now

## Phase 4: Operators, CI/CD, and Production Patterns (Week 7-8)

Move from "it runs" to "it's operable."

- OperatorHub and OLM — install an Operator, understand Subscription/channel/approval-strategy
- OpenShift Pipelines (Tekton) — Task, Pipeline, PipelineRun, Trigger; build one pipeline end to end
- Monitoring stack — enable user-workload monitoring, write a ServiceMonitor and a PrometheusRule
- Cluster upgrades via CVO — understand channels (`stable`, `fast`, `eus`) and why sequential upgrades matter
- etcd backup — run `cluster-backup.sh` at least once so it's not a mystery during an incident

## Phase 5: Certification & Interview Ready (Week 9-10)

Convert knowledge into a credential and into interview-ready explanations.

- Work through the Certification tab's EX280 task list end to end, timed
- Practice explaining OCP vs Kubernetes out loud in under 90 seconds — this question comes up in nearly every OCP interview
- Do 2-3 mock scenarios: "a pod won't schedule," "an SCC is blocking a deploy," "an upgrade got stuck" — walk through your diagnostic commands, not just the answer
- Apply to platform/SRE/DevOps roles that specifically list OpenShift — it's a smaller, higher-signal market than generic Kubernetes roles

## Skills You'll Build

| Skill Area | What You'll Learn |
|---|---|
| Cluster Architecture | Control plane, node types, Cluster Operators, MCO/MCP |
| Security | SCCs, RBAC, `oc adm policy`, diagnosing access-denied errors |
| Networking | Routes, TLS termination modes, Ingress differences from vanilla K8s |
| CI/CD | S2I builds, BuildConfig/ImageStream, Tekton pipelines |
| Operations | Upgrades via CVO, etcd backup, must-gather, node maintenance |

## Weekly Study Plan

```
Monday:    Read theory (fundamentals/intermediate) — one topic at a time
Tuesday:   Hands-on in CRC or a sandbox cluster — run every command yourself
Wednesday: Build toward a portfolio project (see Projects tab)
Thursday:  Read official Red Hat docs on whatever confused you Monday/Tuesday
Friday:    Review interview questions, explain OCP-vs-K8s out loud
Weekend:   Certification task practice or a project milestone
```

## Red Flags to Avoid

- Learning OpenShift before basic Kubernetes is solid — you'll be constantly confused about which parts are OCP-specific
- Memorizing SCC names without ever triggering and fixing a real SCC error
- Skipping the CLI in favor of the web console — the exam and most production work is CLI-first
- Treating DeploymentConfig as the default — it's legacy; know it exists, but build with Deployment
- Never running an actual upgrade or backup because "it's risky" — do it on a disposable cluster where it's safe to break

## Resources

- **This course**: Overview → Fundamentals → Intermediate → Advanced → Certification → Projects
- **Official docs**: [docs.openshift.com](https://docs.openshift.com/container-platform/latest/welcome/index.html) — always the most accurate source for exact syntax
- **Free practice cluster**: Red Hat Developer Sandbox, or `crc start` locally (OpenShift Local)
- **Community**: r/openshift, Red Hat Developer forums

## Getting Your First OpenShift Role

1. **Portfolio**: 2-3 projects that show Routes, SCC troubleshooting, and at least one Tekton pipeline — see the Projects tab
2. **Certification**: EX280 (Administration) is the most commonly requested; EX288 if the role is more developer-facing
3. **Resume**: Call out OCP specifically, not just "Kubernetes" — recruiters filter on it separately
4. **Network**: Red Hat user groups and OpenShift-specific meetups are smaller but higher-signal than generic DevOps ones
5. **Interview prep**: Expect at least one "why OpenShift over vanilla Kubernetes" question and one live troubleshooting scenario
