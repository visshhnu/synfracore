# Azure VNets — Cheatsheet

```bash
# ── CREATE VNet & SUBNETS ─────────────────────────────────
az network vnet create --resource-group rg --name prod-vnet \
  --address-prefix 10.0.0.0/16 --location eastus
az network vnet subnet create --resource-group rg --vnet-name prod-vnet \
  --name web-subnet --address-prefix 10.0.1.0/24
az network vnet subnet create --resource-group rg --vnet-name prod-vnet \
  --name app-subnet --address-prefix 10.0.2.0/24 \
  --service-endpoints Microsoft.Sql Microsoft.Storage

# ── INSPECT ───────────────────────────────────────────────
az network vnet list --output table
az network vnet show --resource-group rg --name prod-vnet
az network vnet subnet list --resource-group rg --vnet-name prod-vnet --output table

# ── NSG ───────────────────────────────────────────────────
az network nsg create --resource-group rg --name web-nsg
az network nsg rule create --resource-group rg --nsg-name web-nsg \
  --name allow-https --priority 100 \
  --protocol Tcp --direction Inbound --access Allow \
  --destination-port-ranges 443
az network nsg rule list --resource-group rg --nsg-name web-nsg --output table
# Associate: az network vnet subnet update ... --network-security-group web-nsg

# ── PEERING ───────────────────────────────────────────────
az network vnet peering create --resource-group rg --vnet-name vnet-a \
  --name a-to-b --remote-vnet vnet-b --allow-vnet-access
az network vnet peering list --resource-group rg --vnet-name vnet-a --output table

# ── PUBLIC IP ─────────────────────────────────────────────
az network public-ip create --resource-group rg --name myip --sku Standard
az network public-ip show --resource-group rg --name myip --query ipAddress -o tsv

# ── FLOW LOGS (for debugging) ─────────────────────────────
az network watcher flow-log create \
  --resource-group rg --name nsg-flow-log \
  --nsg web-nsg \
  --storage-account /subscriptions/$SUB/resourceGroups/rg/providers/Microsoft.Storage/storageAccounts/flowlogsstorage \
  --enabled true \
  --retention 7 \
  --log-version 2

# ── COMMON SUBNET SIZES ───────────────────────────────────
# Azure reserves 5 IPs in each subnet
# /29 = 8 IPs, 3 usable (too small for most)
# /28 = 16 IPs, 11 usable
# /27 = 32 IPs, 27 usable
# /26 = 64 IPs, 59 usable
# /24 = 256 IPs, 251 usable ← standard
# /23 = 512 IPs (span 2 /24s)

# AzureBastionSubnet: /26 minimum
# GatewaySubnet: /27 minimum, /26 recommended
```
