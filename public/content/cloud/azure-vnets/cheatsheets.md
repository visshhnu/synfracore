# Azure VNet Cheatsheet

## Core Commands
```bash
# VNet
az network vnet create -g myRG -n myVNet \
  --address-prefix 10.0.0.0/16 --location eastus
az network vnet subnet create -g myRG --vnet-name myVNet \
  -n webSubnet --address-prefix 10.0.1.0/24
az network vnet list -g myRG
az network vnet show -g myRG -n myVNet

# NSG
az network nsg create -g myRG -n myNSG
az network nsg rule create -g myRG --nsg-name myNSG \
  -n AllowHTTP --priority 100 --direction Inbound \
  --source-address-prefixes Internet --destination-port-ranges 80 443 \
  --protocol Tcp --access Allow
az network vnet subnet update -g myRG --vnet-name myVNet \
  -n webSubnet --network-security-group myNSG

# Peering
az network vnet peering create \
  -g myRG -n AtoB --vnet-name vnetA \
  --remote-vnet /subscriptions/.../vnetB \
  --allow-vnet-access

# Public IP
az network public-ip create -g myRG -n myPIP --sku Standard --allocation-method Static
az network public-ip show -g myRG -n myPIP --query ipAddress

# VNet Gateway (VPN)
az network vnet-gateway create \
  -g myRG -n myVPNGW --public-ip-address myPIP \
  --vnet myVNet --gateway-type Vpn --vpn-type RouteBased \
  --sku VpnGw1 --no-wait

# Route table
az network route-table create -g myRG -n myRouteTable
az network route-table route create -g myRG \
  --route-table-name myRouteTable -n toNVA \
  --address-prefix 0.0.0.0/0 --next-hop-type VirtualAppliance \
  --next-hop-ip-address 10.0.2.4
az network vnet subnet update -g myRG --vnet-name myVNet \
  -n webSubnet --route-table myRouteTable
```

## CIDR Quick Reference
```
/8  = 16,777,216 hosts   — Class A
/16 = 65,536 hosts       — typical VNet
/24 = 256 hosts (-5=251) — typical subnet
/25 = 128 hosts          — small subnet
/26 = 64 hosts           — micro subnet
/27 = 32 hosts           — tiny subnet
/28 = 16 hosts           — minimal (Azure reserves 5 IPs per subnet)
/29 = 8 hosts (-5=3 usable) — minimum recommended

Azure reserves 5 IPs per subnet: .0 (network), .1 (gateway), .2-.3 (DNS), .255 (broadcast)
```

## Key Concepts
| Concept | Description |
|---------|-------------|
| VNet | Isolated network in Azure |
| Subnet | Sub-division of VNet |
| NSG | Layer 4 firewall (inbound/outbound rules) |
| Azure Firewall | Layer 7 managed firewall (FQDN filtering) |
| VNet Peering | Low-latency VNet-to-VNet connection |
| VPN Gateway | Site-to-site or point-to-site VPN |
| ExpressRoute | Private dedicated circuit to Azure |
| Private Endpoint | PaaS service on your VNet private IP |
| Service Endpoint | Route PaaS traffic through VNet backbone |
| Route Table (UDR) | Custom routing (override Azure defaults) |
