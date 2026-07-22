# Azure AKS — Fundamentals

## The hook: kubectl talks to Azure's control plane, not your nodes

A common early confusion: `kubectl` commands feel like they're talking directly to your VMs, but they're not — every `kubectl get`/`apply` call goes to the API server, which is a Microsoft-managed component you never SSH into. Your node pool VMs are visible to Azure Compute (`az vm list` won't show them under your own VM list the normal way — they live in a separate, Azure-managed resource group prefixed `MC_`), but the thing actually scheduling work onto them is entirely out of your hands to patch or restart directly.

## Analogy

Think of `kubectl` as calling a company's reception desk (the API server) instead of walking directly into any specific employee's office (a node). You tell reception what you want done ("run 3 copies of this container"), and reception (the scheduler) decides which office (node) actually does the work. You never need to know or care which specific office it landed in — and if that particular office is unavailable, reception just routes the work to another one.

## Create AKS Cluster

```bash
# Azure CLI
# --enable-managed-identity: cluster's own identity for managing Azure resources (LBs, disks)
# --enable-workload-identity + --enable-oidc-issuer: lets PODS get their own Entra ID identity
# --network-plugin azure: pods get real VNet IPs (vs. kubenet's overlay network)
# --network-policy calico: enforce pod-to-pod traffic rules
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

# Get credentials — writes/merges cluster access config into ~/.kube/config
az aks get-credentials --resource-group prod-rg --name prod-aks

# Check cluster — talks to the managed API server, not any node directly
kubectl get nodes
kubectl cluster-info
```

## Try it yourself (2 minutes)

If you have an Azure sandbox available, run `az aks show --resource-group prod-rg --name prod-aks --query nodeResourceGroup -o tsv` after creating a cluster. This prints the name of the separate, Azure-managed resource group (prefixed `MC_`) where your actual node VMs, load balancers, and disks live — distinct from `prod-rg`, the resource group you created. Then `az group show --name <that MC_ group>` to see it's real and exists, even though you never explicitly created it. This is the concrete evidence behind the hook above: Azure manages that infrastructure layer, and modifying resources inside it directly (instead of through AKS) is explicitly unsupported.

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
