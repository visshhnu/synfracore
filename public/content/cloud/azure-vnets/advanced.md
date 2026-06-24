# Azure VNet Advanced Topics

## Network Security Groups (NSGs)

```
NSG RULES (priority 100-4096, lower = higher priority):
  Inbound rules: filter traffic coming into subnet/NIC
  Outbound rules: filter traffic leaving subnet/NIC

RULE COMPONENTS:
  Priority: 100-4096 (lower number processed first)
  Source/Destination: IP, CIDR, Service Tag, Application Security Group
  Protocol: TCP, UDP, ICMP, Any
  Port: single, range, or *
  Action: Allow or Deny

SERVICE TAGS (dynamic IP sets maintained by Microsoft):
  VirtualNetwork: entire VNet + on-prem space
  AzureLoadBalancer: Azure Load Balancer probes
  Internet: internet-routable IPs
  Storage, Sql, AzureActiveDirectory, AppService — service-specific
  AzureCloud: all Azure datacenter IPs

APPLICATION SECURITY GROUPS (ASG):
  Group VMs logically (web-servers, db-servers)
  Reference ASG in NSG rules (not IPs)
  Automatic IP management when VMs added/removed to ASG

EFFECTIVE SECURITY RULES:
  Check: az network nic show-effective-nsg -g myRG -n myNIC
  Both subnet NSG and NIC NSG applied; most restrictive wins
```

## VNet Peering and Gateway

```
VNET PEERING:
  Low-latency, high-bandwidth connection between VNets (same or cross-region)
  Traffic stays on Microsoft backbone (not public internet)
  Non-transitive: A-B and B-C peered does NOT mean A-C connected
  Peering each direction must be created
  
  az network vnet peering create \
    -g myRG -n vnetA-to-vnetB \
    --vnet-name vnetA --remote-vnet vnetB \
    --allow-vnet-access --allow-forwarded-traffic

  Options:
    Allow forwarded traffic: accept traffic forwarded through NVA
    Allow gateway transit: peer can use this VNet's gateway
    Use remote gateways: route through peered VNet's gateway

VPNGW vs ExpressRoute:
  VPN Gateway: encrypted tunnel over internet; up to 10 Gbps; lower cost
  ExpressRoute: private dedicated circuit; up to 100 Gbps; predictable latency
  ExpressRoute + VPN: failover scenario
```

## Private Endpoints and Service Endpoints

```
SERVICE ENDPOINTS:
  Extend VNet identity to Azure service (Storage, SQL, CosmosDB, etc.)
  Traffic to service goes through Azure backbone (not public internet)
  Service can restrict access to specific VNet subnets
  Simple: just enable on subnet, configure firewall on service

PRIVATE ENDPOINTS:
  Place Azure service on your VNet with private IP
  DNS resolves service hostname to private IP within VNet
  More secure than service endpoints: service not accessible from other VNets
  Required for true network isolation of PaaS services
  
  az network private-endpoint create \
    -g myRG -n myPE \
    --vnet-name myVNet --subnet mySubnet \
    --private-connection-resource-id /subscriptions/.../storageAccounts/myStorage \
    --group-id blob --connection-name myConnection

AZURE PRIVATE DNS ZONES:
  Required with Private Endpoints for DNS resolution
  Link to VNet so private DNS resolves correctly
  Example: privatelink.blob.core.windows.net → private IP
```

## Study Resources
- **AZ-700 (Azure Network Engineer)** — Microsoft networking certification
- **Microsoft Learn VNet modules** — free hands-on labs
- **Azure Network Architecture Center** — reference architectures for hub-spoke, landing zone
- **VNet documentation** — NSG, Private Endpoint, VPN Gateway deep-dive guides
