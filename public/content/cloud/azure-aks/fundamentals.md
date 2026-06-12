# Azure AKS — Fundamentals

## Create AKS Cluster

```bash
# Azure CLI
az aks create \
    --resource-group prod-rg \
    --name prod-aks \
    --node-count 3 \
    --node-vm-size Standard_D4s_v5 \
    --enable-managed-identity \
    --enable-workload-identity \
    --enable-oidc-issuer \
    --network-plugin azure \
    --network-policy calico \
    --enable-addons monitoring \
    --generate-ssh-keys

# Get credentials
az aks get-credentials --resource-group prod-rg --name prod-aks

# Check cluster
kubectl get nodes
kubectl cluster-info
```

## Workload Identity (IRSA equivalent)

```bash
# Give pods access to Azure resources without credentials

# 1. Get OIDC issuer
OIDC=$(az aks show --name prod-aks --resource-group prod-rg \
    --query "oidcIssuerProfile.issuerUrl" -o tsv)

# 2. Create managed identity
az identity create --name app-identity --resource-group prod-rg

# 3. Create federated credential
az identity federated-credential create \
    --name "k8s-fed-cred" \
    --identity-name app-identity \
    --resource-group prod-rg \
    --issuer "$OIDC" \
    --subject "system:serviceaccount:default:app-sa" \
    --audience "api://AzureADTokenExchange"

# 4. Assign role to identity
az role assignment create \
    --role "Key Vault Secrets User" \
    --assignee $(az identity show --name app-identity -g prod-rg --query clientId -o tsv) \
    --scope $(az keyvault show --name prod-vault --query id -o tsv)
```

```yaml
# 5. Annotate service account
apiVersion: v1
kind: ServiceAccount
metadata:
  name: app-sa
  annotations:
    azure.workload.identity/client-id: "<managed-identity-client-id>"

# 6. Label deployment pods
apiVersion: apps/v1
kind: Deployment
spec:
  template:
    metadata:
      labels:
        azure.workload.identity/use: "true"
    spec:
      serviceAccountName: app-sa
```

## Azure CNI vs Kubenet

```
Kubenet:
  - Pods get IPs from a private overlay network (not VNet IPs)
  - Requires UDR (User Defined Routes) on subnets — complex
  - Use for: Small clusters, cost savings (fewer VNet IPs used)

Azure CNI:
  - Pods get real VNet IP addresses
  - Direct communication with other VNet resources
  - Requires pre-allocating IPs (max pods × nodes IPs)
  - Use for: Production, needs VNet integration, Azure services access

Azure CNI Overlay (newer, recommended):
  - Pods get overlay IPs (like Kubenet)
  - But no UDR needed — simpler than Kubenet
  - Better scalability than standard CNI
```

## AKS-Specific Features

```bash
# Azure Monitor for AKS (built-in observability)
az aks enable-addons --addons monitoring \
    --name prod-aks --resource-group prod-rg

# Node auto-provisioning (Karpenter equivalent)
az aks update --name prod-aks --resource-group prod-rg \
    --node-provisioning-mode Auto

# Upgrade cluster (rolling node-by-node)
az aks upgrade --name prod-aks --resource-group prod-rg \
    --kubernetes-version 1.30.0

# Scale node pool
az aks nodepool scale \
    --cluster-name prod-aks --resource-group prod-rg \
    --name nodepool1 --node-count 5

# Enable Cluster Autoscaler
az aks update \
    --name prod-aks --resource-group prod-rg \
    --enable-cluster-autoscaler \
    --min-count 2 --max-count 10
```
