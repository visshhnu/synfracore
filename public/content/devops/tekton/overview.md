# Tekton

> **Cloud-native CI/CD on Kubernetes — Tasks, Pipelines, Triggers**

**Category:** CI/CD  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

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
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Tekton work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of Tekton?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in Tekton?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with Tekton?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe Tekton in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for Tekton?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Tekton compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain What is Tekton? in Tekton."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Writing Tasks and Pipelines in Tekton."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [Tekton Documentation](https://tekton.dev/docs/)
- [Tekton Hub (ClusterTasks)](https://hub.tekton.dev/)
- [OpenShift Pipelines (Tekton)](https://docs.openshift.com/container-platform/4.16/cicd/pipelines/understanding-openshift-pipelines.html)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*