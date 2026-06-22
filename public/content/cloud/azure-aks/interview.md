# Azure Kubernetes Service (AKS) Interview Questions

## Core Concepts

**Q: What is AKS? How does it differ from self-managed Kubernetes?**

AKS is Azure's managed Kubernetes service. Azure manages the control plane (API server, etcd, scheduler) — you only manage and pay for worker nodes.

**AKS vs self-managed:**
- Control plane: Free in AKS (Azure manages), you pay only for VMs running workloads
- Upgrades: One-click or automated cluster upgrades
- Scaling: Node pools with autoscaler, virtual nodes (Azure Container Instances for burst)
- Integrated: Azure AD, Azure Monitor, Azure Policy, ACR, Key Vault
- Networking: Azure CNI (full VNet integration) or Kubenet (overlay)

---

**Q: AKS networking — Azure CNI vs Kubenet.**

**Kubenet** (basic):
- Node gets VNet IP, pods get overlay IPs (not routable from outside VNet)
- Cheaper (fewer IPs consumed from VNet)
- Limited to 400 nodes per cluster
- Use when: pod-to-pod communication stays in cluster

**Azure CNI** (advanced):
- Every pod gets a real VNet IP — directly routable
- No overlay — lower latency, better performance
- Requires more IP address planning (pods × nodes × slots)
- Enables direct pod access from on-premise via VPN/ExpressRoute
- Recommended for production

**Azure CNI Overlay** (newer): Pods use overlay IPs but with Azure CNI features — best of both.

---

**Q: AKS identity and security — Workload Identity.**

**Workload Identity**: AKS equivalent of AWS IRSA. Pods assume Azure AD identities to access Azure resources (Key Vault, Storage, ACR) without storing credentials.

```bash
# Enable workload identity on cluster
az aks update --enable-oidc-issuer --enable-workload-identity   --name myaks --resource-group myrg

# Create managed identity
az identity create --name my-app-identity --resource-group myrg

# Federate with K8s service account
az identity federated-credential create   --name myapp-fedcred   --identity-name my-app-identity   --issuer $(az aks show --name myaks --query "oidcIssuerProfile.issuerUrl" -o tsv)   --subject system:serviceaccount:default:my-service-account
```

**Key Vault integration:**
- AKS CSI driver mounts Key Vault secrets as volumes or K8s secrets
- Workload Identity + Key Vault = no credentials stored anywhere

---

**Q: AKS node pools and scaling.**

```bash
# System node pool: runs K8s system pods (DNS, metrics-server)
# User node pool: runs application workloads

# Create cluster with system pool
az aks create --name myaks --node-count 3 --node-vm-size Standard_D4s_v3

# Add user node pool (GPU, high memory, spot)
az aks nodepool add --cluster-name myaks --name gpupool   --node-count 2 --node-vm-size Standard_NC6s_v3   --mode User --labels workload=gpu

# Enable cluster autoscaler
az aks nodepool update --cluster-name myaks --name agentpool   --enable-cluster-autoscaler --min-count 2 --max-count 10

# Virtual nodes (burst to ACI - Azure Container Instances)
az aks enable-addons --addons virtual-node --cluster-name myaks
```

**Spot node pools**: 60-80% cheaper. AKS handles eviction gracefully via cordon/drain.

---

**Q: AKS monitoring and upgrades.**

**Monitoring**: Azure Monitor + Container Insights + Prometheus (Azure Managed Prometheus).
```bash
az aks enable-addons --addons monitoring --workspace-resource-id $WORKSPACE_ID
```

**Upgrades:**
```bash
az aks get-upgrades --name myaks  # Available versions
az aks upgrade --name myaks --kubernetes-version 1.29.0   --node-image-upgrade-only  # Upgrade node OS only (no K8s version change)
```

Blue-green upgrade: Create new node pool with new version → migrate workloads → delete old pool.

## Revision Notes
```
AKS: managed K8s. Azure manages control plane (free). Pay for nodes only.
NETWORKING:
Kubenet: overlay, limited scale, cheaper IPs
Azure CNI: real VNet IPs per pod, directly routable, recommended for prod
Azure CNI Overlay: overlay IPs with CNI features

WORKLOAD IDENTITY: Pods → Azure AD identity → Azure resources (no credentials stored)
Similar to AWS IRSA (IAM Roles for Service Accounts)

NODE POOLS: System (K8s components) + User (app workloads)
Autoscaler: --enable-cluster-autoscaler --min/max-count
Spot pools: 60-80% cheaper, handle evictions with cordon/drain
Virtual nodes: burst to ACI for sudden scale

MONITORING: Azure Monitor + Container Insights + Managed Prometheus
UPGRADES: az aks upgrade | Blue-green via new node pool
```
