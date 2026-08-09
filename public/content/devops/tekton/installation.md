# Tekton — Installation Guide

## Install Tekton Pipelines

The core CRDs and controllers — required for everything else in this guide:

```bash
kubectl apply -f https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml

# Verify the controllers are running
kubectl get pods -n tekton-pipelines
```

## Install the Tekton CLI (`tkn`)

```bash
# macOS
brew install tektoncd-cli

# Linux
curl -LO https://github.com/tektoncd/cli/releases/latest/download/tkn_Linux_x86_64.tar.gz
tar xvzf tkn_Linux_x86_64.tar.gz -C /usr/local/bin tkn

# Verify
tkn version
```

## Install Tekton Triggers (Webhook-Driven Pipelines)

Needed once pipelines should start automatically from a Git webhook rather than manual invocation:

```bash
kubectl apply -f https://storage.googleapis.com/tekton-releases/triggers/latest/release.yaml
kubectl apply -f https://storage.googleapis.com/tekton-releases/triggers/latest/interceptors.yaml

kubectl get pods -n tekton-pipelines -l app.kubernetes.io/part-of=tekton-triggers
```

## Install the Tekton Dashboard (Optional UI)

```bash
kubectl apply -f https://storage.googleapis.com/tekton-releases/dashboard/latest/release.yaml

kubectl port-forward -n tekton-pipelines svc/tekton-dashboard 9097:9097
# Dashboard available at http://localhost:9097
```

## Install the Tekton Catalog's Common Reusable Tasks

Rather than writing every `Task` from scratch, the Catalog provides pre-built, community-maintained reusable Tasks:

```bash
kubectl apply -f https://raw.githubusercontent.com/tektoncd/catalog/main/task/git-clone/0.9/git-clone.yaml
kubectl apply -f https://raw.githubusercontent.com/tektoncd/catalog/main/task/kaniko/0.6/kaniko.yaml

# Confirm they're registered
tkn task list
```

## Verify Everything Works

```bash
# 1. Confirm all core components are healthy
kubectl get pods -n tekton-pipelines

# 2. Run a minimal Task to confirm the pipeline execution path works
cat <<EOF | kubectl apply -f -
apiVersion: tekton.dev/v1
kind: Task
metadata: { name: hello-task }
spec:
  steps:
    - name: echo
      image: alpine
      script: echo "Hello from Tekton"
EOF

tkn task start hello-task --showlog
# Should print "Hello from Tekton" — confirms Tekton can schedule and
# run a real pod-based step end to end
```

## Common Installation Issues

**Controllers stuck in `Pending` or `CrashLoopBackOff`**
```bash
kubectl describe pod -n tekton-pipelines <pod-name>
# Common cause on smaller clusters: insufficient CPU/memory for the
# controllers, or webhook admission configuration conflicting with an
# existing admission controller
```

**`TaskRun`/`PipelineRun` pods never start**
```bash
kubectl describe taskrun <name>
kubectl describe pipelinerun <name>
# Check for missing Workspace bindings or ServiceAccount RBAC issues —
# a TaskRun referencing a Workspace that was never actually provided
# fails at scheduling, not execution
```

**Tekton Triggers webhook never fires a `PipelineRun`**
```bash
kubectl get eventlistener
kubectl logs -n tekton-pipelines -l eventlistener=<name>
# Confirm the EventListener's exposed Service is actually reachable
# from wherever the webhook (e.g., GitHub) is configured to send events
```

**Dashboard shows no `PipelineRuns`**
Confirm you're viewing the correct namespace in the Dashboard's namespace selector — `PipelineRuns` are namespace-scoped, and the Dashboard doesn't default to "all namespaces."

## What's Installed

After a full installation:
- **tekton-pipelines-controller** and **webhook** — the core reconciliation loop for `Task`/`Pipeline`/`TaskRun`/`PipelineRun`
- **tekton-triggers-controller** (if installed) — webhook-driven pipeline invocation
- **Tekton Dashboard** (if installed) — an optional read/write UI, not required for any core functionality
- Catalog Tasks (if applied) — reusable `Task` definitions like `git-clone` and `kaniko`, registered as regular `Task` CRDs in the cluster

## Next Steps

Go to the **Fundamentals** section to build your first `Task` and `Pipeline`.
