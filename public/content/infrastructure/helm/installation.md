# Helm — Installation Guide

## Prerequisites

Helm requires a running Kubernetes cluster and `kubectl` configured. If you don't have that yet, do the Kubernetes Installation guide first.

```bash
# Verify kubectl works
kubectl cluster-info
kubectl get nodes
```

## Install Helm

### macOS
```bash
brew install helm
helm version   # version.BuildInfo{Version:"v3.x.x"}
```

### Linux
```bash
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
helm version
```

### Windows
```powershell
winget install Helm.Helm
helm version
```

### Manual (Any OS)
```bash
# Download from github.com/helm/helm/releases
# Linux example:
curl -LO https://get.helm.sh/helm-v3.14.0-linux-amd64.tar.gz
tar -zxvf helm-v3.14.0-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm
helm version
```

## Add Common Repositories

```bash
# Official stable charts
helm repo add stable https://charts.helm.sh/stable

# Bitnami (PostgreSQL, Redis, MySQL, WordPress, etc.)
helm repo add bitnami https://charts.bitnami.com/bitnami

# Prometheus community (monitoring stack)
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

# Grafana (Loki, Grafana, Tempo)
helm repo add grafana https://grafana.github.io/helm-charts

# ArgoCD
helm repo add argo https://argoproj.github.io/argo-helm

# Cert-manager
helm repo add jetstack https://charts.jetstack.io

# Update all repos
helm repo update

# List repos
helm repo list
```

## Install Your First Chart

```bash
# Search for available charts
helm search repo nginx
helm search hub redis          # Search Artifact Hub (artifacthub.io)

# Install nginx ingress controller
helm install my-nginx bitnami/nginx --namespace web --create-namespace

# Check status
helm list -A                   # All releases across all namespaces
helm status my-nginx -n web    # Status of a specific release
kubectl get pods -n web

# Upgrade with new values
helm upgrade my-nginx bitnami/nginx -n web --set replicaCount=2

# Rollback to previous version
helm rollback my-nginx 1 -n web

# Uninstall
helm uninstall my-nginx -n web
```

## Inspect a Chart Before Installing

```bash
# See all configurable values
helm show values bitnami/postgresql

# Download chart locally to inspect
helm pull bitnami/postgresql --untar
ls postgresql/
cat postgresql/values.yaml | head -50
```

## Autocomplete Setup

```bash
# bash
source <(helm completion bash)
echo 'source <(helm completion bash)' >> ~/.bashrc

# zsh
source <(helm completion zsh)
echo 'source <(helm completion zsh)' >> ~/.zshrc
```

## Verify Everything Works

```bash
# Install a simple chart and verify pods come up
helm install test-nginx bitnami/nginx
kubectl get pods -w   # Watch until STATUS=Running
helm uninstall test-nginx
```

## Next Steps

Helm is installed and you can deploy charts. Go to **Fundamentals** to learn how to customize charts with values files and build your own.
