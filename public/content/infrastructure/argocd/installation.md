# ArgoCD — Installation Guide

## Prerequisites

ArgoCD runs inside Kubernetes. You need a working cluster first.

```bash
kubectl cluster-info    # Verify cluster is reachable
kubectl get nodes       # Verify nodes are Ready
```

## Install ArgoCD

```bash
# Create namespace
kubectl create namespace argocd

# Install ArgoCD (official manifests)
kubectl apply -n argocd -f \
  https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Watch pods come up (takes 2-3 minutes)
kubectl get pods -n argocd -w
# Wait until all pods show STATUS=Running
```

## Access the ArgoCD UI

### Option A: Port Forward (Quick, for local clusters)
```bash
kubectl port-forward svc/argocd-server -n argocd 8080:443
# Open https://localhost:8080 (accept the self-signed cert warning)
```

### Option B: NodePort (Accessible on your network)
```bash
kubectl patch svc argocd-server -n argocd \
  -p '{"spec": {"type": "NodePort"}}'
kubectl get svc argocd-server -n argocd
# Note the NodePort (e.g., 32541)
# Access: http://NODE-IP:32541
```

### Option C: LoadBalancer (Cloud clusters)
```bash
kubectl patch svc argocd-server -n argocd \
  -p '{"spec": {"type": "LoadBalancer"}}'
kubectl get svc argocd-server -n argocd
# Wait for EXTERNAL-IP to be assigned
```

## Get the Initial Admin Password

```bash
# Get the auto-generated initial password
kubectl -n argocd get secret argocd-initial-admin-secret \
  -o jsonpath="{.data.password}" | base64 -d && echo

# Login: admin / <password from above>
```

## Install ArgoCD CLI

```bash
# macOS
brew install argocd

# Linux
curl -sSL -o argocd-linux-amd64 \
  https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd

# Login via CLI
argocd login localhost:8080 --username admin --password <your-password> --insecure

# Change the default password
argocd account update-password
```

## Deploy Your First Application

```bash
# Add a sample Git repository (public, no credentials needed)
argocd app create guestbook \
  --repo https://github.com/argoproj/argocd-example-apps.git \
  --path guestbook \
  --dest-server https://kubernetes.default.svc \
  --dest-namespace default

# Sync (deploy) the application
argocd app sync guestbook

# Check status
argocd app get guestbook
kubectl get pods -l app=guestbook

# Open in UI — you'll see the guestbook app in "Healthy/Synced" state
```

## Verify ArgoCD is Working

```bash
argocd version          # Client and server versions
argocd cluster list     # Clusters registered (in-cluster by default)
argocd repo list        # Registered repositories
argocd app list         # All applications
```

## Install via Helm (Alternative)

```bash
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update

helm install argocd argo/argo-cd \
  --namespace argocd --create-namespace \
  --set server.service.type=NodePort
```

## Next Steps

ArgoCD is running. Go to **Fundamentals** to connect your own Git repository and set up auto-sync.
