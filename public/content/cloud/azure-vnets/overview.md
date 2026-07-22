# Azure Virtual Networks Overview

## Why this exists (the hook)

Every Azure resource that talks to the network — a VM, an AKS cluster, a Private Endpoint for a database — has to live somewhere on a network, and that network doesn't exist by default. A VNet is what you create first, before any of that, because it's the address space and the security boundary everything else attaches to. Get the VNet design wrong early (too small an address space, no subnet plan, no segmentation) and you end up re-architecting live production networks later, which is far more painful than spending an hour planning subnets up front.

## Analogy

Think of a VNet like a new office building you're leasing before any tenants move in. The building's street address and floor plan (the VNet's CIDR block) has to be decided first. Then you divide floors into departments (subnets) — sales on one floor, engineering on another, so you can control who badges into which floor (NSGs) instead of leaving every door unlocked. Two buildings owned by the same company can be connected with a private walkway (VNet Peering) so staff can walk between them without going out onto the public street.

## What are Azure VNets?

Azure Virtual Networks (VNets) are the fundamental networking building block in Azure. They provide an isolated, private network environment where Azure resources communicate with each other, the internet, and on-premises networks.

## Try it yourself (2 minutes)

If you have an Azure sandbox available, run `az network vnet list --output table` and `az network vnet subnet list --resource-group <rg> --vnet-name <vnet> --output table` against any existing VNet (even a default one from a quickstart). Compare the VNet's address space against the sum of its subnets' address spaces — in almost every real environment you'll find the subnets don't use up the whole VNet range, which is intentional: it leaves room to add more subnets later without re-architecting the address plan.

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
