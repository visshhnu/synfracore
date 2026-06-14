# Azure VNets — Advanced

## Hub-Spoke Topology

```
Hub-Spoke: centralized shared services with isolated spoke VNets

Hub VNet:
  ├── Azure Firewall (centralized egress inspection)
  ├── VPN Gateway / ExpressRoute (on-premises connectivity)
  ├── Azure Bastion (secure admin access)
  └── Shared services (DNS, monitoring, DevOps tools)

Spoke VNets (peered to hub):
  ├── Production spoke (10.1.0.0/16)
  ├── Staging spoke (10.2.0.0/16)
  ├── Dev spoke (10.3.0.0/16)
  └── DMZ spoke (10.4.0.0/16)

Traffic flows:
  Spoke → Internet: routes through hub firewall (inspection)
  Spoke → Spoke: via hub (transitivity through firewall)
  On-prem → Spoke: via hub gateway
```

## Private Endpoints

```bash
# Private Endpoint: access Azure PaaS over private IP (no public internet)
# Works for: Storage, SQL, Key Vault, Cosmos DB, ACR, etc.

# Create private endpoint for Azure SQL
az network private-endpoint create \
  --resource-group prod-rg --name sql-private-endpoint \
  --vnet-name prod-vnet --subnet data-subnet \
  --private-connection-resource-id "/subscriptions/$SUB/resourceGroups/prod-rg/providers/Microsoft.Sql/servers/prod-sql" \
  --group-id sqlServer \
  --connection-name sql-connection

# Create private DNS zone for SQL
az network private-dns zone create \
  --resource-group prod-rg \
  --name "privatelink.database.windows.net"

az network private-dns link vnet create \
  --resource-group prod-rg \
  --zone-name "privatelink.database.windows.net" \
  --name sql-dns-link --virtual-network prod-vnet --registration-enabled false

# DNS zone for Key Vault: privatelink.vaultcore.azure.net
# DNS zone for Storage: privatelink.blob.core.windows.net
# DNS zone for ACR: privatelink.azurecr.io
```
