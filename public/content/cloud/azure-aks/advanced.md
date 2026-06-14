# Azure AKS — Advanced

## GitOps with Flux on AKS

```bash
# Enable GitOps (Flux) as AKS extension
az k8s-configuration flux create \
  --resource-group prod-rg --cluster-name prod-aks --cluster-type managedClusters \
  --name gitops-config \
  --namespace flux-system \
  --scope cluster \
  --url https://github.com/myorg/k8s-config.git \
  --branch main \
  --kustomization name=infra path=./clusters/prod prune=true \
  --kustomization name=apps path=./apps/prod prune=true dependsOn=infra

# Check Flux status
az k8s-configuration flux show \
  --resource-group prod-rg --cluster-name prod-aks \
  --cluster-type managedClusters --name gitops-config
```

## AKS Security Hardening

```bash
# Enable Azure Policy for AKS (OPA Gatekeeper)
az aks enable-addons --resource-group prod-rg --name prod-aks --addons azure-policy

# Microsoft Defender for Containers
az aks update --resource-group prod-rg --name prod-aks \
  --enable-defender

# Restrict API server access (private cluster or authorized IPs)
az aks update --resource-group prod-rg --name prod-aks \
  --api-server-authorized-ip-ranges "$(curl -s ifconfig.me)/32,10.0.0.0/8"

# Enable Azure AD RBAC (replace Kubernetes RBAC)
az aks update --resource-group prod-rg --name prod-aks \
  --enable-azure-rbac

# Assign Kubernetes RBAC role to Azure AD group
az role assignment create \
  --role "Azure Kubernetes Service Cluster User Role" \
  --assignee $AAD_GROUP_OBJECT_ID \
  --scope /subscriptions/$SUB/resourceGroups/prod-rg/providers/Microsoft.ContainerService/managedClusters/prod-aks
```

## AKS Node Pool Management

```bash
# Add GPU node pool for ML workloads
az aks nodepool add \
  --resource-group prod-rg --cluster-name prod-aks \
  --name gpupool \
  --node-count 2 --node-vm-size Standard_NC6s_v3 \
  --node-taints "sku=gpu:NoSchedule" \
  --labels workload=ml

# Add Spot node pool (70-80% cheaper)
az aks nodepool add \
  --resource-group prod-rg --cluster-name prod-aks \
  --name spotpool \
  --priority Spot --eviction-policy Delete \
  --spot-max-price -1 \
  --node-count 0 \
  --enable-cluster-autoscaler --min-count 0 --max-count 50 \
  --node-taints "kubernetes.azure.com/scalesetpriority=spot:NoSchedule"

# Upgrade node pool
az aks nodepool upgrade \
  --resource-group prod-rg --cluster-name prod-aks \
  --name workers --kubernetes-version 1.31
```
