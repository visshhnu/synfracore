# Tekton

CI/CD & GitOps › Tekton
⚙️**Tekton**
BeginnerEngineerArchitectKubernetes-native CI/CD — Tasks, Pipelines, Workspaces, Triggers, OpenShift Pipelines
[What is Tekton](#sec-what)[Tasks & Pipelines](#sec-core)[Triggers](#sec-triggers)[OpenShift Pipelines](#sec-openshift)[Q&A](#sec-interview)


## ⚙️ What is Tekton?›


#### What is Tekton?

Tekton is a **Kubernetes-native CI/CD framework**. Every pipeline, task, and run is a Kubernetes Custom Resource — you create them with `kubectl apply`, inspect them with `kubectl get`, and they run as Kubernetes Pods inside your cluster.


Tekton is the foundation of **OpenShift Pipelines** — Red Hat's enterprise CI/CD product is Tekton with additional OpenShift integration and a pre-installed set of ClusterTasks.


#### Why Tekton over Jenkins or GitHub Actions?
|  | Tekton | Jenkins | GitHub Actions |
|---|---|---|---|
| Runs | Inside your K8s cluster | External server | GitHub SaaS (or self-hosted) |
| Credentials | K8s Secrets — same as apps | Separate Jenkins store | GitHub Secrets / Vars |
| Scaling | K8s schedules task pods automatically | Configure agents manually | GitHub manages runners |
| OpenShift native | Yes — OpenShift Pipelines IS Tekton | Plugin only | Self-hosted runners needed |
| RBAC | K8s RBAC — same model as workloads | Separate Jenkins RBAC | GitHub org permissions |


#### Core concepts
| Object | What it is | Runs as |
|---|---|---|
| Step | A single container command — the smallest unit | Container inside a Pod |
| Task | Ordered sequence of Steps with shared workspace | Kubernetes Pod |
| Pipeline | Ordered sequence of Tasks with params and workspaces | Orchestrates multiple Pods |
| TaskRun | One execution instance of a Task | Pod (created per run) |
| PipelineRun | One execution instance of a Pipeline | Multiple Pods sequentially |
| Workspace | Shared storage between Tasks in a Pipeline | Volume mounted per Pod |


## 🧱 Tasks and Pipelines›


#### Complete Task and Pipeline example

```
# Task — build and push a Docker image using Kaniko
apiVersion: tekton.dev/v1
kind: Task
metadata:
name: docker-build-push
spec:
params:
- name: IMAGE
- name: TAG
default: "latest"
workspaces:
- name: source
steps:
- name: build-and-push
image: gcr.io/kaniko-project/executor:latest
args:
- "--context=$(workspaces.source.path)"
- "--destination=$(params.IMAGE):$(params.TAG)"
- "--dockerfile=$(workspaces.source.path)/Dockerfile"
---
# Pipeline — git clone → test → build → deploy
apiVersion: tekton.dev/v1
kind: Pipeline
metadata:
name: ci-pipeline
spec:
params:
- name: REPO_URL
- name: IMAGE
- name: IMAGE_TAG
workspaces:
- name: shared-workspace
tasks:
- name: clone
taskRef:
name: git-clone            # from Tekton Hub
workspaces:
- name: output
workspace: shared-workspace
params:
- name: url
value: $(params.REPO_URL)

- name: unit-test
runAfter: [clone]            # dependency — runs after clone
taskRef:
name: maven
workspaces:
- name: source
workspace: shared-workspace
params:
- name: GOALS
value: ["test"]

- name: build-push
runAfter: [unit-test]
taskRef:
name: docker-build-push
workspaces:
- name: source
workspace: shared-workspace
params:
- name: IMAGE
value: $(params.IMAGE)
- name: TAG
value: $(params.IMAGE_TAG)
```


#### Workspaces — how Tasks share files

Each Task runs as a separate Pod. Without workspaces, the git-clone Task clones code but the build Task cannot access it. Workspaces solve this: the Pipeline declares a workspace, each Task mounts it, and a PersistentVolumeClaim binds them together in the PipelineRun.


## 🔔 Triggers — Webhook-Driven Pipelines›


#### Trigger the pipeline automatically from Git webhooks

Three resources work together: **EventListener** (HTTP endpoint that receives webhooks), **TriggerBinding** (extracts data from the webhook payload), **TriggerTemplate** (creates a PipelineRun when triggered).


```
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
secretKey: secretToken
- name: eventTypes
value: ["push"]
bindings:
- ref: github-push-binding
template:
ref: ci-pipeline-template
---
# TriggerBinding — extract data from webhook payload
apiVersion: triggers.tekton.dev/v1beta1
kind: TriggerBinding
metadata:
name: github-push-binding
spec:
params:
- name: git-repo-url
value: $(body.repository.clone_url)
- name: git-revision
value: $(body.head_commit.id)
---
# TriggerTemplate — create PipelineRun on trigger
apiVersion: triggers.tekton.dev/v1beta1
kind: TriggerTemplate
metadata:
name: ci-pipeline-template
spec:
params:
- name: git-repo-url
- name: git-revision
resourcetemplates:
- apiVersion: tekton.dev/v1
kind: PipelineRun
metadata:
generateName: ci-run-
spec:
pipelineRef:
name: ci-pipeline
params:
- name: REPO_URL
value: $(tt.params.git-repo-url)
- name: IMAGE_TAG
val
