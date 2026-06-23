# Azure AKS Quick Reference

## az aks Commands
```bash
# Cluster lifecycle
az aks create --name myAKS --resource-group myRG \
  --node-count 3 --node-vm-size Standard_D4s_v3 \
  --enable-managed-identity --enable-workload-identity \
  --enable-cluster-autoscaler --min-count 2 --max-count 10

az aks get-credentials --name myAKS --resource-group myRG  # Set kubeconfig
az aks show --name myAKS --resource-group myRG
az aks upgrade --name myAKS --resource-group myRG --kubernetes-version 1.29.0
az aks delete --name myAKS --resource-group myRG

# Node pools
az aks nodepool add --cluster-name myAKS --resource-group myRG \
  --name gpupool --node-vm-size Standard_NC6s_v3 \
  --node-count 2 --mode User
az aks nodepool scale --cluster-name myAKS --resource-group myRG \
  --name gpupool --node-count 5
az aks nodepool delete --cluster-name myAKS --resource-group myRG --name old-pool

# Add-ons
az aks enable-addons --addons monitoring --workspace-resource-id $WORKSPACE_ID \
  --name myAKS --resource-group myRG
az aks enable-addons --addons azure-policy --name myAKS --resource-group myRG

# Workload Identity
az aks update --enable-oidc-issuer --enable-workload-identity \
  --name myAKS --resource-group myRG
OIDC=$(az aks show --name myAKS --query 'oidcIssuerProfile.issuerUrl' -o tsv)
az identity federated-credential create --name myapp-fc \
  --identity-name myapp-id --resource-group myRG \
  --issuer $OIDC --subject 'system:serviceaccount:default:myapp-sa'
```

## Key Reference
```
Networking:
  Kubenet:    overlay, limited scale, cheaper IPs
  Azure CNI:  real VNet IPs per pod, directly routable (recommended)

Node pool modes:
  System: required K8s system pods (DNS, metrics-server)
  User:   application workloads

Cost saving options:
  --priority Spot: Spot VMs (60-80% cheaper, evictable)
  Autoscaler: min/max count for cost + availability
```
