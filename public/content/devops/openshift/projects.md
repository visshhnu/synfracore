# OpenShift — Portfolio Projects

Build these to prove you can actually run OpenShift, not just recite SCC and Route trivia. Each project maps to a real EX280-style task area, so finishing all three doubles as certification practice.

## Project 1: Multi-Environment App with Routes, SCC, and Quotas

**Level:** Beginner | **Time:** 1-2 days

Deploy a small web app (any language — a simple Node/Python "hello" API is fine) into three Projects: `myapp-dev`, `myapp-staging`, `myapp-prod`. Each environment gets its own Route, its own SCC assignment, and its own ResourceQuota.

### Steps

1. Create three Projects with `oc new-project`, each with a `ResourceQuota` and `LimitRange` sized differently (dev: tight limits, prod: generous)
2. Deploy the app with `oc new-app` from a container image
3. Expose each with `oc expose svc/<name>` and set up **edge TLS termination** on the Route
4. Intentionally run the container as a non-default UID and fix the resulting SCC error by granting `anyuid` to the app's ServiceAccount — document the exact error message and fix
5. Add an `oc rollout status` check to confirm each deploy actually completed before calling it done
6. Write a README that includes the actual `oc adm policy add-scc-to-user` command you needed and why

### Skills Demonstrated

- Projects, Routes, TLS termination modes
- Diagnosing and fixing a real SCC violation (not just reciting the theory)
- ResourceQuota / LimitRange design across environments

### GitHub Repo Name

`ocp-multi-env-scc-routes`

---

## Project 2: S2I Build + Tekton Pipeline to OpenShift

**Level:** Intermediate | **Time:** 2-3 days

Take a source repo (not a pre-built image) and get it running on OpenShift two ways: first with Source-to-Image (`oc new-app <git-url>`), then with a proper Tekton Pipeline that rebuilds and redeploys on every push.

### Steps

1. Deploy directly from a Git repo using S2I: `oc new-app https://github.com/<you>/<repo>.git --name=myapp`
2. Confirm the BuildConfig and ImageStream OpenShift created automatically (`oc get bc,is`)
3. Install OpenShift Pipelines (Tekton) via OperatorHub
4. Write a `Pipeline` with `Task`s for clone → build (buildah) → deploy (`oc set image` or `oc rollout restart`)
5. Wire up an `EventListener` + `Trigger` so a webhook push kicks off the `PipelineRun` automatically
6. Use `oc set triggers` to confirm a new image tag actually rolls out the Deployment

### Skills Demonstrated

- S2I vs external CI/CD tradeoffs
- Tekton Task/Pipeline/PipelineRun/Trigger objects
- ImageStream-driven automatic rollout

### GitHub Repo Name

`ocp-s2i-tekton-pipeline`

---

## Project 3: Day-2 Operations — Upgrade, Backup, and Incident Drill

**Level:** Advanced | **Time:** 4-5 days

Simulate the operational work an OCP admin actually does after the cluster is already running: a controlled upgrade, an etcd backup/restore, and a manufactured incident you diagnose and fix.

### Steps

1. On a test cluster (CRC/OpenShift Local or a lab cluster), check `oc get co`, `oc get nodes`, `oc get mcp` are all healthy before touching anything
2. Run `oc adm upgrade` to see available updates, then upgrade one minor version, watching `clusterversion`, `co`, and `mcp` roll through in order
3. Take an etcd backup with `cluster-backup.sh`, then practice (on a disposable cluster only) restoring from it — document each command and what it actually restores
4. Manufacture a real incident: apply a MachineConfig with a bad sysctl value, watch the MCP go `DEGRADED`, then diagnose using `oc describe mcp`, node logs, and `oc adm must-gather`, and roll it back
5. Write a runbook: symptom → diagnostic commands → root cause → fix → verification

### Skills Demonstrated

- CVO-driven upgrade sequencing and monitoring
- etcd backup/restore (disaster recovery)
- MachineConfigPool troubleshooting and must-gather-based root-causing

### GitHub Repo Name

`ocp-day2-ops-runbook`

---

## Tips for Great Projects

**Make it real.** "Deployed a 3-tier app on OpenShift with SCC-hardened pods and a Tekton pipeline" is a sentence an interviewer will ask follow-up questions about — that's the point.

**Keep the error messages.** The SCC error in Project 1, the MCP degraded state in Project 3 — paste the actual `oc describe` output into your README. Employers care that you've seen real failures, not just happy paths.

**Show the diff between OCP and vanilla Kubernetes** in your writeup wherever it's relevant (Routes vs Ingress, SCC vs PSA, DeploymentConfig vs Deployment) — that comparison is exactly what OCP interviews probe for.

## Portfolio Checklist

- [ ] All 3 projects on GitHub with clear READMEs and actual command output pasted in
- [ ] At least one project uses a real Tekton Pipeline, not just `oc new-app`
- [ ] At least one project documents a real failure and its fix (SCC, MCP, or rollout)
- [ ] Each project's README explains the OCP-specific concept it demonstrates, not just "it works"
