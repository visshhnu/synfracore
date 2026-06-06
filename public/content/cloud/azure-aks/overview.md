# Azure Kubernetes Service (AKS)

AKS is Microsoft Azure's managed Kubernetes service. It handles the control plane (API server, etcd, scheduler) for free — you only pay for worker nodes. AKS integrates deeply with Azure AD, Azure Monitor, Azure Container Registry, and Azure networking.

## Why AKS?

- **Free control plane** — Microsoft manages and pays for it
- **Azure AD integration** — Use existing identities for K8s RBAC
- **Workload Identity** — Pods get Azure AD identities (no secrets needed)
- **Azure Monitor** — Native metrics and logs integration
- **ACR integration** — Pull from Azure Container Registry seamlessly
- **Virtual Nodes** — Burst to Azure Container Instances (serverless pods)
- **Windows node pools** — Run Windows containers alongside Linux

## Create AKS Cluster

```bash
# Install Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
az login

# Set variables
RG="my-rg"
CLUSTER="prod-aks"
REGION="eastus"

# Create resource group
az group create --name $RG --location $REGION

# Create AKS cluster
az aks create \
  --resource-group $RG \
  --name $CLUSTER \
  --location $REGION \
  --node-count 3 \
  --node-vm-size Standard_D4s_v5 \
  --enable-cluster-autoscaler \
  --min-count 2 \
  --max-count 20 \
  --network-plugin azure \            # Azure CNI (recommended for production)
  --network-policy azure \
  --enable-aad \                      # Azure AD integration
  --enable-azure-rbac \               # Azure RBAC for K8s
  --enable-workload-identity \        # Pod-level Azure AD identity
  --enable-oidc-issuer \
  --enable-managed-identity \
  --attach-acr myregistry \           # Allow pulling from ACR
  --enable-addons monitoring \        # Azure Monitor
  --workspace-resource-id /subscriptions/.../workspaces/my-workspace \
  --zones 1 2 3 \                     # Availability zones
  --generate-ssh-keys

# Get kubeconfig
az aks get-credentials --resource-group $RG --name $CLUSTER

# Verify
kubectl get nodes
```

## Node Pools

```bash
# Add a system node pool (for system pods)
az aks nodepool add \
  --resource-group $RG \
  --cluster-name $CLUSTER \
  --name system \
  --node-count 2 \
  --node-vm-size Standard_D2s_v5 \
  --mode System \
  --node-taints CriticalAddonsOnly=true:NoSchedule

# Add a user node pool (for application workloads)
az aks nodepool add \
  --resource-group $RG \
  --cluster-name $CLUSTER \
  --name apppool \
  --node-count 3 \
  --node-vm-size Standard_D8s_v5 \
  --mode User \
  --enable-cluster-autoscaler \
  --min-count 2 \
  --max-count 30 \
  --labels workload=application \
  --zones 1 2 3

# Add GPU node pool for AI/ML workloads
az aks nodepool add \
  --resource-group $RG \
  --cluster-name $CLUSTER \
  --name gpupool \
  --node-count 0 \                    # Start at 0 — scale to 0 when idle
  --node-vm-size Standard_NC6s_v3 \  # GPU VM
  --enable-cluster-autoscaler \
  --min-count 0 \
  --max-count 5 \
  --node-taints sku=gpu:NoSchedule \  # Only GPU workloads go here
  --labels sku=gpu
```

## Workload Identity — No More Secrets

```bash
# Enable on existing cluster
az aks update \
  --resource-group $RG \
  --name $CLUSTER \
  --enable-workload-identity \
  --enable-oidc-issuer

# Get OIDC issuer URL
OIDC_ISSUER=$(az aks show \
  --resource-group $RG \
  --name $CLUSTER \
  --query "oidcIssuerProfile.issuerUrl" -o tsv)

# Create managed identity for the app
az identity create \
  --name myapp-identity \
  --resource-group $RG

CLIENT_ID=$(az identity show \
  --name myapp-identity \
  --resource-group $RG \
  --query clientId -o tsv)

# Give it access to Azure Key Vault
az keyvault set-policy \
  --name my-keyvault \
  --object-id $(az identity show --name myapp-identity -g $RG --query principalId -o tsv) \
  --secret-permissions get list

# Create federated credential (link K8s SA to Azure identity)
az identity federated-credential create \
  --name myapp-federated-cred \
  --identity-name myapp-identity \
  --resource-group $RG \
  --issuer $OIDC_ISSUER \
  --subject system:serviceaccount:production:myapp-sa \
  --audiences api://AzureADTokenExchange
```

```yaml
# Kubernetes side — annotate ServiceAccount
apiVersion: v1
kind: ServiceAccount
metadata:
  name: myapp-sa
  namespace: production
  annotations:
    azure.workload.identity/client-id: "<CLIENT_ID>"

---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp
spec:
  template:
    metadata:
      labels:
        azure.workload.identity/use: "true"   # Enable workload identity
    spec:
      serviceAccountName: myapp-sa
      containers:
      - name: myapp
        image: myregistry.azurecr.io/myapp:latest
        # SDK automatically gets token — no secrets needed!
```

```python
# Python SDK — gets token automatically from workload identity
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient

credential = DefaultAzureCredential()  # Automatically uses workload identity in AKS
client = SecretClient(vault_url="https://my-keyvault.vault.azure.net/", credential=credential)
secret = client.get_secret("database-password")
```

## Azure CNI vs Kubenet

| | Kubenet | Azure CNI |
|--|--|--|
| **Pod IPs** | From overlay (different subnet) | From VNet directly |
| **Max pods/node** | 110 | Limited by VNet subnet |
| **Network Policy** | Calico only | Azure or Calico |
| **Performance** | Slight overhead (NAT) | Native VNet performance |
| **Use for** | Dev/test, small clusters | Production, direct VNet access needed |

```bash
# Azure CNI — pods get VNet IPs
az aks create ... --network-plugin azure

# Kubenet — simpler networking
az aks create ... --network-plugin kubenet
```

## Upgrade Strategy

```bash
# Check available upgrades
az aks get-upgrades --resource-group $RG --name $CLUSTER

# Upgrade control plane first
az aks upgrade \
  --resource-group $RG \
  --name $CLUSTER \
  --kubernetes-version 1.29.0 \
  --control-plane-only           # Upgrade CP only first

# Then upgrade node pools one at a time
az aks nodepool upgrade \
  --resource-group $RG \
  --cluster-name $CLUSTER \
  --name apppool \
  --kubernetes-version 1.29.0 \
  --max-surge 1                  # One extra node during upgrade
```

## Interview Questions

**What is the difference between AKS System and User node pools?**
System node pools run critical Kubernetes system pods (CoreDNS, kube-proxy, metrics-server, CSI drivers). They must always be running and are tainted with `CriticalAddonsOnly=true:NoSchedule` to prevent application pods from scheduling there. User node pools run your application workloads. This separation ensures system stability — if your application pods have resource issues, they can't evict critical system components.

**What is AKS Workload Identity and why is it better than service principal secrets?**
Workload Identity federates Kubernetes ServiceAccounts with Azure AD managed identities. A pod presents a signed Kubernetes token to Azure AD, which verifies it via the cluster's OIDC endpoint and issues short-lived Azure AD tokens. No secrets are stored anywhere — no Azure credentials in Kubernetes secrets, no rotation needed, no risk of credential leakage. The old approach (service principal + secret in K8s Secret) required manual rotation and was vulnerable to secret exposure.
