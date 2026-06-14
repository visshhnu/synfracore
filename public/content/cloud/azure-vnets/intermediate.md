# Azure VNets — Intermediate

## Network Security Groups (NSG) Deep Dive

```bash
# NSG rule priority: lower number = higher priority (100 processed before 200)
# Default rules (cannot delete): AllowVNetInbound, AllowAzureLoadBalancerInbound, DenyAllInbound

# Create NSG with layered rules
az network nsg create --resource-group prod-rg --name app-nsg

# Allow HTTPS from internet
az network nsg rule create --resource-group prod-rg --nsg-name app-nsg \
  --name allow-https --priority 100 \
  --protocol Tcp --direction Inbound --access Allow \
  --source-address-prefixes Internet --destination-port-ranges 443

# Allow SSH from management subnet only
az network nsg rule create --resource-group prod-rg --nsg-name app-nsg \
  --name allow-ssh-mgmt --priority 110 \
  --protocol Tcp --direction Inbound --access Allow \
  --source-address-prefixes 10.0.100.0/24 --destination-port-ranges 22

# Allow app tier to database tier
az network nsg rule create --resource-group prod-rg --nsg-name db-nsg \
  --name allow-app-to-db --priority 100 \
  --protocol Tcp --direction Inbound --access Allow \
  --source-address-prefixes 10.0.2.0/24 --destination-port-ranges 5432

# Associate NSG with subnet
az network vnet subnet update --resource-group prod-rg \
  --vnet-name prod-vnet --name app-subnet \
  --network-security-group app-nsg
```

## VNet Peering

```bash
# Peer two VNets (can be in different subscriptions/regions)
az network vnet peering create \
  --resource-group prod-rg --vnet-name prod-vnet \
  --name prod-to-shared \
  --remote-vnet /subscriptions/$SUB/resourceGroups/shared-rg/providers/Microsoft.Network/virtualNetworks/shared-vnet \
  --allow-vnet-access \
  --allow-forwarded-traffic

# Also create the reverse peering from shared-vnet to prod-vnet
az network vnet peering create \
  --resource-group shared-rg --vnet-name shared-vnet \
  --name shared-to-prod \
  --remote-vnet /subscriptions/$SUB/resourceGroups/prod-rg/providers/Microsoft.Network/virtualNetworks/prod-vnet \
  --allow-vnet-access

# Check peering status
az network vnet peering list --resource-group prod-rg --vnet-name prod-vnet --output table
```

## Azure Firewall

```bash
# Azure Firewall: managed, stateful firewall for hub-spoke topology
az network firewall create \
  --resource-group hub-rg --name hub-firewall \
  --location eastus --sku-tier Standard

# Firewall Policy with rules
az network firewall policy create --resource-group hub-rg --name fw-policy
az network firewall policy rule-collection-group create \
  --policy-name fw-policy --resource-group hub-rg --name DefaultRCG --priority 1000

# Allow app tier outbound to internet (HTTPS only)
az network firewall policy rule-collection-group collection add-filter-collection \
  --policy-name fw-policy --resource-group hub-rg \
  --rule-collection-group-name DefaultRCG --name AllowOutbound \
  --collection-priority 100 --action Allow --rule-type NetworkRule \
  --source-addresses 10.0.0.0/8 --destination-ports 443 --protocols TCP
```
