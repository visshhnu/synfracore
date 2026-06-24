# Azure AKS Intermediate

## Networking Deep Dive

```
NETWORK PLUGINS:
  kubenet (basic):
    Pods get IPs from pod CIDR (not native VNet IPs)
    NAT required for pod-to-pod across nodes
    Simpler, less Azure-native, smaller IP usage
    Limitation: no Windows nodes, no Azure Network Policy

  Azure CNI (advanced):
    Each pod gets a real VNet IP address
    No NAT between pods; fully routable in Azure network
    IP planning critical: reserve enough IPs upfront
    Supports: Windows nodes, Azure Network Policy, VNet-native features

  Azure CNI Overlay (newer):
    Pods get IPs from overlay network, NOT VNet IPs
    Better IP conservation than standard Azure CNI
    Similar feature set to Azure CNI

  Cilium (eBPF):
    High performance, eBPF-based; replaces kube-proxy
    Enable: --network-plugin azure --network-plugin-mode overlay --network-dataplane cilium

NETWORK POLICY:
  Azure Network Policy: native, enforces by Azure (limited features)
  Calico: more feature-rich, works with kubenet or Azure CNI
  Cilium: eBPF-based, highest performance

INGRESS CONTROLLERS:
  NGINX: most popular, simple HTTP/S routing
  Application Gateway Ingress Controller (AGIC): native Azure L7 LB, WAF-integrated
  Azure Container Apps: serverless alternative
```

## Autoscaling

```bash
# Cluster Autoscaler (scale node count)
az aks update -g myRG -n myAKS \
  --enable-cluster-autoscaler --min-count 1 --max-count 10

az aks update -g myRG -n myAKS \
  --update-cluster-autoscaler --min-count 2 --max-count 15

# KEDA (event-driven autoscaling for pods)
az aks update -g myRG -n myAKS --enable-keda

# VPA (Vertical Pod Autoscaler)
az aks update -g myRG -n myAKS --enable-vpa

# Node pool with autoscaler
az aks nodepool add -g myRG --cluster-name myAKS -n pool2 \
  --enable-cluster-autoscaler --min-count 1 --max-count 5
```

## Monitoring and Security

```bash
# Container Insights (Log Analytics)
az aks enable-addons -g myRG -n myAKS --addons monitoring \
  --workspace-resource-id /subscriptions/.../workspaces/myWS

# Azure Policy for AKS (Gatekeeper)
az aks enable-addons -g myRG -n myAKS --addons azure-policy

# Defender for Containers
az aks update -g myRG -n myAKS --enable-defender

# Key Vault secrets (CSI driver)
az aks enable-addons -g myRG -n myAKS --addons azure-keyvault-secrets-provider

# Private cluster
az aks create -g myRG -n myPrivateAKS --enable-private-cluster \
  --private-dns-zone system
```

## Study Resources
- **Microsoft Learn AKS path** (learn.microsoft.com) — free, hands-on
- **AKS Baseline Architecture** (aka.ms/aks/baseline) — Microsoft reference arch
- **AKS checklist** (aka.ms/aks/checklist) — production readiness
- **AKS Best Practices** docs — security, storage, networking, scaling
