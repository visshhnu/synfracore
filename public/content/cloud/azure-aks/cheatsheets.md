# Azure AKS Cheatsheet

## Core Commands
```bash
# Create cluster
az aks create -g myRG -n myAKS \
  --node-count 3 --node-vm-size Standard_DS2_v2 \
  --enable-managed-identity --generate-ssh-keys \
  --network-plugin azure --network-policy azure

az aks get-credentials -g myRG -n myAKS
az aks show -g myRG -n myAKS
az aks list -g myRG

# Node pools
az aks nodepool add -g myRG --cluster-name myAKS \
  -n gpupool --node-count 2 --node-vm-size Standard_NC6 \
  --node-taints sku=gpu:NoSchedule
az aks nodepool scale -g myRG --cluster-name myAKS \
  -n agentpool --node-count 5
az aks nodepool list -g myRG --cluster-name myAKS

# Upgrade
az aks get-upgrades -g myRG -n myAKS
az aks upgrade -g myRG -n myAKS --kubernetes-version 1.29

# Scale
az aks scale -g myRG -n myAKS --node-count 5

# Enable add-ons
az aks enable-addons -g myRG -n myAKS \
  --addons monitoring --workspace-resource-id /subscriptions/xxx/resourcegroups/yyy/providers/microsoft.operationalinsights/workspaces/zzz

az aks disable-addons -g myRG -n myAKS --addons monitoring

# Delete
az aks delete -g myRG -n myAKS --yes --no-wait
```

## Workload Identity (IRSA equivalent)
```bash
# Enable OIDC + workload identity
az aks update -g myRG -n myAKS \
  --enable-oidc-issuer --enable-workload-identity

# Get OIDC issuer URL
az aks show -g myRG -n myAKS --query oidcIssuerProfile.issuerUrl -o tsv

# Create managed identity
az identity create -g myRG -n myIdentity

# Federated credential
az identity federated-credential create \
  --name myFedCred --identity-name myIdentity -g myRG \
  --issuer <OIDC_URL> --subject system:serviceaccount:default:my-sa \
  --audience api://AzureADTokenExchange
```

## Key Concepts
| Concept | AKS | EKS Equivalent |
|---------|-----|----------------|
| Node pool | Node pool | Node group |
| Workload identity | Workload Identity | IRSA |
| CNI | Azure CNI or kubenet | AWS VPC CNI |
| Load balancer | Azure LB / App Gateway Ingress | AWS ALB / NLB |
| Storage | Azure Disk CSI / Azure Files CSI | EBS CSI / EFS CSI |
| Policy | Azure Policy / Gatekeeper | OPA Gatekeeper |
