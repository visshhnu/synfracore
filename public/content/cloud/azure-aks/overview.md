# Azure Kubernetes Service (AKS)

**Before you start:** working Kubernetes knowledge (Deployments, Services, kubectl — see the DevOps academy's Kubernetes Overview/Fundamentals first if those are new) is assumed throughout this page; AKS does not re-teach Kubernetes itself. Basic Azure familiarity (subscriptions, resource groups, Entra ID basics) is also assumed.

AKS is Microsoft Azure's managed Kubernetes service. It handles the control plane (API server, etcd, scheduler) for free — you only pay for worker nodes. AKS integrates deeply with Microsoft Entra ID (formerly Azure AD), Azure Monitor, Azure Container Registry, and Azure networking.

## Why this exists (the hook)

Running Kubernetes yourself means standing up and babysitting the control plane too — etcd backups, API server certificate rotation, scheduler upgrades, all before you've deployed a single application. Get any of that wrong and the entire cluster is unreachable, not just one app. AKS exists because most teams don't want to be in the etcd-backup business — they want the scheduling, self-healing, and declarative-deployment benefits of Kubernetes without also owning its hardest operational surface. Microsoft runs and patches the control plane; you bring the worker nodes and the workloads.

## Analogy

Running your own Kubernetes cluster is like owning and maintaining the elevator in your apartment building yourself — technically possible, but if it breaks at 2am, that's now your emergency, and you also need to understand elevator mechanics well enough to keep it certified and safe. AKS is like living in a building where the elevator is professionally maintained by the building management (Microsoft manages the control plane) — you still decide how many elevators you need and how heavily you load them (your worker node pools and workloads), but you're not the one keeping the motor running.

## How it fits together (diagram)

```flow
{
  "layout": "stack",
  "steps": [
    { "label": "Control Plane", "sublabel": "Microsoft manages, free -- API server, etcd, scheduler, controller-manager", "color": "blue" },
    { "label": "Node Pools", "sublabel": "You provision and pay for -- system pool (CoreDNS, kube-proxy), user pool(s)", "color": "purple" },
    { "label": "Application Pods", "sublabel": "Scheduled onto your node pools", "color": "green" }
  ]
}
```

## Try it yourself (2 minutes)

If you have an Azure sandbox available, run `az aks create --resource-group <rg> --name demo-aks --node-count 1 --generate-ssh-keys` (a single-node cluster is enough to see the shape) and then `kubectl get nodes` and `kubectl get pods -n kube-system` once `az aks get-credentials` has been run. Notice the system pods (`coredns`, `kube-proxy`, `metrics-server`) are already running on your one node without you deploying them — that's the boundary between what Microsoft ships pre-configured on every node and what you're responsible for adding yourself.

## Why AKS?

```conceptgrid
{
  "boxes": [
    { "title": "Free Control Plane", "description": "Microsoft manages and pays for it -- you only pay for worker nodes", "color": "blue" },
    { "title": "Entra ID + Workload Identity", "description": "Existing identities for K8s RBAC; pods get identities, no secrets needed", "color": "purple" },
    { "title": "Azure Native Integration", "description": "Azure Monitor, ACR pull, Virtual Nodes (burst to ACI)", "color": "green" },
    { "title": "Windows Node Pools", "description": "Run Windows containers alongside Linux in the same cluster", "color": "slate" }
  ]
}
```

- **Free control plane** — Microsoft manages and pays for it
- **Entra ID integration** — Use existing identities for K8s RBAC
- **Workload Identity** — Pods get Entra ID identities (no secrets needed)
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
# --network-plugin azure = Azure CNI (recommended for production)
# --enable-aad = Azure AD integration; --enable-azure-rbac = Azure RBAC for K8s
# --enable-workload-identity = pod-level Azure AD identity
# --attach-acr = allow pulling from ACR; --enable-addons monitoring = Azure Monitor
# --zones 1 2 3 = spread nodes across availability zones
az aks create \
  --resource-group $RG \
  --name $CLUSTER \
  --location $REGION \
  --node-count 3 \
  --node-vm-size Standard_D4s_v5 \
  --enable-cluster-autoscaler \
  --min-count 2 \
  --max-count 20 \
  --network-plugin azure \
  --network-policy azure \
  --enable-aad \
  --enable-azure-rbac \
  --enable-workload-identity \
  --enable-oidc-issuer \
  --enable-managed-identity \
  --attach-acr myregistry \
  --enable-addons monitoring \
  --workspace-resource-id /subscriptions/.../workspaces/my-workspace \
  --zones 1 2 3 \
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
# --node-count 0 starts at zero and scales up only when a GPU workload is scheduled
# --node-vm-size Standard_NC6s_v3 is a GPU-enabled VM size
# --node-taints ensures only pods that explicitly tolerate sku=gpu land here
az aks nodepool add \
  --resource-group $RG \
  --cluster-name $CLUSTER \
  --name gpupool \
  --node-count 0 \
  --node-vm-size Standard_NC6s_v3 \
  --enable-cluster-autoscaler \
  --min-count 0 \
  --max-count 5 \
  --node-taints sku=gpu:NoSchedule \
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
