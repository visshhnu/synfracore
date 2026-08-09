# Tekton — Prerequisites

## What to Know Before Starting Tekton

Tekton is deeply Kubernetes-native — every pipeline step runs as a real pod, and there's no separate CI server to abstract that away. Strong Kubernetes fundamentals matter more here than for a CI tool with its own dedicated runtime.

## Required (Must Have)

### 1. Solid Kubernetes Fundamentals
```bash
kubectl get pods, kubectl logs, kubectl describe
kubectl apply -f
```
Tekton's core objects (`Task`, `Pipeline`, `PipelineRun`, `Trigger`) are all Kubernetes CRDs, and a running `PipelineRun` is literally a set of pods — debugging a failed pipeline step means debugging a pod, using the exact same `kubectl logs`/`kubectl describe` workflow as any other Kubernetes workload.

### 2. Container/Docker Basics
Every Tekton `Task` step runs inside a container image — you need to understand what a container image is and why a step's behavior depends on which image it runs in.

### 3. YAML Comfort
All Tekton objects are YAML CRDs — the same baseline comfort needed for any Kubernetes-native tool.

## Nice to Have (Speeds Up Learning)

### Prior CI/CD Concept Exposure
If you've used Jenkins or GitHub Actions before, the concepts (pipeline, step, trigger) transfer directly — Overview's own framing is the fastest on-ramp: a `Task` is like a Kubernetes Job, a `Pipeline` chains Tasks the way a Jenkins pipeline chains stages.

### Familiarity With Persistent Volumes
Module topics on `Workspace` (shared storage between Tasks) will make more sense with basic PersistentVolume/PersistentVolumeClaim familiarity, though it's learnable within the guide without prior exposure.

### OpenShift Awareness (Optional)
Tekton is deeply integrated with OpenShift Pipelines (Red Hat's distribution) — not required, but useful context if your target environment is OpenShift specifically.

## What You Do NOT Need

- A dedicated CI server or agent infrastructure — Tekton has no central server; everything runs as pods on the cluster you already have
- Jenkins or Groovy knowledge, despite the conceptual "chain of steps" similarity
- Prior Tekton Dashboard experience — it's an optional add-on, not required to use Tekton

## Time Estimate

If you have the prerequisites above:
- Fundamentals: 1-2 days
- Intermediate + Advanced: 4-6 days
- Job-ready (comfortable with Tasks, Pipelines, Triggers, and supply-chain provenance via Tekton Chains): 2-3 weeks

## Start Here

Go to the **Installation** section to install Tekton Pipelines onto a cluster, then proceed to **Fundamentals**.
