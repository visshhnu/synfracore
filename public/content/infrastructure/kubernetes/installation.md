# Kubernetes — Installation Guide

## Option 1: Local Cluster for Learning (Recommended Start)

### Minikube (Easiest)
Single-node K8s cluster on your machine.

```bash
# macOS
brew install minikube
minikube start --cpus=2 --memory=4096
minikube status

# Ubuntu/Linux
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube start

# Windows (PowerShell as Admin)
winget install minikube
minikube start
```

### Kind (Kubernetes in Docker — for CI/CD testing)
```bash
# macOS
brew install kind

# Linux
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.22.0/kind-linux-amd64
chmod +x ./kind && sudo mv ./kind /usr/local/bin/kind

# Create cluster
kind create cluster --name my-cluster
kind get clusters
```

## Install kubectl (Required for All Options)

```bash
# macOS
brew install kubectl

# Linux
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Windows
winget install Kubernetes.kubectl

# Verify
kubectl version --client
kubectl cluster-info   # Shows cluster is reachable
```

## Option 2: Managed Kubernetes (Production / Practice)

### AWS EKS (Free tier doesn't cover EKS — ~$0.10/hr for control plane)
```bash
# Install eksctl
brew tap weaveworks/tap && brew install eksctl

# Create cluster (takes ~15 minutes)
eksctl create cluster --name my-cluster --region ap-south-1 --nodegroup-name workers   --node-type t3.medium --nodes 2 --nodes-min 1 --nodes-max 4

# Configure kubectl
aws eks update-kubeconfig --name my-cluster --region ap-south-1
kubectl get nodes
```

### Azure AKS (Azure free tier: $200 credit for 30 days)
```bash
az group create --name myRG --location southindia
az aks create --resource-group myRG --name my-cluster --node-count 2   --node-vm-size Standard_B2s --generate-ssh-keys
az aks get-credentials --resource-group myRG --name my-cluster
kubectl get nodes
```

### GKE (Google Cloud free trial: $300 for 90 days)
```bash
gcloud container clusters create my-cluster --zone asia-south1-a   --num-nodes=2 --machine-type=e2-medium
gcloud container clusters get-credentials my-cluster --zone asia-south1-a
kubectl get nodes
```

## Useful kubectl Setup

```bash
# Shell autocomplete (add to ~/.bashrc or ~/.zshrc)
source <(kubectl completion bash)    # bash
source <(kubectl completion zsh)     # zsh

# Essential aliases (add to ~/.bashrc)
alias k=kubectl
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kgn='kubectl get nodes'

# Set default namespace
kubectl config set-context --current --namespace=my-namespace

# View all contexts (clusters)
kubectl config get-contexts
kubectl config use-context my-cluster
```

## Verify Your Cluster Works

```bash
# Deploy a test app
kubectl create deployment nginx --image=nginx --replicas=2
kubectl get pods
kubectl expose deployment nginx --port=80 --type=NodePort
kubectl get service nginx

# Minikube: open in browser
minikube service nginx

# View logs
kubectl logs -l app=nginx

# Clean up
kubectl delete deployment nginx
kubectl delete service nginx
```

## Next Steps

Your cluster is running. Go to **Fundamentals** to learn Pods, Deployments, and Services.
