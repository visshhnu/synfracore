# Azure Virtual Networks Overview

## What are Azure VNets?

Azure Virtual Networks (VNets) are the fundamental networking building block in Azure. They provide an isolated, private network environment where Azure resources communicate with each other, the internet, and on-premises networks.

## Core Concepts

```
VNET:
  Private IP address space (RFC 1918 recommended)
  Spans all availability zones in a region
  Cannot span regions (use peering or VPN for cross-region)
  Can be subdivided into subnets
  Default: all VMs in same VNet can communicate

SUBNETS:
  Sub-divisions of VNet address space
  Resources placed in specific subnets
  Network policies applied at subnet level (NSG, route tables)
  Some Azure services require dedicated subnets (Azure Firewall, App Gateway, Bastion)

IP ADDRESSING:
  Private: 10.x.x.x/8, 172.16-31.x.x/12, 192.168.x.x/16
  Public: static or dynamic; standard or basic SKU
  Standard SKU: required for availability zones, zone-redundant
  Private IPs: assigned from subnet range; static or dynamic

DNS:
  Default: Azure-provided DNS (168.63.129.16) — resolves Azure internal hostnames
  Custom: bring your own DNS servers (on-prem DC, custom forwarder)
  Private DNS Zones: custom DNS within Azure (for private endpoints)
```

## Network Connectivity Options

```
INTERNET:
  Outbound: default via system route (Azure NAT)
  NAT Gateway: dedicated static outbound IPs, better for production
  Inbound: Public IP on VM/LB/App Gateway

ON-PREMISES:
  VPN Gateway (Site-to-site): IPsec/IKE tunnel over internet
  ExpressRoute: private circuit via connectivity provider
  VPN + ER: redundant connectivity

AZURE SERVICES:
  Service Endpoints: route through backbone, restrict to VNet
  Private Endpoints: service on VNet private IP
  VNet Integration (App Service): outbound to VNet from PaaS

VNET TO VNET:
  VNet Peering: same or cross-region, non-transitive
  VPN Gateway: any topology, supports transit
  Azure Virtual WAN: hub-spoke at scale
```

## Hub-Spoke Architecture

```
HUB VNET:
  Shared services: Azure Firewall, VPN/ER Gateway, DNS, Bastion, AD DS
  Connected to: on-premises, all spoke VNets

SPOKE VNETS:
  Application workloads isolated in separate VNets
  Peered to hub only (not to each other)
  Traffic to/from internet/on-prem routes through hub firewall

BENEFITS:
  Centralized security (single firewall)
  Shared expensive resources (ExpressRoute)
  Isolation between workloads
  Consistent policy enforcement

AZURE VIRTUAL WAN:
  Microsoft-managed hub-spoke at scale
  Automated peering, routing, and security
  Good for: many spoke VNets, global enterprise
```

## Study Resources
- **AZ-700 Azure Network Engineer Associate** — Microsoft certification for networking
- **Microsoft Learn VNet Learning Path** — free, hands-on modules
- **Azure Architecture Center** (learn.microsoft.com/azure/architecture) — reference architectures
- **Azure Networking Blog** — new features and best practices
