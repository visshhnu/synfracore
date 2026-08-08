# Tekton

> **Cloud-native CI/CD on Kubernetes — Tasks, Pipelines, Triggers**

**Category:** CI/CD  
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

---

## What is Tekton?

Tekton is a Kubernetes-native CI/CD framework — each pipeline step runs as a K8s pod. No central server to manage. CRD-based: Task (single step), Pipeline (chain of Tasks), PipelineRun (execution), Trigger (webhook event → PipelineRun). Deeply integrated with OpenShift Pipelines (Red Hat's distribution of Tekton). Best for teams running everything on Kubernetes.

## Why Tekton?

A Task is like a Job in Kubernetes — it runs one or more steps in containers. A Pipeline chains Tasks with parameters passing between them. Workspaces provide shared filesystem — git-clone writes code to a workspace, build Task reads from it. Results pass small data (like image digest) between Tasks without filesystem.

---

## Learning Modules

### Module 01 — What is Tekton?
*K8s-native CI/CD, no server needed*

Tekton is a Kubernetes-native CI/CD framework — each pipeline step runs as a K8s pod. No central server to manage. CRD-based: Task (single step), Pipeline (chain of Tasks), PipelineRun (execution), Trigger (webhook event → PipelineRun). Deeply integrated with OpenShift Pipelines (Red Hat's distribution of Tekton). Best for teams running everything on Kubernetes.

**Topics covered:**

- Tekton vs Jenkins vs GitHub Actions — 🟢 Beginner
- CRD-based: Task, Pipeline, PipelineRun — 🟢 Beginner
- ClusterTask — reusable across namespaces — 🟡 Intermediate
- Workspace — share data between tasks — 🟡 Intermediate

```bash
# Tekton core objects:
# Task       — a reusable unit of work (like a function)
# Pipeline   — chain of Tasks (like a workflow)
# PipelineRun — one execution of a Pipeline (creates pods)
# Trigger    — webhook → PipelineRun (event-driven)
# Workspace  — shared storage between Tasks (like a volume)

# Install Tekton Pipelines
kubectl apply -f https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml

# Install Tekton Dashboard (optional UI)
kubectl apply -f https://storage.googleapis.com/tekton-releases/dashboard/latest/release.yaml

# Install Tekton Catalog (ClusterTasks like git-clone, kaniko, kubectl)
kubectl apply -f https://raw.githubusercontent.com/tektoncd/catalog/main/task/git-clone/0.9/git-clone.yaml

# Check installation
kubectl get pods -n tekton-pipelines
```

### Module 02 — Writing Tasks and Pipelines
*Full build-deploy pipeline example*

A Task is like a Job in Kubernetes — it runs one or more steps in containers. A Pipeline chains Tasks with parameters passing between them. Workspaces provide shared filesystem — git-clone writes code to a workspace, build Task reads from it. Results pass small data (like image digest) between Tasks without filesystem.

**Topics covered:**

- Task definition with steps — 🟡 Intermediate
- Pipeline chaining Tasks with runAfter — 🟡 Intermediate
- Parameters and results — 🟡 Intermediate
- Workspaces for source code sharing — 🟡 Intermediate
- PipelineRun — trigger execution — 🟢 Beginner

```bash
# Complete Task: run tests
apiVersion: tekton.dev/v1
kind: Task
metadata:
  name: run-tests
spec:
  workspaces:
  - name: source
  steps:
  - name: test
    image: node:20-alpine
    workingDir: $(workspaces.source.path)
    script: |
      npm ci
      npm test
---
# Complete Pipeline: clone → test → build → deploy
apiVersion: tekton.dev/v1
kind: Pipeline
metadata:
  name: build-deploy
spec:
  params:
  - name: git-url
  - name: image-name
  - name: namespace
    default: production
  workspaces:
  - name: source
  tasks:
  - name: clone
    taskRef:
      name: git-clone
      kind: ClusterTask
    params:
    - name: url
      value: $(params.git-url)
    workspaces:
    - name: output
      workspace: source

  - name: test
    taskRef:
      name: run-tests
    runAfter: [clone]
    workspaces:
    - name: source
      workspace: source

  - name: build-push
    taskRef:
      name: kaniko
      kind: ClusterTask
    runAfter: [test]
    params:
    - name: IMAGE
      value: $(params.image-name):$(tasks.clone.results.commit)
    workspaces:
    - name: source
      workspace: source

  - name: deploy
    taskRef:
      name: kubernetes-actions
      kind: ClusterTask
    runAfter: [build-push]
    params:
    - name: script
      value: |
        kubectl set image deployment/myapp \\
          app=$(params.image-name):$(tasks.clone.results.commit) \\
          -n $(params.namespace)
        kubectl rollout status deployment/myapp -n $(params.namespace)
```

### Module 03 — Triggers — Event-Driven CI/CD
*Webhook → PipelineRun automatically*

Tekton Triggers make CI/CD event-driven — push to GitHub → webhook fires → EventListener receives it → TriggerBinding extracts git URL and commit → TriggerTemplate creates a PipelineRun. This is how you wire Tekton to Git just like Jenkins webhooks or GitHub Actions.

**Topics covered:**

- EventListener — receives webhooks — 🟡 Intermediate
- TriggerBinding — extract values from payload — 🟡 Intermediate
- TriggerTemplate — create PipelineRun — 🟡 Intermediate
- GitHub webhook setup — 🟢 Beginner

```bash
# EventListener — receives GitHub webhook
apiVersion: triggers.tekton.dev/v1beta1
kind: EventListener
metadata:
  name: github-listener
spec:
  triggers:
  - name: github-push
    interceptors:
    - ref:
        name: github
      params:
      - name: secretRef
        value:
          secretName: github-webhook-secret
          secretKey: token
      - name: eventTypes
        value: [push]
    bindings:
    - ref: github-binding
    template:
      ref: pipeline-template
---
# TriggerBinding — extract from webhook payload
apiVersion: triggers.tekton.dev/v1beta1
kind: TriggerBinding
metadata:
  name: github-binding
spec:
  params:
  - name: git-url
    value: $(body.repository.clone_url)
  - name: git-commit
    value: $(body.after)
---
# TriggerTemplate — create a PipelineRun
apiVersion: triggers.tekton.dev/v1beta1
kind: TriggerTemplate
metadata:
  name: pipeline-template
spec:
  params:
  - name: git-url
  - name: git-commit
  resourcetemplates:
  - apiVersion: tekton.dev/v1
    kind: PipelineRun
    metadata:
      generateName: build-deploy-
    spec:
      pipelineRef:
        name: build-deploy
      params:
      - name: git-url
        value: $(tt.params.git-url)
      workspaces:
      - name: source
        volumeClaimTemplate:
          spec:
            accessModes: [ReadWriteOnce]
            resources:
              requests:
                storage: 1Gi
```

---

## Production Example

```bash
# Tekton — Monitor and Debug Pipelines

# Watch a PipelineRun
kubectl get pipelinerun -w

# Get all PipelineRuns
tkn pipelinerun list

# Describe a PipelineRun (shows task status)
tkn pipelinerun describe build-deploy-xyz

# Get logs of a PipelineRun
tkn pipelinerun logs build-deploy-xyz -f

# Get logs of a specific Task within the run
tkn pipelinerun logs build-deploy-xyz -t build-push -f

# Re-run a failed PipelineRun
tkn pipelinerun rerun build-deploy-xyz

# Tekton vs Jenkins — When to choose Tekton:
# ✓ Everything runs on Kubernetes already
# ✓ Want no separate CI server to manage
# ✓ OpenShift environment (OpenShift Pipelines = Tekton)
# ✓ Fine-grained K8s RBAC for pipeline steps
# ✓ Each step needs different container images

# When to stick with Jenkins:
# ✓ Existing Jenkins investment + shared libraries
# ✓ Complex orchestration across many systems
# ✓ Team knows Groovy and Jenkins well
```

---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is Tekton and why would you use it in production?"
    **Problem:** a Kubernetes-native platform team running Jenkins alongside their cluster has a separate server to patch, scale, and secure, with its own agent-to-cluster credential story. **Solution:** Tekton is a CI/CD framework that runs entirely as Kubernetes CRDs — every pipeline step executes as a pod, with no central server at all; `Task` (a single step), `Pipeline` (a chain of Tasks), `PipelineRun` (one execution), and `Trigger` (webhook → PipelineRun) are the whole object model. **Result:** CI/CD infrastructure is managed with the exact same `kubectl`/RBAC/observability tooling as everything else in the cluster, and it's what OpenShift Pipelines (Red Hat's Tekton distribution) is built on for teams already standardized on OpenShift.

??? question "How does Tekton work internally? Explain the architecture."
    **Problem:** without knowing that a `Pipeline` is just a template, "why isn't my pipeline doing anything" is a confusing question to debug. **Solution:** a `Pipeline` defines a chain of `Task` references with `runAfter:` ordering; nothing actually executes until a `PipelineRun` is created, which is what spins up real pods — one per `Task` step, scheduled and scaled exactly like any other Kubernetes workload; a `Trigger` (via `EventListener`/`TriggerBinding`/`TriggerTemplate`) is what creates that `PipelineRun` automatically from a webhook. **Result:** "my pipeline never runs" is almost always a missing or misfiring `Trigger` (check the `EventListener`'s logs first), while "my pipeline runs but fails" is a pod-level problem on a specific `Task` — `kubectl describe pod`/`kubectl logs` on that Task's pod, same as debugging any other workload.

??? question "What are the main components of Tekton?"
    **Problem:** Tekton's CRD-only design means there's no single "Tekton service" to point at — the components are the CRD types themselves plus the Triggers subsystem. **Solution:** `Task`/`ClusterTask` (reusable units of work, ClusterTask scoped cluster-wide instead of one namespace), `Pipeline` (chains Tasks with `runAfter` and parameter passing), `PipelineRun` (one execution, creates the actual pods), `Workspace` (shared filesystem between Tasks — e.g. `git-clone` writes source code a later `build` Task reads), and `Trigger`/`EventListener`/`TriggerBinding`/`TriggerTemplate` (the event-driven layer that creates PipelineRuns from webhooks). **Result:** the Tekton Catalog (`git-clone`, `kaniko`, `kubectl` ClusterTasks) covers most common steps out of the box, so a real pipeline is usually assembling existing Catalog Tasks via `runAfter` rather than writing custom Task definitions from scratch.

??? question "How do you handle failures in Tekton?"
    **Problem:** because every step is a real pod, a Tekton failure could be a Task's own script failing, a Workspace/PVC problem, or the Trigger never firing at all — three different layers to check. **Solution:** `kubectl get pipelineruns` and `kubectl describe pipelinerun <name>` show which Task failed and why; each Task's pod logs (`kubectl logs`) show the actual script/command failure, same as any container; for a PipelineRun that never even starts, check the `EventListener`'s own logs and the webhook delivery status on the Git provider's side, since a webhook that never reaches the EventListener produces no Tekton-side error at all. **Result:** "the PipelineRun exists but a Task failed" and "no PipelineRun was ever created" are different failure classes needing different starting points — Task pod logs for the first, EventListener/webhook delivery for the second.

??? question "What is your production experience with Tekton?"
    This is a genuinely personal question — answer with a real incident using the Problem → Solution → Result structure: what broke (a Workspace PVC that ran out of space mid-build, a webhook that stopped firing after a GitHub token rotation, a ClusterTask upgrade that changed a parameter's default), your actual diagnostic sequence, and what the root cause turned out to be. Interviewers are listening for whether you have real operational experience, not textbook recall.

??? question "How do you monitor and observe Tekton in production?"
    **Problem:** because every Task is a pod, Tekton pipeline health is really Kubernetes pod health plus PipelineRun-specific state, and treating them as separate things misses the connection. **Solution:** the Tekton Dashboard (optional, install separately) gives a visual view of PipelineRun history and per-Task status; `kubectl get pipelineruns --watch` and `tkn pipelinerun logs` (the Tekton CLI) are the equivalent for teams that stay in the terminal; standard Kubernetes-level monitoring (pod restarts, resource limits on Task pods) catches infrastructure-level problems that a Tekton-specific view wouldn't surface on its own. **Result:** treating Tekton observability as "just another Kubernetes workload plus PipelineRun status" — rather than needing a separate monitoring stack — is consistent with the whole point of running CI/CD as CRDs in the first place.

??? question "What are the security considerations for Tekton?"
    **Problem:** every Task runs as a pod with whatever ServiceAccount the PipelineRun is given, so an over-privileged default ServiceAccount means any Task (including ones sourced from a third-party Catalog entry) can reach far more than it should. **Solution:** scope each PipelineRun's ServiceAccount to least privilege rather than relying on the namespace default; pin Catalog Tasks (like `git-clone`, `kaniko`) to a specific version rather than `latest`, since Tasks are just YAML pulled from wherever they're referenced; secure the `EventListener`'s webhook secret (`secretRef:` in the example above) so an attacker can't forge webhook payloads and trigger arbitrary PipelineRuns. **Result:** this is the same "everything is just Kubernetes objects with RBAC" security model as the rest of the cluster — Tekton doesn't introduce a separate security layer, which is a benefit if the platform team already has strong Kubernetes RBAC discipline and a gap if they don't.

??? question "How does Tekton compare to alternatives?"
    **Problem:** "which CI/CD tool" depends on how Kubernetes-centric the team already is. **Solution:** vs. Jenkins — no central server, but a steeper learning curve since everything is Kubernetes CRDs rather than a Jenkinsfile DSL; vs. GitHub Actions/GitLab CI — those are hosted/managed platforms with their own runners, while Tekton's pipelines run entirely on infrastructure the team already operates, which matters for teams wanting full control or running fully air-gapped; vs. ArgoCD — different layer entirely, ArgoCD is GitOps *delivery* (syncing manifests to a cluster), Tekton is the *build* pipeline that produces the artifact ArgoCD later deploys — the two are often used together, not as alternatives. **Result:** Tekton wins specifically for teams already all-in on Kubernetes who want CI/CD to use the same operational model (RBAC, observability, scaling) as everything else, not for teams wanting the least setup effort.

??? question "Walk through what a Task, a Pipeline, and a PipelineRun each actually are."
    **Problem:** these three terms are easy to conflate since a `Pipeline` references Tasks but doesn't itself do anything until executed. **Solution:** a `Task` is a reusable unit of work — one or more steps, each a container, similar conceptually to a Kubernetes Job; a `Pipeline` chains multiple Tasks together with `runAfter:` for ordering and passes parameters/results between them, but is purely a template — no pods exist yet; a `PipelineRun` is one concrete execution of a Pipeline, and creating a `PipelineRun` object is what actually spins up the real Task pods. **Result:** this is exactly why `kubectl apply -f pipeline.yaml` alone does nothing observable — the Pipeline is registered but idle until something (manually or via a Trigger) creates a `PipelineRun` against it.

??? question "How do Workspaces let Tasks in a Pipeline share data, and what's the alternative for small values?"
    **Problem:** a `build` Task needs the source code a `clone` Task fetched, and containers don't share a filesystem by default — something has to bridge that gap. **Solution:** a `Workspace` provides shared storage (typically backed by a PVC) mounted into every Task that declares it — `git-clone` writes source into the Workspace, and a later `build`/`test` Task reads from that same mount; for small pieces of data that don't need a full filesystem (like a Git commit SHA or a built image digest), Tekton's `results` mechanism passes values directly between Tasks without needing shared storage at all. **Result:** Workspaces are for "the next Task needs the actual files," results are for "the next Task just needs one small value" — using a Workspace for a single string wastes a PVC mount, and results can't carry a whole source checkout.

---

## Official Resources

- [Tekton Documentation](https://tekton.dev/docs/)
- [Tekton Hub (ClusterTasks)](https://hub.tekton.dev/)
- [OpenShift Pipelines (Tekton)](https://docs.openshift.com/container-platform/4.16/cicd/pipelines/understanding-openshift-pipelines.html)

---

