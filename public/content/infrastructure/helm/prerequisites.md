# Helm — Prerequisites

## What to Know Before Starting Helm

Helm is the package manager for Kubernetes. Before Helm makes sense, you need Kubernetes fundamentals.

## Required

### 1. Kubernetes — Core Resources Well Understood
Helm generates Kubernetes YAML. If Kubernetes resources are unfamiliar, Helm just adds confusion. You must know:

```yaml
# These resources must feel familiar before touching Helm:
Deployment     # Runs and scales your application
Service        # Exposes your app (ClusterIP, NodePort, LoadBalancer)
ConfigMap      # Non-secret configuration
Secret         # Sensitive data
Ingress        # HTTP routing to your Service
Namespace      # Logical isolation
PersistentVolumeClaim  # Storage request
```

And you should be comfortable with:
```bash
kubectl apply -f manifest.yaml
kubectl get pods/services/deployments
kubectl describe pod my-pod
kubectl logs my-pod
kubectl exec -it my-pod -- sh
```

**Minimum:** Complete Kubernetes Fundamentals before starting Helm.

### 2. YAML — Fluent
Helm templates are YAML with Go template syntax. If YAML indentation trips you up, practice first.

```yaml
# Go template syntax you'll see in Helm charts:
{{ .Values.replicaCount }}             # Reference a value
{{ .Release.Name }}-my-service         # Release name injection
{{- if .Values.ingress.enabled }}      # Conditional block
{{ include "mychart.labels" . }}        # Named template
{{ .Values.image.tag | default "latest" }}  # With default
```

### 3. Working Kubernetes Cluster
You need a cluster to install charts into:
- minikube (`minikube start`)
- kind (`kind create cluster`)
- EKS/GKE/AKS (if you have cloud access)

## Nice to Have

### Understanding of the Apps You're Deploying
Helm charts configure Kubernetes apps. Understanding what Prometheus, Grafana, nginx-ingress, and PostgreSQL do makes their chart values.yaml make sense.

### Jinja2 or Go Templates
Helm uses Go templates. If you've used Jinja2 (Ansible/Python), the concepts are similar.

## Learning Order

```
Kubernetes Installation
      ↓
Kubernetes Fundamentals (Pods, Deployments, Services)
      ↓
Kubernetes Intermediate (Ingress, PVCs, ConfigMaps)
      ↓
Helm Installation
      ↓
Helm Fundamentals (install existing charts)
      ↓
Helm Intermediate (customize with values, create your own chart)
```

## Time Estimate

With Kubernetes fundamentals done:
- Install and use public charts: 1 day
- Customize charts with values files: 2-3 days
- Create your own Helm chart: 1 week
